package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.JDBCUtil;
import vo.Bank2VO;

public class Bank2DAO {
	Connection conn;
	PreparedStatement pstmt;
	
	final String sql_selectOne="SELECT * FROM BANK2 WHERE BID=222";
	public Bank2VO selectOne(Bank2VO vo) {
		Bank2VO data=null;
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectOne);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				data=new Bank2VO();
				data.setBalance(rs.getInt("BALANCE"));
				data.setBid(rs.getInt("BID"));
				data.setBname(rs.getString("BNAME"));
				System.out.println("Bank2DAO: selectOne(): "+data);
				return data;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return data;
	}
}
