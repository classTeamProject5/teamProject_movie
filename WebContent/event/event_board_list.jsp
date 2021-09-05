<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="fixed">
	<head>

		<!-- Basic -->
		<meta charset="UTF-8">

		<title>Basic Tables | Okler Themes | Porto-Admin</title>
		<meta name="keywords" content="HTML5 Admin Template" />
		<meta name="description" content="Porto Admin - Responsive HTML5 Template">
		<meta name="author" content="okler.net">

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		
		<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

		<!-- Theme CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme.css" />
		<link rel="stylesheet" href="../event/css/total.css"/>

		<!-- Head Libs -->
		<script src="assets/vendor/modernizr/modernizr.js"></script>

	</head>
	<body>
		<section class="event_board_list_body">

		

			<div class="inner-wrapper">
				

				<section role="main" class="content-body">
				
				
					<div class="event_header">
						<div class="event_contentTitle">당첨자 발표
						</div>
						<div class="event_otherLinkBox"><a class="event_otherLink">지난 이벤트</a>
						</div>
						<div class="event_otherLinkBox"><a class="event_otherLink">진행중인 이벤트</a>
						</div>
					</div>	
					
					
					<!-- start: page -->
					<div class="event_board_Menus">
						<a class="event_board_categoryMenu">전체</a>
						<a class="event_board_categoryMenu">영화</a>
						<a class="event_board_categoryMenu">극장</a>
					</div>
					
						<div class="row">
							
							<div class="col-md-6">
								<section class="panel">
									
									<div class="panel-body">
										<div class="table-responsive">
											<table class="event_board_list_tableList">
												<thead>
													<tr>
														<th class="event_board_list_no">no</th>
														<th class="event_board_list_category">구분</th>
														<th class="event_board_list_title">제목</th>
														<th class="event_board_list_release">발표일</th>
													</tr>
												</thead>
												<tbody>
													<%for(int i=1; i<=10; i++){ %>
													<tr>
														<td class="event_board_list_content" id="event_board_list_table_content_no">번호</td>
														<td class="event_board_list_content" id="event_board_list_table_content_category">영화/극장</td>
														<td class="event_board_list_content" id="event_board_list_table_content_title">제목 들어갈 자리</td>
														<td class="event_board_list_content" id="event_board_list_table_content_release">날짜 들어갈 자리</td>
													</tr>
													<%} %>
												</tbody>
											</table>
										</div>
									</div>
								</section>
							</div>
						</div>
						
						
								
					<!-- end: page -->
				</section>
			</div>

			
		</section>

		<!-- Vendor -->
		<script src="assets/vendor/jquery/jquery.js"></script>
		<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>

	</body>
</html>