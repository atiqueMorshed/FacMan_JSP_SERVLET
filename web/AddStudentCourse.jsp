<%@ page import="Database.DBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: ArrowX17
  Date: 3/9/2020
  Time: 2:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Student Profile</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=ABeeZee">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli">
    <link rel="stylesheet" href="assets/css/Bootstrap-Chat.css">
    <link rel="stylesheet" href="assets/css/Community-ChatComments.css">
    <link rel="stylesheet" href="assets/css/Data-Table-with-Search-Sort-Filter-and-Zoom-using-TableSorter.css">
    <link rel="stylesheet" href="assets/css/Google-Style-Login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.2/css/theme.bootstrap_4.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="assets/css/LinkedIn-like-Profile-Box.css">
    <link rel="stylesheet" href="assets/css/Profile-Edit-Form-1.css">
    <link rel="stylesheet" href="assets/css/Profile-Edit-Form.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>
<%
    if(session.getAttribute("USER") != "3") {
        response.sendRedirect("index.jsp");
    }
%>
<div class="containerMinHeight">
    <div class="mainHeight">
        <nav class="navbar navbar-dark navbar-expand-lg fixed-top bg-dark navbar-custom">
            <div class="container"><a class="navbar-brand" href="index.jsp">FacMan</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navbarResponsive"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item" role="presentation"></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="index.jsp">Home</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="StudentProfile.jsp">Profile</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="logout.jsp">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="height150"></div>
        <div class="container profile profile-view facultyProfileBlock" id="profile">
            <form action="AddStudentCourse2.jsp" method="post">
                <div class="form-row profile-row">
                    <div class="col-md-8">
                        <h1>Add Course</h1>
                        <hr>
                        <div class="form-row">
                            <div class="col-sm-12 col-md-6">
                                <div class="input-group-append">
                                    <select class="browser-default custom-select" name="CourseIDDropdown">
                                        <option selected value="0">Course</option>
                                        <%
                                            DBConnect dbc = new DBConnect();
                                            Connection con = dbc.getConnection();

                                            PreparedStatement ps = con.prepareStatement("SELECT DISTINCT CourseID from facourses");
                                            ResultSet rs = ps.executeQuery();
                                            while(rs.next()) {
                                                int CourseID = rs.getInt("CourseID");
                                        %>
                                        <option value="<%=CourseID%>">CSE<%=CourseID%></option>
                                        <%
                                            }
                                            rs.close();
                                            con.close();
                                        %>
                                    </select>
                                    <button class="btn btn-outline-secondary" type="submit">Search</button>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div class="input-group-append">
                                    <select class="browser-default custom-select" disabled>
                                        <option selected>Section</option>
                                        <!--  -->

                                        <option value="1">Name</option>
                                    </select>

                                    <button class="btn btn-outline-secondary" type="button" disabled >Search</button>
                                </div>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="col-md-12 content-right">
                                <p class="text-center text-danger" name="error"> ${ErrorMsg} </p>
                            </div>
                            <div class="col-md-12 content-right">
                                <button type="submit" disabled class="btn btn-danger form-btn">Add Course</button>
                                <!-- <button type="submit" disabled name="AddStudentCourse" value="Add" class="btn btn-danger form-btn">Add Course</button> -->
                            </div>
                        </div>
                        <!-- <hr> -->

                    </div>
                </div>
            </form>
        </div>
        <!-- <div class="height150"></div> -->
    </div>
</div>
<footer class="bg-black footerBottom">
    <div class="container">
        <p class="text-center text-white m-0 small footerContent">Copyright&nbsp;© FacMan 2020</p>
    </div>
</footer>


<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/Data-Table-with-Search-Sort-Filter-and-Zoom-using-TableSorter.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.2/js/jquery.tablesorter.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.2/js/widgets/widget-filter.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.2/js/widgets/widget-storage.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<!-- <script src="assets/js/Profile-Edit-Form.js"></script> -->
</body>
</html>