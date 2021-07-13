package ebook.biz;

import ebook.dao.UserDao;
import ebook.model.User;
import org.mindrot.jbcrypt.BCrypt;

public class UserBiz {
    private UserDao dao;

    public UserBiz() {
        this.dao = new UserDao();
    }

    public User findByEmail(String email) {
        return dao.findByEmail(email);
    }

    public int updatePasswordByEmail(User user, String newPwd) {
        user.setPassword(BCrypt.hashpw(newPwd, BCrypt.gensalt(10)));
        return dao.updatePasswordByEmail(user);
    }
}
