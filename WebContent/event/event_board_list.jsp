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
	
		
		<!-- Theme CSS -->
		<link rel="stylesheet" href="../event/css/theme.css" />
		<link rel="stylesheet" href="../event/css/total.css"/>
		

	</head>
	<body>
		<section class="event_board_list_body">

		

			<div class="event_board_list_inner-wrapper">
				

				<section role="event_board_list_main" class="event_board_list_content-body">
				
				
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
					
						<div class="event_board_list_row">
							
							<div class="event_board_list_col-md-6">
								<section class="event_board_list_panel">
									
									<div class="event_board_list_panel-body">
										<div class="event_board_list_table-responsive">
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


	</body>
</html>