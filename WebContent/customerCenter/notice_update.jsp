<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
  <div class="customer-container">
    <div class="customer-row">
      <form method=post action="../customerCenter/notice_update_ok.do">
	      <table class="table">
	       <tr>
			  <th width=20% class="text-center"  style="background-color: #d3d3d3">구분</th>
			  <td width=80% class="text-center" >
			    <select style="float: left;" name=type>
			      <option>시스템 점검</option>
			      <option>극장</option>
			      <option>기타</option>
			    </select>
			  </td>
		   </tr>
	       <tr>
	         <th width="20%" class="text-right">제목</th>
	         <td width="80%">
	           <input type=text name=title size=60 class="input-sm" value="${vo.title }">
	           <input type=hidden name=no value="${vo.no }">
	         </td>
	       </tr>
	       <tr>
	         <th width="20%" class="text-right">내용</th>
	         <td width="80%">
	           <textarea rows="10" cols="60" name=content>${vo.content }</textarea>
	        </td>
	       </tr>
	       <tr>
	         <td class="text-center">
	           <input type=submit value="수정" class="btn btn-sm btn-danger">
	           <input type=button value="취소" class="btn btn-sm btn-success"
	            onclick="javascript:history.back()">
	         </td>
	       </tr>
	      </table>
      </form>
    </div>
  </div>
</div>
</body>
</html>