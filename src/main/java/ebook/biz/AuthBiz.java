package ebook.biz;

import org.mindrot.jbcrypt.BCrypt;

import ebook.dao.AuthDao;
import ebook.model.User;

public class AuthBiz {
	private AuthDao dao;
	
	public AuthBiz() {
		this.dao = new AuthDao();
	}
	
	public User findByEmail(String email) {
		return dao.findByEmail(email);
	}
	
	public User login(String email) {
		User loggedUser = dao.findByEmail(email);
		loggedUser.setPassword("");
		
		return loggedUser;
	}
	
	public int register(User user) {
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(10)));
		return dao.add(user);
	}

}
