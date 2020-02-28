package com.cn.service;

import com.cn.dao.UserDao;
import com.cn.vo.Users;

public class UserService {
	UserDao ud=null;
	public UserService(){
		ud=new UserDao();
	}
	public Users LoginUser(String username,String userpass) {
		return ud.LoginUser(username, userpass);
	}
	public int DealUser(Users u) {
		return ud.InsertUser(u);
	}
}
