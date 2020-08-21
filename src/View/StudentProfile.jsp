<%@ page import="Model.EditStudent.StudentDatabaseInfoFinder" %>
<%@ page import="Model.Database.DBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
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
          <!-- <div class="row">
              <div class="col-md-12 alert-col relative">
                  <div class="alert alert-info absolue center" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button><span>Profile save with success</span></div>
              </div>
          </div> -->
          <form>
              <div class="form-row profile-row">
                  <div class="col-md-8">
                      <h1>Profile </h1>
                      <hr>
                      <div class="form-row">
                          <div class="col-sm-12 col-md-6">
                              <div class="form-group"><label>Name </label><input class="form-control" disabled type="text" name="name" value="<%=session.getAttribute("NAME")%>" ></div>
                          </div>
                          <div class="col-sm-12 col-md-6">
                              <div class="form-group"><label>DOB </label><input class="form-control" disabled type="date" name="dob" value="<%=session.getAttribute("DOB")%>" ></div>
                          </div>
                      </div>
                      <div class="form-row">
                          <div class="col-sm-12 col-md-6">
                              <div class="form-group"><label>Email </label><input class="form-control" type="email" disabled name="email" value="<%=session.getAttribute("STUDENTEMAIL")%>" ></div>
                          </div>
                          <div class="col-sm-12 col-md-6">
                              <div class="form-group"><label>Phone </label><input class="form-control" disabled type="text" name="phone" value="<%=session.getAttribute("PHONE")%>" ></div>
                          </div>
                      </div>
                      <div class="form-row">
                          <div class="col-md-12 content-right"><a class="btn btn-danger form-btn" href="EditStudentProfile.jsp">Edit</a></div>
                      </div>
                      <hr>
                      <div class="studentCoursesTaken">
                        <table class="table">
                          <thead class="thead-dark">
                            <tr>
                              <th scope="col">#</th>
                              <th scope="col">Course</th>
                              <th scope="col">Section</th>
                                <th scope="col">Day</th>
                              <th scope="col">Time</th>
                              <th scope="col">Faculty Profile/Message</th>
                            </tr>
                          </thead>
                          <tbody>
                          <%
                              if(session.getAttribute("USER") != "3") {
                                  response.sendRedirect("index.jsp");
                              }else{

                                  StudentDatabaseInfoFinder sdif = new StudentDatabaseInfoFinder();
//                                  int StudentCourses = 9;
                                  int StudentCourses = (int)session.getAttribute("STUDENTCOURSES");
                                  DBConnect dbc = new DBConnect();
                                  Connection con = dbc.getConnection();
                                  PreparedStatement ps = con.prepareStatement("SELECT FCID FROM stcourses WHERE StudentCourses=?");
                                  ps.setInt(1, StudentCourses);
                                  ResultSet rs = ps.executeQuery();
                                  int i = 1;
                                  while(rs.next()) {
                                      int FCID = rs.getInt("FCID");
                                      DBConnect dbc2 = new DBConnect();
                                      Connection con2 = dbc2.getConnection();
                                      PreparedStatement ps2 = con2.prepareStatement("SELECT fc.FacultyCourses, fc.courseID, fc.Section, fc.Day, fc.Time FROM facourses as fc WHERE FCID=?");
                                      ps2.setInt(1, FCID);
                                      ResultSet rs2 = ps2.executeQuery();
                                      rs2.next();
                                      int FacultyCourses = rs2.getInt("fc.FacultyCourses");
                                      int CourseID = rs2.getInt("fc.CourseID");
                                      int Section = rs2.getInt("fc.Section");
                                      String Day=sdif.dayFinder(rs2.getInt("fc.Day"));
                                      String Time=sdif.timeFinder(rs2.getInt("fc.Time"));
                          %>
                                <tr>
                                  <th scope="row"><%=i%></th>
                                  <td>CSE<%=CourseID%></td>
                                  <td><%=Section%></td>
                                  <td><%=Day%></td>
                                  <td><%=Time%></td>
                                    <td><a href="PublicFacultyProfile.jsp?FacultyCourses=<%=FacultyCourses%>"><img
                                            src="assets/img/message2.png" alt="" style="height: 20px; align-self: center"></a></td>
                                </tr>
                          <%
                                      i++;
                                      rs2.close();
                                      con2.close();
                                  }
                                  rs.close();
                                  con.close();
                          %>
                          </tbody>
                        </table>
                          <%
                              dbc = new DBConnect();
                              con = dbc.getConnection();
                              ps = con.prepareStatement("SELECT CourseTaken FROM student WHERE StudentCourses =?");
                              ps.setInt(1, StudentCourses);
                              rs = ps.executeQuery();
                              rs.next();
                              int CourseTaken = rs.getInt("CourseTaken");
                              if(CourseTaken < 4) {
                          %>
                          <div class="form-row">
                              <div class="col-md-12 content-right"><a class="btn btn-danger form-btn" href="AddStudentCourse.jsp">Add Course</a></div>
                          </div>
                          <%
                              } else {
                          %>
                          <div class="form-row">
                              <div class="col-md-12 content-right"><button class="btn btn-danger form-btn" disabled >Add Course</button></div>
                          </div>
                          <%
                              }
                              }
                          %>
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