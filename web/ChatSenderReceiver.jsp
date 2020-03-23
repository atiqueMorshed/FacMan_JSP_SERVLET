<%@ page import="Database.DBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
  if(request.getParameter("FacultyCourses") != null) {
    int StudentCourses = (int)session.getAttribute("STUDENTCOURSES");
    int FacultyCourses = Integer.parseInt(request.getParameter("FacultyCourses"));
    DBConnect dbc = new DBConnect();
    Connection con = dbc.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM messages WHERE (Sender=? AND Receiver=?) OR (Sender=? AND Receiver=?) ORDER BY MessageDate");
    ps.setInt(1, FacultyCourses);
    ps.setInt(2, StudentCourses);
    ps.setInt(3, StudentCourses);
    ps.setInt(4, FacultyCourses);
    ResultSet rs = ps.executeQuery();
    int $i = 0;
    while(rs.next()) {
      int Sender = rs.getInt("Sender");
      String msg = rs.getString("Message");
      String date = rs.getString("MessageDate");
      if(FacultyCourses == Sender) {
%>
      <div class="media w-50 mb-3"><img src="https://res.cloudinary.com/mhmd/image/upload/v1564960395/avatar_usae7z.svg" alt="user" width="50" class="rounded-circle">
        <div class="media-body ml-3">
          <div class="bg-light rounded py-2 px-3 mb-2">
            <p class="text-small mb-0 text-muted"><%=msg%></p>
          </div>
          <p class="small text-muted"><%=date%></p>
        </div>
      </div>
<%
      }
      else {
%>
      <!-- Receiver Message-->
      <div class="media w-50 ml-auto mb-3">
        <div class="media-body">
          <div class="bg-primary rounded py-2 px-3 mb-2">
            <p class="text-small mb-0 text-white"><%=msg%></p>
          </div>
          <p class="small text-muted"><%=date%></p>
        </div>
      </div>
<%
      }
    }
    rs.close();
    con.close();
  }
  else if(request.getParameter("StudentCourses") != null) {
    int FacultyCourses = (int)session.getAttribute("FACULTYCOURSES");
    int StudentCourses = Integer.parseInt(request.getParameter("StudentCourses"));
    DBConnect dbc = new DBConnect();
    Connection con = dbc.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM messages WHERE (Sender=? AND Receiver=?) OR (Sender=? AND Receiver=?) ORDER BY MessageDate");
    ps.setInt(1, StudentCourses);
    ps.setInt(2, FacultyCourses);
    ps.setInt(3, FacultyCourses);
    ps.setInt(4, StudentCourses);
    ResultSet rs = ps.executeQuery();
    int $i = 0;
    while(rs.next()) {
      int Sender = rs.getInt("Sender");
      String msg = rs.getString("Message");
      String date = rs.getString("MessageDate");
      if(StudentCourses == Sender) {
%>
        <!-- Sender Message-->
        <div class="media w-50 mb-3"><img src="https://res.cloudinary.com/mhmd/image/upload/v1564960395/avatar_usae7z.svg" alt="user" width="50" class="rounded-circle">
          <div class="media-body ml-3">
            <div class="bg-light rounded py-2 px-3 mb-2">
              <p class="text-small mb-0 text-muted"><%=msg%></p>
            </div>
            <p class="small text-muted"><%=date%></p>
          </div>
        </div>
<%
      } else {
%>
          <div class="media w-50 ml-auto mb-3">
            <div class="media-body">
              <div class="bg-primary rounded py-2 px-3 mb-2">
                <p class="text-small mb-0 text-white"><%=msg%></p>
              </div>
              <p class="small text-muted"><%=date%></p>
            </div>
          </div>
<%
      }
    }
    rs.close();
    con.close();
  }
%>
