<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>
<!-- top bar navigation -->
	<div class="headerbar">

		<!-- LOGO -->
        <div class="headerbar-left">
			<a href="empHome.do" class="logo"><img alt="Logo" src="assets/images/logo.png" /> <span>CheckMon</span></a>
        </div>

        <nav class="navbar-custom">

                    <ul class="list-inline float-right mb-0">
                    
                    <!-- 관리자모드 사용자모드로 전환하는 버튼 생성하기 -->
						
						<!-- 프로필 사진 확인 부분 -->
                        <li class="list-inline-item dropdown notif">
                            <a class="nav-link dropdown-toggle nav-user" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            	<!-- img src="assets/images/avatars/admin.png" -->
                                <img src="${sessionScope.imgpath}" alt="Profile image" class="avatar-rounded">
                            </a>
                            <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                                <!-- item-->
                                <div class="dropdown-item noti-title">
                                    <h5 class="text-overflow"><small>근무자 ${sessionScope.e_name}님</small> </h5>
                                </div>
								
                                <!-- item-->
                                <a href="modEmpProfileForm.do" class="dropdown-item notify-item">
                                    <i class="fa fa-user"></i> <span>프로필 수정하기</span>
                                </a>

                                <!-- item-->
                                <a href="logout.do" class="dropdown-item notify-item">
                                    <i class="fa fa-power-off"></i> <span>로그아웃</span>
                                </a>
								
                            </div>
                        </li>

                    </ul>

                    <ul class="list-inline menu-left mb-0">
                        <li class="float-left">
                            <button class="button-menu-mobile open-left">
								<i class="fa fa-fw fa-bars"></i>
                            </button>
                        </li>                        
                    </ul>

        </nav>

	</div>
	<!-- End Navigation -->
	
 
	<!-- Left Sidebar -->
	<div class="left main-sidebar">
	
		<div class="sidebar-inner leftscroll">

			<div id="sidebar-menu">
        
			<ul>

					<li class="submenu">
						<a class="active" href="empHome.do"><i class="fa fa-fw fa-bars"></i><span> ChechMon 홈으로 </span> </a>
                    </li>
                    
                     <li class="submenu">
                        <a href="#"><i class="fa fa-vcard-o"></i> <span> 근태 </span> <span class="menu-arrow"></span></a>
                            <ul class="list-unstyled">
                                <li><a href="empCommute.do">월별 근태 관리</a></li>
                                <li><a href="empCommuteApplyList.do">근태 변경 목록</a></li>
                            </ul>
                    </li>
		
					<li class="submenu">
                        <a href="#"><i class="fa fa-calendar"></i> <span> 스케줄 </span> <span class="menu-arrow"></span></a>
							<ul class="list-unstyled">
								<li><a href="scheduleList.do">월별 스케줄 관리</a></li>
								<li><a href="vacationList.do">휴가 신청 목록</a></li>
								<li><a href="substituteList.do">대리 근무 승인 목록</a></li>
							</ul>
                    </li>
										
                   
					<li class="submenu">
                        <a href="#"><i class="fa fa-money"></i> <span>급여 관리</span> <span class="menu-arrow"></span></a>
                            <ul class="list-unstyled">
                                <li><a href="forms-general.html">급여 계산</a></li>
								<li><a href="forms-select2.html">급여 명세서</a></li>
                            </ul>
                    </li>
					
                    <li class="submenu">
						<a href="#"><i class="fa fa-info-circle"></i> <span>공지사항</span> <span class="menu-arrow"></span></a>
                            <ul class="list-unstyled">
                                <li><a href="star-rating.html">전체 공지사항</a></li>
								<li><a href="range-sliders.html">개인 공지사항</a></li>
                            </ul>
                    </li>
            </ul>

            <div class="clearfix"></div>

			</div>
        
			<div class="clearfix"></div>

		</div>

	</div>
	<!-- End Sidebar -->
</header>