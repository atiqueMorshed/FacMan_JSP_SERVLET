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
    DBConnect dbc = new DBConnect();
    Connection con = dbc.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM facourses WHERE FacultyCourses = ?");
    ps.setInt(1, FacultyCourses);
    ResultSet rs = ps.executeQuery();
    int $i = 0;
    while(rs.next()) {
      $i++;
      int FCID = rs.getInt("FCID");
      PreparedStatement ps2 = con.prepareStatement("SELECT * FROM stcourses WHERE FCID=?");
      ps2.setInt(1, FCID);
      ResultSet rs2 = ps2.executeQuery();
      if(rs2.next()) {
        int StudentCourses = rs2.getInt("StudentCourses");
        if(!al.contains(StudentCourses)) {
          al.add(StudentCourses);
          ps2 = con.prepareStatement("SELECT DISTINCT * FROM student WHERE StudentCourses=?");
          ps2.setInt(1, StudentCourses);
          rs2 = ps2.executeQuery();
          if(rs2.next()) {
            String StudentName = rs2.getString("StudentName");
            String StudentEmail = rs2.getString("StudentEmail");
            String Phone = rs2.getString("Phone");

            ps2 = con.prepareStatement("SELECT * FROM messages WHERE (Sender=? AND Receiver = ?) OR (Sender=? AND Receiver = ?)ORDER BY MessageDate DESC");
            ps2.setInt(1, FacultyCourses);
            ps2.setInt(2, StudentCourses);
            ps2.setInt(3, StudentCourses);
            ps2.setInt(4, FacultyCourses);
            rs2 = ps2.executeQuery();
            Timestamp LastMessageDate;
            if(rs2.next()) {
              LastMessageDate = rs2.getTimestamp("MessageDate");
%>
<a href="Chat.jsp?StudentCourses=<%=StudentCourses%>" id="<%=$i%>" onclick="toggleclass(<%=$i%>)" class="list-group-item list-group-item-action list-group-item-light rounded-0">
  <div class="media"><img src="https://res.cloudinary.com/mhmd/image/upload/v1564960395/avatar_usae7z.svg" alt="user" width="50" class="rounded-circle">
    <div class="media-body ml-4">
      <div class="d-flex align-items-center justify-content-between mb-1">
        <h6 class="mb-0"><%=StudentName%></h6><small class="small font-weight-bold"><%=LastMessageDate%></small>
      </div>
      <p class="font-italic text-muted mb-0 text-small"><%=StudentEmail%></p>
      <p class="font-italic mb-0 text-small"><%=Phone%></p>
    </div>
  </div>
</a>
<%          }
          }
        }
      }
      rs2.close();
    }
    rs.close();
    con.close();
  }
  else if(session.getAttribute("USER") == "3") {
    ArrayList<Integer> al = new ArrayList<Integer>();
    int StudentCourses = (int)session.getAttribute("STUDENTCOURSES");

  DBConnect dbc = new DBConnect();
  Connection con = dbc.getConnection();
  PreparedStatement ps = con.prepareStatement("SELECT * FROM stcourses WHERE StudentCourses = ?");
  ps.setInt(1, StudentCourses);
  ResultSet rs = ps.executeQuery();
  int $i = 0;
  while(rs.next()) {
    $i++;
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
          if(rs2.next()) {
            LastMessageDate = rs2.getTimestamp("MessageDate");
%>
<a href="Chat.jsp?FacultyCourses=<%=FacultyCourses%>" id="<%=$i%>" onclick="toggleclass(<%=$i%>)" class="list-group-item list-group-item-action list-group-item-light rounded-0">
  <div class="media"><img src="https://res.cloudinary.com/mhmd/image/upload/v1564960395/avatar_usae7z.svg" alt="user" width="50" class="rounded-circle">
    <div class="media-body ml-4">
      <div class="d-flex align-items-center justify-content-between mb-1">
        <h6 class="mb-0"><%=FacultyName%></h6><small class="small font-weight-bold"><%=LastMessageDate%></small>
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
      }
    rs2.close();
    }
  rs.close();
  con.close();
  }
%>
