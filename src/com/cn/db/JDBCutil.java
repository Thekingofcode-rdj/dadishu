package com.cn.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

public class JDBCutil {
	Connection con=null;
	PreparedStatement pstm=null;
	ResultSet rs=null;
	public JDBCutil() {
		getConnection();
	}
	public void getConnection() {
		
		try {
			String url="jdbc:mysql://localhost:3306/game";
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(url,"root","root");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//增删改
		public int dealData(String sql, Object[] params) {
			int result = -1;
			try {
				pstm = con.prepareStatement(sql);
				if (params != null) {
					for (int i = 0; i < params.length; i++) {
						pstm.setObject(i + 1, params[i]);
					}
				}
				result = pstm.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;

		}
		//查询
		public ResultSet QueryData(String sql, Object[] params) {
			try {
				pstm = con.prepareStatement(sql);
				if (params != null) {
					for (int i = 0; i < params.length; i++) {
						pstm.setObject(i + 1, params[i]);
					}
				}
				rs = pstm.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return rs;
		}
		//关闭
		public void close() {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
}
