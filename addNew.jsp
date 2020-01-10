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
      <h1>Submit</h1>
    </header>

    <section class="container">
      <form id="my-form" method="post">
        <h1>Add User</h1>
        <div class="msg"></div> 
        <div>
          <label for="name">Name:</label>
          <input type="text" name="name">
        </div>
        <div>
          <label for="email">Email:</label>
          <input type="text"  name="email">
        </div>
        <input class="btn" type="submit" value="Submit">
         <a href="table.jsp" class="btn" style="text-decoration: none; text-align: center;">Back</a>
      </form>
    </section>
  </body>
    
    </html>
    
    <%
		
    	String name= request.getParameter("name");
		String email = request.getParameter("email");
		Connection conn =null;
		PreparedStatement ps = null;

		//to connect
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			if(name!=null && email!=null){
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/idk?autoReconnect=true&useSSL=false", "root", "");
				ps = conn.prepareStatement("INSERT INTO smth(name, email) VALUES (?,?)");
				ps.setString(1,name);
				ps.setString(2,email);
				//int x = ps.executeUpdate(); //this will return the number of rows thats been updated,inserted
				ps.executeUpdate();
				response.sendRedirect("table.jsp");
			}

		}catch(Exception e){
			

		}

    %>
    