<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import = "com.spring.gogidang.domain.*" %>

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("MemberVO");
	String id = memberVO.getU_id();
	ArrayList<StoreVO> storeList = (ArrayList<StoreVO>) request.getAttribute("storeList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게리스트</title>
</head>
<body>
	<h1><%=id %></h1>
	<h1>가게리스트</h1>
		<center>
			<table border=1 width=300>
				<tr align=center><td colspan=2>등록된 가게 리스트</td></tr>
			<%
				for (int i=0; i<storeList.size(); i++)
					{
						StoreVO vo = (StoreVO)storeList.get(i);
						
						if (vo.getConfirm() == 1) {
			%>
				<tr>
					<td>
						<a href="storeInfo.st?s_num=<%=vo.getS_num() %>"><%=vo.getS_num() %> / <%=vo.getS_name()%> - <%=vo.getU_id()%></a>
					</td>
				</tr>
			<%
					}
			%>
			<%
				}
			%>
			</table>
		</center>
</body>
</html>