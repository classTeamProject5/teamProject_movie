package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;

import com.sist.vo.MemberVO;
import com.sist.vo.ZipcodeVO;

import javax.naming.*;
public class MemberDAO {
  private Connection conn;
  private PreparedStatement ps;
  private static MemberDAO dao; 
  
  public void getConnection()
  {
	  try
	  {
		  Context init=new InitialContext(); // 저장된 위치에 접근
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
  // 싱글턴 패턴 
  public static MemberDAO newInstance()
  {
	  if(dao==null) // 미생성시에는 
		  dao=new MemberDAO();
	  return dao; // 이미 만들어진 dao객체를 사용한다 
		  
  }
  // 기능 => 아이디 중복 체크!
  public int memberidCheck(String id)
  {
	  int count=0;
	  try
	  {
		  getConnection();
		  String sql="SELECT COUNT(*) FROM project_member "
				    +"WHERE id=?";
		  // count=0 (사용가능한 ID), count=1 (사용중인 ID)
		  ps=conn.prepareStatement(sql);
		  ps.setString(1,id);
		  ResultSet rs=ps.executeQuery();
		  rs.next();
		  count=rs.getInt(1);
		  rs.close();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  disConnection();
	  }
	  return count;
  }
  // 기능 => 우편번호 검색 
  public List<ZipcodeVO> postfind(String dong)
  {
	  System.out.println("postfind:"+dong);
	  List<ZipcodeVO> list=new ArrayList<ZipcodeVO>();
	  try
	  {
		  getConnection();
		  String sql="SELECT zipcode,sido,gugun,dong,NVL(bunji,' ') "
				    +"FROM zipcode "
				    +"WHERE dong LIKE '%'||?||'%'";
		  ps=conn.prepareStatement(sql);
		  ps.setString(1,dong);
		  ResultSet rs=ps.executeQuery();
		  while(rs.next())
		  {
			  ZipcodeVO vo=new ZipcodeVO();
			  vo.setZipcode(rs.getString(1));
			  vo.setSido(rs.getString(2));
			  vo.setGugun(rs.getString(3));
			  vo.setDong(rs.getString(4));
			  vo.setBunji(rs.getString(5));
			  list.add(vo);
		  }
		  rs.close();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  disConnection();
	  }
	  return list;
  }
  public int postfindCount(String dong)
  {
	  int count=0;
	  try
	  {
		  getConnection();
		  String sql="SELECT COUNT(*) "
				    +"FROM zipcode "
				    +"WHERE dong LIKE '%'||?||'%'";
		  ps=conn.prepareStatement(sql);
		  ps.setString(1,dong);
		  ResultSet rs=ps.executeQuery();
		  rs.next();
		  count=rs.getInt(1);
		  rs.close();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  disConnection();
	  }
	  return count;
  }
  // 실제 회원가입 
  public void memberJoinInsert(MemberVO vo)
  {
	  try
	  {
		  getConnection();
		  String sql="INSERT INTO project_member VALUES(?,?,?,?,?,"
				   +"?,?,?,?,?,?,'n')"; // admin(n=일반,y=관리자)
		  ps=conn.prepareStatement(sql);
		  ps.setString(1, vo.getId());
		  ps.setString(2, vo.getPwd());
		  ps.setString(3, vo.getSex());
		  ps.setString(4, vo.getName());
		  ps.setString(5, vo.getBirthday());
		  
		  ps.setString(6, vo.getEmail());
		  ps.setString(7, vo.getPost());
		  ps.setString(8, vo.getAddr1());
		  ps.setString(9, vo.getAddr2());
		  ps.setString(10, vo.getTel());
		  ps.setString(11, vo.getGenre());
		  
		  ps.executeUpdate();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  disConnection();
	  }
  }
  // 로그인 
  public String isLogin(String id,String pwd)
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
  // 회원수정 
  /*
   *  vo.setId(id);
	  vo.setPwd(pwd);
	  vo.setName(name);
	  vo.setSex(sex);
	  vo.setBirthday(birthday);
	  vo.setPost(post1+"-"+post2);
	  vo.setEmail(email);
	  vo.setAddr1(addr1);
	  vo.setAddr2(addr2);
	  vo.setTel(tel1+"-"+tel2);
   */
  public boolean joinUpdate(MemberVO vo)
  {
	  boolean bCheck=false;
	  try
	  {
		  getConnection();
		  String sql="SELECT pwd FROM project_member "
				    +"WHERE id=?";
		  ps=conn.prepareStatement(sql);
		  ps.setString(1, vo.getId());
		  ResultSet rs=ps.executeQuery();
		  rs.next();
		  String db_pwd=rs.getString(1);
		  rs.close();
		  if(db_pwd.equals(vo.getPwd()))
		  {
			  bCheck=true;
			  sql="UPDATE project_member SET "
				 +"name=?,sex=?,birthday=?,post=?,addr1=?,addr2=?,"
			     +"email=?,tel=? "
				 +"WHERE id=?";
			  ps=conn.prepareStatement(sql);
			  ps.setString(1, vo.getName());
			  ps.setString(2, vo.getSex());
			  ps.setString(3, vo.getBirthday());
			  ps.setString(4, vo.getPost());
			  ps.setString(5, vo.getAddr1());
			  ps.setString(6, vo.getAddr2());
			  ps.setString(7, vo.getEmail());
			  ps.setString(8, vo.getTel());
			  ps.setString(9, vo.getId());
			  ps.executeUpdate();
		  }
		  else
		  {
			  bCheck=false;
		  }
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  disConnection();
	  }
	  return bCheck;
  }
  
}