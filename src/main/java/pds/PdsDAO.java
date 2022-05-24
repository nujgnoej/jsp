package pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.BoardVO;
import board.TimeDiff;
import conn.GetConn;

public class PdsDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	PdsVO vo = null;

	// 자료실에 업로드된 파일의 정보를 DB에 저장한다.
	public int setPdsInput(PdsVO vo) {
		int res = 0;
		try {
			sql = "insert into pds values (default,?,?,?,?,?,?,?,?,?,default,default,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setInt(2, vo.getMidIdx());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getfName());
			pstmt.setString(5, vo.getfSName());
			pstmt.setInt(6, vo.getfSize());
			pstmt.setString(7, vo.getTitle());
			pstmt.setString(8, vo.getPart());
			pstmt.setString(9, vo.getPwd());
			pstmt.setString(10, vo.getOpenSw());
			pstmt.setString(11, vo.getContent());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 전체자료 가져오기
	public ArrayList<PdsVO> getPdsList(int startIndexNo, int pageSize, String part) {
		ArrayList<PdsVO> vos = new ArrayList<PdsVO>();
		try {
			if(part.equals("전체")) {
				sql = "select * from pds order by idx desc limit ?, ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
			}
			else {
				sql = "select * from pds where part = ? order by idx desc limit ?, ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, part);
				pstmt.setInt(2, startIndexNo);
				pstmt.setInt(3, pageSize);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new PdsVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMidIdx(rs.getInt("midIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setTitle(rs.getString("title"));
				vo.setPart(rs.getString("part"));
				
				vo.setfDate(rs.getString("fDate"));
				vo.setwCdate(rs.getString("fDate"));
				TimeDiff timeDiff = new TimeDiff();
				int res = timeDiff.timeDiff(vo.getwCdate());
				vo.setwNdate(res);
				
				vo.setDownNum(rs.getInt("downNum"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setContent(rs.getString("content"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}
	
	// 페이징처리를 위한 전체 레코드수 구하기
	public int totRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from pds";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			totRecCnt = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}

	// 개별 자료 검색
	public PdsVO getPdsContent(int idx) {
		vo = new PdsVO();
		try {
			sql = "select * from pds where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			
			vo.setIdx(rs.getInt("idx"));
			vo.setMidIdx(rs.getInt("midIdx"));
			vo.setMid(rs.getString("mid"));
			vo.setNickName(rs.getString("nickName"));
			vo.setfName(rs.getString("fName"));
			vo.setfSName(rs.getString("fSName"));
			vo.setfSize(rs.getInt("fSize"));
			vo.setTitle(rs.getString("title"));
			vo.setPart(rs.getString("part"));
			vo.setPwd(rs.getString("pwd"));
			vo.setfDate(rs.getString("fDate"));
			vo.setDownNum(rs.getInt("downNum"));
			vo.setOpenSw(rs.getString("openSw"));
			vo.setContent(rs.getString("content"));
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 다운로드수 1 증가하기
	public void setPdsDownNum(int idx) {
		try {
			sql = "update pds set downNum = downNum + 1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	// 자료파일을 DB에서 삭제처리한다.
	public void setPdsDelete(int idx) {
		try {
			sql = "delete from pds where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}
}
