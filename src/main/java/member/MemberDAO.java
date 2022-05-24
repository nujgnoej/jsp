package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.swing.plaf.metal.MetalMenuBarUI;

import conn.GetConn;

public class MemberDAO {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	MemberVO vo = null;

	// 아이디 중복체크
	public String memIdCheck(String mid) {
		String name = "";
		try {
			sql = "select name from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) name = rs.getString("name");
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return name;
	}

	// 닉네임 중복체크하기
	public String memNickCheck(String nickName) {
		String name = "";
		try {
			sql = "select name from member where nickName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			if(rs.next()) name = rs.getString("name");
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return name;
	}

	// 회원 가입처리
	public int setMemJoinOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "insert into member values (default,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,default,default,default,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getBirthday());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getEmail());
			pstmt.setString(10, vo.getHomePage());
			pstmt.setString(11, vo.getJob());
			pstmt.setString(12, vo.getHobby());
			pstmt.setString(13, vo.getPhoto());
			pstmt.setString(14, vo.getContent());
			pstmt.setString(15, vo.getUserInfor());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 로그인체크(아이디와 비밀번호 체크)
	public MemberVO getMemLoginOk(String mid, String pwd) {
		vo = new MemberVO();
		try {
			sql = "select * from member where mid = ? and pwd = ? and userDel = 'NO'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setNickName(rs.getString("nickName"));
				vo.setLevel(rs.getInt("level"));
				vo.setLastDate(rs.getString("lastDate"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 방문수,오늘방문수,포인트 증가하기
	public void setMemPointUpdate(String mid) {
		try {
			sql = "update member set point=point+1, visitCnt=visitCnt+1, todayCnt=todayCnt+1, lastDate=now() where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	// 개별 회원 정보를 모두 DB에서 가져와서 vo에 담아준다.
	public MemberVO getUserInfor(String mid) {
		vo = new MemberVO();
		try {
			sql = "select * from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			rs.next();
			
			vo.setIdx(rs.getInt("idx"));
			vo.setMid(rs.getString("mid"));
			vo.setPwd(rs.getString("pwd"));
			vo.setNickName(rs.getString("nickName"));
			vo.setName(rs.getString("name"));
			vo.setGender(rs.getString("gender"));
			vo.setBirthday(rs.getString("birthday"));
			vo.setTel(rs.getString("tel"));
			vo.setAddress(rs.getString("address"));
			vo.setEmail(rs.getString("email"));
			vo.setHomePage(rs.getString("homePage"));
			vo.setJob(rs.getString("job"));
			vo.setHobby(rs.getString("hobby"));
			vo.setPhoto(rs.getString("photo"));
			vo.setContent(rs.getString("content"));
			vo.setUserInfor(rs.getString("userInfor"));
			vo.setUserDel(rs.getString("userDel"));
			vo.setPoint(rs.getInt("point"));
			vo.setLevel(rs.getInt("level"));
			vo.setVisitCnt(rs.getInt("visitCnt"));
			vo.setStartDate(rs.getString("startDate"));
			vo.setLastDate(rs.getString("lastDate"));
			vo.setTodayCnt(rs.getInt("todayCnt"));
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 현재 로그인한 회원이 방명록에 올린 글의 개수 가져오기
	public int getGuestWrite(String mid, String name, String nickName) {
		int guestCnt = 0;
		try {
			sql = "select count(*) as cnt from guest where name = ? or name = ? or name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, name);
			pstmt.setString(3, nickName);
			rs = pstmt.executeQuery();
			rs.next();
			guestCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return guestCnt;
	}

	// 오늘처음 방문시는 오늘방문카운트(todayCnt)를 0으로 셋팅한다.
	public void setTodayCntUpdate(String mid) {
		try {
			sql = "update member set todayCnt = 0 where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	// 회원자료 전체보기
	public ArrayList<MemberVO> getMemList(int level) {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		try {
			if(level != 0) {
				sql = "select * from member where userInfor = '공개' order by idx desc";
			}
			else {
				sql = "SELECT *, TIMESTAMPDIFF(DAY, lastDate, NOW()) as applyDiff from member order by idx desc";
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new MemberVO();

				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				if(level == 0) vo.setApplyDiff(rs.getInt("applyDiff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 회원등급 변경처리
	public void setMemLevelChange(int idx, int level) {
		try {
			sql = "update member set level = ? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	// 회원 탈퇴 신청 처리하기
	public int setMemDeleteUpdate(String mid) {
		int res = 0;
		try {
			sql = "update member set userDel = 'OK' where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 탈퇴신청후 30일이 경과된 회원을 DB에서 완전히 삭제처리한다.
	public int setUserDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from member where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
	// 회원정보 수정하기
	public int setMemUpdateOk(MemberVO vo) {
		int res=0;
		try {
			sql = "update member set nickName=?, name=?, gender=?, birthday=?,"
				+ "tel=?, address=?, email=?, homePage=?, job=?, hobby=?,"
				+ "photo=?, content=?, userInfor=? where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getBirthday());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getAddress());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getHomePage());
			pstmt.setString(9, vo.getJob());
			pstmt.setString(10, vo.getHobby());
			pstmt.setString(11, vo.getPhoto());
			pstmt.setString(12, vo.getContent());
			pstmt.setString(13, vo.getUserInfor());
			pstmt.setString(14, vo.getMid());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 비밀번호 변경하기
	public int setMemUpdatePwdOk(String mid, String newPwd) {
		int res = 0;
		try {
			sql = "update member set pwd = ? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
}
