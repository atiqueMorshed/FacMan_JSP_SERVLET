<%@ page import="Database.DBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Timestamp" %>
<%
  if(session.getAttribute("USER") == "2") {
    ArrayList<Integer> al = new ArrayList<Integer>();
    int FacultyCourses = (int)session.getAttribute("FACULTYCOURSES");

    //Individual Students
    DBConnect dbc = new DBConnect();
    Connection con = dbc.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM facourses WHERE FacultyCourses = ?");
    ps.setInt(1, FacultyCourses);
    ResultSet rs = ps.executeQuery();
    int i = 0;
    while(rs.next()) {
      i++;
      int FCID = rs.getInt("FCID");
      DBConnect dbc2 = new DBConnect();
      Connection con2 = dbc2.getConnection();
      PreparedStatement ps2 = con2.prepareStatement("SELECT StudentCourses FROM stcourses WHERE FCID=?");
      ps2.setInt(1, FCID);
      ResultSet rs2 = ps2.executeQuery();
      while(rs2.next()) {
        int StudentCourses = rs2.getInt("StudentCourses");
        if(!al.contains(StudentCourses)) {
          al.add(StudentCourses);
          DBConnect dbc3 = new DBConnect();
          Connection con3 = dbc3.getConnection();
          PreparedStatement ps3 = con3.prepareStatement("SELECT DISTINCT * FROM student WHERE StudentCourses=?");
          ps3.setInt(1, StudentCourses);
          ResultSet rs3 = ps3.executeQuery();
          if(rs3.next()) {
            String StudentName = rs3.getString("StudentName");
            String StudentEmail = rs3.getString("StudentEmail");
            String Phone = rs3.getString("Phone");

            ps3 = con.prepareStatement("SELECT * FROM messages WHERE (Sender=? AND Receiver = ?) OR (Sender=? AND Receiver = ?)ORDER BY MessageDate DESC");
            ps3.setInt(1, FacultyCourses);
            ps3.setInt(2, StudentCourses);
            ps3.setInt(3, StudentCourses);
            ps3.setInt(4, FacultyCourses);
            rs3 = ps3.executeQuery();
            Timestamp LastMessageDate;
%>
<a href="Chat.jsp?StudentCourses=<%=StudentCourses%>" id="<%=i%>" onclick="toggleclass(<%=i%>)" class="list-group-item list-group-item-action list-group-item-light rounded-0">
  <div class="media"><img src="https://res.cloudinary.com/mhmd/image/upload/v1564960395/avatar_usae7z.svg" alt="user" width="50" class="rounded-circle">
    <div class="media-body ml-4">
      <div class="d-flex align-items-center justify-content-between mb-1">
        <h6 class="mb-0"><%=StudentName%></h6>
        <%
        if(rs3.next()) {
        LastMessageDate = rs3.getTimestamp("MessageDate");
        %>
        <small class="small font-weight-bold"><%=LastMessageDate%></small>
        <%
          } else {
        %>
        <small class="small font-weight-bold">No Message</small>
        <%
          }
        %>
      </div>
      <p class="font-italic text-muted mb-0 text-small"><%=StudentEmail%></p>
      <p class="font-italic mb-0 text-small"><%=Phone%></p>
    </div>
  </div>
</a>
<%
          }
          rs3.close();
          con3.close();
        }
      }
      rs2.close();
      con2.close();
    }
    rs.close();
    con.close();

  //All students of courses
  DBConnect dbc4 = new DBConnect();
  Connection con4 = dbc4.getConnection();
  PreparedStatement ps4 = con4.prepareStatement("SELECT * FROM facourses WHERE FacultyCourses = ?");
  ps4.setInt(1, FacultyCourses);
  ResultSet rs4 = ps4.executeQuery();
  int j = 0;
  while(rs4.next()) {
    j++;
    int Course = rs4.getInt("CourseID");
    int Section = rs4.getInt("Section");
    int FCID = rs4.getInt("FCID");
    int TotalStudents = rs4.getInt("TotalStudents");
%>
<a href="Chat.jsp?FCID=<%=FCID%>" id="<%=j%>" onclick="toggleclass(<%=j%>)" class="list-group-item list-group-item-action list-group-item-light rounded-0">
  <div class="media"><img src="https://res.cloudinary.com/mhmd/image/upload/v1564960395/avatar_usae7z.svg" alt="user" width="50" class="rounded-circle">
    <div class="media-body ml-4">
      <div class="d-flex align-items-center justify-content-between mb-1">
        <h6 class="mb-0">CSE<%=Course%></h6>
        <small class="small font-weight-bold">Section: <%=Section%></small>
        <small class="small font-weight-bold">Group</small>
      </div>
      <p class="font-italic text-muted mb-0 text-small">Total: <%=TotalStudents%></p>
      <%--    <p class="font-italic mb-0 text-small"><%=Phone%></p>--%>
    </div>
  </div>
</a>
<%
  }
  rs4.close();
  con4.close();
}
  else if(session.getAttribute("USER") == "3") {
    ArrayList<Integer> al = new ArrayList<Integer>();
    int StudentCourses = (int)session.getAttribute("STUDENTCOURSES");

  DBConnect dbc = new DBConnect();
  Connection con = dbc.getConnection();
  PreparedStatement ps = con.prepareStatement("SELECT * FROM stcourses WHERE StudentCourses = ?");
  ps.setInt(1, StudentCourses);
  ResultSet rs = ps.executeQuery();
  int i = 0;
  while(rs.next()) {
    i++;
    int FCID = rs.getInt("FCID");
    PreparedStatement ps2 = con.prepareStatement("SELECT * FROM facourses WHERE FCID=?");
    ps2.setInt(1, FCID);
    ResultSet rs2 = ps2.executeQuery();
    if(rs2.next()) {
      int FacultyCourses = rs2.getInt("FacultyCourses");
      if(!al.contains(FacultyCourses)) {
        al.add(FacultyCourses);
        ps2 = con.prepareStatement("SELECT DISTINCT * FROM faculty WHERE FacultyCourses=?");
        ps2.setInt(1, FacultyCourses);
        rs2 = ps2.executeQuery();
        if(rs2.next()) {
          String FacultyName = rs2.getString("FacultyName");
          String FacultyInitial = rs2.getString("FacultyInitial");
          String FacultyEmail = rs2.getString("FacultyEmail");

          ps2 = con.prepareStatement("SELECT * FROM messages WHERE (Sender=? AND Receiver = ?) OR (Sender=? AND Receiver = ?)ORDER BY MessageDate DESC");
          ps2.setInt(1, FacultyCourses);
          ps2.setInt(2, StudentCourses);
          ps2.setInt(3, StudentCourses);
          ps2.setInt(4, FacultyCourses);
          rs2 = ps2.executeQuery();
          Timestamp LastMessageDate;

%>
<a href="Chat.jsp?FacultyCourses=<%=FacultyCourses%>" id="<%=i%>" onclick="toggleclass(<%=i%>)" class="list-group-item list-group-item-action list-group-item-light rounded-0">
  <div class="media"><img src="https://res.cloudinary.com/mhmd/image/upload/v1564960395/avatar_usae7z.svg" alt="user" width="50" class="rounded-circle">
    <div class="media-body ml-4">
      <div class="d-flex align-items-center justify-content-between mb-1">
        <h6 class="mb-0"><%=FacultyName%></h6>
        <%
          if(rs2.next()) {
            LastMessageDate = rs2.getTimestamp("MessageDate");
        %>
        <small class="small font-weight-bold"><%=LastMessageDate%></small>
        <%
          } else {
        %>
        <small class="small font-weight-bold">No Message</small>
        <%
          }
        %>
      </div>
      <p class="font-italic text-muted mb-0 text-small"><%=FacultyInitial%></p>
      <p class="font-italic mb-0 text-small"><%=FacultyEmail%></p>
    </div>
  </div>
</a>
<%
          }
        }
      }
    rs2.close();
    }
  rs.close();
  con.close();

  //All courses
  DBConnect dbc4 = new DBConnect();
  Connection con4 = dbc4.getConnection();
  PreparedStatement ps4 = con4.prepareStatement("SELECT * FROM stcourses WHERE StudentCourses = ?");
  ps4.setInt(1, StudentCourses);
  ResultSet rs4 = ps4.executeQuery();
  while(rs4.next()) {
    int FCID = rs4.getInt("FCID");
    PreparedStatement ps5 = con4.prepareStatement("SELECT * FROM facourses WHERE FCID = ?");
    ps5.setInt(1,FCID);
    ResultSet rs5 = ps5.executeQuery();
    rs5.next();
    int j = 0;
    j++;
    int Course = rs5.getInt("CourseID");
    int Section = rs5.getInt("Section");
    int TotalStudents = rs5.getInt("TotalStudents");
%>
<a href="Chat.jsp?FCID=<%=FCID%>" id="<%=j%>" onclick="toggleclass(<%=j%>)" class="list-group-item list-group-item-action list-group-item-light rounded-0">
  <div class="media"><img src="https://res.cloudinary.com/mhmd/image/upload/v1564960395/avatar_usae7z.svg" alt="user" width="50" class="rounded-circle">
    <div class="media-body ml-4">
      <div class="d-flex align-items-center justify-content-between mb-1">
        <h6 class="mb-0">CSE<%=Course%></h6>
        <small class="small font-weight-bold">Section: <%=Section%></small>
        <small class="small font-weight-bold">Group</small>
      </div>
      <p class="font-italic text-muted mb-0 text-small">Total: <%=TotalStudents%></p>
      <%--    <p class="font-italic mb-0 text-small"><%=Phone%></p>--%>
    </div>
  </div>
</a>
<%
      rs5.close();
    }
%>
<%
    rs4.close();
    con4.close();
  }

%>