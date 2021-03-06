<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>



<%@include file="../includes/header_simple.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/joinstyle.css" type="text/css">
<title>회원가입</title>  
  
<body>
	 <!--네비게이션바 사용 시작-->
   <!--<section class="hero">
        <div class="container">
            <div class="hero__item__box2"></div>
                    <div class="EventNav">
                        <ul>
                            <li><a href="#">가게리스트</a></li>
                            <li><a href="#">리뷰전체</a>
                            <li><a href="#">공지사항</a></li>
                        </ul>
                    </div>   
            </div>   
        </div>
    </section>  --> 
    <!--네비게이션바 사용 끝-->
    
	<!-- 회원가입 시작 -->
	
	
	
	<div class="container" id="join">
		<div class="row justify-content-center">
        <div class="col-lg-8">
        	<div class="join">
 				<h1>JOIN</h1>
            <!-- join form -->
         	<form name="joinform" action="./joinProcess.me" method="post">
         		<div class="id_input_box">
         			<ts>아이디<span class="ico">*</span> </ts>
         	 		<td><input type="text"  name="u_id" placeholder="숫자와 영어를 포함 4~10자리내로 입력하세요." style="font-size:13px;" /></td> <!-- name="u_id"  -->
         	 	</div>
         	 	
         	 	<div class="id_input_box">
         	 		<ts>비밀번호<span class="ico">*</span>  </ts>
         	 		<td><input type="password" name="u_pw" placeholder="숫자와 영어를 포함 6~12자리내로 입력하세요." style="font-size:13px;"/></td>
         	 	</div>
         	 	
         	 	<div class="id_input_box">
	         	 	<ts>비밀번호 확인<span class="ico">*</span>   </ts>
	         	 	<td><input type="password" name="u_pw2" placeholder="숫자와 영어를 포함 6~12자리내로 입력하세요." style="font-size:13px;"/></td>
         	 	</div>
         	 	
         	 	<div class="id_input_box">
	         	 	<ts>이름<span class="ico">*</span>   </ts>
	         	 	<td><input type="text" name="u_name" placeholder="이름을 입력하세요." style="font-size:13px;"/></td>
         	 	</div>
         	 	
         	 	<div class="id_input_box">
	         	 	<ts>닉네임<span class="ico">*</span>   </ts>
	         	 	<td><input type="text" name="u_nick" placeholder="이름을 입력하세요." style="font-size:13px;"/></td>
         	 	</div>
         	 	
         	 	<div class="id_input_box">
	         	 	<ts>생년월일<span class="ico">*</span></ts>
	         	 	<td><input type="text" name="u_birth" placeholder="생년월일 8자리를 입력하세요.(예: 19990120)" style="font-size:13px;"/></td>
         	 	</div>
         	 	
         	 	<div class="id_input_box_s">
         	 		<div class="id_input_box">
		         	 	<ts>주소<span class="ico">*</span></ts>
		         	 	<td><input class="add_input" type="text" id="u_post" name="u_post" placeholder="우편번호" style="font-size:13px;"/>
		         	 		<input class="add_btn" type="button" onclick="execDaumPostcode()" value="우편번호찾기" style="font-size:10px;"/></td>
		         	 </div>
		         	 <div class="id_input_box">
		         		 <ts> </ts>
		         	 	<td><input  type="text" id="u_addr" name="u_addr" placeholder="주소" style="font-size:13px;"/></td>
		         	 </div>
		         	 <div class="id_input_box">		
		         	 	<ts> </ts>
		         	 	<input type="text" id="u_addr" name="u_addr" placeholder="상세주소" style="font-size:13px;"/></td>
	         	 	</div>
         	 	</div>
         	 
         		
         	 	<div class="id_input_box">
		         	<ts>이메일<span class="ico">*</span></ts>
		         	 <td><input class="add_input_email" type="text" name="u_email"/><span class="ico_email" style="font-size:13px;">@</span>
		         	 <select class="add_input_email_se" name="u_email" width="110px"> 
		         	 		<option value="">메일주소선택</option>
							<option value="@naver,com">naver.com</option>
							<option value="@hanmail.net">hanmail.net</option>
							<option value="@daum.net">daum.net</option>
							<option value="@gmail.com">gmail.com</option>
							<option value="@nate.net">nate.net</option>
					</select>
					</td>
         	 	</div>
         	 	
         	 	<div class="id_input_box">
         	 	<ts>전화번호<span class="ico">*</span></ts>
         	 	<td><input type="text" name="u_phone" style="font-size:13px;"/></td>
         	 	</div>
         	 	
         	 	<div class="id_input_box">
         	 	<ts>약관동의<span class="ico">*</span></ts>
         	 	<div class="input_box_box">
		         	<td><input class="radio_input" type="radio" name="u_agree" value="1" checked/><span class="ico_ag">동의</span></td>
		         	<td><input class="radio_input" type="radio" name="u_agree" value="0"/><span class="ico_ag">비동의</span></td>
		     	</div>
		      </div>
		         	 	
         	 	<div class="id_input_box">
         	 		<ts>고객 유형<span class="ico">*</span></ts>
         	 		<div class="input_box_box">
         	 			<td><input class="radio_input" type="radio" name="seller_key" value="1" checked/><span class="ico_ag">판매자</span></td>
        		 		<td><input class="radio_input" type="radio" name="seller_key" value="0"/><span class="ico_ag">일반고객</span></td>
         			</div>	
         	 	</div>
         	 	
         	 	<!-- 
         	 	 <a href="#" onclick="check_input()">회원가입</a>&nbsp;&nbsp;
         		<a href="javascript:joinform.reset()">다시작성</a>
         		 -->
         		 
         	 	<div class="join_btn">
         	 	<button type="submit" class="btn-jj btn-lg btn-block btn-success"  >회원가입</button>
         	 	<button type="reset" class="btn-j btn-lg btn-block btn-success" >다시 작성</button>
         	 	</div>
         	 	
         	
         	
         	
			</form>
 
 
 			</div><!--join -->
		</div><!-- col-lg-8 -->.
		</div><!-- row justify-content-center -->
	</div><!-- container id="join" -->
 
 
 
    <!-- Footer Section start -->
	<%@include file="../includes/footer.jsp"%>
	<!-- Footer Section End -->
	
	
	
  <!-- Js Plugins -->
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
 <script type="text/javascript">
 

 var birthExp = /^\d{8}$/;

