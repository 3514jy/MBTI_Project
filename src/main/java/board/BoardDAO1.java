package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO1 {
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
		
	public void insertBoard(BoardDTO1 boardDTO) {
		try {
		
			con=getConnection();
			int num=0;
			sql="select max(num) from board";
			pre=con.prepareStatement(sql);
			rs=pre.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt("max(num)")+1;
			}
			sql ="insert into board(num,name,pass,ttitle,twrite,content,date,readcount,file) "
					+ "values(?,?,?,?,?,?,?,?,?)";
			pre=con.prepareStatement(sql);
			pre.setInt(1,num);
			pre.setString(2, boardDTO.getName());
			pre.setString(3,boardDTO.getPass());
			pre.setString(4,boardDTO.getTtitle());
			pre.setString(5,boardDTO.getTwrite());
			pre.setString(6,boardDTO.getContent());
			pre.setTimestamp(7,boardDTO.getDate());
			pre.setInt(8,boardDTO.getReadcount());
			//첨부파일
			pre.setString(9,boardDTO.getFile());
			pre.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			obclose();
		}
	}//insertBoard //게시판 작성내용을 저장할 수 있는 저장소
	
		public List<BoardDTO1> getBoardList(int startRow,int pageSize){
			
			List<BoardDTO1> boardList = new ArrayList<BoardDTO1>();
			try {
				con = getConnection();
//				sql ="select *from board order by num desc"; => board의 전체 숫자를 내림차순으로
				sql ="select * from board order by num desc limit ?,?";
				//select * from board order by num desc limit 시작행-1, 가져올개수; 
				//board의 전체 숫자를 ? 개씩 짤라서
				pre= con.prepareStatement(sql);
				pre.setInt(1, startRow-1);//시작할행
				pre.setInt(2, pageSize);//가져올 갯수
				rs= pre.executeQuery();
				
				while(rs.next()) {
					BoardDTO1 boardDTO = new BoardDTO1();
					
					boardDTO.setNum(rs.getInt("num"));
					boardDTO.setPass(rs.getString("pass"));
					boardDTO.setName(rs.getString("name"));
					boardDTO.setTtitle(rs.getString("ttitle"));
					boardDTO.setTwrite(rs.getNString("twrite"));
					boardDTO.setContent(rs.getString("content"));
					boardDTO.setDate(rs.getTimestamp("date"));
					boardDTO.setReadcount(rs.getInt("readcount"));
				    boardDTO.setFile(rs.getString("file"));
					
					boardList.add(boardDTO);
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				obclose();
			}
			return boardList;
		
		}//getBoardList

		//검색어 검색했을때 
public List<BoardDTO1> getBoardList(int startRow,int pageSize,String search){
			
			List<BoardDTO1> boardList = new ArrayList<BoardDTO1>();
			try {
				con = getConnection();
//				sql ="select *from board order by num desc"; => board의 전체 숫자를 내림차순으로
//				sql ="select * from board where ttitle like '%검색어%' order by num desc limit ?,?";
				sql ="select * from board where ttitle like ? order by num desc limit ?,?";
				//select * from board order by num desc limit 시작행-1, 가져올개수; 
				//board의 전체 숫자를 ? 개씩 짤라서
				pre= con.prepareStatement(sql);
				pre.setString(1, "%"+search+"%");  //setstring 에서는 작은따옴표가 자동으로 붙는다.
				pre.setInt(2, startRow-1);//시작할행
				pre.setInt(3, pageSize);//가져올 갯수
				rs= pre.executeQuery();
				
				while(rs.next()) {
					BoardDTO1 boardDTO = new BoardDTO1();
					
					boardDTO.setNum(rs.getInt("num"));
					boardDTO.setPass(rs.getString("pass"));
					boardDTO.setName(rs.getString("name"));
					boardDTO.setTtitle(rs.getString("ttitle"));
					boardDTO.setTwrite(rs.getNString("twrite"));
					boardDTO.setContent(rs.getString("content"));
					boardDTO.setDate(rs.getTimestamp("date"));
					boardDTO.setReadcount(rs.getInt("readcount"));
				    boardDTO.setFile(rs.getString("file"));
					
					boardList.add(boardDTO);
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				obclose();
			}
			return boardList;
		
		}//getBoardList
		
	public BoardDTO1 getBoard(int num) {
		BoardDTO1 boardDTO = new BoardDTO1();
		try {
			con = getConnection();
			sql="select *from board where num=?";
			pre= con.prepareStatement(sql);
			pre.setInt(1, num);
			rs=pre.executeQuery();
			
			if(rs.next()) {
				boardDTO.setNum(rs.getInt("num"));
				boardDTO.setPass(rs.getString("pass"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setTtitle(rs.getString("ttitle"));
				boardDTO.setTwrite(rs.getNString("twrite"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setDate(rs.getTimestamp("date"));
				boardDTO.setReadcount(rs.getInt("readcount"));
			    boardDTO.setFile(rs.getString("file"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			obclose();
		}
		return boardDTO;
	}//getBoard
		
	
	public BoardDTO1 numCheck(int num,String pass) {
		BoardDTO1 boardDTO =null;
		try {
			con =getConnection();
			sql="select *from board where num=? and pass=?";
			pre= con.prepareStatement(sql);
			pre.setInt(1, num);
			pre.setString(2, pass);
			rs=pre.executeQuery();
			
			if(rs.next()) {
				boardDTO = new BoardDTO1();
				boardDTO.setNum(rs.getInt("num"));
			}
		}catch (Exception e) {
				e.printStackTrace();
		}finally {
			obclose();
		}return boardDTO;
	}//numCheck
	
	public void updateBoard(BoardDTO1 boardDTO) {
		try {
			con = getConnection();
			sql ="update board set ttitle=?,content=?  where num=?";
			pre=con.prepareStatement(sql);
			pre.setString(1,boardDTO.getTtitle());
			pre.setString(2, boardDTO.getContent());
			pre.setInt(3, boardDTO.getNum());
			
			pre.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			obclose();
		}
	}//updateBoard
	
	public void newUpdateBoard(BoardDTO1 boardDTO) {
		try {
			con = getConnection();
			sql ="update board set ttitle=?,content=?,file=?  where num=?";
			pre=con.prepareStatement(sql);
			pre.setString(1,boardDTO.getTtitle());
			pre.setString(2, boardDTO.getContent());
			pre.setString(3, boardDTO.getFile());
			pre.setInt(4, boardDTO.getNum());
			
			pre.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			obclose();
		}
	}//newUpdateBoard
	
	public void updateReadcount(int num) {
		try {
			con=getConnection();
			sql="update board set readcount=readcount+1 where num=?";
			pre=con.prepareStatement(sql);
			pre.setInt(1, num);
			pre.executeUpdate();
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			obclose();
		}
	}//updateReadcount
	
	public void deleteBoard(int num) {
		try {
			con=getConnection();
			sql="delete from board where num=?";
			pre=con.prepareStatement(sql);
			pre.setInt(1, num);
			pre.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			obclose();
		}
	}
	
	// select count(*) from board 
//	int count =boardDAO1.getBoardCount();
	public int getBoardCount() {
		int count=0;
		try {
			con = getConnection();
			sql="select count(*) from board "; //게시판의 전체 글수
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
	public int getBoardCount(String search) {
		int count=0;
		try {
			con = getConnection();
//			sql="select count(*) from board where ttitle like '%검색어%'"; //게시판의 전체 글수
			sql="select count(*) from board where ttitle like ?"; //게시판의 전체 글수
			pre= con.prepareStatement(sql);
//			pre.setString(1, '%검색어%');
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
	
	
	
}//BoardDAO
