<%@ page import="EditFaculty.FacultyDatabaseInfoFinder" %><%--
  Created by IntelliJ IDEA.
  User: ArrowX17
  Date: 3/5/2020
  Time: 8:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    if(request.getParameter("FCID")==null || session.getAttribute("FACULTYEMAIL")==null || session.getAttribute("USER") != "2") {
        response.sendRedirect("index.jsp");
    } else {
        int FCID = Integer.parseInt(request.getParameter("FCID"));
        FacultyDatabaseInfoFinder fdif = new FacultyDatabaseInfoFinder();
        fdif.deleteRowDatabase(FCID);
        response.sendRedirect("FacultyProfile.jsp");
    }

%>
</body>
</html>
