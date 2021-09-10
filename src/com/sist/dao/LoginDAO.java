package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LoginDAO {
	private Connection conn;
	  private PreparedStatement ps;
	  private static LoginDAO dao; // 싱글턴 패턴 (static:메모리 공간을 한개만 사용이 가능) => 재사용 
	  // Connection 주소 읽기 => Connection객체를 미리생성 => 생성시간을 줄여서 속도가 빠르게 만든다 
	  // 갯수 지정을 했기에 Connection객체 관리가 편하다 => 모든 웹사이트 개발는 95%가 DBCP를 사용한다 
	  // Connection 객체 얻기 
	  public void getConnection()
	  {
		  try
		  {
			  Context init=new InitialContext(); // 저장된 위치에 접근 
			  // JNDI (java naming directory interface)
			  Context c=(Context)init.lookup("java://comp//env");
			  DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			  conn=ds.getConnection();
		  }catch(Exception ex) 
		  {
			  ex.printStackTrace();
		  }
	  }
	  // 사용후 반환 -> 다른사람이 재사용이 가능하게 만든다 
	  public void disConnection()
	  {
		  try
		  {
			  if(ps!=null) ps.close();
			  if(conn!=null) conn.close();
		  }catch(Exception ex) {}
	  }
	  
	  public static LoginDAO newInstance()
	  {
		  if(dao==null) // 미생성시에는 
			  dao=new LoginDAO();
		  return dao; // 이미 만들어진 dao객체를 사용한다 
			  
	  }
	  
		public int login(String id, String pwd) {
			String sql="SELECT pwd FROM project_login "
				    +"WHERE id=?";
			try {
				ps = conn.prepareStatement(sql); 
				ps.setString(1, id); //첫번째 '?'에 매개변수로 받아온 'userID'를 대입
				ResultSet rs=ps.executeQuery(); //쿼리를 실행한 결과를 rs에 저장
				if(rs.next()) {
					if(rs.getString(1).equals(pwd)) {
						return 1; //로그인 성공
					}else
						return 0; //비밀번호 틀림
				}
				return -1; //아이디 없음
			}catch (Exception ex) {
				ex.printStackTrace();
			}
			return -2; //오류
		}
}
