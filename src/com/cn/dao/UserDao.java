package com.cn.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.cn.db.JDBCutil;
import com.cn.vo.Users;

public class UserDao {
	JDBCutil j=null;
	public UserDao() {
		j=new JDBCutil();
	}
	public Users LoginUser(String username,String userpass) {
		Users u=null;
		String sql="select * from users where username=? and userpass=?";
		Object params[]= {username,userpass};
		ResultSet rs=j.QueryData(sql, params);
		try {
			if(rs.next()) {
				u=new Users();
				u.setId(rs.getInt("Id"));
				u.setUsername(rs.getString("username"));
				u.setUserpass(rs.getString("userpass"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}
	public int InsertUser(Users u) {
		String sql="insert into users(username,userpass)values(?,?)";
		Object params[]= {u.getUsername(),u.getUserpass()};
		int i=j.dealData(sql, params);
		return i;
	}
}
