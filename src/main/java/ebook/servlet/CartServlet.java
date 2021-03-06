package ebook.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import ebook.biz.ProductBiz;
import ebook.model.Product;
import ebook.model.ProductCart;
import ebook.utils.JspPathConst;
import ebook.utils.UrlConst;

@WebServlet(name = "cartServlet", urlPatterns = {
		UrlConst.CART,
		UrlConst.CART_ADD,
		UrlConst.CART_DELETE,
})
public class CartServlet extends HttpServlet{

	private ProductBiz productBiz;

	@Override
	public void init() throws ServletException {
		super.init();
		productBiz = new ProductBiz();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		
		switch (path) {
		case UrlConst.CART:
			req.getRequestDispatcher(JspPathConst.CART).forward(req, resp);
			break;
			
		default:
			break;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		Gson gson = new Gson();
		JsonObject data = null;
		String json = null;
		Map<String, Object> results = new HashMap<>();
		PrintWriter out = resp.getWriter();
		resp.setContentType("application/json");
		HttpSession session = req.getSession();

		List<ProductCart> productCartList = session.getAttribute("productCartList") == null
				? new LinkedList<>() : (List<ProductCart>) session.getAttribute("productCartList");
		int totalPrice = session.getAttribute("totalPrice") == null
				? 0 : Integer.parseInt(session.getAttribute("totalPrice").toString());
		int id;
		ProductCart productCart = null;

		switch (path) {
			case UrlConst.CART_ADD:
				// L???y th??ng tin s???n ph???m
				data = gson.fromJson(req.getReader(), JsonObject.class);
				id = data.get("id").getAsInt();
				int quantity = data.get("quantity") == null ? 1 : data.get("quantity").getAsInt();
				boolean update = data.get("update") == null ? false : true;

				// T??m ki???m s???n ph???m trong gi??? h??ng xem ???? t???n t???i hay ch??a
				for(ProductCart item : productCartList) {
					if(item.getProduct().getId() == id) {
						productCart = item;
						break;
					}
				}

				int oldQuantity = -1;
				if(productCart != null) { // C?? t???n t???i th?? c???ng th??m s??? l?????ng m???i
					oldQuantity = productCart.getQuantity();
					if(update) { // N???u c?? y??u c???u c???p nh???t l???i s??? l?????ng ??? trang gi??? h??ng
						productCart.setQuantity(quantity);
					} else {
						productCart.setQuantity(oldQuantity + quantity);
					}
				} else {
					productCart = new ProductCart();
					productCart.setProduct(productBiz.findById(id));
					productCart.setQuantity(quantity);
					if(productCart.getProduct().getQuantity() > 0) {
						productCartList.add(productCart);
					} else {
						results.put("errorQuantity", "S???n ph???m ???? h???t h??ng");
						resp.setStatus(400);
					}
				}

				// Ki???m tra s??? l?????ng hi???n t???i v???i s??? l?????ng trong kho
				if(productCart.getQuantity() > productCart.getProduct().getQuantity()) { // N???u l???n h??n s??? l?????ng trong kho
					productCart.setQuantity(oldQuantity);
					if(!results.containsKey("errorQuantity"))
						results.put("errorQuantity", "S??? l?????ng s???n ph???m v?????t qu?? s??? l?????ng t???n kho");
					resp.setStatus(400);
				} else {
					if(update) {
						totalPrice -= productCart.getProduct().getPrice() * oldQuantity;
						totalPrice += productCart.getProduct().getPrice() * quantity;
					} else {
						totalPrice += productCart.getProduct().getPrice() * quantity;
					}
					session.setAttribute("totalPrice", totalPrice);
					session.setAttribute("productCartList", productCartList);
					resp.setStatus(200);
				}
				results.put("productCartList", productCartList);
				results.put("totalPrice", totalPrice);
				json = gson.toJson(results);
				out.write(json);
				out.flush();
				break;

			case UrlConst.CART_DELETE:
				data = gson.fromJson(req.getReader(), JsonObject.class);
				id = data.get("id").getAsInt();

				// T??m ki???m s???n ph???m trong gi??? h??ng xem ???? t???n t???i hay ch??a
				for(ProductCart item : productCartList) {
					if(item.getProduct().getId() == id) {
						totalPrice -= item.getQuantity() * item.getProduct().getPrice();
						productCartList.remove(item); // C?? t???n t???i th?? x??a kh???i list
						results.put("productCartList", productCartList);
						results.put("totalPrice", totalPrice);
						session.setAttribute("totalPrice", totalPrice);
						session.setAttribute("productCartList", productCartList);
						break;
					}
				}

				resp.setStatus(200);
				json = gson.toJson(results);
				out.write(json);
				out.flush();
				break;

			default:
				break;
		}
	}
}
