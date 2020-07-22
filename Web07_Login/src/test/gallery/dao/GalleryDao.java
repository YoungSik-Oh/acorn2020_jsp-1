package test.gallery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.gallery.dto.GalleryDto;
import test.util.DbcpBean;

public class GalleryDao {
	private static GalleryDao dao;
	private GalleryDao() {}
	public static GalleryDao getInstance() {
		if(dao==null) {
			dao=new GalleryDao();
		}
		return dao;
	}
	public List<GalleryDto> getList(){
		List<GalleryDto> list=new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 준비하기
			String sql = "select num,writer,caption,imagePath,regdate"
					+ "	from board_gallery"
					+ "	order by num desc";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩 할 값이 있으면 바인딩하고 

			// select 문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 결과 값 추출하기
			while (rs.next()) {
				GalleryDto dto=new GalleryDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setCaption(rs.getString("caption"));
				dto.setImagePath(rs.getString("imagePath"));
				dto.setRegdate(rs.getString("regdate"));
				
				list.add(dto);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
	public boolean insert(GalleryDto dto) {
		Connection conn=null;
				PreparedStatement pstmt=null;
				int flag=0;
				try {
					conn=new DbcpBean().getConn();
					// 실행할 sql 문 준비하기
					String sql="insert into board_gallery"
							+ "	(num,writer,caption,imagePath,regdate)"
							+ "	values(board_gallery_seq.NEXTVAL,?,?,?,SYSDATE)";
					pstmt=conn.prepareStatement(sql);
					// ? 에 바인딩 할 값이 있으면 바인딩한다.
					pstmt.setString(1, dto.getWriter());
					pstmt.setString(2, dto.getCaption());
					pstmt.setString(3, dto.getImagePath());
					//sql 문 수행하고 update or insert or delete 된 row 의 갯수 리턴 받기
					flag=pstmt.executeUpdate();
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if(pstmt!=null)pstmt.close();
						if(conn!=null)conn.close();
					}catch(Exception e) {};
				}
				if(flag>0) {
					return true;
				}else {
					return false;
				}
			}
	// 전체 row 의 갯수를 리턴해주는 메소드
	public int getCount() {
		// 전체 row의 갯수를 담을 지역 변수
		int count=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 준비하기
			// ROWNUM 중에서 가장 큰 숫자를 얻어오면 전체 row 의 갯수가 된다.
			// 혹시 row 가  하나도 없으면 null 이 얻어와 지기때문에  null 인 경우 0으로 바꿔줘야한다.
			String sql = "select navl(select max(ROWNUM), 0) AS num"
					+ "	from board_file";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩 할 값이 있으면 바인딩하고 

			// select 문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 결과 값 추출하기
			if (rs.next()) {
				count=rs.getInt("num");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return count;
	}
}
