<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
    <% Class.forName("com.mysql.jdbc.Driver"); %>
<%
	String idStr = request.getParameter("id");
	int id = Integer.parseInt(idStr);
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/idk?autoReconnect=true&useSSL=false", "root", "");
	
	Statement stat=conn.createStatement();
	String sql= "DELETE FROM smth WHERE id='" +id + "'" ;
	stat.executeUpdate(sql);
	response.sendRedirect("table.jsp");
%>