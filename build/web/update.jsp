<%-- 
    Document   : update
    Created on : Feb 18, 2024, 10:58:58 PM
    Author     : meroo
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

if(request.getParameter("submit") != null){
    
    String id = request.getParameter("id");
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
        pst = con.prepareStatement("update Student set name=?,age=?,course=?,fee=?,tel=? where id =?");

        pst.setString(1, name);
        pst.setInt(2, age);
        pst.setString(3, course);
        pst.setString(4, fee);
        pst.setString(5, tel);
        pst.setString(6, id);
        pst.executeUpdate();

%>

<script>
    alert("Record Updated");
</script>

<%

    } catch (Exception e) {
        e.printStackTrace(); // You can handle the exception more gracefully in a production environment
%>

<script>
    alert("Error updating record. Please try again.");
</script>

<%

    } finally {
        try {
            
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

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
        <h1>Update Student Data</h1>
        <div class="row">
            
<%
try {
    Connection con;
    PreparedStatement pst;
    ResultSet rs;

    String jdbcUrl = "jdbc:mysql://localhost:3306/school";
    String username = "root";
    String password = "1234";
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    con = DriverManager.getConnection(jdbcUrl, username, password);
    String id = request.getParameter("id");
    pst = con.prepareStatement("select * from Student where id = ?");
    pst.setString(1, id);
    rs = pst.executeQuery();

    while (rs.next()) {
%>

    <br>
    <div alight="left">
        <label class="form-label">Student Name</label>
        <input type="text" class="form-control" value="<%=rs.getString("name")%>" placeholder="Student Name" name="name" id="name" required>
    </div>
    <br>
    <div alight="left">
        <label class="form-label">Student Age</label>
        <input type="number" class="form-control" value="<%=rs.getString(String.valueOf("age"))%>" placeholder="Student Age" name="age" id="age" required>
    </div>
    <br>
    <div alight="left">
        <label class="form-label">Student Course</label>
        <input type="text" class="form-control" value="<%=rs.getString("course")%>" placeholder="Student Course" name="course" id="course" required>
    </div>
    <br>
    <div alight="left">
        <label class="form-label">Student Fee</label>
        <input type="text" class="form-control" value="<%=rs.getString("fee")%>" placeholder="Student Fee" name="fee" id="fee" required>
    </div>
    <br>
    <div alight="left">
        <label class="form-label">Student Tel</label>
        <input type="text" class="form-control" value="<%=rs.getString("tel")%>" placeholder="Student Telephone Number" name="tel" id="tel" required>
    </div>
    <br>
    <% } %>
    <div alight="right">
        <input type="submit" id="" class="btn btn-info" name="submit">
        <input type="reset" id="reset" class="btn btn-warning" name="reset">
    </div>

<%
} catch (Exception e) {
    e.printStackTrace(); // You can handle the exception more gracefully in a production environment
%>

    <script>
        alert("Error loading student details. Please try again.");
    </script>

<%
} finally {
    try {
        if (con != null) con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>
</div>
        </div>
    </body>
</html>
