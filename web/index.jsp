<%@ page import="Database.DBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="static javax.swing.UIManager.getInt" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="EditFaculty.FacultyDatabaseInfoFinder" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home - FacMan</title>
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
<%--                      <li class="nav-item" role="presentation"><a class="nav-link" href="FacultyLogin.jsp">Faculty</a></li>--%>
<%--                      <li class="nav-item" role="presentation"><a class="nav-link" href="StudentLogin.jsp">Student</a></li>--%>
<%--                      <li class="nav-item" role="presentation"><a class="nav-link" href="AdminLogin.jsp">Admin</a></li>--%>


                      <li class="nav-item dropdown">
                          <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#">Login</a>
                          <div class="dropdown-menu" role="menu">
                              <a class="dropdown-item" role="presentation" href="FacultyLogin.jsp">Faculty</a>
                              <a class="dropdown-item" role="presentation" href="StudentLogin.jsp">Student</a>
                              <a class="dropdown-item" role="presentation" href="AdminLogin.jsp">Admin</a>
                          </div>
                      </li>
                      <%
                          }
                      %>

                      <%
                          if(session.getAttribute("USER") == "1") {
                      %>
<%--                      <li class="nav-item" role="presentation"><a class="nav-link" href="AddFaculty.jsp">Faculty</a></li>--%>
<%--                      <li class="nav-item" role="presentation"><a class="nav-link" href="AddStudent.jsp">Student</a></li>--%>
<%--                      <li class="nav-item" role="presentation"><a class="nav-link" href="logout.jsp">Logout</a></li>--%>

                      <li class="nav-item dropdown">
                          <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#">Register</a>
                          <div class="dropdown-menu" role="menu">
                              <a class="dropdown-item" role="presentation" href="AddFaculty.jsp">Faculty</a>
                              <a class="dropdown-item" role="presentation" href="AddStudent.jsp">Student</a>
                          </div>
                      </li>
                      <li class="nav-item" role="presentation"><a class="nav-link" href="logout.jsp">Logout</a></li>

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
      <header class="masthead text-center text-white">
          <div class="masthead-content">
              <div class="container">
                  <h1 class="masthead-heading mb-0">Faculty Management</h1>
              </div>
          </div>
          <div class="bg-circle-1 bg-circle"></div>
          <div class="bg-circle-2 bg-circle"></div>
          <div class="bg-circle-3 bg-circle"></div>
          <div class="bg-circle-4 bg-circle"></div>
      </header>
      <div class="height150"></div>
      <div class="TableWithSearch">
          <form action="" method="get">
              <div class="input-group" style="margin-bottom: 20px">
                  <input type="text" class="form-control" placeholder="Search..." aria-label="Recipient's username" aria-describedby="basic-addon2" name="SearchField">
<%--                  <div class="input-group-append">--%>
<%--                      <select class="browser-default custom-select" name="SearchFilter">--%>
<%--                          <option selected value="0">Filter</option>--%>
<%--                          <option value="1">Name</option>--%>
<%--                          <option value="2">Course</option>--%>
<%--                      </select>--%>
<%--                      <button class="btn btn-outline-secondary" type="submit" name="SearchButton">Search</button>--%>
<%--                  </div>--%>
              </div>
          </form>
        <div class="FacultyTableDatabase">
          <table class="table">
            <thead class="thead-dark">
              <tr>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Initial</th>
                <th scope="col">Course</th>
                <th scope="col">Section</th>
                  <th scope="col">Day</th>
                  <th scope="col">Time</th>
<%--                  <th scope="col">Students</th>--%>
<%--                  <th scope="col">Message</th>--%>
              </tr>
            </thead>
            <tbody>
            <%
                String asearchYes = request.getParameter("SearchField");
                String searchYes = asearchYes;
                if(searchYes!= null && asearchYes.contains("CSE"))
                    searchYes = asearchYes.replaceAll("CSE","");
                if(searchYes!= null && asearchYes.contains("cse"))
                    searchYes = asearchYes.replaceAll("cse","");



//                String afilter = request.getParameter("SearchFilter");
//                int filter = getInt("afilter");
                DBConnect dbc = new DBConnect();
                Connection con = dbc.getConnection();
                PreparedStatement ps;
//                try {
                    if(searchYes == null) {
                        ps = con.prepareStatement("SELECT f.FacultyName, f.FacultyEmail, f.FacultyInitial, f.FacultyCourses, c.FacultyCourses, c.CourseID, c.Section, c.Day, c.Time, c.TotalStudents, c.ActiveStatus, c.FCID FROM faculty as f RIGHT JOIN facourses as c ON f.FacultyCourses = c.FacultyCourses ORDER BY c.CourseID");
//                        ps = con.prepareStatement("SELECT f.FacultyName, f.FacultyEmail, f.FacultyInitial, f.FacultyCourses, c.FacultyCourses, c.CourseID, c.Section, c.Day, c.Time, c.TotalStudents, c.FCID FROM faculty as f RIGHT JOIN facourses as c ON f.FacultyCourses = c.FacultyCourses ORDER BY c.CourseID");
//                        ps = con.prepareStatement("SELECT * FROM faculty, facourses");
//                        ps = con.prepareStatement("SELECT faculty.FacultyName, faculty.FacultyEmail, faculty.FacultyInitial, faculty.FacultyCourses, facourses.FacultyCourses, facourses.CourseID, facourses.Section, facourses.Day, facourses.Time, facourses.TotalStudents, facourses.FCID\n" +
//                                "FROM faculty \n" +
//                                "FULL JOIN facourses\n" +
//                                "ON faculty.FacultyCourses = facourses.FacultyCourses\n" +
//                                "ORDER BY facourses.CourseID");
                    }
//                    else if(filter == 1 && searchYes!= null) {
//                        ps = con.prepareStatement("SELECT f.FacultyName, f.FacultyEmail, f.FacultyInitial, f.FacultyCourses, c.FacultyCourses, c.CourseID, c.Section, c.Day, c.Time, c.TotalStudents, c.ActiveStatus, c.FCID FROM faculty as f RIGHT JOIN facourses as c ON f.FacultyCourses = c.FacultyCourses WHERE f.FacultyName LIKE '%"+searchYes+"%' ORDER BY c.CourseID");
////                        ps = con.prepareStatement("SELECT * FROM facourses WHERE FacultyName LIKE '%"+searchYes+"%'");
////                        ps = con.prepareStatement("SELECT faculty.FacultyName, faculty.FacultyEmail, faculty.FacultyInitial, faculty.FacultyCourses, facourses.FacultyCourses, facourses.CourseID, facourses.Section, facourses.Day, facourses.Time, facourses.TotalStudents, facourses.FCID\n" +
////                                "FROM faculty \n" +
////                                "FULL JOIN facourses\n" +
////                                "ON faculty.FacultyCourses = facourses.FacultyCourses\n" +
////                                "WHERE FacultyName LIKE '%\"+searchYes+\"%'\n" +
////                                "ORDER BY facourses.CourseID");
//                    }
                    else {
                        ps = con.prepareStatement("SELECT f.FacultyName, f.FacultyEmail, f.FacultyInitial, f.FacultyCourses, c.FacultyCourses, c.CourseID, c.Section, c.Day, c.Time, c.TotalStudents, c.ActiveStatus, c.FCID FROM faculty as f RIGHT JOIN facourses as c ON f.FacultyCourses = c.FacultyCourses WHERE c.CourseID LIKE '%"+searchYes+"%' OR f.FacultyName LIKE '%"+searchYes+"%' OR f.FacultyInitial LIKE '%"+searchYes+"%' ORDER BY c.CourseID");

//                        ps = con.prepareStatement("SELECT * FROM facourses WHERE CourseID LIKE '%"+searchYes+"%'");
//                        ps = con.prepareStatement("SELECT faculty.FacultyName, faculty.FacultyEmail, faculty.FacultyInitial, faculty.FacultyCourses, facourses.FacultyCourses, facourses.CourseID, facourses.Section, facourses.Day, facourses.Time, facourses.TotalStudents, facourses.FCID\n" +
//                                "FROM faculty \n" +
//                                "FULL JOIN facourses\n" +
//                                "ON faculty.FacultyCourses = facourses.FacultyCourses\n" +
//                                "WHERE CourseID LIKE '%\"+searchYes+\"%'\n" +
//                                "ORDER BY facourses.CourseID");
                    }
//
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()) {
                        FacultyDatabaseInfoFinder fdif = new FacultyDatabaseInfoFinder();
                        String day=fdif.dayFinder(rs.getInt("c.Day"));
                        String time=fdif.timeFinder(rs.getInt("c.Time"));
                        String activeStatus = fdif.ActiveStatusFinder(rs.getInt("c.ActiveStatus"));
                        int FacultyCourses = rs.getInt("f.FacultyCourses");

                    %>
                    <tr>
                        <th><%=rs.getString("f.FacultyName")%></th>
                        <th><a href="PublicFacultyProfile.jsp?FacultyCourses=<%=FacultyCourses%>"><%=rs.getString("f.FacultyEmail")%></a></th>
                        <th><%=rs.getString("f.FacultyInitial")%></th>
                        <td>CSE<%=rs.getInt("c.CourseID")%></td>
                        <td><%=rs.getInt("c.Section")%></td>
                        <td><%=day%></td>
                        <td><%=time%></td>
<%--                        <td><%=rs.getInt("TotalStudents")%></td>--%>
        <%--                <td><%=activeStatus%></td>--%>
<%--                        <%--%>
<%--                            if(rs.getInt("ActiveStatus")==1){--%>
<%--                        %>--%>
<%--                        <td><a href="FacultyProfileDatabaseActiveStatus.jsp?FCID=<%=FCID%>"><img src="assets/img/on.png" height="20px"></a></td>--%>

<%--                        <%--%>
<%--                        }--%>
<%--                        %>--%>

                    </tr>

                    <%
                            }
                            rs.close();
                            con.close();
