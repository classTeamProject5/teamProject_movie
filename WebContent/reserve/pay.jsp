<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/seat.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
.panel{
border:none;
}
.pay_btn{
	width:49%;
	height:40px;
	border-radius: 1em;
	border-color:#434343;
	background-color:#319eb2; 
	color:white; 
	font-weight: bold;
	font-size:11pt;
	vertical-align:bottom;
}
.p_btn{
 width:100px;
 background-color:#f5f5f5;
 border-radius: 5px;
}
</style>
</head>
<body>

	<div class="container text-center">
		<h3>결제하기</h3>
		<br>
		<hr style="background-color: black; height: 1px; border: 0px;">


	</div>
	<div class="container">
		<div class="row" style="margin-top: 50px;">

			<div class="col-sm-6">			
			
			  <div class="panel-group" id="accordion">
			    <div class="panel panel-default">
			      <div class="panel-heading" style="background-color: #4f3397; height="70px"">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" style="color: white;font-size: 13pt; text-decoration: none;" >카드결제 <img src="../reserve/arrow_down1.png" style="margin-left: 420px; width:20px; height:20px"></a>
			        </h4>
			      </div>
			      
			      <div id="collapse1" class="panel-collapse collapse in" >
			        <div>
			          <table class="container" style="margin-left:20px;">
			            <tr>
			              <td>
			                <label for="sel1" style="margin-top:35px">카드사 선택</label>
							  <select class="form-control" id="sel1" style="width:400px;">
							    <option>--카드사 선택--</option>
							    <option>국민카드</option>
							    <option>신한카드</option>
							    <option>삼성카드</option>
							    <option>현대카드</option>
							    <option>비씨카드</option>
							    <option>롯데카드</option>
							  </select>
			              </td>
			            </tr>
			            <tr>
			              <td>
			                	<span style="font-weight: bold;">카드번호 :</span> <input type=text size=40 class="input-sm" style="margin-top:15px">
			              </td>
			            </tr>
			              <tr>
			              <td>
			              <div style="margin-top:20px">
			                <span style="font-weight: bold;">유효기간 :</span>	
			                <select name="mm" id="pay_month"></select>월			                	
			                <select name="yy" id="pay_year"></select>년
			               </div> 			                	
			              </td>
			            </tr>
			             <tr>
			              <td>
			                <span style="font-weight: bold;">이름 :</span> <input type=text size=15 class="input-sm" style="margin:15px 0 0 29px">			                	
			              </td>
			            </tr>
			             <tr>
			              <td>			                	
			                <span style="font-weight: bold;">비밀번호 :</span> <input type=text maxlength='2' class="input-sm" style="margin-top:15px; width:40px"> * *
			              </td>
			            </tr>
			            <tr>
			              <td>
			                <input type="button" class="p_btn" value="확인" style="margin:40px 60px 10px 100px;">
			                 <input type="button" class="p_btn" value="취소" style="margin-left: 30px;">
			              </td>
			            </tr>
			          </table>
			        </div>
			      </div>
			      
			    </div>
			    
			    <div class="panel panel-default">
			      <div class="panel-heading" style="background-color: #4f3397; margin:20px 0">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2" style="color: white; font-size: 13pt;text-decoration: none;">포인트결제<img src="../reserve/arrow_down1.png" style="margin-left: 405px;width:20px; height:20px"></a>
			        </h4>
			      </div>
			      <div id="collapse2" class="panel-collapse collapse">
			      
			        <div>
			          <span style="margin-left:10px;font-weight: bold;">사용 포인트:<input type="textbox" style="margin:30px 10px 40px 10px; width:150px;"></span>   
			          <span style="margin-left:10px;font-weight: bold;">보유 포인트:<input type="textbox" disabled style="margin:30px 10px 40px 10px; width:150px;"></span> 
			           <div align="right">
			             <input type='button' class="p_btn" value='포인트 사용' style="margin:15px 45px 100px 0">
			           </div> 
			        </div>			        			      			        		       			          			      
			      </div>
			    </div>
			    
			    <div class="panel panel-default">
			      <div class="panel-heading" style="background-color: #4f3397;">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3" style="color: white; font-size: 13pt;text-decoration: none;">쿠폰결제<img src="../reserve/arrow_down1.png" style="margin-left: 420px;width:20px; height:20px"></a>
			        </h4>
			      </div>
			      
			      <div id="collapse3" class="panel-collapse collapse">			       
			        
			        
			        <div>
			          <span style="margin-left:10px;font-weight: bold;">쿠폰번호 입력:<input type="textbox" style="margin:40px 10px 10px 10px; width:250px;"></span>
			          <input type='button' class="p_btn" value='내 쿠폰함' style="margin-left:30px">			    
			        </div>	
			        <div>
			        <!--   <input type='button' name='btn' value='내 쿠폰함' style="margin: 15px 20px 10px 110px" > -->
			          <input type='button' class="p_btn" value='쿠폰 등록하기' style="margin-left:406px">
			        </div>
			        
			      </div>
			      
			    </div>
			  </div> 
				
            </div>
			<div class="col-sm-6 " style="border: 4px solid #dddddd; width: 310px;height:515px; margin-left: 80px; background-color: #333; border-color: #333;border-radius: 1em; " >
			    <div class="row">
			   <div style="text-align: center;">	
			     <img src="../reserve/movie1.jpg" class="img-rounded" style="width:170px; height:260x; margin-top:20px; ">
			   </div>
		
			</div>
			
			  <div class="row" style="width:306px;margin-top:20px;  background-color:#434343; " >
			  <p style="font-size: 10pt; color: #9194a6; margin: 10px; text-align: left">샹치&emsp;12세</p>
			  <p style="font-size: 10pt; color: #9194a6; margin: 10px; text-align: left">7관&emsp; 09월10일(금)&emsp; 11:00~13:00
			  </p>
			 	<p style="font-size: 10pt; color: #9194a6; margin: 10px; text-align: left">성인1</p>
			 	<p style="font-size: 13pt; color: white; margin: 10px; text-align: left;color:white;font-weight: bold;">결제금액  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span style="color:#319eb2">10,000원</span></p>
			 	<hr style="margin:1px">
			 	<p style="font-size: 10pt; color: #9194a6; margin: 10px; text-align: left">결제수단: 카드결제</p>		
			 	<input type="button" class="pay_btn" value="결제" style="">			 	  	
			 	  
			 	  <input type="button" class="pay_btn" value="이전" style="width:49%; height:40px;border-radius: 1em;background-color:#797777; color:white; font-weight: bold;">	
			 		 		 	 			 	 
			  </div>	
			 
		</div>
	</div>
  </div>
</body>

</html>