package com.example.eleme.pojo;

public class User {
    private String id;

	private String name;

	private Integer age;

	private String img;

	private String password;

	private String qrcode;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id == null ? null : id.trim();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img == null ? null : img.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getQrcode() {
		return qrcode;
	}

	public void setQrcode(String qrcode) {
		this.qrcode = qrcode == null ? null : qrcode.trim();
	}
	
	@Override
	public String toString() {
	    return "User{" +
	            "id=" + id +
	            ", age='" + age + '\'' +
	            ", name='" + name + '\'' +
	            ", password='" + password + '\''+
	            '}';
	}
}