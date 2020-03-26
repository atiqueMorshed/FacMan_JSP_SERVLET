<%@ page import="Database.DBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
//    if(session.getAttribute("USER") != "2" || session.getAttribute("USER") != "3") {
//        response.sendRedirect("index.jsp");
//    }
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home - FacMan</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/Bootstrap-Chat.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <script>
      function toggleclass(i) {
        document.getElementById(i).classList.add('active');
        // document.getElementById("MyElement").classList.remove('MyClass');
        // if ( document.getElementById("MyElement").classList.contains('MyClass') )
        // document.getElementById("MyElement").classList.toggle('MyClass');
      }
    </script>
</head>

<body>
    <nav class="navbar navbar-dark navbar-expand-lg fixed-top bg-dark navbar-custom">
        <div class="container"><a class="navbar-brand" href="#">FacMan</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navbarResponsive"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="FacultyProfile.jsp">Profile</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="Chat.jsp">Chat</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div style="height: 150px"></div>
    <section><div>
<div class="container py-5 px-4">
  <!-- For demo purpose-->
  <header class="text-center">
    <h1 class="display-4 text-black">Chat Now</h1>
  </header>

  <div class="row rounded-lg overflow-hidden shadow">
    <!-- Users box-->
    <div class="col-5 px-0">
      <div class="bg-white">

        <div class="bg-gray px-4 py-2 bg-light">
          <p class="h5 mb-0 py-1">Available</p>
        </div>

        <div class="messages-box">
          <div class="list-group rounded-0">
              <jsp:include page="ChatAvailableFaculty.jsp" />
          </div>
        </div>
      </div>
    </div>
    <!-- Chat Box-->
    <div class="col-7 px-0">
      <div class="px-4 py-5 chat-box bg-white">
          <jsp:include page="ChatSenderReceiver.jsp" />
      <!-- Typing area -->
      <form method="post" class="bg-light">
        <div class="input-group">
          <input type="text" placeholder="Type a message" aria-describedby="button-addon2" class="form-control rounded-0 border-0 py-4 bg-light" name="TextField">
          <div class="input-group-append">
            <button id="button-addon2" type="submit" class="btn btn-link" name="SendMessage"> <i class="fa fa-paper-plane"></i></button>
          </div>
        </div>
      </form>
<%
    if(request.getParameter("SendMessage") != null) {
        String msg = request.getParameter("TextField");
        if(msg == "") {
%>
          <div class='alert alert-danger'>
              <strong><center>Please enter your message first.</center></strong>
          </div>
<%

        } else if(msg.length() > 100) {
%>
          <div class='alert alert-danger'>
              <strong><center>Message is too long.</center></strong>
          </div>
<%
        } else {
            DBConnect dbc = new DBConnect();
            Connection con = dbc.getConnection();
            if(request.getParameter("FacultyCourses") != null) {
                int FacultyCourses = Integer.parseInt(request.getParameter("FacultyCourses"));
                int StudentCourses = (int)session.getAttribute("STUDENTCOURSES");
                PreparedStatement ps = con.prepareStatement("INSERT INTO messages(Sender, Receiver, Message) VALUES(?,?,?)");
                ps.setInt(1, StudentCourses);
                ps.setInt(2, FacultyCourses);
                ps.setString(3, msg);
                if(ps.executeUpdate()>0) {
%>
                  <script>
                      window.location.href = "Chat.jsp?FacultyCourses=<%=FacultyCourses%>";
                  </script>
<%
                } else {
%>
                  <div class='alert alert-danger'>
                      <strong><center>Error Sending Message!</center></strong>
                  </div>
<%
                }
            }
            else if(request.getParameter("StudentCourses") != null) {
                int StudentCourses = Integer.parseInt(request.getParameter("StudentCourses"));
                int FacultyCourses = (int)session.getAttribute("FACULTYCOURSES");
                PreparedStatement ps = con.prepareStatement("INSERT INTO messages(Sender, Receiver, Message) VALUES(?,?,?)");
                ps.setInt(1, FacultyCourses);
                ps.setInt(2, StudentCourses);
                ps.setString(3, msg);
                if(ps.executeUpdate()>0) {
%>
                  <script>
                      window.location.href = "Chat.jsp?StudentCourses=<%=StudentCourses%>";
                  </script>
<%
                }
                else {
 %>
                  <div class='alert alert-danger'>
                      <strong><center>Error Sending Message!</center></strong>
                  </div>
<%

                }
            }
            else if(request.getParameter("FCID") != null && session.getAttribute("FACULTYCOURSES") != null) {
                int FCID = Integer.parseInt(request.getParameter("FCID"));
                int FacultyCourses = (int)session.getAttribute("FACULTYCOURSES");
                PreparedStatement ps = con.prepareStatement("INSERT INTO messages(Sender, FCID, Message) VALUES(?,?,?)");
                ps.setInt(1, FacultyCourses);
                ps.setInt(2, FCID);
                ps.setString(3, msg);
                if(ps.executeUpdate()>0) {
%>
                  <script>
                      window.location.href = "Chat.jsp?FCID=<%=FCID%>";
                  </script>
<%
                  }
                  else {
%>
                  <div class='alert alert-danger'>
                      <strong><center>Error Sending Message!</center></strong>
                  </div>
<%
                  }
            }
            else if(request.getParameter("FCID") != null && session.getAttribute("STUDENTCOURSES") != null) {
                int FCID = Integer.parseInt(request.getParameter("FCID"));
                int StudentCourses = (int)session.getAttribute("STUDENTCOURSES");
                PreparedStatement ps = con.prepareStatement("INSERT INTO messages(Sender, FCID, Message) VALUES(?,?,?)");
                ps.setInt(1, StudentCourses);
                ps.setInt(2, FCID);
                ps.setString(3, msg);
                if(ps.executeUpdate()>0) {
%>
                  <script>
                      window.location.href = "Chat.jsp?FCID=<%=FCID%>";
                  </script>
<%
                }
                else {
%>
                  <div class='alert alert-danger'>
                      <strong><center>Error Sending Message!</center></strong>
                  </div>
<%
                }
            }
        }
    }

%>

                </div>
            </div>
        </div>
    </div>
</div>
</section>
<div class="height150"></div>
    <footer class="py-5 bg-black footerBottom">
        <div class="container">
            <p class="text-center text-white m-0 small">Copyright&nbsp;© FacMan 2020</p>
        </div>
    </footer>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
