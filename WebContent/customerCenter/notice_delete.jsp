<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">b
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>
<body>
<div>
  <div class="customer-container">
    <div class="customer-row">
      <form method=post action="../customerCenter/notice_delete_ok.do">
	      <table class="table">
	       <tr>
	         <td class="inline">
	           	정말로 삭제하십니까?
	           <input type=hidden name=no value="${no }">
	         </td>
	       </tr>
	       <tr>
	         <td class="text-center">
	           <input type=submit value="삭제" class="btn btn-sm btn-danger">
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