<%--
  Created by IntelliJ IDEA.
  User: 24412
  Date: 2019/11/13
  Time: 22:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.qst.itofferbacker.dao.UserDAO" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user"
             class="com.qst.itofferbacker.javabean.User"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<%
    UserDAO dao = new UserDAO();
    dao.update(user);
    response.sendRedirect("userList.jsp");
%>

