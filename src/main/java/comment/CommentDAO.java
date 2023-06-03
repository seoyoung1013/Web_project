package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class CommentDAO {
	private Connection conn;	//db�� �����ϴ� ��ü
	private ResultSet rs;
	
	public CommentDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(dbURL,"scott","tiger");

		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public int getNext() {
		String SQL = "SELECT commentID FROM comment1 ORDER BY commentID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 1; //ù��° ����� ���
	}
	public int write(String commentText, String userID, int bbsID) {
		String SQL = "INSERT INTO comment1 (commentText, commentID, userID, commentAvailable, bbsID) VALUES(?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, commentText);
			pstmt.setInt(2, getNext());
			pstmt.setString(3, userID);
			pstmt.setInt(4,1);
			pstmt.setInt(5, bbsID);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	public String getUpdateComment(int commentID) {
		String SQL = "SELECT commentText FROM comment1 WHERE commentID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //����
	}
	public ArrayList<Comment> getList(int bbsID){
		String SQL = "SELECT commentText,commentID,userID,commentAvailable,TO_CHAR(commentDATE,'RR/MM/DD'),BbsID FROM comment1 WHERE bbsID= ? AND commentAvailable = 1 ORDER BY bbsID DESC"; 
		ArrayList<Comment> list = new ArrayList<Comment>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  bbsID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comment cmt = new Comment();
				cmt.setCommentText(rs.getString(1));
				cmt.setCommentID(rs.getInt(2));
				cmt.setUserID(rs.getString(3));
				cmt.setCommentAvailable(rs.getInt(4));
				cmt.setCommentDate(rs.getString(5));
				cmt.setBbsID(rs.getInt(6));
				
				list.add(cmt);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //�����ͺ��̽� ����
	}
	
	public int update(int bbsID, int commentID,String commentText ) {
		String SQL="update comment1 set commentText = ? where bbsID = ? and commentID = ?"; 
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, commentText);//물음표의 순서
			pstmt.setInt(2, bbsID);
			pstmt.setInt(3, commentID);
			return pstmt.executeUpdate();//insert,delete,update			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
	public Comment getComment(int commentID) {
		String SQL = "SELECT * FROM comment1 WHERE commentID = ? ORDER BY commentID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  commentID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comment cmt = new Comment();
				cmt.setCommentText(rs.getString(1));
				cmt.setCommentID(rs.getInt(2));
				cmt.setUserID(rs.getString(3));
				cmt.setCommentAvailable(rs.getInt(4));
				cmt.setCommentDate(rs.getString(5));
				cmt.setBbsID(rs.getInt(6));
				return cmt;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int delete(int commentID) {
		String SQL = "UPDATE comment1 SET commentAvailable = 0 WHERE commentID = ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
}