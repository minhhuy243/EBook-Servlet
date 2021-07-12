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
				// Lấy thông tin sản phẩm
				data = gson.fromJson(req.getReader(), JsonObject.class);
				id = data.get("id").getAsInt();
				int quantity = data.get("quantity") == null ? 1 : data.get("quantity").getAsInt();
				boolean update = data.get("update") == null ? false : true;

				// Tìm kiếm sản phẩm trong giỏ hàng xem đã tồn tại hay chưa
				for(ProductCart item : productCartList) {
					if(item.getProduct().getId() == id) {
						productCart = item;
						break;
					}
				}

				if(productCart != null) { // Có tồn tại thì cộng thêm số lượng mới
					if(update) { // Nếu có yêu cầu cập nhật lại số lượng ở trang giỏ hàng
						totalPrice -= productCart.getProduct().getPrice() * productCart.getQuantity();
						productCart.setQuantity(quantity);
					} else {
						int oldQuantity = productCart.getQuantity();
						productCart.setQuantity(oldQuantity + quantity);
					}
					//totalPrice += productCart.getProduct().getPrice() * quantity;
				} else {
					productCart = new ProductCart();
					productCart.setProduct(productBiz.findById(id));
					productCart.setQuantity(quantity);
					if(productCart.getProduct().getQuantity() > 0)
						productCartList.add(productCart);

					//totalPrice += productCart.getProduct().getPrice() * quantity;
				}
				totalPrice += productCart.getProduct().getPrice() * quantity;

				// Kiểm tra số lượng hiện tại với số lượng trong kho
				if(productCart.getQuantity() > productCart.getProduct().getQuantity()) { // Nếu lớn hơn số lượng trong kho
					results.put("errorQuantity", "Số lượng sản phẩm vượt quá số lượng tồn kho");
					resp.setStatus(400);
				} else {
					//totalPrice += product.getPrice() * quantity;
					results.put("productCartList", productCartList);
					results.put("totalPrice", totalPrice);
					session.setAttribute("totalPrice", totalPrice);
					session.setAttribute("productCartList", productCartList);
					resp.setStatus(200);
				}

				json = gson.toJson(results);
				out.write(json);
				out.flush();
				break;

			case UrlConst.CART_DELETE:
				data = gson.fromJson(req.getReader(), JsonObject.class);
				id = data.get("id").getAsInt();

				// Tìm kiếm sản phẩm trong giỏ hàng xem đã tồn tại hay chưa
				for(ProductCart item : productCartList) {
					if(item.getProduct().getId() == id) {
						totalPrice -= item.getQuantity() * item.getProduct().getPrice();
						productCartList.remove(item); // Có tồn tại thì xóa khỏi list
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
