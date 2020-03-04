<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Edit Faculty Profile</title>
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
                      <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#">Login</a>
                          <div class="dropdown-menu" role="menu"><a class="dropdown-item" role="presentation" href="facultyLogin.jsp">Faculty</a><a class="dropdown-item" role="presentation" href="studentLogin.jsp">Student</a><a class="dropdown-item" role="presentation" href="adminLogin.jsp">Admin</a></div>
                      </li>
                  </ul>
              </div>
          </div>
      </nav>

        <div class="container profile profile-view facultyProfileBlock" id="profile">
            <div class="row">
                <div class="col-md-12 alert-col relative">
                    <div class="alert alert-info absolue center" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button><span>Profile save with success</span></div>
                </div>
            </div>
            <form>
                <div class="form-row profile-row">
                    <div class="col-md-8">
                        <div class="height150"></div>
                        <div class="addFacultyCourseForm">
                          <h1>Add Courses </h1>
                          <hr>
                          <div class="form-group"><label>Email </label><input class="form-control" type="email" required name="email" value="studentx@gmail.com"></div>
                          <div class="form-row">
                              <div class="col-sm-12 col-md-6">
                                  <div class="form-group"><label>CourseID </label><input class="form-control" type="text" name="courseID"></div>
                              </div>
                              <div class="col-sm-12 col-md-6">
                                  <div class="form-group"><label>Section </label><input class="form-control" type="text" name="section"></div>
                              </div>
                          </div>
                          <!-- <div class="form-row">
                              <div class="col-sm-12 col-md-6">
                                  <div class="form-group"><label>New Password </label><input class="form-control" type="password" name="password"></div>
                              </div>
                              <div class="col-sm-12 col-md-6">
                                  <div class="form-group"><label>Confirm Password </label><input class="form-control" type="text" name="confirmPassword"></div>
                              </div>
                          </div> -->
                          <div class="form-row">
                              <div class="col-md-12 content-right"><button class="btn btn-danger form-btn" type="submit" name="addStudentCourseButton">Add</button></div>
                          </div>
                          <!-- <hr> -->
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
    <!-- <script src="assets/js/Profile-Edit-Form.js"></script> -->
</body>

</html>
