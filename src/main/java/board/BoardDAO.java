package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class BoardDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	BoardVO vo = null;

	// 전체자료 검색처리
	public ArrayList<BoardVO> getBoList(int startIndexNo, int pageSize, int recent) {
		ArrayList<BoardVO> vos = new ArrayList<BoardVO>();
		try {
//				sql = "select * from board order by idx desc limit ?, ?";
			if(recent == 0) {
				sql = "select *,(select count(*) from boardReply where boardIdx = board.idx) as replyCount from board order by idx desc limit ?, ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
			}
			else {
				sql = "select *,(select count(*) from boardReply where boardIdx = board.idx) as replyCount from board where date_sub(now(), interval ? day) < wDate order by idx desc limit ?, ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, recent);
				pstmt.setInt(2, startIndexNo);
				pstmt.setInt(3, pageSize);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setContent(rs.getString("content"));
				
				// 날짜를 24시간제로 체크하기위해서 사용자가 만든 클래스의 메소드로 처리한다.(timeDiff())
				vo.setwDate(rs.getString("wDate"));
				vo.setwCdate(rs.getString("wDate"));
				TimeDiff timeDiff = new TimeDiff();	// 날짜계산하는 사용자 클래스
				int res = timeDiff.timeDiff(vo.getwCdate());
				vo.setwNdate(res);	// 오늘날짜와 글쓴날짜의 시간차를 숫자형식변수에 저장시켜준다.
				
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setGood(rs.getInt("good"));
				vo.setMid(rs.getString("mid"));
				vo.setReplyCount(rs.getInt("replyCount"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 게시글 저장하기
	public int setBoInputOk(BoardVO vo) {
		int res = 0;
		try {
			sql = "insert into board values (default,?,?,?,?,?,default,default,?,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getHomePage());
			pstmt.setString(5, vo.getContent());
			pstmt.setString(6, vo.getHostIp());
			pstmt.setString(7, vo.getMid());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 게시된 1개 글의 모든 내용을 가져온다.
	public BoardVO getBoContent(int idx) {
		vo = new BoardVO();
		try {
			sql = "select * from board where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setContent(rs.getString("content"));
				vo.setwDate(rs.getString("wDate"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setGood(rs.getInt("good"));
				vo.setMid(rs.getString("mid"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 글 조회수 1 증가하기
	public void setReadNum(int idx) {
		try {
			sql="update board set readNum = readNum + 1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
	}

	// 좋아요 횟수 1 증가처리
	public void setGoodCount(int idx) {
		try {
			sql="update board set good = good + 1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}
	
	// 페이징처리를 위한 전체 레코드수 구하기
	public int totRecCnt(int recent) {
		int totRecCnt = 0;
		try {
			if(recent == 0) {
				sql = "select count(*) as cnt from board";
				pstmt = conn.prepareStatement(sql);
			}
			else {
				sql = "select count(*) as cnt from board where date_sub(now(), interval ? day) < wDate";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, recent);
			}
			rs = pstmt.executeQuery();
			
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}

	// 게시판 검색기 처리
		public ArrayList<BoardVO> getBoSearch(String search, String searchString) {
			ArrayList<BoardVO> vos = new ArrayList<BoardVO>();
			try {
				sql = "select * from board where "+search+" like ? order by idx desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searchString+"%");
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					vo = new BoardVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setNickName(rs.getString("nickName"));
					vo.setTitle(rs.getString("title"));
					vo.setEmail(rs.getString("email"));
					vo.setHomePage(rs.getString("homePage"));
					vo.setContent(rs.getString("content"));
					
					// 날짜를 24시간제로 체크하기위해서 사용자가 만든 클래스의 메소드로 처리한다.(timeDiff())
					vo.setwDate(rs.getString("wDate"));
					vo.setwCdate(rs.getString("wDate"));
					TimeDiff timeDiff = new TimeDiff();	// 날짜계산하는 사용자 클래스
					int res = timeDiff.timeDiff(vo.getwCdate());
					vo.setwNdate(res);  	// 오늘날짜와 글쓴날짜의 시간차를 숫자형식변수에 저장시켜준다.
					
					vo.setReadNum(rs.getInt("readNum"));
					vo.setHostIp(rs.getString("hostIp"));
					vo.setGood(rs.getInt("good"));
					vo.setMid(rs.getString("mid"));
					
					vos.add(vo);
				}
			} catch (SQLException e) {
				System.out.println("SQL 에러 : " + e.getMessage());
			} finally {
				getConn.rsClose();
			}
			return vos;
		}

		// 게시글 수정처리
		public int setBoUpdateOk(BoardVO vo) {
			int res = 0;
			try {
				sql = "update board set title=?, email=?, homePage=?, content=?, hostIp=? where idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getTitle());
				pstmt.setString(2, vo.getEmail());
				pstmt.setString(3, vo.getHomePage());
				pstmt.setString(4, vo.getContent());
				pstmt.setString(5, vo.getHostIp());
				pstmt.setInt(6, vo.getIdx());
				pstmt.executeUpdate();
				res = 1;
			} catch (SQLException e) {
				System.out.println("SQL 에러 : " + e.getMessage());
			} finally {
				getConn.pstmtClose();
			}
			return res;
		}

		// 게시글 삭제처리
		public int setBoDeleteOk(int idx) {
			int res = 0;
			try {
				sql = "delete from board where idx = ?";
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

		// 이전글/다음글 내용 가져오기...
		public BoardVO getPreNextSearch(String str, int idx) {
			vo = new BoardVO();
			try {
				if(str.equals("pre")) {
					sql = "select * from board where idx < ? order by idx desc limit 1";
				}
				else {
					sql = "select * from board where idx > ? limit 1";
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();
				
				if(str.equals("pre") && rs.next()) {
					vo.setPreIdx(rs.getInt("idx"));
					vo.setPreTitle(rs.getString("title"));
				}
				else if(str.equals("next") && rs.next()) {
					vo.setNextIdx(rs.getInt("idx"));
					vo.setNextTitle(rs.getString("title"));
				}
				
			} catch (SQLException e) {
				System.out.println("SQL 에러 : " + e.getMessage());
			} finally {
				getConn.rsClose();
			}
			return vo;
		}

		// 댓글 입력처리
		public String setReplyInputOk(BoardReplyVO replyVo) {
			String res = "0";
			try {
				sql = "insert into boardReply values (default,?,?,?,default,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, replyVo.getBoardIdx());
				pstmt.setString(2, replyVo.getMid());
				pstmt.setString(3, replyVo.getNickName());
				pstmt.setString(4, replyVo.getHostIp());
				pstmt.setString(5, replyVo.getContent());
				pstmt.executeUpdate();
				res = "1";
			} catch (SQLException e) {
				System.out.println("SQL 에러 : " + e.getMessage());
			} finally {
				getConn.pstmtClose();
			}
			return res;
		}

		// 부모글에 해당하는 댓글 내용 가져오기
		public ArrayList<BoardReplyVO> getBoardReply(int boardIdx) {
			ArrayList<BoardReplyVO> replyVos = new ArrayList<BoardReplyVO>();
			try {
				sql = "select * from boardReply where boardIdx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, boardIdx);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BoardReplyVO replyVo = new BoardReplyVO();
					replyVo.setIdx(rs.getInt("idx"));
					replyVo.setBoardIdx(boardIdx);
					replyVo.setMid(rs.getString("mid"));
					replyVo.setNickName(rs.getString("nickName"));

					// 날짜를 24시간제로 체크하기위해서 사용자가 만든 클래스의 메소드로 처리한다.(timeDiff())
					replyVo.setwDate(rs.getString("wDate"));
					replyVo.setwCdate(rs.getString("wDate"));
					TimeDiff timeDiff = new TimeDiff();	// 날짜계산하는 사용자 클래스
					int res = timeDiff.timeDiff(replyVo.getwCdate());
					replyVo.setwNdate(res);	// 오늘날짜와 글쓴날짜의 시간차를 숫자형식변수에 저장시켜준다.
					
					replyVo.setContent(rs.getString("content"));
					replyVo.setHostIp(rs.getString("hostIp"));
					
					replyVos.add(replyVo);
				}
			} catch (SQLException e) {
				System.out.println("SQL 에러 : " + e.getMessage());
			} finally {
				getConn.rsClose();
			}
			return replyVos;
		}

		// 댓글삭제
		public String boReplyDeleteOk(int idx) {
			String res = "0";
			try {
				sql = "delete from boardReply where idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				pstmt.executeUpdate();
				res = "1";
			} catch (SQLException e) {
				System.out.println("SQL 에러 : " + e.getMessage());
			} finally {
				getConn.pstmtClose();
			}
			return res;
		}

		// 댓글수정을 위해, 선택한 댓글의 내용을 가져오기위한 처리
		public String getReplyContent(int replyIdx) {
			String content = "";
			try {
				sql = "select content from boardReply where idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, replyIdx);
				rs = pstmt.executeQuery();
				rs.next();
				content = rs.getString(1);
			} catch (SQLException e) {
				System.out.println("SQL 에러 : " + e.getMessage());
			} finally {
				getConn.rsClose();
			}
			return content;
		}

		// 댓글 자료 수정처리
		public String setReplyUpdateOk(int idx, String content, String hostIp) {
			String res = "0";
			try {
				sql = "update boardReply set content = ?, hostIp = ? where idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, content);
				pstmt.setString(2, hostIp);
				pstmt.setInt(3, idx);
				pstmt.executeUpdate();
				res = "1";
			} catch (SQLException e) {
				System.out.println("SQL 에러 : " + e.getMessage());
			} finally {
				getConn.pstmtClose();
			}
			return res;
		}
}
