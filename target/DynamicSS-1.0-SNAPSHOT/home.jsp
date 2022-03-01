
<%@page import="com.table.entities.Message"%>
<%@page import="com.table.entities.User"%>
<%
User user=(User)session.getAttribute("currentUser");
if(user==null)
{
    Message m=new Message("You are not logged in!!","error","alert-danger");
        session.setAttribute("msg", m);
    response.sendRedirect("login_page.jsp");
}
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

        
        <style>
        </style>
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="background: #F6ECEC">
        <div class="text-center mt-4">
            <button class="btn btn-dark" data-toggle="modal" data-target="#table-modal" style="color: #fff">Create table</button>
            <a  class="btn btn-dark" href="LogoutServlet" style="color: #fff; text-decoration: none"><span class="fa fa-user-circle"></span> Logout</a>
        </div> 
      
 

<!-- Modal -->
<div class="modal fade" id="table-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog" role="document">
<div class="modal-content">
    <div class="modal-header"><h3 class="mt-2 text-center"id="exampleModalLabel" >Give Table Details</h3>
    <!--<h5 class="modal-title" id="exampleModalLabel">SKS</h5>-->
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <div class="modal-body">
      <h6 style="color : #FF0800">**first field will be the primary key</h6>
          <div id="table-details">
              
              
              <form action="CreateTableServlet" id="tableDetails-form" method="post">
                  
<!--                   <div class="row" id="row0">
                      <div class="col-6">
                          <label>Enter Table Name</label>
                          <input type="text" name="tablename" class="form-control" placeholder="Enter table name">
                      </div>
                   </div>-->
                       

                  
              </form>
              <button class="btn btn-dark mt-2" id="btnadd" onclick="add_more_field()">Add fields +</button>
            </div>

  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
  </div>
</div>
</div>
</div>
    <%--end of table modal--%>

    
    
    

<!--javascripts-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>       
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="js/myjs.js" type="text/javascript"></script>

<script>
   
    
</script>  
        <!--javascripts-->
 <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>       
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>




<!--<script>
 $(document).ready(function(){
$('#tableDetails-form').on('submit',function(event){
    event.preventDefault();
    let form=new FormData(this);
    
    //sending data to register servlet through ajax
    $.ajax({
        url:"CreateTableServlet",
        type:'post',
        data:form,
        success: function (data, textStatus, jqXHR) {
            if(data.trim()=="REGISTERED"){
                swal({
                     title: "Table Created Succesfully!",
                     text: "",
                     icon: "success",
                    
                 }).then((value) => {
                     window.location="home.jsp"
                 });
            }
            else{
                swal("Something went wrong try again with some other tablename!!");
            }
       // console.log(data);
        },
        
        error: function (jqXHR,textStatus,errorThrown){
            swal("Something went wrong try again!!");
        },
        processData: false,
        contentType:false
        
    });
});





});
        </script>-->
    </body>
</html>
