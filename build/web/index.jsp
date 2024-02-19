

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    if (request.getParameter("submit") != null) {
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");
        String tel = request.getParameter("tel");

        Connection con = null;
        PreparedStatement pst = null;

        try {
            String jdbcUrl = "jdbc:mysql://localhost:3306/school";
            String username = "root";
            String password = "1234";

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(jdbcUrl, username, password);
            pst = con.prepareStatement("insert into Student(name,age,course,fee,tel)values(?,?,?,?,?)");

            pst.setString(1, name);
            pst.setInt(2, age);
            pst.setString(3, course);
            pst.setString(4, fee);
            pst.setString(5, tel);

            pst.executeUpdate();

            // Add any additional logic after successful execution, if needed.
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions (e.g., log the error, display an error message)
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                // Handle exception while closing resources
                e.printStackTrace();
            }
        }
%>
<script>
    alert("Record Added");
</script>

<%

    }


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.rtl.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.rtl.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Student Registration</h1>
        
        
        <div class="row">
            
            <div class="col-sm-4">
                <form method="post" action="">
                    <br>
                    <div alight="left">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" name="name" id="name" required>      
                    </div>
 <br>
                    <div alight="left">
                        <label class="form-label">Student Age</label>
                        <input type="number" class="form-control" placeholder="Student Age" name="age" id="age" required>      
                    </div>
 <br>
                    <div alight="left">
                        <label class="form-label">Student Course</label>
                        <input type="text" class="form-control" placeholder="Student Course" name="course" id="course" required>      
                    </div>
 <br>
                    <div alight="left">
                        <label class="form-label">Student Fee</label>
                        <input type="text" class="form-control" placeholder="Student Fee" name="fee" id="fee" required>      
                    </div>
 <br>
                    <div alight="left">
                        <label class="form-label">Student Tel</label>
                        <input type="text" class="form-control" placeholder="Student Telephone Number" name="tel" id="tel" required>      
                    </div>
 <br>
                    <div alight="right">
                        <input type="submit" id="submit" class="btn btn-info" name="submit">
                        
                        <input type="reset" id="reset" class="btn btn-warning" name="reset">
                        
                    </div>
                    
                    
                    
                    
                </form>
                
                
            </div>
            <div class="col-sm-8">
                
                
             <div class="panel-body">
    <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0" width="100%">
        <thead>
            <tr>
                <th> Name</th>
                <th> Age</th>
                <th> Course</th>
                <th> Fee</th>
                <th> Tel</th>
                <th>Del</th>
                <th>Edit</th>
            </tr>
            <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            try {
                String jdbcUrl = "jdbc:mysql://localhost:3306/school";
                String username = "root";
                String password = "1234";
                Class.forName("com.mysql.cj.jdbc.Driver");

                con = DriverManager.getConnection(jdbcUrl, username, password);
                String query = "select * from Student";
                st = con.createStatement();
                rs = st.executeQuery(query);

                while (rs.next()) {
                    String id = rs.getString("id");
            %>
            <tr>
                <td><%=rs.getString("name")%></td>
                <td><%=rs.getInt("age")%></td>
                <td><%=rs.getString("course")%></td>
                <td><%=rs.getString("fee")%></td>
                <td><%=rs.getString("tel")%></td>
                <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
            </tr>
            <%
                }
            } catch (SQLException e) {
                e.printStackTrace(); // You can handle the exception more gracefully in a production environment
            } finally {
                try {
                    
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            %>
        </thead>
    </table>
</div>
            </div>
        </div>
    </body>
</html>
