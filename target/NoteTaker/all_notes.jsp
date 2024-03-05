<!doctype html>
<%@page import="entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="helper.FectoryProvider"%>
<%@page import="org.hibernate.Session"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>All Notes:Note Taker</title>
    <%@include file="all_js_css.jsp" %>
  </head>
  <body>
<div  class="container-fluid p-0 m-0">
<div class='row'>
<div class='col-12'>

<%@include file="navbar.jsp" %>
<br>
<h1 class='text-uppercase'>All Notes:</h1>
<%
Session s=FectoryProvider.getFactory().openSession();
Query q=s.createQuery("from Note");
List<Note> list=q.list();
for(Note note:list){
	%>
	<div class="card mt-3">
  <img src="img/notes.png" style="max-width: 70px" class="card-img-top mx-auto" alt="...">
  <div class="card-body px-5">
    <h5 class="card-title"><%=note.getTitle()%></h5>
    <p class="card-text"><%=note.getContent()%></p>
    <div class="container text-center mt-2">
    <a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
    <a href="#" class="btn btn-primary">Update</a>
    </div>
  </div>
</div>
<% 
}
s.close();
%>

</div>
</div>



</div>
  </body>
</html>