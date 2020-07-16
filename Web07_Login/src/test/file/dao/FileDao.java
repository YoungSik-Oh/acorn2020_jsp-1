package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
	private static FileDao dao;
	private FileDao() {};
	public static FileDao getInstance() {
		if(dao==null) {
			dao=new FileDao();
		}	
		return dao;
	}
	// 인자로 전달되는 파일 번호에 해당하는 파일 정보를 삭제하는 메소드
	public boolean  delete(int num) {
				Connection conn=null;
				PreparedStatement pstmt=null;
				int flag=0;
				try {
					conn=new DbcpBean().getConn();
					// 실행할 sql 문 준비하기
					String sql="delete from board_file"
							+ "	where num=?";
					pstmt=conn.prepareStatement(sql);
					// ? 에 바인딩 할 값이 있으면 바인딩한다.
					pstmt.setInt(1, num);
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
	
	// 인자로 전달되는 파일 번호에 해당하는 파일 정보를 리턴하는 메소드
	public FileDto getdata(int num) {
		FileDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 준비하기
			String sql = "select writer,title,orgFileName,saveFileName, fileSize,regdate"
					+ "	from board_file"
					+ "	where num=?";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩 할 값이 있으면 바인딩하고 
			pstmt.setInt(1, num);
			// select 문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 결과 값 추출하기
			if (rs.next()) {
				dto=new FileDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("Title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
				dto.setRegdate(rs.getString("regdate"));
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
		return dto;
	}
	
	// 파일 목록을 리턴해주는 메소드
	public List<FileDto> getList(){
		List<FileDto> list=new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 준비하기
			String sql = "select num, writer, title, orgFileName, saveFileName, fileSize, regdate"
					+ "	from board_file"
					+ "	order by num desc";
			pstmt = conn.prepareStatement(sql);
			// select 문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 결과 값 추출하기
			while (rs.next()) {
				
				FileDto dto=new FileDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
				dto.setRegdate(rs.getString("regdate"));
				// ArrayList 객체에 누적시킨다.
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {	}
		}
		return list;
	}
	// 파일 정보를 DB에 저장하는 메소드
	public boolean insert (FileDto dto) {
				Connection conn=null;
				PreparedStatement pstmt=null;
				int flag=0;
				try {
					conn=new DbcpBean().getConn();
					// 실행할 sql 문 준비하기
					String sql="insert into board_file"
							+ "	( num,writer,title,orgFileName,saveFileName,fileSize,regdate)"
							+ "	values( board_file_seq.NEXTVAL,?,?,?,?,?, SYSDATE)";
					pstmt=conn.prepareStatement(sql);
					// ? 에 바인딩 할 값이 있으면 바인딩한다.
					pstmt.setString(1, dto.getWriter());
					pstmt.setString(2, dto.getTitle());
					pstmt.setString(3, dto.getOrgFileName());
					pstmt.setString(4, dto.getSaveFileName());
					pstmt.setLong(5, dto.getFileSize());
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
	
}
