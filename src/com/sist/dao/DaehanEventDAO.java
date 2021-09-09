package com.sist.dao;

import java.sql.*;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class DaehanEventDAO {

	// 오라클 연결 객체
	private Connection conn;
	// SQL문장 전송 객체
	private PreparedStatement ps;
	// 오라클 서버 주소
	private final String URL = "jdbc:oracle:thin:@211.238.142.208:1521:XE";

	// 1. 드라이버 등록
	public DaehanEventDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	// 2. 오라클 연결
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, "hr", "happy");
			// conn hr/happy
		} catch (Exception ex) {
		}
	}

	// 3. 오라클 해제 => JDBC => DBCP => ORM(MyBatis,JPA,Hibernate...)
	public void disConnection() {
		try {
			if (ps != null)
				ps.close(); // 연결중이면 닫는다
			if (conn != null)
				conn.close();
		} catch (Exception ex) {
		}
	}
	
	//********************************************************************************//
	//********************************************************************************//
	// 4. 대한극장 이벤트 입력
	// 4.1 전체 목록 출력에 대한 함수.
		public ArrayList<DaehanEventVO> daehanEventListData() {
			ArrayList<DaehanEventVO> list = new ArrayList<DaehanEventVO>();
			try {
				// 1. 연결
				getConnection();
				// 2. SQL문장 전송
				String sql = "SELECT * FROM event_main ORDER BY event_term DESC"; // ORDER BY empno ASC";
				ps = conn.prepareStatement(sql);
				// 3. 실행후 결과 읽기
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					DaehanEventVO vo = new DaehanEventVO();
					vo.setNum(rs.getInt(1));
					vo.setEvent_category(rs.getString(2));
					vo.setEvent_poster(rs.getString(3));
					vo.setEvent_title(rs.getString(4));
					vo.setEvent_term(rs.getString(5));
					vo.setEvent_state(rs.getString(6));
					vo.setKey(rs.getString(7));

					list.add(vo);
				}
				rs.close();
			} catch (Exception ex) {
				// 오류확인
				ex.printStackTrace();
			} finally {
				// 닫기
				disConnection();
			}
			return list;
		}
		//*************************************오류생기면 지우기 0820적은 메소드*******//
		//4.2 이벤트 중 영화관련 목록 출력에 대한 함수.
				public ArrayList<DaehanEventVO> daehanEventListData_movie() {
					ArrayList<DaehanEventVO> list = new ArrayList<DaehanEventVO>();
					try {
						// 1. 연결
						getConnection();
						// 2. SQL문장 전송
						String sql = "SELECT * FROM event_main WHERE event_category='영화'"; 
						ps = conn.prepareStatement(sql);
						// 3. 실행후 결과 읽기
						ResultSet rs = ps.executeQuery();
						while (rs.next()) {
							DaehanEventVO vo = new DaehanEventVO();
							vo.setNum(rs.getInt(1));
							vo.setEvent_category(rs.getString(2));
							vo.setEvent_poster(rs.getString(3));
							vo.setEvent_title(rs.getString(4));
							vo.setEvent_term(rs.getString(5));
							vo.setEvent_state(rs.getString(6));
							vo.setKey(rs.getString(7));

							list.add(vo);
						}
						rs.close();
					} catch (Exception ex) {
						// 오류확인
						ex.printStackTrace();
					} finally {
						// 닫기
						disConnection();
					}
					return list;
				}
		//4.3 이벤트 중 극장관련 목록 출력에 대한 함수.
				public ArrayList<DaehanEventVO> daehanEventListData_theater() {
					ArrayList<DaehanEventVO> list = new ArrayList<DaehanEventVO>();
					try {
						// 1. 연결
						getConnection();
						// 2. SQL문장 전송
						String sql = "SELECT * FROM event_main WHERE event_category='극장'"; 
						ps = conn.prepareStatement(sql);
						// 3. 실행후 결과 읽기
						ResultSet rs = ps.executeQuery();
						while (rs.next()) {
							DaehanEventVO vo = new DaehanEventVO();
							vo.setNum(rs.getInt(1));
							vo.setEvent_category(rs.getString(2));
							vo.setEvent_poster(rs.getString(3));
							vo.setEvent_title(rs.getString(4));
							vo.setEvent_term(rs.getString(5));
							vo.setEvent_state(rs.getString(6));
							vo.setKey(rs.getString(7));

							list.add(vo);
						}
						rs.close();
					} catch (Exception ex) {
						// 오류확인
						ex.printStackTrace();
					} finally {
						// 닫기
						disConnection();
					}
					return list;
				}
		//*************************************************************************//
		//*************************************************************************//
		
		//목록 삽입에 대한 함수
		public void daehanEventDataInsert(DaehanEventVO vo) {
			try {
				
				getConnection();
				
				String sql = "INSERT INTO event_main VALUES(?,?,?,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, vo.getNum());
				ps.setString(2, vo.getEvent_category());	
				ps.setString(3, vo.getEvent_poster());
				ps.setString(4, vo.getEvent_title());
				ps.setString(5, vo.getEvent_term());
				ps.setString(6, null);
				ps.setString(7, vo.getKey());
				
				ps.executeUpdate(); 
				
			} catch (Exception ex) {
				ex.printStackTrace(); 
			} finally {
				disConnection(); 
			}
		}
		
		//6. 데이터 크롤하기
		public void daehanEvent_theater_DataCrawling() { /*이벤트-극장부분 크롤링*/
			DaehanEventDAO dao = new DaehanEventDAO();
			
			try {
				int k = 1;
				for(int i=1;i<=10;i++) { //괄호 아직 안닫음.
				
				Document doc = Jsoup.connect("https://www.daehancinema.co.kr/Event/List?TYPE=EVENTTYPE02&PAGE_NO="+i).get();
				//num
				Elements daehan_event_poster = doc.select("div.img_thumb > a > img");//
				//Elements daehan_event_category = "극장";
				Elements daehan_event_title = doc.select("div.event_link_box > div:nth-child(2) > p:nth-child(1)");
				Elements daehan_event_term = doc.select("div.event_link_box > div:nth-child(2) > p:nth-child(2)");
				//key
				
			
				for (int j = 0; j < daehan_event_title.size(); j++) {
					try {
						System.out.println("NUM:" + k);
						System.out.println("이미지:" + daehan_event_poster.get(j).attr("src"));
						System.out.println("제목:" + daehan_event_title.get(j).text());
						System.out.println("날짜:" + daehan_event_term.get(j).text());
				
						DaehanEventVO vo = new DaehanEventVO();
						vo.setNum(k);
						vo.setEvent_category("극장");
						vo.setEvent_poster(daehan_event_poster.get(j).attr("src"));
						vo.setEvent_title(daehan_event_title.get(j).text());
						vo.setEvent_term(daehan_event_term.get(j).text());
					
						dao.daehanEventDataInsert(vo);
						System.out.println("=========================================");

						k++;
					} catch (Exception ex) {
					}
				}
				}

			} catch (Exception ex) {
			}
		}
		
		
		
		public void daehanEvent_movie_DataCrawling() { /*이벤트-영화부분 크롤링*/
			DaehanEventDAO dao = new DaehanEventDAO();
			
			try {
				int k = 101;
				for(int i=1;i<=10;i++) { //임시로 10페이지만큼 긁음.
				
				Document doc = Jsoup.connect("https://www.daehancinema.co.kr/Event/List?TYPE=EVENTTYPE01&PAGE_NO="+i).get();
				//num
				Elements daehan_event_poster = doc.select("div.img_thumb > a > img");//
				//Elements daehan_event_category = "극장";
				Elements daehan_event_title = doc.select("div.event_link_box > div:nth-child(2) > p:nth-child(1)");
				Elements daehan_event_term = doc.select("div.event_link_box > div:nth-child(2) > p:nth-child(2)");
				//key
				
			
				for (int j = 0; j < daehan_event_title.size(); j++) {
					try {
						System.out.println("NUM:" + k);
						System.out.println("이미지:" + daehan_event_poster.get(j).attr("src"));
						System.out.println("제목:" + daehan_event_title.get(j).text());
						System.out.println("날짜:" + daehan_event_term.get(j).text());
				
						DaehanEventVO vo = new DaehanEventVO();
						vo.setNum(k);
						vo.setEvent_category("영화");
						vo.setEvent_poster(daehan_event_poster.get(j).attr("src"));
						vo.setEvent_title(daehan_event_title.get(j).text());
						vo.setEvent_term(daehan_event_term.get(j).text());
					
						dao.daehanEventDataInsert(vo);
						System.out.println("=========================================");

						k++;
					} catch (Exception ex) {
					}
				}
				}

			} catch (Exception ex) {
			}
		}
		
		//***********************************************************************************//
		//**********************************************************************************//
		public ArrayList<DaehanEventVO> daehanEvent_ListData_Paging(int page){
			//페이징하는 함수 아직 테스트 안해봄. Daehan List_servlet 만들어야함.
			ArrayList<DaehanEventVO> list = new ArrayList<DaehanEventVO>(); //가변형. 
			try {
				//1. 연결
				 getConnection();
				 //2. sql 문장 만들기
				 String sql = "SELECT num, event_poster, event_title, event_term, rnum"
						 + "FROM (SELECT num, event_poster, event_title, event_term, rownum as rnum"
						 + "FROM (SELECT num, event_poster, evemt_title, event_term"
						 + "FROM event_main ORDER BY num ASC))"
						 + "WHERE rnum BETWEEN ? AND ?";
				 int rowSize=20;
				 int start=(rowSize*page)-(rowSize-1);
				 int end=rowSize*page;
				 ps=conn.prepareStatement(sql);
					ps.setInt(1, start);
					ps.setInt(2, end);
					// 페이지 나눈다 
					// 데이터 읽기
					ResultSet rs=ps.executeQuery();
					while(rs.next())
					{
					    	DaehanEventVO vo=new DaehanEventVO();
					    	vo.setNum(rs.getInt(1));
					    	vo.setEvent_poster(rs.getString(2));
					    	vo.setEvent_title(rs.getString(3));
					    	vo.setEvent_term(rs.getString(4));
					    	//vo.setAlbum(rs.getString(5));
							/*
							 * vo.setState(rs.getString(6)); vo.setIdcrement(rs.getInt(7));
							 * vo.setKey(rs.getString(8));
							 */
					    	list.add(vo);
					}
					rs.close();
				
			}catch(Exception ex) {
				ex.printStackTrace(); // 에러 처리
			}finally {
				disConnection();
			}
			return list;
		}
		
		//********************************************************************************************//
		//********************************************************************************************//
		public int daehanEvent_TotalPage_Paging() {
			
			int total=0; 
			try {
				getConnection();
				String sql = "SELECT CEIL (COUNT(*)/20.0) FROM event_main";
				ps=conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				rs.next();
				total= rs.getInt(1);
				rs.close();
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				disConnection();
			}
			return total;
		}
		//**********************************************************************************************//
		//**********************************************************************************************//
		public DaehanEventVO daehanEvent_DetailData_Paging(int num) {
			DaehanEventVO vo = new DaehanEventVO();
			try {
				getConnection();
				
				String sql = "SELECT num, event_title, event_term, key"
						+ "FROM event_main"
						+ "WHERE num="+ num;
				ps=conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				rs.next();
				
				vo.setNum(rs.getInt(1));
				vo.setEvent_title(rs.getString(2));
				vo.setEvent_term(rs.getString(3));
				vo.setKey(rs.getString(4));
				rs.close();
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				disConnection();
			}
			return vo;
		}
}
