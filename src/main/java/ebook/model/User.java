package ebook.model;

public class User {
	private int id;
	private String email;
	private String password;
	private String lastName;
	private String firstName;
	private String address;
	private String phoneNumber;
	
	public User() {
		this.id = -1;
		this.email = "";
		this.password = "";
		this.lastName = "";
		this.firstName = "";
		this.address = "";
		this.phoneNumber = "";
	}

	public User(int id, String email, String password, String lastName, String firstName, String address,
			String phoneNumber) {
		this.id = id;
		this.email = email;
		this.password = password;
		this.lastName = lastName;
		this.firstName = firstName;
		this.address = address;
		this.phoneNumber = phoneNumber;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
}
