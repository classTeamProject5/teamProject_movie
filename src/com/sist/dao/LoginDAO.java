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
	  
	 public String login(String id, String pwd)
	 {
		 String result="";
		  try
		  {
			  getConnection();
			  String sql="SELECT COUNT(*) "
					    +"FROM project_member "
					    +"WHERE id=?";
			  ps=conn.prepareStatement(sql); //id가 존재하는지 체크
			  ps.setString(1, id);
			  ResultSet rs=ps.executeQuery();
			  rs.next();
			  int count=rs.getInt(1);
			  rs.close();
			  
			  if(count==0) //ID가 없는 상태
			  {
				  result="NOID";
			  }
			  else // ID가 있는 상태
			  {
				  sql="SELECT pwd,name,admin FROM project_member "
					 +"WHERE id=?";
				  ps=conn.prepareStatement(sql);
				  ps.setString(1, id);
				  rs=ps.executeQuery();
				  rs.next();
				  String db_pwd=rs.getString(1);
				  String name=rs.getString(2);
				  String admin=rs.getString(3);
				  rs.close();
				  // 비밀번호 확인 
				  if(db_pwd.equals(pwd))//로그인
				  {
					  result=name+"|"+admin;
				  }
				  else
				  {
					  result="NOPWD";
				  }
			  }
		  }catch(Exception ex)
		  {
			  ex.printStackTrace();
		  }
		  finally
		  {
			  disConnection();
		  }
		  return result;
	 }
	 
	 public String login_idfind_email(String email)
	  {
		   String result="";
		   try
		   {
			   getConnection();
			   String sql="SELECT COUNT(*) FROM project_member "
					     +"WHERE email=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, email);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   int count=rs.getInt(1);
			   rs.close();
			   
			   if(count==0)
			   {
				   result="no";
			   }
			   else
			   {
				   sql="SELECT RPAD(SUBSTR(id,1,1),LENGTH(id),'*') FROM project_member "
					  +"WHERE email=?";
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, email);
				   rs=ps.executeQuery();
				   rs.next();
				   result=rs.getString(1);
				   rs.close();
			   }
			   
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
		   return result;
	  }
	  public String login_idfind_tel(String tel)
	  {
		   String result="";
		   try
		   {
			   getConnection();
			   String sql="SELECT COUNT(*) FROM project_member "
					     +"WHERE tel=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, tel);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   int count=rs.getInt(1);
			   rs.close();
			   
			   if(count==0)
			   {
				   result="no";
			   }
			   else
			   {
				   sql="SELECT RPAD(SUBSTR(id,1,1),LENGTH(id),'*') FROM project_member "
					  +"WHERE tel=?";
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, tel);
				   rs=ps.executeQuery();
				   rs.next();
				   result=rs.getString(1);
				   rs.close();
			   }
			   
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
		   return result;
	  }
	  
}