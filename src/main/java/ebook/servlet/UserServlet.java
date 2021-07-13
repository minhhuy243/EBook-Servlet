package ebook.servlet;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import ebook.biz.UserBiz;
import ebook.model.User;
import ebook.utils.JspPathConst;
import ebook.utils.UrlConst;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "userServlet", urlPatterns = {
        UrlConst.USER_PROFILE,
        UrlConst.USER_CHANGE_PWD
})
public class UserServlet extends HttpServlet {

    private UserBiz biz;

    @Override
    public void init() throws ServletException {
        super.init();
        biz = new UserBiz();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();

        switch (path) {
            case UrlConst.USER_PROFILE:
                req.getRequestDispatcher(JspPathConst.USER_PROFILE).forward(req, resp);
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
        Map<String, String> errors = null;
        PrintWriter out = resp.getWriter();
        resp.setContentType("application/json");
        HttpSession session = req.getSession();

        switch (path) {
            case UrlConst.USER_CHANGE_PWD:
                data = gson.fromJson(req.getReader(), JsonObject.class); // Lấy body từ request xong chuyển qua JSON
                String currentPwd = data.get("currentPwd").getAsString();
                String newPwd = data.get("newPwd").getAsString();
                String confirmPwd = data.get("confirmPwd").getAsString();
                User user = (User) session.getAttribute("user");

                errors = validate(user.getEmail(), currentPwd, newPwd, confirmPwd);
                if(errors.isEmpty()) {
                    biz.updatePasswordByEmail(user, newPwd);
                    session.invalidate();
                    resp.setStatus(200);
                    json = gson.toJson(user);
                } else {
                    resp.setStatus(400);
                    json = gson.toJson(errors);
                }

                out.write(json);
                out.flush();
                break;
            default:
                break;
        }
    }

    public boolean isBlank(String str) {
        return str == null || str.trim().isEmpty();
    }

    public Map<String, String> validate(String email, String currentPwd, String newPwd, String confirmPwd) {
        Map<String, String> errors = new HashMap<>();

        if(isBlank(currentPwd)) {
            errors.put("currentPwd", "Mật khẩu hiện tại không được bỏ trống");
        } else if (isBlank(newPwd)) {
            errors.put("newPwd", "Mật khẩu mới không được bỏ trống");
        } else if(isBlank(confirmPwd)) {
            errors.put("confirmPwd", "Mật khẩu nhập lại không được bỏ trống");
        } else if(!newPwd.equals(confirmPwd)) {
            errors.put("confirmPwd", "Không trùng với mật khẩu mới");
        } else {
            User user = biz.findByEmail(email);
            if(!BCrypt.checkpw(currentPwd, user.getPassword())) {
                errors.put("currentPwd", "Mật khẩu hiện tại không chính xác");
            }
        }

        return errors;
    }
}
