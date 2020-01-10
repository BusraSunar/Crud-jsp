<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
    <% Class.forName("com.mysql.jdbc.Driver"); %>
  
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Submit</title>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
    <header>
      <h1>Update</h1>
    </header>
	<%
		Connection conn =null;
		Statement stat = null;
		ResultSet res=null;
		PreparedStatement stmt=null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/idk?autoReconnect=true&useSSL=false", "root", "");
		
	%>
      <section class="container">
	      <form id="my-form" method="post">
	      	<%
	      		stat= conn.createStatement(); 
	      		String idStr = request.getParameter("id");
	      		int id = Integer.parseInt(idStr);
	      		String sql = "SELECT * FROM smth WHERE id='"+id+"'";
	      		res = stat.executeQuery(sql);
	      		while(res.next()){	
	      	%>
	      	<input type="hidden" name="id" value='<% res.getString("id");%>'>
	        <div>
	          <label for="name">Name:</label>
	          <input type="text" id="name" name="name" value='<% res.getString("name");%>' >
	        </div>
	        <div>
	          <label for="email">Email:</label>
	          <input type="text" id="email"  name="email" value='<% res.getString("email");%>'>
	        </div>
	        
	        <%
	      		 }
	        %>
	        
	        <button  type="submit" class="btn">Update</button>
	         <a href="table.jsp" class="btn" style="text-decoration: none; text-align: center;" >Back</a>
	      </form>
      </section>
    
  </body>
  </html>
  <%
  	String id2 = request.getParameter("id"); 
  	String name = request.getParameter("name");
	String email = request.getParameter("email");
	if(id2!=null && name!=null && email!=null){
		String update="UPDATE smth SET name=?, email=? WHERE id='" +id2 +"'";
		stmt = conn.prepareStatement(update);
		stmt.setString(1,name);
		stmt.setString(2,email);
		stmt.executeUpdate();
		response.sendRedirect("table.jsp");
	}

  %>
  
  
  
  
  
  
  