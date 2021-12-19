package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO1 {

	Connection con=null;
	PreparedStatement pre=null;
	String sql=null;
	ResultSet rs=null;
	
	private Connection getConnection() throws Exception{
		
		Context init = new InitialContext();
		DataSource ds =(DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		con=ds.getConnection();
		
		return con;
	}
	public void obclose() {
		if(rs!=null) {
			try {
			rs.close();	
			} catch (Exception e) {
			e.printStackTrace();
			}
		}
		if(pre!=null) {
			try {
				pre.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(con!=null) {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void insertMemeber1(MemberDTO1 memberDTO1) {
		
		try {
			con=getConnection();
			
			sql="insert into member(id,pass,name,date,email,address,phone,mobile,address2,MBTI) values(?,?,?,?,?,?,?,?,?,?)";
			pre=con.prepareStatement(sql);
			pre.setString(1, memberDTO1.getId());
			pre.setString(2, memberDTO1.getPass());
			pre.setString(3, memberDTO1.getName());
			pre.setTimestamp(4, memberDTO1.getDate());
			pre.setString(5, memberDTO1.getEmail());
			pre.setString(6, memberDTO1.getAddress());
			pre.setString(7, memberDTO1.getPhone());
			pre.setString(8, memberDTO1.getMobile());
			pre.setString(9, memberDTO1.getAddress2());
			pre.setString(10, memberDTO1.getMbti());
		
			pre.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			obclose();
		}
		return;
	}//insertMemeber
	
	public MemberDTO1 getmember1(String id) {
		 MemberDTO1 memberDTO1 = null;
		
		try {
			con =getConnection();
			sql = "select * from member where id=?";
			pre=con.prepareStatement(sql);
			pre.setString(1, id);
			rs=pre.executeQuery();
		if(rs.next()) {
			memberDTO1=new MemberDTO1();
			memberDTO1.setId(rs.getString("id"));
			memberDTO1.setPass(rs.getString("pass"));
			memberDTO1.setName(rs.getString("name"));
			memberDTO1.setDate(rs.getTimestamp("date"));
			memberDTO1.setEmail(rs.getString("email"));
			memberDTO1.setAddress(rs.getString("address"));
			memberDTO1.setPhone(rs.getString("phone"));
			memberDTO1.setMobile(rs.getString("mobile"));
			memberDTO1.setAddress2(rs.getString("address2"));
			memberDTO1.setMbti(rs.getString("MBTI"));
			
		}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			obclose();
		}
		return memberDTO1;
	}
	public MemberDTO1 userCheck1(String id,String pass) {
		MemberDTO1 memberDTO1 = null;
		try {
			con=getConnection();
			sql="select * from member where id=? and pass=?";
			pre=con.prepareStatement(sql);
			pre.setString(1, id);
			pre.setString(2, pass);
			rs=pre.executeQuery();
			
			if(rs.next()) {
				memberDTO1=new MemberDTO1();
				memberDTO1.setId(rs.getString("id"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			obclose();
		}
		return memberDTO1;
	}
	public void updateMember(MemberDTO1 memberDTO1_update) {
		try {
			con = getConnection();
			sql="update member set name=?,email=?,address=?,phone=?,mobile=?,address2=?,MBTI=? where id=?";
			pre=con.prepareStatement(sql);
			pre.setString(1, memberDTO1_update.getName());
			pre.setString(2, memberDTO1_update.getEmail());
			pre.setString(3, memberDTO1_update.getAddress());
			pre.setString(4, memberDTO1_update.getPhone());
			pre.setString(5, memberDTO1_update.getMobile());
			pre.setString(6, memberDTO1_update.getAddress2());
			pre.setString(7, memberDTO1_update.getMbti());
			pre.setString(8, memberDTO1_update.getId());
			pre.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			obclose();
		}return;
	}//updateMember
	
	public void deleteMember(String id) {
		try {
			con = getConnection();
			sql="delete from member where id=?";
			pre=con.prepareStatement(sql);
			pre.setString(1, id);
	
			pre.executeUpdate();
		} catch (Exception e) {	
			e.printStackTrace();
		}finally {
			obclose();
		}
		
	}//deleteMember
	
}
