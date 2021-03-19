<%@ page import="com.Item" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <% 
 //Insert item---------------------------------- 
if (request.getParameter("itemCode") != null) 
 { 
 Item itemObj = new Item(); 
 String stsMsg = itemObj.insertItem(request.getParameter("itemCode"), 
 request.getParameter("itemName"), 
 request.getParameter("itemPrice"), 
 request.getParameter("itemDese")); 
 session.setAttribute("statusMsg", stsMsg); 
 } 
  
  if (request.getParameter("itemID")!=null){
		 Item itemObj = new Item();
		 String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
		 session.setAttribute("statusMsg", stsMsg); 
	 }
%>  
    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Views/css/bootstrap.min.css">
<title>Item</title>
</head>
<body>

<div class="container">
  <div class="row">
    <div class="col">

    <h1>Items Management</h1>
    <form method="post" action="itemps.jsp">
      Item code: <input name="itemCode" type="text" class="form-control"><br> 
      Item name: <input name="itemName" type="text" class="form-control"><br> 
      Item price:<input name="itemPrice" type="text"class="form-control"><br> 
      Item description: <input name="itemDese" type="text" class="form-control"><br> 
     <input name="btnSubmit" type="submit" value="Save" class="btn btn-primary">
</form>
<div class="alert alert-success">
 <% out.print(session.getAttribute("statusMsg"));%>
</div>
<br>
<%
 Item itemObj = new Item();
 out.print(itemObj.readItems());
%>




    </div>
  </div>
</div>
    

</body>
</html>