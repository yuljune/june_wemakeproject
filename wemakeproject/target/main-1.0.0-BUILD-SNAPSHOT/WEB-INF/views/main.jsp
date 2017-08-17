<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="resources/css/default.css">
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script src="resources/js/simpleBanner.js"></script>
    <link href="resources/css/bootstrapsmall.min.css?ver=1" rel="stylesheet" />
    
    <title>Insert title here</title>
    <style>
    	#login_wrap {width:100%; height:61px; background:#353b4f;}
		#login_wrap .login_box {width:1200px; margin:0 auto;}
		#login_wrap .login_box .tit {float:left; width:160px; height:61px; background:#202430; text-align:center;}
		#login_wrap .login_box .tit img {margin-top:25px;}
		#login_wrap .login_box .login_zone {float:left; width:844px; height:61px;}
		#login_wrap .login_box .login_zone fieldset ul {float:left; margin-top:15px;}
		#login_wrap .login_box .login_zone fieldset ul li {float:left; margin-left:30px;}
		#login_wrap .login_box .login_zone fieldset ul li span.id {padding-left:20px; background:url(resources/img/icon_id.png) no-repeat left center; font-size:13px; color:#d7dced; margin-right:10px;}
		#login_wrap .login_box .login_zone fieldset ul li span.pass {padding-left:20px; background:url(resources/img/icon_pass.png) no-repeat left center; font-size:13px; color:#d7dced; margin-right:10px;}
		#login_wrap .login_box .login_zone fieldset ul li .input_login {height:30px; line-height:30px; width:110px; padding:0 10px; border-bottom:1px solid #5c617d; border-right:0px; border-top:0px; border-left:0px; color:#d7dced; font-size:13px; background:none;}
		#login_wrap .login_box .login_zone fieldset a.btn {float:left; margin-top:15px; margin-left:10px; width:85px; height:30px; border:1px solid #6c759d; text-align:center; line-height:16px; color:#b5c3ff; font-size:12px; font-weight:700; background:#2a2f40 url(resources/img/icon_arrow05.png) no-repeat 90% center; text-decoration:none;}
		#login_wrap .login_box .login_zone fieldset .btn_box {float:right; display:inline-block; margin-right:30px; margin-top:25px; zoom:1; .display:inline;}
		#login_wrap .login_box .login_zone fieldset .btn_box > a {padding-left:7px; background:url(resources/img/icon_arrow02.png) no-repeat left center; font-size:12px; color:#c1c4d1; margin-left:15px; text-decoration:none;}
		#login_wrap .login_box .logout_zone {float:left; width:844px; height:61px;}
		#login_wrap .login_box .logout_zone .memberName {float:left; width:118px; height:61px; background:#353b4f; border-right:1px solid #2d3243;}
		#login_wrap .login_box .logout_zone .memberName > span {padding-left:20px; margin-left:25px; margin-top:20px; font-weight:700; font-size:15px; line-height:22px; color:#fff; background:url(resources/img/icon_id.png) no-repeat left center; text-overflow:ellipsis; overflow:hidden; white-space:nowrap; width:80px;}
		#login_wrap .login_box .logout_zone .info_wrap {float:left; width:528px; height:61px; background:#3b4258; border-right:1px solid #2d3243; font-size:13px; line-height:20px; color:#ccd3ea;}
		#login_wrap .login_box .logout_zone .info_wrap .identity {float:left; margin-top:22px; margin-left:30px; padding-left:7px; background:url(resources/img/icon_dot02.png) no-repeat left center;}
		#login_wrap .login_box .logout_zone .info_wrap .identity > span {width:50px; text-overflow:ellipsis; overflow:hidden; white-space:nowrap; vertical-align:top; .vertical-align:middle;}
		#login_wrap .login_box .logout_zone .info_wrap .attach {float:left; margin-top:22px; margin-left:20px; padding-left:7px; background:url(resources/img/icon_dot02.png) no-repeat left center;}
		#login_wrap .login_box .logout_zone .info_wrap .attach > span {width:100px; text-overflow:ellipsis; overflow:hidden; white-space:nowrap; vertical-align:top; .vertical-align:middle;}
		#login_wrap .login_box .logout_zone .info_wrap .message {float:left; margin-top:22px; margin-left:10px; padding-left:7px; background:url(resources/img/icon_dot02.png) no-repeat left center;}
		#login_wrap .login_box .logout_zone .info_wrap .message > span > a {color:#ccd3ea;}
		#login_wrap .login_box .logout_zone .btn_box {float:left; margin-left:15px; margin-top:25px;}
		#login_wrap .login_box .logout_zone .btn_box > a {padding-left:7px; background:url(resources/img/icon_arrow02.png) no-repeat left center; font-size:12px; color:#c1c4d1; margin-left:15px; text-decoration:none;}
		
		#login_wrap .login_box .btn_guide {float:left; width:196px; height:61px; background:#ee7f3d;}
		#login_wrap .login_box .btn_guide > a {width:196px; height:61px; text-align:center;}
		#login_wrap .login_box .btn_guide > a > span {font-size:13px; color:#fff; padding-left:25px; background:url(resources/img/icon_guide.png) no-repeat left center; line-height:61px;}
		
		#contents_area {overflow:hidden; position:relative; width:1200px; margin:0 auto; z-index:90; padding-bottom:40px;}
		.visual_wrap {float:left; width:800px; height:438px;} /*대문이미지*/
		
		.visual_wrap .bxslider {width:648px; height:438px;}
		.visual_wrap .bxslider > li.slider01 {position:relative; width:648px; height:438px; background:url(resources/img/visual_bg01.jpg) no-repeat;} 
		.visual_wrap .bxslider > li > p {position:absolute; width:260px; top:0; left:330px;}
		.visual_wrap .bxslider > li > p > .logo {margin-top:40px;} /*20160831수정*/
		.visual_wrap .bxslider > li > p > .tit {margin-top:20px; font-size:16px; color:#222; line-height:24px; font-weight:700;} /*20160831수정*/
		.visual_wrap .bxslider > li > p > .cont {margin-top:5px; font-size:13px; color:#63646b; line-height:22px;} /*20160831수정*/
		.visual_wrap .bxslider > li > ul.link_menu {position:absolute; top:350px; left:55px;}
		.visual_wrap .bxslider > li > ul.link_menu > li {float:left; margin-left:30px;}
		.visual_wrap .bxslider > li > ul.link_menu > li:first-child {margin-left:0px;}
		.visual_wrap .bxslider > li > ul.link_menu > li > a {text-decoration:none;}
		.visual_wrap .bxslider > li > ul.link_menu > li > a.icon01 {background:url(resources/img/visual_icon01-1.png) no-repeat; padding-left:55px; height:43px;}
		.visual_wrap .bxslider > li > ul.link_menu > li > a.icon02 {background:url(resources/img/visual_icon01-2.png) no-repeat; padding-left:55px; height:43px;}
		.visual_wrap .bxslider > li > ul.link_menu > li > a.icon03 {background:url(resources/img/visual_icon01-3.png) no-repeat; padding-left:55px; height:43px;}
		.visual_wrap .bxslider > li > ul.link_menu > li > a > .tit01 {display:inline-block; padding-right:10px; font-size:15px; color:#222; font-weight:700; line-height:22px; background:url(resources/img/icon_arrow03.png) no-repeat right center;}/*20160831수정*/
		.visual_wrap .bxslider > li > ul.link_menu > li > a > .tit02 {display:block;  font-size:12px; color:#63646b; line-height:20px; letter-spacing:-1px;}/*20160831수정*/
		.visual_wrap .bxslider > li.slider02 {position:relative; width:648px; height:438px; background:url(resources/img/visual_bg02.jpg) no-repeat;} /*20160831추가*/
		.visual_wrap .bxslider > li.slider02 > p > .logo {margin-top:55px;} /*20160831추가*/
		.visual_wrap .bxslider > li.slider02 > p > .tit {margin-top:15px; font-size:16px; color:#222; line-height:24px; font-weight:700;} /*20160831추가*/
		.visual_wrap .bxslider > li.slider02 > p > .cont {margin-top:5px; font-size:13px; color:#63686b; line-height:22px;} /*20160831추가*/
		.visual_wrap .bxslider > li.slider02 > ul.link_menu > li > a.icon01 {background:url(resources/img/visual_icon02-1.png) no-repeat; padding-left:55px; height:43px;}/*20160831추가*/
		.visual_wrap .bxslider > li.slider02 > ul.link_menu > li > a.icon02 {background:url(resources/img/visual_icon02-2.png) no-repeat; padding-left:55px; height:43px;}/*20160831추가*/
		.visual_wrap .bxslider > li.slider02 > ul.link_menu > li > a.icon03 {background:url(resources/img/visual_icon02-3.png) no-repeat; padding-left:55px; height:43px;}/*20160831추가*/
		.visual_wrap .bxslider > li.slider02 > ul.link_menu > li > a > .tit01 {display:inline-block; padding-right:10px; font-size:15px; color:#222; font-weight:700; line-height:22px; background:url(resources/imgn/icon_arrow03.png) no-repeat right center;}/*20160831추가*/
		.visual_wrap .bxslider > li.slider02 > ul.link_menu > li > a > .tit02 {display:block;  font-size:12px; color:#63696b; line-height:20px; letter-spacing:-1px;}/*20160831추가*/
		.visual_wrap .bxslider > li.slider03 {position:relative; width:648px; height:438px; background:url(resources/img/visual_bg03.jpg) no-repeat;} /*20160831추가*/
		.visual_wrap .bxslider > li.slider03 > p > .logo {margin-top:95px;} /*20160831추가*/
		.visual_wrap .bxslider > li.slider03 > p > .tit {margin-top:15px; font-size:16px; color:#222; line-height:24px; font-weight:700;} /*20160831추가*/
		.visual_wrap .bxslider > li.slider03 > p > .cont {margin-top:5px; font-size:13px; color:#6b6364; line-height:22px;} /*20160831추가*/
		.visual_wrap .bxslider > li.slider03 > ul.link_menu > li > a.icon01 {background:url(resources/img/visual_icon03-1.png) no-repeat; padding-left:55px; height:43px;}/*20160831추가*/
		.visual_wrap .bxslider > li.slider03 > ul.link_menu > li > a.icon02 {background:urlresources/img/visual_icon03-2.png) no-repeat; padding-left:55px; height:43px;}/*20160831추가*/
		.visual_wrap .bxslider > li.slider03 > ul.link_menu > li > a.icon03 {background:url(resources/img/visual_icon03-3.png) no-repeat; padding-left:55px; height:43px;}/*20160831추가*/
		.visual_wrap .bxslider > li.slider03 > ul.link_menu > li > a > .tit01 {display:inline-block; padding-right:10px; font-size:15px; color:#222; font-weight:700; line-height:22px; background:url(resources/img/icon_arrow03.png) no-repeat right center;}/*20160831추가*/
		.visual_wrap .bxslider > li.slider03 > ul.link_menu > li > a > .tit02 {display:block;  font-size:12px; color:#6b6363; line-height:20px; letter-spacing:-1px;}/*20160831추가*/
		
		
		/*main visual slider*/
		#bx-pager {position:absolute; z-index:10; top:0; left:0;}
		#bx-pager > a.visual_tab01 {width:170px; height:146px; background:url(resources/img/visual_tab01_off.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		#bx-pager > a.visual_tab01.active {background:url(resources/img/visual_tab01_on.png) no-repeat;}
		#bx-pager > a.visual_tab02 {width:170px; height:146px; background:url(resources/img/visual_tab02_off.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		#bx-pager > a.visual_tab02.active {background:url(resources/img/visual_tab02_on.png) no-repeat;}
		#bx-pager > a.visual_tab03 {width:170px; height:146px; background:url(resources/img/visual_tab03_off.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		#bx-pager > a.visual_tab03.active {background:url(resources/img/visual_tab03_on.png) no-repeat;}
		
		
		
		
		.visual_wrap .bx-wrapper {position:relative;}
		.visual_wrap .bx-wrapper .bx-controls {position:absolute; top:40px; left:540px;}/*20160831수정*/
		.visual_wrap .bx-wrapper .bx-controls .bx-controls-direction {position:relative;}/*20160831수정*/
		.visual_wrap .bx-wrapper .bx-controls .bx-controls-direction .bx-prev {position:absolute; top:0; left:24px; width:22px; height:22px; background:url(resources/img/btn_prev.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}/*20160831추가*/
		.visual_wrap .bx-wrapper .bx-controls .bx-controls-direction .bx-next {position:absolute; top:0; left:46px; width:22px; height:22px; background:url(resources/img/btn_next.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}/*20160831추가*/
		.visual_wrap .bx-wrapper .bx-controls .bx-controls-auto {position:relative;}
		.visual_wrap .bx-wrapper .bx-controls .bx-controls-auto-item .bx-start {position:absolute; top:0; display:none; width:24px; height:24px; background:url(resources/img/btn_play.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		.visual_wrap .bx-wrapper .bx-controls .bx-controls-auto-item .bx-stop {position:absolute; top:0; display:block; width:24px; height:24px; background:url(resources/img/btn_stop.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		
		/*project track*/
		.project_wrap {position:relative; float:left; display:inline-block; width:398px; height:438px; background:#e7effc; border-right:1px solid #d2ddf0; border-bottom:1px solid #d2ddf0;} /*20160923수정*/
		.project_wrap > h2 {margin-top:45px; margin-left:35px; font-size: 17px; color: black; font-weight: bold;}
		.project_wrap > ul {margin-top:25px; margin-left:35px; width:333px;}
		.project_wrap > ul > li {overflow:hidden; margin-bottom:9px; .margin-bottom:5px;}    
		.project_wrap > ul > li > a {float:left; width:225px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;}
		.project_wrap > ul > li > a.project01 {float:left; background:url(resources/img/icon_project01.png) no-repeat left center; line-height:30px; padding-left:20px; font-size:13px; color:#222;}
		.project_wrap > ul > li > a.project02 {float:left; background:url(resources/img/icon_project02.png) no-repeat left center; line-height:30px; padding-left:20px; font-size:13px; color:#222;}
		.project_wrap > ul > li > a.project03 {float:left; background:url(resources/img/icon_project03.png) no-repeat left center; line-height:30px; padding-left:20px; font-size:13px; color:#222;}
		.project_wrap > ul > li > a.project04 {float:left; background:url(resources/img/icon_project04.png) no-repeat left center; line-height:30px; padding-left:20px; font-size:13px; color:#222;} /*20161228추가*/
		.project_wrap > ul > li > span.statue01 {float:left; margin-left:25px; font-size:12px; letter-spacing:-1px; color:#666; background:url(resources/img/icon_statue01.png) no-repeat left 55%; padding-left:20px; line-height:30px;}
		/* .project_wrap > ul > li > span.statue02 {float:left; margin-left:25px; font-size:12px; letter-spacing:-1px; color:#666; background:url(resources/img/icon_statue02.png) no-repeat left 55%; padding-left:20px; line-height:30px;} */
		.project_wrap > ul > li > span.statue03 {float:left; margin-left:25px; font-size:12px; letter-spacing:-1px; color:#666; background:url(resources/img/icon_statue03.png) no-repeat left 55%; padding-left:20px; line-height:30px;}
		/* .project_wrap > ul > li > span.statue04 {float:left; margin-left:25px; font-size:12px; letter-spacing:-1px; color:#666; background:url(resources/img/icon_statue04.png) no-repeat left 55%; padding-left:20px; line-height:30px;} */
		/* .project_wrap > ul > li > span.statue05 {float:left; margin-left:25px; font-size:12px; letter-spacing:-1px; color:#666; background:url(resources/img/icon_statue05.png) no-repeat left 55%; padding-left:20px; line-height:30px;} */
		.project_wrap .more {position:absolute; top:40px; right:20px;}
		
		/*hanium award*/
		.award_wrap {position:relative; float:left; width:379px; height:273px; margin-top:33px;}
		.award_wrap > h2 {margin-left:58px; margin-top:2px;}
		.award_wrap .award_box_wrap {display:inline-block; zoom:1; .display:inline; margin-top:13px; width:377px; height:241px; background:#fff; border-top:1px solid #e0e0e0; border-right:1px solid #e0e0e0; border-left:1px solid #e0e0e0; border-bottom:1px solid #bebebe;}
		.award_wrap .award_box_wrap .award_box {width:311px; height:170px; margin:35px auto;}
		.award_wrap .award_box_wrap .award_box .bxslider02 {width:311px; height:180px;}
		.award_wrap .award_box_wrap .award_box .bxslider02 > li {width:311px; height:180px;}
		.award_wrap .award_box_wrap .award_box .bxslider02 > li > div > .photo {float:left; border:1px solid #e0e0e0;} /*20161219수정*/
		.award_wrap .award_box_wrap .award_box .bxslider02 > li > div > .photo > img {width:141px; height:94px;}
		.award_wrap .award_box_wrap .award_box .bxslider02 > li > div > .tit_box {display:inline-block; margin-left:17px; width:148px; zoom:1; .display:inline;}
		.award_wrap .award_box_wrap .award_box .bxslider02 > li > div > .tit_box > .headline {display:inline-block; margin-top:4px;} /*20161229수정*/
		.award_wrap .award_box_wrap .award_box .bxslider02 > li > div > .tit_box > a >.tit {display:inline-block; font-size:16px; font-weight:700; line-height:22px; color:#222; margin-top:10px; letter-spacing:-1px\9;
		    width: 148px;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: normal;
		    height: 4em;
		    text-align: left;
		    word-wrap: break-word;
		    display: -webkit-box;
		    -webkit-line-clamp: 3;
		    -webkit-box-orient: vertical;} /*20161229수정*/
		.award_wrap .award_box_wrap .award_box .bxslider02 > li > .cont {clear:both; display:block; font-size:13px; color:#666; line-height:20px; padding-top:15px; .padding-top:10px;
			width: 311px;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: normal;
		    height: 4.4em;
		    text-align: left;
		    word-wrap: break-word;
		    display: -webkit-box;
		    -webkit-line-clamp: 3;
		    -webkit-box-orient: vertical;
		} /*20161229수정*/
		.award_wrap > p.icon {position:absolute; top:0; left:0;}
		.award_wrap > .more {position:absolute; top:0; right:0px;}
		
		.award_box .bx-wrapper .bx-controls .bx-pager {display:none;}
		
		.award_wrap .bx-controls-direction {position:absolute; top:0; left:309px;}
		.award_wrap .bx-controls-direction .bx-prev {width:23px; height:24px; background:url(resources/img/btn_arrow_left.gif) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		.award_wrap .bx-controls-direction .bx-next {width:23px; height:24px; background:url(resources/img/btn_arrow_right.gif) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		
		/*quick menu*/
		.quickMenu_wrap {position:relative; float:left; width:379px; height:273px; margin-top:33px; margin-left:14px;}
		.quickMenu_wrap > h2 {margin-left:10px; margin-top:2px;}
		.quickMenu_wrap .quickMenu_box {display:inline-block; zoom:1; .display:inline; margin-top:9px; .margin-top:10px; width:377px; height:241px; background:#fff; border-top:1px solid #e0e0e0; border-right:1px solid #e0e0e0; border-left:1px solid #e0e0e0; border-bottom:1px solid #bebebe;}
		.quickMenu_wrap .quickMenu_box > ul {width:310px; margin-left:40px; margin-top:40px;}
		.quickMenu_wrap .quickMenu_box > ul > li {float:left; width:155px; margin-bottom:30px;}
		.quickMenu_wrap .quickMenu_box > ul > li > a.quick01 {height:32px; padding-left:40px; background:url(resources/img/icon_quick01.png) no-repeat left center;}
		.quickMenu_wrap .quickMenu_box > ul > li > a.quick02 {height:32px; padding-left:40px; background:url(resources/img/icon_quick02.png) no-repeat left center;}
		.quickMenu_wrap .quickMenu_box > ul > li > a.quick03 {height:32px; padding-left:40px; background:url(resources/img/icon_quick03.png) no-repeat left center;}
		.quickMenu_wrap .quickMenu_box > ul > li > a.quick04 {height:32px; padding-left:40px; background:url(resources/img/icon_quick04.png) no-repeat left center;}
		.quickMenu_wrap .quickMenu_box > ul > li > a.quick05 {height:32px; padding-left:40px; background:url(resources/img/icon_quick05.png) no-repeat left center;}
		.quickMenu_wrap .quickMenu_box > ul > li > a.quick06 {height:32px; padding-left:40px; background:url(resources/img/icon_quick06.png) no-repeat left center;}
		.quickMenu_wrap .quickMenu_box > ul > li > a > span {padding-right:15px; font-size:14px; color:#222; line-height:32px; letter-spacing:-1px; background:url(resources/img/icon_arrow04.png) no-repeat right center;}
		
		/*popup zone*/
		.popup_wrap {position:relative; float:left; width:396px; height:277px; margin-top:30px; margin-left:20px;}
		.popup_wrap > h2 {margin-left:11px; margin-top:2px; font-size:18px; font-weight:900; color:#2E2E2E;}
		.popup_wrap .popup_box_wrap {display:inline-block; zoom:1; .display:inline; margin-top:9px; width:390px; height:241px; background:white; border-top:1px solid #e0e0e0; border-right:1px solid #e0e0e0; border-left:1px solid #e0e0e0; border-bottom:1px solid #bebebe;}
		.popup_wrap .popup_box_wrap .popup_box {width:390px; height:241px;}
		.popup_wrap .popup_box_wrap .popup_box .bxslider03 {width:390px; height:180px;}
		
		.popup_wrap .bx-wrapper .bx-controls {position:absolute; top:3px; right:30px;} /*20161229추가*/
		.popup_wrap .bx-wrapper .bx-controls .bx-controls-direction {display:none;}
		.popup_wrap .bx-wrapper .bx-controls .bx-pager {float:left; margin-right:5px; margin-top:2px;} /*20161229수정*/
		.popup_wrap .bx-wrapper .bx-controls .bx-pager .bx-pager-item a {width:12px; height:12px; background:url(resources/img/popup_pager_off.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		.popup_wrap .bx-wrapper .bx-controls .bx-pager .bx-pager-item {display:inline-block; margin-right:3px; zoom:1; .display:inline;}
		.popup_wrap .bx-wrapper .bx-controls .bx-pager .bx-pager-item a.active { background:url(resources/img/popup_pager_on.png) no-repeat;}
		
		.popup_wrap .bx-wrapper .bx-controls .bx-controls-auto {float:left;}/*20161229수정*/
		.popup_wrap .bx-wrapper .bx-controls .bx-controls-auto .bx-controls-auto-item a.bx-start {display:none; width:16px; height:16px; background:url(resources/img/popup_play.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		.popup_wrap .bx-wrapper .bx-controls .bx-controls-auto .bx-controls-auto-item a.bx-stop {width:16px; height:16px; background:url(resources/img/popup_stop.png) no-repeat; text-indent:-99999px; .text-indent:0; .font-size:0; .line-height:0;}
		
		/*notice*/
		.notice_wrap {position:relative; float:left; width:379px; height:273px; margin-top:33px;}
		.notice_wrap > h2 {margin-left:10px; margin-top:2px;}
		.notice_wrap .notice_box {display:inline-block; zoom:1; .display:inline; margin-top:13px; width:377px; height:241px; background:#fff; border-top:1px solid #e0e0e0; border-right:1px solid #e0e0e0; border-left:1px solid #e0e0e0; border-bottom:1px solid #bebebe;}
		.notice_wrap .notice_box > ul {width:300px; margin:25px auto;}
		.notice_wrap .notice_box > ul > li {font-size:13px; color:#222; line-height:31px;}
		.notice_wrap .notice_box > ul > li > a {float:left; width:240px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; padding-left:25px; background:url(resources/img/icon_dot.png) no-repeat 15px center;}
		.notice_wrap .notice_box > ul > li > a.new { padding-left:25px; background:url(resources/img/icon_new.png) no-repeat left center;}
		.notice_wrap > .more {position:absolute; top:0; right:0px;}
		
		/*공지사항*/
		.knowledge_wrap {position:relative; float:left; width:379px; height:273px; margin-top:33px;}
		.knowledge_wrap > h2 {margin-left:11px; margin-top:2px; font-size:19px; font-weight:900; color:#2E2E2E;}
		.knowledge_wrap .knowledge_box {display:inline-block; zoom:1; .display:inline; margin-top:10px; .margin-top:11px;  width:379px; height:241px; background:#fff; border-top:1px solid #e0e0e0; border-right:1px solid #e0e0e0; border-left:1px solid #e0e0e0; border-bottom:1px solid #bebebe;}
		.knowledge_wrap .knowledge_box > ul {width:300px; margin:25px auto;}
		.knowledge_wrap .knowledge_box > ul > li {font-size:13px; color:#222; line-height:31px;}
		.knowledge_wrap .knowledge_box > ul > li > a {float:left; max-width:235px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; padding-left:20px; background:url(resources/img/icon_dot.png) no-repeat 15px center;}
		.knowledge_wrap .knowledge_box > ul > li > .dat {display:inline; color:#353b4f; font-weight:700; margin-left:5px;}
		.knowledge_wrap .knowledge_box > ul > li > .dat > a {text-decoration:none;}
		.knowledge_wrap > .more {position:absolute; top:0; right:0px;}
		
		/*지식Q&A*/
		.knowledge_wrap2 {position:relative; float:left; width:379px; height:273px; margin-top:33px; margin-left:25px;}
		.knowledge_wrap2 > h2 {margin-left:10px; margin-top:2px;}
		.knowledge_wrap2 .knowledge_box {display:inline-block; zoom:1; .display:inline; margin-top:10px; .margin-top:11px;  width:379px; height:241px; background:#fff; border-top:1px solid #e0e0e0; border-right:1px solid #e0e0e0; border-left:1px solid #e0e0e0; border-bottom:1px solid #bebebe;}
		.knowledge_wrap2 .knowledge_box > ul {width:300px; margin:25px auto;}
		.knowledge_wrap2 .knowledge_box > ul > li {font-size:13px; color:#222; line-height:31px;}
		.knowledge_wrap2 .knowledge_box > ul > li > a {float:left; max-width:235px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; padding-left:20px; background:url(resources/img/icon_dot.png) no-repeat 15px center;}
		.knowledge_wrap2 .knowledge_box > ul > li > .dat {display:inline; color:#353b4f; font-weight:700; margin-left:5px;}
		.knowledge_wrap2 .knowledge_box > ul > li > .dat > a {text-decoration:none;}
		.knowledge_wrap2 > .more {position:absolute; top:0; right:0px;}
		
		
		
		/*프로보노 지식강연*/
		.probono_wrap {position:relative; float:left; width:358px; height:273px; margin-top:33px; margin-left:69px;}
		.probono_wrap > h2 {margin-top:2px;}
		.probono_wrap .probono_box {display:inline-block; zoom:1; .display:inline; margin-top:10px; .margin-top:11px;  width:358px; height:241px;}
		.probono_wrap .probono_box > ul {margin-top:15px;}
		.probono_wrap .probono_box > ul > li {font-size:13px; color:#222; line-height:20px;}
		.probono_wrap .probono_box > ul > li > a {float:left; max-width:235px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; color:#333333; padding-left:20px; background:url(resources/img/icon_dot.png) no-repeat 10px center;}
		.probono_wrap .probono_box > ul > li > .date {float:right; color:#888; font-size:12px;}
		.probono_wrap > .more {position:absolute; top:0; right:0px;}
		
		/*하단배너*/
		.simple_banner_wrap{ position:relative; overflow:hidden; width:100%; height:87%; margin-top:16px; }
		.simple_banner_wrap ul{ list-style:none; margin:0; padding:0; display:block; position:absolute; left:0; top:0; width:100%; height:100%; }
		.simple_banner_wrap ul li{ margin:0; padding:0; display:block; position:absolute; top:0; left:0; width:100%; height:100%; }
		.simple_banner_wrap .nav_wrap{ position:absolute; bottom:10px; height:10px; z-index:2; }
		.simple_banner_wrap .nav_wrap ul{ display:block; position:relative; list-style:none; margin:0; padding:0; }
		.simple_banner_wrap .nav_wrap ul li{ display:inline-block; position:relative; width:10px; height:10px; margin:0 1px; cursor:pointer; }
		.simple_banner_wrap .nav_wrap.numeral{ height:14px; line-height:14px; }
		.simple_banner_wrap .nav_wrap.numeral ul li{ font-size:12px; width:14px; height:14px; text-align:center; text-shadow:1px 1px 0px #CCC; }
		.simple_banner_wrap .nav_wrap.numeral ul li.on{ text-decoration:underline; font-weight:bold; }
		.simple_banner_wrap .nav_wrap.bullet{ height:10px; line-height:10px; }
		.simple_banner_wrap .nav_wrap.bullet ul li{ font-size:10px; text-indent:-1000px; margin-left:4px; border-radius:5px; background-color:#F96; box-shadow:inset 0 0 0 1px #FFF; }
		.simple_banner_wrap .nav_wrap.bullet ul li.on{ box-shadow:inset 0 0 0 1px #F96; background-color:#FFF; }
		.simple_banner_wrap .nav_wrap.prev_next{ height:14px; line-height:14px; text-shadow:1px 1px 0px #CCC; }
		.simple_banner_wrap .nav_wrap.prev_next ul li{ font-size:12px; width:14px; height:14px; font-weight:bold; text-align:center; }
		
		
		
		/* footer */
		#main_footer_wrap{position:relative; width:100%;}
		#main_footer_wrap .quick_wrap {position:relative; width:100%; height:54px; border-top:1px solid #4c4e55; border-bottom:1px solid #4c4e55; background-color:#4c4e55;}
		#main_footer_wrap .quick_wrap .quick_box {position:relative; width:1100px; height:54px; margin:0 auto; text-align:center;}
		#main_footer_wrap .quick_wrap .quick_box ul {display:inline-block; margin-top:20px; overflow:hidden; .width:475px;}
		#main_footer_wrap .quick_wrap .quick_box ul li {float:left; padding-right:30px; padding-left:30px; background:url(../images/main/foot_quick_line.png) no-repeat right center;}
		#main_footer_wrap .quick_wrap .quick_box ul li.none {background:none;}
		#main_footer_wrap .quick_wrap .quick_box ul li a {font-size:13px; color:#fff; text-decoration:none;}
		#main_footer_wrap .btn_top {position:absolute; left:50%; margin-left:537px; top:0;}
		#main_footer_wrap .address_wrap {padding:30px 0 40px 0; text-align:center;}
		#main_footer_wrap .address_wrap address {color:#555; font-size:13px; margin-bottom:7px;}
		#main_footer_wrap .address_wrap .copyright {color:#555; font-size:13px;}
		
		
		
    </style>
    </head>
    <body>
    <input type="hidden" value="${sessionScope.loginId}" name="user_id" id="user_id"/>
    	<jsp:include page="header.jsp"/>
    	<section id="containerWrap_main">		
		<div id="login_wrap">
			<div class="login_box">
				<span class="tit"><img src="resources/img/login_tag.png" alt="Member Login"></span>
				<c:choose>
				<c:when test="${empty sessionScope.loginId }">
				<div class="login_zone">
					<form action="mainLogin" name="loginForm" method="post" id="actionLogin">
						<fieldset>
							<legend>로그인</legend>
							<ul>
								<li><label for="id"><span class="id">ID :</span></label>
									<input type="text" id="user_id" class="input_login" name="user_id" placeholder="아이디" />
								</li>
								<li><label for="password"><span class="pass">PW :</span></label>
									<input type="password" id="user_pw" class="input_login" name="user_pw" placeholder="비밀번호" />
								</li>
							</ul>
							<a class="btn" onclick="actionLogin()">Login</a>
							<p class="btn_box">
								<a href="joinForm">회원가입</a><a href="membershipFind">아이디/비밀번호 찾기</a>
							</p>
						</fieldset>
					</form>
				</div>
				</c:when>
				<c:otherwise>
				
				<div class="logout_zone">
					<p class="memberName"><span>${mainLogin.user_name }</span></p>
					<div class="info_wrap">
						<p class="identity">신분 : <span>${mainLogin.user_type }</span></p>
						<p class="attach">소속 : <span>${mainLogin.assign }</span></p>
						<p class="message">We Make Project 입니다.</p>
					</div>
					<p class="btn_box">
						<a href="logout">로그아웃</a><a href="myPage?user_id=${sessionScope.loginId}">마이페이지</a>
					</p>
				</div>	
				</c:otherwise>
				</c:choose>
					
				<p class="btn_guide"><a onclick="window.open('https://www.hanium.or.kr/promotion/guide/main.jsp','child','width=1100, height=920, scrollbars=yes, resizable=no');"><span>We Make Project 가이드</span></a></p>
			</div>
		</div>
		
		
		
		<div id="contents_area">
		
			<div style="overflow:hidden;">
				<!-- <div id="bx-pager">
				
				 
				  <a class="visual_tab01" href="#"><span></span></a><br>
				  <a class="visual_tab02" href="#"><span></span></a><br>
				  <a class="visual_tab03" href="#"><span></span></a> 
				 
				</div> -->
				
				<div class="visual_wrap">
					<div id="myCarousel" class="carousel slide" data-ride="carousel"> 
	
					<!--페이지-->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<!--페이지-->
					<div class="carousel-inner">
						<!--슬라이드1-->
						<c:forEach items="${outputlist}" var="list" varStatus="status">
						<c:if test="${status.first}">
						<div class="item active">
							<!-- <img src="resources/img/login_tag.png"  style="width:100%;" alt="First slide"> -->
							<a href="./outputDetail?idx=${list.idx}" style="width:100%;">
							<img src="./resources/upload/${list.new_file}" style="width:100%; height:100%; margin-top:0;" alt="First slide">
							</a>
							<div class="container">
								<div class="carousel-caption">
									<h1 style="font-size: 11pt; ">${list.subject}</h1>
								</div>
							</div>
						</div>
						</c:if>
						<c:if test="${not status.first}">
						<div class="item">
							<!-- <img src="resources/img/login_tit.png"  style="width:100%;" data-src="" alt="Second slide"> -->
							<a href="./outputDetail?idx=${list.idx}" style="width:100%;">
							<img src="./resources/upload/${list.new_file}" style="width:100%; height:100%; margin-top:0;" data-src="" alt="Second slide">
							</a>
							<div class="container">
								<div class="carousel-caption">
									<h1 style="font-size: 11pt;">${list.subject}</h1>
								</div>
							</div>
						</div>
						</c:if>
						</c:forEach>
						
					</div>
					
					<!--이전, 다음 버튼-->
					<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span style=""><</span></a> 
					<a class="right carousel-control" href="#myCarousel" data-slide="next"><span style="">></span></a> 
				</div>
				</div>
				
					<!-- <div class="bx-wrapper" style="max-width: 100%;"><div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 438px;"><ul class="bxslider" style="width: 515%; position: relative; transition-duration: 0s; transform: translate3d(-1944px, 0px, 0px);">
					<li class="slider03 bx-clone" style="float: left; list-style: none; position: relative; width: 648px;">
							<p><span class="logo"><img src="/images/main/visual_logo03.png" alt="이브와"></span>
								<span class="tit">이브와 ICT멘토링</span>
								<span class="cont">이공계 여대생들에게 ICT 여성기업인 등 멘토와 공동 프로젝트 수행을 통해 현장 실무 습득 기회를 제공하여 차세대 ICT산업을 이끌 ICT 여성 인재를 육성하는 프로그램입니다.</span></p>
							<ul class="link_menu">
								<li><a href="/portal/kibwa/businessOverview.do" class="icon01"><span class="tit01">사업안내</span><span class="tit02">이브와ICT멘토링 소개</span></a></li>
								<li><a href="/portal/kibwa/participationGuidelines.do" class="icon02"><span class="tit01">참여안내</span><span class="tit02">멘토링 참여프로세스</span></a></li>
								<li><a href="javascript:void(0);" onclick="searchNoticeList('ibwa');" class="icon03"><span class="tit01">프로젝트</span><span class="tit02">이브와 멘토링 프로젝트</span></a></li>
							</ul>
						</li>
						<li class="slider01" style="float: left; list-style: none; position: relative; width: 648px;">
							<p><span class="logo"><img src="/images/main/visual_logo01.png" alt="한이음"></span>
								<span class="tit">한이음 ICT멘토링</span>
								<span class="cont">ICT인재양성 프로그램으로 학생은 다양한 ICT 분야의 기업전문가 멘토에게 지도 받을 수 있는 기회를, 멘토는 ICT분야에 관심 있는 대학생들 에게 실무노하우를 전수하고 비전제시 합니다.</span></p>
							<ul class="link_menu">
								<li><a href="/portal/hanium/businessOverview.do" class="icon01"><span class="tit01">사업안내</span><span class="tit02">한이음ICT멘토링 소개</span></a></li>
								<li><a href="/portal/hanium/participationGuidelines.do" class="icon02"><span class="tit01">참여안내</span><span class="tit02">멘토링 참여프로세스</span></a></li>
								<li><a href="javascript:void(0);" onclick="searchNoticeList('hanium');" class="icon03"><span class="tit01">프로젝트</span><span class="tit02">한이음 멘토링 프로젝트</span></a></li>
							</ul>
						</li>
						<li class="slider02" style="float: left; list-style: none; position: relative; width: 648px;">
							<p><span class="logo"><img src="/images/main/visual_logo02.png" alt="프로보노"></span>
								<span class="tit">프로보노 ICT멘토링</span>
								<span class="cont">협약을 맺은 기업의 現개발 실무진(멘토)들과 대학생(멘티)들이 팀을 이루어 사회공헌이라는 의미가 부여된 착한기술 프로젝트를 개발하고 수행하는 인재양성 프로그램입니다.</span></p>
							<ul class="link_menu">
								<li><a href="/portal/probono/businessOverview.do" class="icon01"><span class="tit01">사업안내</span><span class="tit02">프로보노ICT멘토링 소개</span></a></li>
								<li><a href="/portal/probono/participationGuidelines.do" class="icon02"><span class="tit01">참여안내</span><span class="tit02">멘토링 참여프로세스</span></a></li>
								<li><a href="javascript:void(0);" onclick="searchNoticeList('probono');" class="icon03"><span class="tit01">프로젝트</span><span class="tit02">프로보노 멘토링 프로젝트</span></a></li>
							</ul>
						</li>		
						<li class="slider03" style="float: left; list-style: none; position: relative; width: 648px;">
							<p><span class="logo"><img src="/images/main/visual_logo03.png" alt="이브와"></span>
								<span class="tit">이브와 ICT멘토링</span>
								<span class="cont">이공계 여대생들에게 ICT 여성기업인 등 멘토와 공동 프로젝트 수행을 통해 현장 실무 습득 기회를 제공하여 차세대 ICT산업을 이끌 ICT 여성 인재를 육성하는 프로그램입니다.</span></p>
							<ul class="link_menu">
								<li><a href="/portal/kibwa/businessOverview.do" class="icon01"><span class="tit01">사업안내</span><span class="tit02">이브와ICT멘토링 소개</span></a></li>
								<li><a href="/portal/kibwa/participationGuidelines.do" class="icon02"><span class="tit01">참여안내</span><span class="tit02">멘토링 참여프로세스</span></a></li>
								<li><a href="javascript:void(0);" onclick="searchNoticeList('ibwa');" class="icon03"><span class="tit01">프로젝트</span><span class="tit02">이브와 멘토링 프로젝트</span></a></li>
							</ul>
						</li>
					<li class="slider01 bx-clone" style="float: left; list-style: none; position: relative; width: 648px;">
							<p><span class="logo"><img src="/images/main/visual_logo01.png" alt="한이음"></span>
								<span class="tit">한이음 ICT멘토링</span>
								<span class="cont">ICT인재양성 프로그램으로 학생은 다양한 ICT 분야의 기업전문가 멘토에게 지도 받을 수 있는 기회를, 멘토는 ICT분야에 관심 있는 대학생들 에게 실무노하우를 전수하고 비전제시 합니다.</span></p>
							<ul class="link_menu">
								<li><a href="/portal/hanium/businessOverview.do" class="icon01"><span class="tit01">사업안내</span><span class="tit02">한이음ICT멘토링 소개</span></a></li>
								<li><a href="/portal/hanium/participationGuidelines.do" class="icon02"><span class="tit01">참여안내</span><span class="tit02">멘토링 참여프로세스</span></a></li>
								<li><a href="javascript:void(0);" onclick="searchNoticeList('hanium');" class="icon03"><span class="tit01">프로젝트</span><span class="tit02">한이음 멘토링 프로젝트</span></a></li>
							</ul>
						</li>
						</ul>
						</div>
						<div class="bx-controls bx-has-controls-direction bx-has-controls-auto">
						<div class="bx-controls-direction"><a class="bx-prev" href="">Prev</a><a class="bx-next" href="">Next</a></div>
						<div class="bx-controls-auto"><div class="bx-controls-auto-item"><a class="bx-start active" href="">Start</a></div>
						<div class="bx-controls-auto-item"><a class="bx-stop" href="">Stop</a></div>
						</div></div>
						</div> -->
				
				<div class="project_wrap">
					<h2>프로젝트 목록</h2>
					<ul>
				<c:forEach items="${projectlist}" var="projectlist">
					<c:if test="${projectlist.condition eq '모집중'}">
						<li>
							<a onclick="location.href='./projectdetail?idx=${projectlist.project_idx}'" class="project04" onclick="">${projectlist.subject}</a>
							<span class="statue03">모집중</span>
					
						</li>
					</c:if>
					<c:if test="${projectlist.condition eq '진행중'}">
						<li>
							<a href="./projectdetail?idx=${projectlist.project_idx}" class="project01" onclick="">${projectlist.subject}</a>
							<span class="statue01">진행중</span>
						</li>
					</c:if>
					<c:if test="${projectlist.condition eq '완료'}">
						<li>
							<a href="./projectdetail?idx=${projectlist.project_idx}" class="project01" onclick="">${projectlist.subject}</a>
							<span class="statue01">완료</span>
						</li>
					</c:if>
				</c:forEach>


					</ul>
					<p class="more"><a href="projectmain"><img src="resources/img/btn_more.gif" alt="more"></a></p>
				</div>
			</div>
			
			
			
			<!-- <div class="award_wrap">
				<h2><img src="/images/main/title02.png" alt="Hanium Award"></h2>
				<p class="icon"><img src="/images/main/icon_award.png" alt="ict"></p>
				<div class="award_box_wrap">
					<div class="award_box">
						<div class="bx-wrapper" style="max-width: 100%;"><div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 180px;">
						<ul class="bxslider02" style="width: 815%; position: relative; transition-duration: 0s; transform: translate3d(-311px, 0px, 0px);">
						<li style="float: left; list-style: none; position: relative; width: 311px;" class="bx-clone">
											<div>
												<p class="photo">
															<img src="http://www.hanium.or.kr/upload/20170328054745624_은상_키노피오.jpg" alt="">
												</p>
												<p class="tit_box">
															<span class="headline"><img src="/images/main/award_head_silver.png" alt="미래창조과학부 장관상 은상"></span>
													
													<a onclick="fn_awardView('9465')"><span class="tit">아두이노를 이용한 휴대용 신장계</span></a>
												</p>
											</div>
											<p class="cont">Android 스마트폰과 연동하여 사용하는 휴대용 신장계이다.
					아두이노를 사용하였으며 높은 휴대성과 가격대비 높은 스펙으로 어디서든 간편하게 신장을 측정 할 수 있다.</p>
										</li>
										<li style="float: left; list-style: none; position: relative; width: 311px;">
											<div>
												<p class="photo">
															<img src="http://www.hanium.or.kr/upload/20170321030207075_01_대상_Plossom.png" alt="">
												</p>
												<p class="tit_box">
													 		<span class="headline"><img src="/images/main/award_head_grand.png" alt="미래창조과학부 장관상 대상"></span>
													
													<a onclick="fn_awardView('9782')"><span class="tit">Spring Boot를 활용한 웹 기반의 프로젝트 관리 시스템</span></a>
												</p>
											</div>
											<p class="cont">최근 늘어가고 있는 프로젝트에 소프트웨어 개발자 또는 프로젝트 매니저가 겪는 프로젝트 산출물 표준화 및 체계적인 관리를 할 수 있도록 하는 시스템</p>
										</li>
									
										<li style="float: left; list-style: none; position: relative; width: 311px;">
											<div>
												<p class="photo">
														
															<img src="http://www.hanium.or.kr/upload/20170321030640647_03_금상_TRON.jpg" alt="">
												</p>
												<p class="tit_box">
															<span class="headline"><img src="/images/main/award_head_gold.png" alt="미래창조과학부 장관상 금상"></span>
													<a onclick="fn_awardView('9378')"><span class="tit">VR과 모션 시뮬레이터를 이용한 4D 자전거 주행 시뮬레이션 개발</span></a>
												</p>
											</div>
											<p class="cont">본 프로젝트는 VR(Virtual Reality)기기와 모션 시뮬레이터를 이용하여 사용자가 실제 주행을 체감할 수 있는 4D 자전거 주행 시뮬레이션를 개발하여 다소 지루할 수 있는 운동을 즐기며 할 수 있도록 한다. </p>
										</li>
									
										<li style="float: left; list-style: none; position: relative; width: 311px;">
											<div>
												<p class="photo">
															<img src="http://www.hanium.or.kr/upload/20170321030515842_02_금상_ICT기반 재배환경 제어 시스템.jpeg" alt="">
												</p>
												<p class="tit_box">
														
															<span class="headline"><img src="/images/main/award_head_gold.png" alt="미래창조과학부 장관상 금상"></span>
													<a onclick="fn_awardView('10128')"><span class="tit">ICT기반 재배환경 제어시스템</span></a>
												</p>
											</div>
											<p class="cont">기존 식물공장의 수중재배 방안에 더불어 영상처리 프로젝트 제작을 통해 차후 식물공장 및 연구소에서 구현 가능한 식물공장 Prototype을 구현하고 서비스 모델을 제시한다. 
</p>
										</li>
									
										<li style="float: left; list-style: none; position: relative; width: 311px;">
											<div>
												<p class="photo">
															<img src="http://www.hanium.or.kr/upload/20170321030830997_05_은상_범블 아이(AI) 카.jpg" alt="">
												</p>
												<p class="tit_box">
															<span class="headline"><img src="/images/main/award_head_silver.png" alt="미래창조과학부 장관상 은상"></span>
													<a onclick="fn_awardView('9821')"><span class="tit">스마트 인공지능(AI) 유모차</span></a>
												</p>
											</div>
											<p class="cont">안전사고 예방 안전기능 및 각종 편의기능을 제공하여
									IoT 시대에 스마트 유모차의 새로운 패러다임을 제시합니다.</p>
										</li>
									
										<li style="float: left; list-style: none; position: relative; width: 311px;">
											<div>
												<p class="photo">
															<img src="http://www.hanium.or.kr/upload/20170321030741950_04_은상_IoT 스노보드.jpeg" alt="">
													
												</p>
												<p class="tit_box">
															<span class="headline"><img src="/images/main/award_head_silver.png" alt="미래창조과학부 장관상 은상"></span>
														
													
													<a onclick="fn_awardView('9282')"><span class="tit">IoT(Internet of Things) 스마트 스노우보드 제작</span></a>
												</p>
											</div>
											<p class="cont">센서와 스노보드를 융합한 IoT 솔루션이다. 사용자의 안전과 실력 향상을 통해 스노보드의 활성화를 이끈다.</p>
										</li>
									
										<li style="float: left; list-style: none; position: relative; width: 311px;">
											<div>
												<p class="photo">
															<img src="http://www.hanium.or.kr/upload/20170328054745624_은상_키노피오.jpg" alt="">
												</p>
												<p class="tit_box">
															<span class="headline"><img src="/images/main/award_head_silver.png" alt="미래창조과학부 장관상 은상"></span>
													<a onclick="fn_awardView('9465')"><span class="tit">아두이노를 이용한 휴대용 신장계</span></a>
												</p>
											</div>
											<p class="cont">Android 스마트폰과 연동하여 사용하는 휴대용 신장계이다.
										아두이노를 사용하였으며 높은 휴대성과 가격대비 높은 스펙으로 어디서든 간편하게 신장을 측정 할 수 있다.</p>
										</li>
							
						<li style="float: left; list-style: none; position: relative; width: 311px;" class="bx-clone">
											<div>
												<p class="photo">
															<img src="http://www.hanium.or.kr/upload/20170321030207075_01_대상_Plossom.png" alt="">
												</p>
												<p class="tit_box">
													 		<span class="headline"><img src="resources/img/login_tag.png" alt=""></span>
													<a onclick="fn_awardView('9782')"><span class="tit">Spring Boot를 활용한 웹 기반의 프로젝트 관리 시스템</span></a>
												</p>
											</div>
											<p class="cont">최근 늘어가고 있는 프로젝트에 소프트웨어 개발자 또는 프로젝트 매니저가 겪는 프로젝트 산출물 표준화 및 체계적인 관리를 할 수 있도록 하는 시스템</p>
										</li></ul></div>
										<div class="bx-controls bx-has-pager bx-has-controls-direction">
										<div class="bx-pager bx-default-pager">
										<div class="bx-pager-item">
										<a href="" data-slide-index="0" class="bx-pager-link active">1</a></div>
										<div class="bx-pager-item"><a href="" data-slide-index="1" class="bx-pager-link">2</a>
										</div><div class="bx-pager-item"><a href="" data-slide-index="2" class="bx-pager-link">3</a></div>
										<div class="bx-pager-item"><a href="" data-slide-index="3" class="bx-pager-link">4</a>
										</div><div class="bx-pager-item"><a href="" data-slide-index="4" class="bx-pager-link">5</a></div><div class="bx-pager-item">
										<a href="" data-slide-index="5" class="bx-pager-link">6</a></div></div><div class="bx-controls-direction">
										<a class="bx-prev" href="#">Prev</a>
										<a class="bx-next" href="#">Next</a></div></div></div>
					</div>
				</div>
				<p class="more"><a href="/portal/project/awardList.do"><img src="resources/img/btn_more.gif" alt="more"></a></p>
			</div> -->



			
				
				
				
				
				
				<!--															  -->
				<!-- <div class="popup_box_wrap">
					<div class="popup_box">
						<div class="bx-wrapper" style="max-width: 100%;"><div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 241px;"><ul class="bxslider03" style="width: 315%; position: relative; transition-duration: 0s; transform: translate3d(-390px, 0px, 0px);"><li style="float: left; list-style: none; position: relative; width: 390px;" class="bx-clone"><a href="/portal/subscription/info.do"><img src="/images/main/popup_20170724.jpg" alt=""></a></li>
							<li style="float: left; list-style: none; position: relative; width: 390px;"><a href="/portal/subscription/info.do"><img src="/images/main/popup_20170724.jpg" alt=""></a></li>
							<li><a href="/portal/noticeAllBoard.do?unitedSeq=&articleSeq=44774"><img src="/images/main/popup_20170614.png" alt="" /></a></li>
							<li><a href="/portal/noticeAllBoard.do?unitedSeq=&articleSeq=44702"><img src="/images/main/popup_20170612.jpg" alt="" /></a></li>
							<li><a href="/portal/noticeAllBoard.do?unitedSeq=&articleSeq=43374"><img src="/images/main/popup_2017030802.jpg" alt="" /></a></li>
							<li><a href="/portal/noticeAllBoard.do?unitedSeq=&articleSeq=43436"><img src="/images/main/popup_2017030801.jpg" alt="" /></a></li>
							<li><a href="/portal/noticeAllBoard.do?unitedSeq=&articleSeq=43337"><img src="/images/main/popup_2017021101.jpg" alt="" /></a></li>
							<li><a href="#"><img src="/images/main/popup_img01.jpg" alt="" /></a></li>
						<li style="float: left; list-style: none; position: relative; width: 390px;" class="bx-clone"><a href="/portal/subscription/info.do"><img src="/images/main/popup_20170724.jpg" alt=""></a></li></ul></div><div class="bx-controls bx-has-pager bx-has-controls-direction bx-has-controls-auto"><div class="bx-pager bx-default-pager"><div class="bx-pager-item"><a href="" data-slide-index="0" class="bx-pager-link active">1</a></div></div><div class="bx-controls-direction"><a class="bx-prev disabled" href="">Prev</a><a class="bx-next disabled" href="">Next</a></div><div class="bx-controls-auto"><div class="bx-controls-auto-item"><a class="bx-start active" href="">Start</a></div><div class="bx-controls-auto-item"><a class="bx-stop" href="">Stop</a></div></div></div></div>
					</div>
				</div>
			</div> -->
			
			<!--                  						-->
			
			<!-- <div class="notice_wrap">
				<h2><img src="/images/main/title05.png" alt="Notice"></h2>
				<div class="notice_box">
					<ul>
								<a href="javascript:void(0);" onclick="noticeLink('','45343');" class="new"> [공지] 한이음 공모전 2017 안내</a>
			</li>
		
			<li>
								<a href="javascript:void(0);" onclick="noticeLink('','45314');"> [서식] 한이음 프로젝트_ 개발_ 프로그램 설계서(산출물)_2017년</a>
					
				
			</li>
		
			<li>
								<a href="javascript:void(0);" onclick="noticeLink('','44816');"> [한이음] 한이음 ICT멘토링 수행계획 변경 신청(실습장비 신청 포함) 안내</a>
			</li>
		
			<li>
								<a href="javascript:void(0);" onclick="noticeLink('','44774');">  [프로보노] 2017년 프로보노ICT멘토링 프로보노 멘티 5기 추가모집 </a>
			</li>
		
			<li>
								<a href="javascript:void(0);" onclick="noticeLink('','44702');"> [공지] 한이음 ICT멘토링 기획형 프로젝트 참여멘티 모집(~6/20)</a>
				
			</li>
		
			<li>
								<a href="javascript:void(0);" onclick="noticeLink('','44339');">  [프로보노] 2017년 프로보노ICT멘토링 지원사항</a>
				
			</li>
		
	
					</ul>
				</div>
				<p class="more"><a href="/portal/noticeAllBoard.do"><img src="resources/img/btn_more.gif" alt="more"></a></p>
			</div> -->

			
			<div class="knowledge_wrap">
				<h2>공지사항</h2>
				<div class="knowledge_box">
					<ul id="noticeZone">
					<%-- <c:forEach items="${QnAList}" var="QnAList">
						<li>
							<a href="QnADetail?idx=${QnAList.idx }">${QnAList.subject }</a><span class="dat"><a href="#">[${QnAList.comment_count }]</a></span>
						</li>
					</c:forEach> --%>
					</ul>
				</div>
				<p class="more"><a href="/main/QnABoard"><img src="resources/img/btn_more.gif" alt="more"></a></p>
			</div>
			
			
			

			<div class="knowledge_wrap2">
				<h2><img src="resources/img/title06.png" alt="지식"></h2>
				<div class="knowledge_box">
					<ul id="qnaZone">
					
					</ul>
				</div>
				<p class="more"><a href="/main/noticeBoard"><img src="resources/img/btn_more.gif" alt="more"></a></p>
			</div>
			
			
			
			
			<div class="popup_wrap">				
				<h2>공모소식<!-- <img src="resources/img/title04.png" alt="Popup zone"> --></h2>
					<div class="simple_banner_wrap banner01">
						<ul>
							<li><a href="./noticeDetail?idx=15"><img src="http://www.blueb.co.kr/SRC2/_image/w01.jpg" style="width:100%; height:100%; margin-top:0;"/></a></li>
							<li><a href="noticeDetail?idx=16"><img src="http://www.blueb.co.kr/SRC2/_image/w02.jpg" style="width:100%; height:100%; margin-top:0;"/></a></li>
							<li><a href="#"><img src="http://www.blueb.co.kr/SRC2/_image/w03.jpg" style="width:100%; height:100%; margin-top:0;"/></a></li>
							<li><a href="#!"><img src="http://www.blueb.co.kr/SRC2/_image/w02.jpg" style="width:100%; height:100%; margin-top:0;"/></a></li>
						</ul>
					</div>
			</div>
			
			<!-- <div class="quickMenu_wrap">
				<h2><img src="/images/main/title03.png" alt="Quick Menu"></h2>
				<div class="quickMenu_box">
					<ul>
						<li><a href="" class="quick01"><span>지식공감</span></a></li>
						<li><a href="" class="quick02"><span>이슈/트랜드</span></a></li>
						<li><a href="" class="quick03"><span>프로젝트</span></a></li>
						<li><a href="" class="quick04"><span>멘토링 SOS</span></a></li>
						<li><a href="" class="quick05"><span>통합자료실</span></a></li>
						<li><a onclick="personalOpen(); return false;" class="quick06"><span>개인정보침해신고</span></a></li>
					</ul>
				</div>
			</div> -->
			
			
			
			
			
			
			
			<!-- <div class="probono_wrap">
				<h2><img src="/images/main/title07.png" alt="프로보노 지식강연"></h2>
				<div class="probono_box">
		<iframe width="100%" height="220" src="https://www.youtube.com/embed/6hPhrzjPdGE" ?rel="0&amp;enablejsapi=1&amp;controls=1&amp;showinfo=0&amp;wmode=opaque&amp;autohide=1&amp;disablekb=0&quot;" frameborder="0" allowfullscreen=""></iframe>		
		
			<ul>
				<li><a>2017년도 한이음 ICT멘토링제도 소개</a><span class="date">2017-03-21</span></li>
			</ul>


				</div>
				<p class="more"><a href="/its/openCourseWare/probonoArticleList.do"><img src="resources/img/btn_more.gif" alt="more"></a></p>
			</div> -->
			
			
		</div>
	</section>
	
	
	
	
	
	<footer id="main_footer_wrap">
		<div class="quick_wrap">
			<div class="quick_box">
				<ul>
					<li><a href="#" onclick="window.open('https://www.hanium.or.kr/html/etc_privacy.html','child','width=850, height=700, scrollbars=yes, resizable=no');">개인정보처리방침</a></li>
					<li><a href="#" onclick="window.open('https://www.hanium.or.kr/html/etc_email.html','child','width=850, height=700, scrollbars=yes, resizable=no');">이메일주소무단수집거부</a></li>
					<li><a href="#" onclick="window.open('https://www.hanium.or.kr/html/etc_user.html','child','width=850, height=700, scrollbars=yes, resizable=no');">이용자약관</a></li>
					<li class="none"><a style="cursor: auto;">대표전화 : 010-8520-6542 / E-mail : WeMakeProject@org.kr</a></li>
				</ul>
			</div>
		</div>
		<p class="btn_top"><a href="#"><img src="resources/img/btn_top.gif" height="54" alt="상단으로"></a></p>
		<div class="address_wrap">
			<p class="copyright">Copyright © 2017 위메프. All Rights Reserved.</p>
		</div>
	</footer>
	
	
	
    </body>
    <script>
	    function actionLogin(){
			$("#actionLogin").submit();
		}
    	
	    var data = {};
    	var url;
    
    	noticeListCall();
    	
    	
	    function noticeListCall(){
				url = "./rest/mainNoticeCall"
				data = {};
				ajaxCall(url,data);
		}
	   
	    
	    function actionLogin(){
			$("#actionLogin").submit();
		}
	    function ajaxCall(reqUrl, reqData){
				console.log(reqUrl, reqData);
				$.ajax({
					url:reqUrl,
					type:"post",
					data:reqData,
					dataType:"json",
					success:function(d){				
						if(reqUrl == "./rest/mainNoticeCall"){
							console.log(d.noticeList);
							console.log(d.qnaList);
							noticePrint(d.noticeList);
							qnaPrint(d.qnaList);
						}
					},
					error:function(e){
						console.log(e);
					}
				});
			}
		 //리스트 그리기
 		function noticePrint(list){
		  
			var content="";					
			for(var i=0; i<list.length; i++){
				content +="<li>";
				content +="<a href='noticeDetail?idx="+list[i].idx+"'>"+list[i].subject+"</a><span class='dat'><a href='#'></a></span>";
				content +="</li>";
			}						
			$("#noticeZone").empty();
			$("#noticeZone").append(content);		
 			
		}
		 
 		function qnaPrint(list){
 			 
 			var content="";					
 			for(var i=0; i<list.length; i++){
 				content +="<li>";
 				content +="<a href='QnADetail?idx="+list[i].idx+"'>"+list[i].subject+"</a><span class='dat'>["+list[i].comment_count+"]<a href='#'></a></span>";
 				content +="</li>";
 			}						
 			$("#qnaZone").empty();
 			$("#qnaZone").append(content);		
 	 			
	 	}
    
    </script>
</html>