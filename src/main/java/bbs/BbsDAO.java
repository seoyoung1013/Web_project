package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	private static Connection conn;
	private ResultSet rs;

	public BbsDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(dbURL,"scott","tiger");

		}catch(Exception e) {
			e.printStackTrace();
		}
	}


	public int getNext() {
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO BBS (bbsID, bbsTitle, userID, bbsContent, bbsAvailable) VALUES (?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, bbsContent);
			pstmt.setInt(5, 1);

			return pstmt.executeUpdate(); 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public ArrayList<Complain> Complain_getList(int pageNumber) {
		String SQL = "SELECT bbsid, bbstitle,userid,TO_CHAR(BBSDATE,'RR/MM/DD'),BBSCONTENT,BBSAVAILABLE, COUNT, LIKE_COUNT, CATEGORY FROM (SELECT * FROM bbs WHERE bbsID < ? and bbsAvailable = 1 order by bbsID desc) WHERE category =1 AND ROWNUM <=10";
		ArrayList<Complain> list = new ArrayList<Complain>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Complain bbs = new Complain();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(1));
				bbs.setBbsCount(rs.getInt(7));
				bbs.setBbsLike_count(rs.getInt(8));
				bbs.setBbsCategory(rs.getInt(9));
				System.out.println(bbs.getBbsCategory());
				list.add(bbs);
			}         
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;

	}
	
	public ArrayList<Complain> Complain_getBestList(int pageNumber) {
		String SQL = "SELECT bbsid, bbstitle,userid,TO_CHAR(BBSDATE,'RR/MM/DD'),BBSCONTENT,BBSAVAILABLE, COUNT, LIKE_COUNT, CATEGORY FROM (SELECT * FROM bbs WHERE bbsID < ? and bbsAvailable = 1 order by count DESC, bbsID DESC) WHERE category =1 AND ROWNUM <=3";
		ArrayList<Complain> list = new ArrayList<Complain>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Complain bbs = new Complain();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(1));
				bbs.setBbsCount(rs.getInt(7));
				bbs.setBbsLike_count(rs.getInt(8));
				bbs.setBbsCategory(rs.getInt(9));
				System.out.println(bbs.getBbsCategory());
				list.add(bbs);
			}         
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;

	}
	
	public ArrayList<Free> Free_getList(int pageNumber) {
		String SQL = "SELECT bbsid, bbstitle,userid,TO_CHAR(BBSDATE,'RR/MM/DD'),BBSCONTENT,BBSAVAILABLE, COUNT, LIKE_COUNT, CATEGORY FROM (SELECT * FROM bbs WHERE bbsID < ? and bbsAvailable = 1 order by bbsID desc) WHERE category =2 AND ROWNUM <=10";
		ArrayList<Free> list_Complain = new ArrayList<Free>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Free bbs = new Free();
				bbs.setFree_ID(rs.getInt(1));
				bbs.setFree_Title(rs.getString(2));
				bbs.setFree_userID(rs.getString(3));
				bbs.setFree_Date(rs.getString(4));
				bbs.setFree_Content(rs.getString(5));
				bbs.setFree_Available(rs.getInt(1));
				bbs.setFree_count(rs.getInt(7));
				bbs.setFree_like_count(rs.getInt(8));
				bbs.setFree_category(rs.getInt(9));
				System.out.println(bbs.getFree_category());
				list_Complain.add(bbs);
			}         
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list_Complain;
	}


	public ArrayList<Free> Free_getBestList(int pageNumber) {
		String SQL = "SELECT bbsid, bbstitle,userid,TO_CHAR(BBSDATE,'RR/MM/DD'),BBSCONTENT,BBSAVAILABLE, COUNT, LIKE_COUNT, CATEGORY FROM (SELECT * FROM bbs WHERE bbsID < ? and bbsAvailable = 1 order by count DESC, bbsID DESC) WHERE category =2 AND ROWNUM <=3";
		ArrayList<Free> list = new ArrayList<Free>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Free bbs = new Free();
				bbs.setFree_ID(rs.getInt(1));
				bbs.setFree_Title(rs.getString(2));
				bbs.setFree_userID(rs.getString(3));
				bbs.setFree_Date(rs.getString(4));
				bbs.setFree_Content(rs.getString(5));
				bbs.setFree_Available(rs.getInt(1));
				bbs.setFree_count(rs.getInt(7));
				bbs.setFree_count(rs.getInt(8));
				bbs.setFree_category(rs.getInt(9));
				System.out.println(bbs.getFree_category());
				list.add(bbs);
			}         
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;

	}
	

	public ArrayList<PR> PR_getList(int pageNumber) {
		String SQL = "SELECT bbsid, bbstitle,userid,TO_CHAR(BBSDATE,'RR/MM/DD'),BBSCONTENT,BBSAVAILABLE, COUNT, LIKE_COUNT, CATEGORY FROM (SELECT * FROM bbs WHERE bbsID < ? and bbsAvailable = 1 order by bbsID desc) WHERE category =3 AND ROWNUM <=10";
		ArrayList<PR> list = new ArrayList<PR>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PR bbs = new PR();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(1));
				bbs.setBbsCount(rs.getInt(7));
				bbs.setBbsLike_count(rs.getInt(8));
				bbs.setBbsCategory(rs.getInt(9));
				System.out.println(bbs.getBbsCategory());
				list.add(bbs);
			}         
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;

	}
	
	public ArrayList<PR> PR_getBestList(int pageNumber) {
		String SQL = "SELECT bbsid, bbstitle,userid,TO_CHAR(BBSDATE,'RR/MM/DD'),BBSCONTENT,BBSAVAILABLE, COUNT, LIKE_COUNT, CATEGORY FROM (SELECT * FROM bbs WHERE bbsID < ? and bbsAvailable = 1 order by count DESC, bbsID DESC) WHERE category =3 AND ROWNUM <=3";
		ArrayList<PR> list = new ArrayList<PR>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PR bbs = new PR();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(1));
				bbs.setBbsCount(rs.getInt(7));
				bbs.setBbsLike_count(rs.getInt(8));
				bbs.setBbsCategory(rs.getInt(9));
				System.out.println(bbs.getBbsCategory());
				list.add(bbs);
			}         
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;

	}
	
	public ArrayList<Study> Study_getList(int pageNumber) {
		String SQL = "SELECT bbsid, bbstitle,userid,TO_CHAR(BBSDATE,'RR/MM/DD'),BBSCONTENT,BBSAVAILABLE, COUNT, LIKE_COUNT, CATEGORY FROM (SELECT * FROM bbs WHERE bbsID < ? and bbsAvailable = 1 order by bbsID desc) WHERE category =4 AND ROWNUM <=10";
		ArrayList<Study> list = new ArrayList<Study>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Study bbs = new Study();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(1));
				bbs.setBbsCount(rs.getInt(7));
				bbs.setBbsLike_count(rs.getInt(8));
				bbs.setBbsCategory(rs.getInt(9));
				System.out.println(bbs.getBbsCategory());
				list.add(bbs);
			}         
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;

	}
	
	public ArrayList<Study> Study_getBestList(int pageNumber) {
		String SQL = "SELECT bbsid, bbstitle,userid,TO_CHAR(BBSDATE,'RR/MM/DD'),BBSCONTENT,BBSAVAILABLE, COUNT, LIKE_COUNT, CATEGORY FROM (SELECT * FROM bbs WHERE bbsID < ? and bbsAvailable = 1 order by count DESC, bbsID DESC) WHERE category =4 AND ROWNUM <=3";
		ArrayList<Study> list = new ArrayList<Study>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Study bbs = new Study();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(1));
				bbs.setBbsCount(rs.getInt(7));
				bbs.setBbsLike_count(rs.getInt(8));
				bbs.setBbsCategory(rs.getInt(9));
				System.out.println(bbs.getBbsCategory());
				list.add(bbs);
			}         
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;

	}
	
	
	public ArrayList<Graduate> Graduate_getList(int pageNumber) {
		String SQL = "SELECT bbsid, bbstitle,userid,TO_CHAR(BBSDATE,'RR/MM/DD'),BBSCONTENT,BBSAVAILABLE, COUNT, LIKE_COUNT, CATEGORY FROM (SELECT * FROM bbs WHERE bbsID < ? and bbsAvailable = 1 order by bbsID desc) WHERE category =5 AND ROWNUM <=10";
		ArrayList<Graduate> list = new ArrayList<Graduate>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Graduate bbs = new Graduate();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(1));
				bbs.setBbsCount(rs.getInt(7));
				bbs.setBbsLike_count(rs.getInt(8));
				bbs.setBbsCategory(rs.getInt(9));
				System.out.println(bbs.getBbsCategory());
				list.add(bbs);
			}         
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;

	}
	
	public ArrayList<Graduate> Graduate_getBestList(int pageNumber) {
		String SQL = "SELECT bbsid, bbstitle,userid,TO_CHAR(BBSDATE,'RR/MM/DD'),BBSCONTENT,BBSAVAILABLE, COUNT, LIKE_COUNT, CATEGORY FROM (SELECT * FROM bbs WHERE bbsID < ? and bbsAvailable = 1 order by count DESC, bbsID DESC) WHERE category =5 AND ROWNUM <=3";
		ArrayList<Graduate> list = new ArrayList<Graduate>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Graduate bbs = new Graduate();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(1));
				bbs.setBbsCount(rs.getInt(7));
				bbs.setBbsLike_count(rs.getInt(8));
				bbs.setBbsCategory(rs.getInt(9));
				System.out.println(bbs.getBbsCategory());
				list.add(bbs);
			}         
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;

	}
	

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public Complain getBbs(int bbsID) {
		String SQL = "SELECT * FROM BBS WHERE bbsID = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Complain bbs = new Complain();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(1));
				bbs.setBbsCount(rs.getInt(7));
				bbs.setBbsLike_count(rs.getInt(8));
				bbs.setBbsCategory(rs.getInt(9));
				return bbs;
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int update(int bbsID, String bbsTitle, String bbsContent) {
		String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);

			return pstmt.executeUpdate(); 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public static int incrementLikeCount(int bbsID) {
		String SQL = "UPDATE BBS SET like_count = like_count + 1 WHERE bbsid = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			pstmt.executeUpdate();
			
			//좋아요 수가 증가시, 조회수도 증가하기 때문에
			String sql = "update BBS set COUNT = COUNT - 1 where bbsid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public static int decreaseLikeCount(int bbsID) {
		String SQL = "UPDATE BBS SET like_count = like_count - 1 WHERE bbsid = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			pstmt.executeUpdate();
			
			//좋아요 수가 감소시, 조회수도 증가하기 때문에
			String sql = "update BBS set COUNT = COUNT - 1 where bbsid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}


	public int increasecount(int bbsID) {
		String SQL = "UPDATE BBS SET COUNT = COUNT + 1 WHERE bbsid = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int delete(int c) {
		String SQL = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, c);
			return pstmt.executeUpdate(); 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}


}