<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="b1" class="vo.Bank1VO" />
<jsp:useBean id="b2" class="vo.Bank2VO" />
<jsp:useBean id="dao1" class="dao.Bank1DAO" />
<jsp:useBean id="dao2" class="dao.Bank2DAO" />
<%
	
		String action=request.getParameter("action");
		System.out.println("로그 : "+action);

		if(action.equals("main")){
			b1=dao1.selectOne(b1);
			b2=dao2.selectOne(b2);
			
			session.setAttribute("b1",b1);
			session.setAttribute("b2",b2);

			pageContext.forward("main.jsp"); // forward 액션
		}
		else if(action.equals("transfer")){
		
		if(dao1.transfer(Integer.parseInt(request.getParameter("balance")))){ //아웃풋이 String
			out.print("<script>alert('성공!');location.href='main.jsp';</script>");
		}
		else{
			out.print("<script>alert('실패...');location.href='main.jsp';</script>");
		}

		b1=dao1.selectOne(b1);
		b2=dao2.selectOne(b2);
		//req,sess,appli에 저장
		session.setAttribute("b1",b1);
		session.setAttribute("b2",b2);
		// V에서 EL식으로 출력하기 위해, JSP scope 내장객체에 setAttribute() 수행함

		}

%>