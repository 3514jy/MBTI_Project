package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class commentDAO {
	String sql=null;
	Connection con;
	PreparedStatement pre;
	ResultSet rs=null;
	
	private Connection getConnection() throws Exception{
		Context init = new InitialContext();
		DataSource ds =(DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		con=ds.getConnection();
		
		return con;
	}//Connection
	
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
	
	public void insertComment(commentDTO cDTO) {
		try {
		
			con=getConnection();
			int num=0;
			sql="select max(num) from comment";
			pre=con.prepareStatement(sql);
			rs=pre.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt("max(num)")+1;
			}
			sql ="insert into comment(date,comment,name,num,boardNum) values(?,?,?,?,?)";
			pre=con.prepareStatement(sql);
			pre.setTimestamp(1,cDTO.getDate());
			pre.setString(2, cDTO.getComment());
			pre.setString(3, cDTO.getName());
			pre.setInt(4,num);
			pre.setInt(5, cDTO.getBoardNum());		
			//첨부파일
			pre.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			obclose();
		}
	}//insertBoard //게시판 작성내용을 저장할 수 있는 저장소

	public List<commentDTO> getCommentList(int startRow,int pageSize){
		
		List<commentDTO> commentList = new ArrayList<commentDTO>();
		try {
			con = getConnection();
//			sql ="select *from comment order by num desc"; => comment의 전체 숫자를 내림차순으로
			sql ="select * from comment order by num desc limit ?,?";
			//select * from comment order by num desc limit 시작행-1, 가져올개수; 
			//comment의 전체 숫자를 ? 개씩 짤라서
			pre= con.prepareStatement(sql);
			pre.setInt(1, startRow-1);//시작할행
			pre.setInt(2, pageSize);//가져올 갯수
			rs= pre.executeQuery();
			
			while(rs.next()) {
				commentDTO cDTO = new commentDTO();
				
				cDTO.setDate(rs.getTimestamp("date"));
				cDTO.setComment(rs.getString("comment"));
				cDTO.setName(rs.getString("name"));
				cDTO.setNum(rs.getInt("num"));
				cDTO.setBoardNum(rs.getInt("boardNum"));
				commentList.add(cDTO);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			obclose();
		}
		return commentList;
	
	}//getBoardList



//검색어 검색했을때 
public List<commentDTO> getCommentList(int startRow,int pageSize,String search){
		
		List<commentDTO> commentList = new ArrayList<commentDTO>();
		try {
			con = getConnection();
//			sql ="select *from comment order by num desc"; => comment의 전체 숫자를 내림차순으로
//			sql ="select * from comment where ttitle like '%검색어%' order by num desc limit ?,?";
			sql ="select * from comment where ttitle like ? order by num desc limit ?,?";
			//select * from comment order by num desc limit 시작행-1, 가져올개수; 
			//comment의 전체 숫자를 ? 개씩 짤라서
			pre= con.prepareStatement(sql);
			pre.setString(1, "%"+search+"%");  //setstring 에서는 작은따옴표가 자동으로 붙는다.
			pre.setInt(2, startRow-1);//시작할행
			pre.setInt(3, pageSize);//가져올 갯수
			rs= pre.executeQuery();
			
			while(rs.next()) {
				commentDTO cDTO = new commentDTO();
				
				cDTO.setDate(rs.getTimestamp("date"));
				cDTO.setComment(rs.getString("comment"));
				cDTO.setName(rs.getString("name"));
				cDTO.setNum(rs.getInt("num"));
				cDTO.setBoardNum(rs.getInt("boardNum"));
				commentList.add(cDTO);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			obclose();
		}
		return commentList;
	
	}//getBoardList
	
public commentDTO getComment(int boardNum) {
	commentDTO cDTO = new commentDTO();
	try {
		con = getConnection();
		sql="select *from comment where boardNum=?";
		pre= con.prepareStatement(sql);
		pre.setInt(1, boardNum);
		rs=pre.executeQuery();
		
		if(rs.next()) {
			cDTO.setDate(rs.getTimestamp("date"));
			cDTO.setComment(rs.getString("comment"));
			cDTO.setName(rs.getString("name"));
			cDTO.setNum(rs.getInt("num"));
		    cDTO.setBoardNum(rs.getInt("boardNum"));
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		obclose();
	}
	return cDTO;
}//getBoard
	

public commentDTO numCheck(int num,String pass) {
	commentDTO cDTO =null;
	try {
		con =getConnection();
		sql="select *from comment where num=? and pass=?";
		pre= con.prepareStatement(sql);
		pre.setInt(1, num);
		pre.setString(2, pass);
		rs=pre.executeQuery();
		
		if(rs.next()) {
			cDTO = new commentDTO();
			cDTO.setNum(rs.getInt("num"));
		}
	}catch (Exception e) {
			e.printStackTrace();
	}finally {
		obclose();
	}return cDTO;
}//numCheck

public void updateComment(commentDTO cDTO) {
	try {
		con = getConnection();
		sql ="update comment set comment=? where num=?";
		pre=con.prepareStatement(sql);
		pre.setString(1, cDTO.getComment());
		pre.setInt(2, cDTO.getNum());
		
		pre.executeUpdate();
	}catch (Exception e) {
		e.printStackTrace();
	}finally {
		obclose();
	}
}//updateBoard




public void deleteBoard(int num) {
	try {
		con=getConnection();
		sql="delete from comment where num=?";
		pre=con.prepareStatement(sql);
		pre.setInt(1, num);
		pre.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		obclose();
	}
}

// select count(*) from comment 
//int count =boardDAO1.getBoardCount();
public int getCommnetCount() {
	int count=0;
	try {
		con = getConnection();
		sql="select count(*) from comment "; //게시판의 전체 글수
		pre= con.prepareStatement(sql);
		rs=pre.executeQuery();
		
		if(rs.next()) {
			count=rs.getInt("count(*)");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		obclose();
	}
	return count;
}//getBoardCount

//오버로딩 :이름이 같아도 다른함수로 인식한다.
public int getCommnetCount(String search) {
	int count=0;
	try {
		con = getConnection();
//		sql="select count(*) from comment where ttitle like '%검색어%'"; //게시판의 전체 글수
		sql="select count(*) from comment where ttitle like ?"; //게시판의 전체 글수
		pre= con.prepareStatement(sql);
//		pre.setString(1, '%검색어%');
		pre.setString(1,"%"+search+"%");
		rs=pre.executeQuery();
		
		if(rs.next()) {
			count=rs.getInt("count(*)");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		obclose();
	}
	return count;
}
}
