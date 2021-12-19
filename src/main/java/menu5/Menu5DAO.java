package menu5;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class Menu5DAO {

	Connection con;
	String sql = null;
	ResultSet rs=null;
	PreparedStatement pre;
	
	private Connection getConnection() throws Exception{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		con=ds.getConnection();
		return con;
	}//getConnection
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
	}//obclose
	
	public void insertBoardM5(Menu5DTO mboardDTO) {
		try {
			con = getConnection();
			int num=0;
			sql="select max(num) from menu5_board";
			pre=con.prepareStatement(sql);
			rs=pre.executeQuery();
			if(rs.next()) {
				num=rs.getInt("max(num)")+1;
			}
			sql="insert into menu5_board(num,name,pass,ttitle,twrite,content,date,readcount,category) values(?,?,?,?,?,?,?,?,?)";
			pre=con.prepareStatement(sql);
			pre.setInt(1, num);
			pre.setString(2, mboardDTO.getName());
			pre.setString(3, mboardDTO.getPass());
			pre.setString(4, mboardDTO.getTtitle());
			pre.setString(5, mboardDTO.getTwrite());
			pre.setString(6, mboardDTO.getContent());
			pre.setTimestamp(7, mboardDTO.getDate());
			pre.setInt(8,mboardDTO.getReadcount());
			pre.setString(9, mboardDTO.getCategory());
			
			pre.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			obclose();
		}
		
		}//insertBoardM5
	
	public List<Menu5DTO> getBoardM5List(int startRow,int pageSize){
		List<Menu5DTO> BoardM5List = new ArrayList<Menu5DTO>();
		
		try {
			con= getConnection();
			sql="select * from menu5_board order by num desc limit ?,?";
			pre=con.prepareStatement(sql);
			pre.setInt(1, startRow-1);
			pre.setInt(2, pageSize);
			rs=pre.executeQuery();
			
			while(rs.next()) {
				Menu5DTO mboardDTO= new Menu5DTO();
				mboardDTO.setNum(rs.getInt("num"));
				mboardDTO.setName(rs.getString("name"));
				mboardDTO.setPass(rs.getString("pass"));
				mboardDTO.setTtitle(rs.getString("ttitle"));
				mboardDTO.setTwrite(rs.getString("twrite"));
				mboardDTO.setContent(rs.getString("content"));
				mboardDTO.setDate(rs.getTimestamp("date"));
				mboardDTO.setReadcount(rs.getInt("readcount"));
				mboardDTO.setCategory(rs.getString("category"));
				
				BoardM5List.add(mboardDTO);
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			obclose();
		}
		return BoardM5List;
	}
	public Menu5DTO getBoardM5(int num) {
		Menu5DTO mboardDTO = new Menu5DTO();
		try {
			con = getConnection();
			sql= "select * from menu5_board where num=?";
			pre=con.prepareStatement(sql);
			pre.setInt(1, num);
			rs=pre.executeQuery();
			
			if(rs.next()) {
				mboardDTO.setNum(rs.getInt("num"));
				mboardDTO.setName(rs.getString("name"));
				mboardDTO.setPass(rs.getString("pass"));
				mboardDTO.setTtitle(rs.getString("ttitle"));
				mboardDTO.setTwrite(rs.getString("twrite"));
				mboardDTO.setContent(rs.getString("content"));
				mboardDTO.setDate(rs.getTimestamp("date"));
				mboardDTO.setReadcount(rs.getInt("readcount"));
				mboardDTO.setCategory(rs.getString("category"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			obclose();
		}return mboardDTO;
	}//getBoardM5
		
	public Menu5DTO numCheck(int num,String pass) {
		Menu5DTO mboardDTO =null;
		try {
			con =getConnection();
			sql="select *from menu5_board where num=? and pass=?";
			pre= con.prepareStatement(sql);
			pre.setInt(1, num);
			pre.setString(2, pass);
			rs=pre.executeQuery();
			
			if(rs.next()) {
				mboardDTO = new Menu5DTO();
				mboardDTO.setNum(rs.getInt("num"));
			}
		}catch (Exception e) {
				e.printStackTrace();
		}finally {
			obclose();
		}return mboardDTO;
	}//numCheck
	public void updateBoardM5(Menu5DTO mboardDTO) {
		try {
			con = getConnection();
			sql ="update menu5_board set ttitle=?,content=?  where num=?";
			pre=con.prepareStatement(sql);
			pre.setString(1,mboardDTO.getTtitle());
			pre.setString(2, mboardDTO.getContent());
			pre.setInt(3, mboardDTO.getNum());
			
			pre.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			obclose();
		}
	}//updateBoard
	
	public void updateReadcount(int num) {
		try {
			con=getConnection();
			sql="update menu5_board set readcount=readcount+1 where num=?";
			pre=con.prepareStatement(sql);
			pre.setInt(1,num);
			pre.executeUpdate();
					
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			obclose();
		}
	}//updateReadcount
	public void deleteBoardM5(int num) {
		try {
			con = getConnection();
			sql="delete from menu5_board where num=?";
			pre=con.prepareStatement(sql);
			pre.setInt(1, num);
			pre.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			obclose();
		}
		
	}//deleteBoardM5
	
	public int getBoardM5Count() {
		int count=0;
		try {
			con = getConnection();
			sql="select count(*) from menu5_board";
			pre=con.prepareStatement(sql);
			rs=pre.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			obclose();
		}return count;
		
	}//getBoardM5Count
}
