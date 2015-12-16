<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="col-xs-12 col-sm-4">
                            <h2><strong>  </strong></h2>                    
                            <p><small>Followers</small></p>
                            <button class="btn btn-success btn-block"><span class="fa fa-plus-circle"></span> Follow </button>
                        </div><!--/col-->
                        <div class="col-xs-12 col-sm-4">
                            <h2><strong></strong></h2>                    
                            <p><small>Following</small></p>
                            <button class="btn btn-info btn-block" onclick="openPage('root.jsp')"><span class="fa fa-user"></span> View Profile </button>
                        </div><!--/col-->
                        <div class="col-xs-12 col-sm-4">
                            <h2><strong></strong></h2>                    
                            <p><small>Snippets</small></p>
                            <button type="button" class="btn btn-primary btn-block"><span class="fa fa-gear"></span> Options </button>  
                        </div><!--/col-->
                    </div><!--/row-->
              </div><!--/panel-body-->
          </div><!--/panel-->
<script>
function openPage(pageURL){
    window.location.href = pageURL;
}
</script>
</body>
</html>