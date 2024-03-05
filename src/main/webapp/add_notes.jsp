<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
<div  class="container-fluid p-0 m-0">
<%@include file="navbar.jsp" %>
<br>
<h1>Please fill your note details</h1>
<br>
<!-- This is add form -->
<form action="SaveNoteServlet"  method="post">
  <div class="form-group">
    <label for="title">Note Titles</label>
    <input type="text" class="form-control" id="title" name="title" aria-describedby="emailHelp" placeholder="Enter here" required>
  </div>
  <div class="form-group" >
    <label for="content">Note Content</label>
    <textarea id="content" name="content" class="form-control"  style="min-height:300px "  placeholder="Enter Your Contents" required></textarea>
  </div>
  

<div class="container text-center" > 
<button type="submit" class="btn btn-primary">Add</button>
</div>

</form>
</div>
  </body>
</html>