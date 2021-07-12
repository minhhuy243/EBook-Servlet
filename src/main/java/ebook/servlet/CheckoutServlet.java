package ebook.servlet;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import ebook.biz.CheckoutBiz;
import ebook.model.ProductCart;
import ebook.model.Purchase;
import ebook.model.User;
import ebook.utils.JspPathConst;
import ebook.utils.UrlConst;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "checkoutServlet", urlPatterns = {
        UrlConst.CHECKOUT,
})
public class CheckoutServlet extends HttpServlet {

    CheckoutBiz biz;

    @Override
    public void init() throws ServletException {
        super.init();
        biz = new CheckoutBiz();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();

        switch (path) {
            case UrlConst.CHECKOUT:
                req.getRequestDispatcher(JspPathConst.CHECKOUT).forward(req, resp);
                break;

            default:
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        HttpSession session = req.getSession();

        List<ProductCart> productCartList = session.getAttribute("productCartList") == null
                ? new LinkedList<>() : (List<ProductCart>) session.getAttribute("productCartList");
        int totalPrice = session.getAttribute("totalPrice") == null
                ? 0 : Integer.parseInt(session.getAttribute("totalPrice").toString());

        switch (path) {
            case UrlConst.CHECKOUT:
                Purchase purchase = new Purchase();
                purchase.setUser((User) session.getAttribute("user"));
                purchase.setName(req.getParameter("name"));
                purchase.setAddress(req.getParameter("address"));
                purchase.setPhoneNumber(req.getParameter("phoneNumber"));
                purchase.setEmail(req.getParameter("email"));
                purchase.setCreatedAt(LocalDate.now());
                purchase.setTotal(totalPrice);

                Purchase newPurchase = biz.save(purchase, productCartList);
                session.setAttribute("productCartList", null);
                session.setAttribute("totalPrice", null);

                req.setAttribute("purchase", newPurchase);
                req.setAttribute("productCartList", productCartList);
                req.getRequestDispatcher(JspPathConst.CHECKOUT_COMPLETE).forward(req, resp);
                break;
            default:
                break;
        }
    }
}