//                        } catch (Exception e) {
//                            e.printStackTrace();
//                        }

                    %>
<%--              <tr>--%>
<%--                <th scope="row">1</th>--%>
<%--                <td>Mark</td>--%>
<%--                <td><a href="FacultyProfile.jsp">mark@bracu.ac.bd</a></td>--%>
<%--                <td>MRK</td>--%>
<%--                <td>CSE110</td>--%>
<%--                <td>1</td>--%>
<%--              </tr>--%>
<%--              <tr>--%>
<%--                <th scope="row">2</th>--%>
<%--                <td>Jacob</td>--%>
<%--                <td>jacob@bracu.ac.bd</td>--%>
<%--                <td>JKB</td>--%>
<%--                <td>CSE220</td>--%>
<%--                <td>3</td>--%>
<%--              </tr>--%>
<%--              <tr>--%>
<%--                <th scope="row">3</th>--%>
<%--                <td>Larry</td>--%>
<%--                <td>larry@bracu.ac.bd</td>--%>
<%--                <td>LRY</td>--%>
<%--                <td>CSE310</td>--%>
<%--                <td>1</td>--%>
<%--              </tr>--%>
            </tbody>
          </table>
        </div>
        <div class="height150"></div>
      </div>
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
    <script src="assets/js/Profile-Edit-Form.js"></script>
</body>

</html>
