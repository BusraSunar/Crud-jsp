<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
	  <!DOCTYPE html>
	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	    <link rel="stylesheet" href="rehberStyle.css">
	    <script src="https://kit.fontawesome.com/41c5e081d3.js" crossorigin="anonymous"></script>
	    <title>Rehber</title>
	</head>
	<body>
	    <header >
	        <h1 >Rehber</h1>
	    </header>
	    
	    <div class="search-box">
    		<form action="" method="get" class="form">
		        <input class="search-txt" name="q" placeholder="Type to search">
		        <a href="#" class="search-btn" style="text-decoration: none;">
		            <i class="fas fa-search"></i>
		        </a>
	        </form>

	    </div>
	    <a href="addNew.jsp" id="newData" class="btn2" style="text-decoration: none;">Add New Data</a>
	        <table id="rehber" >
        <thead>
            <tr bgcolor="#333">
                <th ><font color="#fff">ID</font></th>
                <th ><font color="#fff">NAME</font></th>
                <th ><font color="#fff">EMAIL</font></th>
                <th class="text-center"><font color="#fff">ACTION</font></th>
                
            </tr>
        </thead>
        <TBody>
        	<%
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/idk?autoReconnect=true&useSSL=false", "root", "");
				Statement statement=conn.createStatement();
				String query = request.getParameter("q");//bu search inputun name i 
				
				String sql="";
				
				if(query!=null){
					sql = "SELECT * FROM smth WHERE name LIKE '%"+query+"%' OR email LIKE '%"+query+"%'";
				}else{
					sql ="SELECT * FROM smth";
				}
				ResultSet resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
			%>
			<tr>
				<td><%=resultSet.getString("id") %></td>
				<td><%=resultSet.getString("name") %></td>
				<td><%=resultSet.getString("email") %></td>
				<td>
					<a href="edit.jsp?id=<%=resultSet.getString("id") %>" style="text-decoration: none;  background: #333;" class="edit"   >Edit</a>
					<a href="delete.jsp?id=<%=resultSet.getString("id") %>" style="text-decoration: none; background: rgb(163, 2, 2);" class="edit"   >Delete</a>
				</td>
			</tr>
			<%
				}
			%>
        </TBody>
    </table>
		

	</body>
	</html>
		
		
