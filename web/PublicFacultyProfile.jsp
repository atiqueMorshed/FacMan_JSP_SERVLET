<%@ page import="Database.DBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="EditFaculty.FacultyDatabaseInfoFinder" %>
<%@ page import="static java.lang.Integer.parseInt" %>
<%--
  Created by IntelliJ IDEA.
  User: ArrowX17
  Date: 3/8/2020
  Time: 7:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Faculty Profile</title>
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

<div class="containerMinHeight">
    <div class="mainHeight">
        <nav class="navbar navbar-dark navbar-expand-lg fixed-top bg-dark navbar-custom">
            <div class="container"><a class="navbar-brand" href="index.jsp">FacMan</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navbarResponsive"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item" role="presentation"></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="index.jsp">Home</a></li>
                        <%
                            if(!(session.getAttribute("USER") == "1" || session.getAttribute("USER") == "2" || session.getAttribute("USER") == "3" )) {
                        %>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="FacultyLogin.jsp">Faculty</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="StudentLogin.jsp">Student</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="AdminLogin.jsp">Admin</a></li>


                        <%--                      <li class="nav-item dropdown">--%>
                        <%--                          <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#">Login</a>--%>
                        <%--                          <div class="dropdown-menu" role="menu">--%>
                        <%--                              <a class="dropdown-item" role="presentation" href="FacultyLogin.jsp">Faculty</a>--%>
                        <%--                              <a class="dropdown-item" role="presentation" href="StudentLogin.jsp">Student</a>--%>
                        <%--                              <a class="dropdown-item" role="presentation" href="AdminLogin.jsp">Admin</a>--%>
                        <%--                          </div>--%>
                        <%--                      </li>--%>
                        <%
                            }
                        %>

                        <%
                            if(session.getAttribute("USER") == "1") {
                        %>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="AddFaculty.jsp">Faculty</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="AddStudent.jsp">Student</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="logout.jsp">Logout</a></li>

                        <%--                      <li class="nav-item dropdown">--%>
                        <%--                          <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#">Register</a>--%>
                        <%--                          <div class="dropdown-menu" role="menu">--%>
                        <%--                              <a class="dropdown-item" role="presentation" href="AddFaculty.jsp">Faculty</a>--%>
                        <%--                              <a class="dropdown-item" role="presentation" href="AddStudent.jsp">Student</a>--%>
                        <%--                          </div>--%>
                        <%--                        <li class="nav-item" role="presentation"><a class="nav-link" href="logout.jsp">Logout</a></li>--%>
                        <%--                      </li>--%>

                        <%
                            }
                        %>

                        <%
                            if(session.getAttribute("USER") == "2") {
                        %>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="FacultyProfile.jsp">Profile</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="logout.jsp">Logout</a></li>
                        <%
                            }
                        %>

                        <%
                            if(session.getAttribute("USER") == "3") {
                        %>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="StudentProfile.jsp">Profile</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="logout.jsp">Logout</a></li>
                        <%
                            }
                        %>

                    </ul>
                </div>
            </div>
        </nav>
        <div class="height150"></div>
        <div class="container profile profile-view facultyProfileBlock" id="profile">
            <%
                int facultyCourses = Integer.parseInt(request.getParameter("FacultyCourses"));
                DBConnect dbc = new DBConnect();
                Connection con = dbc.getConnection();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM faculty WHERE FacultyCourses=?");
                ps.setInt(1, facultyCourses);
                ResultSet rs = ps.executeQuery();
                String name = "Not Set";
                String initial = "Not Set";
                String email = "Not Set";
                if(rs.next()) {
                     name = rs.getString("FacultyName");
                     initial = rs.getString("FacultyInitial");
                     email = rs.getString("FacultyEmail");
                }
                rs.close();
                con.close();
            %>
            <form>
                <div class="form-row profile-row">
                    <div class="col-md-10">

                        <%
                            if(session.getAttribute("USER") == "3") {
                        %>
                        <h2>Message Now: <a href="Chat.jsp?StudentCourses=<%=session.getAttribute("STUDENTCOURSES")%>"><img
                                src="assets/img/message2.png" alt="" style="height: 30px; align-self: center"></a></h2>
                        <%
                            }
                        %>
                        <hr>
                        <h1>Profile </h1>
                        <hr>
                        <div class="form-row">
                            <div class="col-sm-12 col-md-6">
                                <div class="form-group"><label>Name </label><input class="form-control" disabled type="text" name="name" value="<%= name %>"></div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div class="form-group"><label>Initial </label><input class="form-control" disabled type="text" name="initial" value="<%= initial %>"></div>
                            </div>
                        </div>
                        <div class="form-group"><label>Email </label><input class="form-control" type="email" disabled autocomplete="off" required="" name="email" value="<%= email %>"></div>
                        <hr>
                        <div class="FacultyTableDatabase">
                            <table class="table FacultyProfileTable">
                                <thead class="thead-dark">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Course</th>
                                    <th scope="col">Section</th>
                                    <th scope="col">Day</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Students</th>
                                    <th scope="col">Active</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    FacultyDatabaseInfoFinder fdif = new FacultyDatabaseInfoFinder();
                                    dbc = new DBConnect();
                                    con = dbc.getConnection();
                                    ps = con.prepareStatement("SELECT * FROM facourses WHERE FacultyCourses=?");
                                    ps.setInt(1, facultyCourses);
                                    rs = ps.executeQuery();
                                    int i = 1;
                                    while(rs.next()) {
                                        String day=fdif.dayFinder(rs.getInt("Day"));
                                        String time=fdif.timeFinder(rs.getInt("Time"));
                                        String activeStatus = fdif.ActiveStatusFinder(rs.getInt("ActiveStatus"));
                                        int FCID = rs.getInt("FCID");
                                %>
                                <tr>
                                    <th><%=i%></th>
                                    <td>CSE<%=rs.getInt("CourseID")%></td>
                                    <td><%=rs.getInt("Section")%></td>
                                    <td><%=day%></td>
                                    <td><%=time%></td>
                                    <td><%=rs.getInt("TotalStudents")%></td>
                                    <td><%=activeStatus%></td>
                                </tr>

                                    <%
                                        i++;
                                        }
                                        rs.close();
                                        con.close();
                                    %>
                                <%--                            <tr>--%>
                                <%--                              <th scope="row">2</th>--%>
                                <%--                              <td>CSE110</td>--%>
                                <%--                              <td>2</td>--%>
                                <%--                              <td>SUN-TUE [10.30AM-12.00PM]</td>--%>
                                <%--                              <td><div class="col-md-12 content-right"><button class="btn btn-danger form-btn" type="submit" name="messageAllCourse2">Send</button></div></td>--%>
                                <%--                              <td><div class="col-md-12 content-right"><button class="btn btn-danger form-btn" type="submit" name="profileCourseDeleteButton2">Delete</button></div></td>--%>
                                <%--                            </tr>--%>
                                <%--                            <tr>--%>
                                <%--                              <th scope="row">3</th>--%>
                                <%--                              <td>CSE111</td>--%>
                                <%--                              <td>1</td>--%>
                                <%--                              <td>MON-WED [10.30AM-12.00PM]</td>--%>
                                <%--                              <td><div class="col-md-12 content-right"><button class="btn btn-danger form-btn" type="submit" name="messageAllCourse3">Send</button></div></td>--%>
                                <%--                              <td><div class="col-md-12 content-right"><button class="btn btn-danger form-btn" type="submit" name="profileCourseDeleteButton3">Delete</button></div></td>--%>
                                <%--                            </tr>--%>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </form>
        </div>
        <div class="height150"></div>
    </div>
</div>
<footer class="bg-black footerBottom">
    <div class="container">
        <p class="text-center text-white m-0 small footerContent">Copyright&nbsp;© FacMan 2020</p>
    </div>
</footer>


<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.validate.min.js"></script>
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