function execDaumPostcode() {
   new daum.Postcode({
       oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
           // 각 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var Addr = ''; // 최종 주소 변수
           var extraAddr = ''; // 조합형 주소 변수
           // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
           if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
               Addr = data.roadAddress;
           } else { // 사용자가 지번 주소를 선택했을 경우(J)
               Addr = data.jibunAddress;
           }
           // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
           if(data.userSelectedType === 'R'){
               //법정동명이 있을 경우 추가한다.
               if(data.bname !== ''){
                   extraAddr += data.bname;
               }
               // 건물명이 있을 경우 추가한다.
               if(data.buildingName !== ''){
                   extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
               Addr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
           }
           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           document.getElementById('u_post').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('u_addr').value = Addr;
           // 커서를 상세주소 필드로 이동한다.
           document.getElementById('u_addr').focus();
       }
   }).open();
}


function check_input() {
 var str,i,ch,chk,chk_list="";
 
 if(document.joinform.u_id.value=="") {
    alert("아이디를 입력하세요!!");
    document.joinform.u_id.focus();
    return false;
 } else {
    str=document.joinform.u_id.value;
    if(str.length<4 || str.length>10){
       alert("아이디 길이를 확인해주세요 (4~10자리)!!!");
       document.joinform.u_id.focus();
       return false;
    } else {
       for(i=0;i<str.length;i++) {
          ch=str.substring(i,i+1);
          if(!((ch>="0" && ch<="9")||(ch>="a" && ch<="z") ||(ch>="A" && ch<="Z"))){
             alert("특수문자가 포함, 다시입력!!!");
             document.joinform.u_id.focus();
             return false;
          }
       }
    }
 }
 
 chk_list="u_id="+str+"\n";
 //아이디 입력시 체크하는 부분
 //비밀번호 체크
 if(document.joinform.u_pw.value=="") {
    alert("비밀번호를 입력하세요!!!");
    document.joinform.u_pw.focus();
    return false;
 } else {
    str=document.joinform.u_pw.value;
    if(str.length<6 || str.length>12) {
       alert("비밀번호 길이를 확인하세요(6~12자리)!!!");
       document.joinform.u_pw.focus();
       return false;
    } else{
       for(i=0;i<str.length;i++) {
          ch=str.substring(i,i+1);
          if(!((ch>="0" && ch<="9")||(ch>="a" && ch<="z") ||(ch>="A" && ch<="z"))) {
          alert("특수문자가 포함되어있습니다, 다시입력해주세요!!");
          document.joinform.u_pw.focus();
          return false;
          }
       }
    }
 }
 
 if(document.joinform.u_pw.value != document.joinform.u_pw2.value) {
    alert("비밀번호가 일치하지 않습니다 다시 확인해주세요!!!");
    document.joinform.u_pw2.focus();
    return false;
 }
 
 chk_list +="u_pw="+str+"\n";
 
 var u_birth = document.joinform.u_birth;
 
 if( !birthExp.test( u_birth.value ) ) {
    alert("생년월일은 숫자만 8자리 입력가능합니다");
    u_birth.value = "";
    u_birth.focus();
    return false;
 }
 
 joinform.submit();
}

$(function(){
 //아이디 중복체크
     $('#u_id').blur(function(){
         $.ajax({
         type:"post",
         url:"checkid.bo",
         data:{ "u_id":$('#u_id').val()},
         success:function(data){   //data : checkSignup에서 넘겨준 결과값
                if($.trim(data)=="YES"){
                   if($('#u_id').val()!==''){
                      alert("사용가능한 아이디입니다.");
                   }
                  }else{
                   if($('#u_id').val()!==''){
                      alert("이미 회원 가입된 아이디입니다.");
                      $('#u_id').val('');
                      $('#u_id').focus();
                   }
                }
             },
        }) 
      })
 });
</script>
 
  </body>
</html>