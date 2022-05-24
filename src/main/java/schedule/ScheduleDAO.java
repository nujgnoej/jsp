package schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class ScheduleDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	ScheduleVO vo = null;

	// 해당 '년-월'의 자료를 모두 검색한다.
	public ArrayList<ScheduleVO> getScheduleList(String mid, String ym) {
		ArrayList<ScheduleVO> vos = new ArrayList();
		try {
			sql = "select * from schedule where mid=? and date_format(sDate,'%Y-%m')=? order by sDate,part";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, ym);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new ScheduleVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPart(rs.getString("part"));
				vo.setsDate(rs.getString("sDate"));
				vo.setContent(rs.getString("content"));
				//vo.setPartCnt(rs.getInt("partCnt"));
				vo.setYm(ym);
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 개별 날짜에 따른 일정목록 가져오기
	public ArrayList<ScheduleVO> getScMenu(String mid, String ymd) {
		ArrayList<ScheduleVO> vos = new ArrayList<ScheduleVO>();
		try {
			sql = "select * from schedule where mid=? and date_format(sDate,'%Y-%m-%d')=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, ymd);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new ScheduleVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPart(rs.getString("part"));
				vo.setsDate(rs.getString("sDate"));
				vo.setContent(rs.getString("content"));
				//vo.setPartCnt(rs.getInt("partCnt"));
				vo.setYmd(ymd);
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 스케줄(일정) 저장하기
	public int setScheduleInputOk(ScheduleVO vo) {
		int res = 0;
		try {
			sql = "insert into schedule values (default,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getsDate());
			pstmt.setString(3, vo.getPart());
			pstmt.setString(4, vo.getContent());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 일정내역 1건 가져오기
	public ScheduleVO getScContent(int idx) {
		vo = new ScheduleVO();
		try {
			sql = "select * from schedule where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			vo = new ScheduleVO();
			
			rs.next();
			vo.setIdx(rs.getInt("idx"));
			vo.setMid(rs.getString("mid"));
			vo.setPart(rs.getString("part"));
			vo.setsDate(rs.getString("sDate"));
			vo.setContent(rs.getString("content"));
			
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 일정 지우기
	public int setScheduleDeleteOk(int idx) {
		int res = 0;
		try {
			sql = "delete from schedule where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 일정관리 수정하기
	public int setScUpdateOk(ScheduleVO vo) {
		int res = 0;
		try {
			sql = "update schedule set part=?, content=? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPart());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getIdx());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

}
