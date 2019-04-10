<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>
<!-- top bar navigation -->
	<div class="headerbar">

		<!-- LOGO -->
        <div class="headerbar-left">
			<a href="manHome.do" class="logo"><img alt="Logo" src="assets/images/logo.png" /> <span>CheckMon</span></a>
        </div>

        <nav class="navbar-custom">

                    <ul class="list-inline float-right mb-0">
                    
                    <!-- 관리자모드 사용자모드로 전환하는 버튼 생성하기 -->
						
						<!-- 프로필 사진 확인 부분 -->
                        <li class="list-inline-item dropdown notif">
                            <a class="nav-link dropdown-toggle nav-user" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                <img src="${imgpath}" alt="Profile image" class="avatar-rounded">
                            </a>
                            <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                                <!-- item-->
                                <div class="dropdown-item noti-title">
                                    <h5 class="text-overflow"><small>관리자 ${sessionScope.m_name}님</small> </h5>
                                </div>
								
                                <!-- item-->
                                <a href="modManProfileForm.do" class="dropdown-item notify-item">
                                    <i class="fa fa-user"></i> <span>프로필 수정하기</span>
                                </a>
                                
                                <!-- item-->
                                <a href="generateQR.do" class="dropdown-item notify-item">
                                    <i class="fa fa-barcode"></i> <span>매장 QR Code</span>
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
						<a class="active" href="manHome.do"><i class="fa fa-fw fa-bars"></i><span> CheckMon 홈으로 </span> </a>
                    </li>
                    
                    <li class="submenu">
                        <a href="#"><i class="fa fa-user-circle-o"></i> <span> 직원 관리 </span> <span class="menu-arrow"></span></a>
                            <ul class="list-unstyled">
                                <li><a href="empReqRunList.do">직원 관리</a></li>
                                <li><a href="goGroup.do">그룹 관리</a></li>
                                <li><a href="goPosition.do">직책 관리</a></li>
                            </ul>
                    </li>
                    
                     <li class="submenu">
                        <a href="#"><i class="fa fa-vcard-o"></i> <span> 근태 관리 </span> <span class="menu-arrow"></span></a>
                            <ul class="list-unstyled">
                                <li><a href="dayCommuteList.do">당일 근태 현황</a></li>
                                <li><a href="commuteAllListForm.do">출퇴근 기록 관리</a></li>
                                <li><a href="commuteApplyAllList.do">근태 변경신청 목록</a></li>
                            </ul>
                    </li>
		
					<li class="submenu">
                        <a href="#"><i class="fa fa-calendar"></i> <span> 스케줄 관리 </span> <span class="menu-arrow"></span></a>
							<ul class="list-unstyled">
								<li><a href="hourTemplateList.do">근무 시간 템플릿 관리</a></li>
								<li><a href="scheduleMonthList.do">스케줄 관리</a></li>
								<li><a href="vacationList.do">휴가 요청 관리</a></li>
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