<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel=stylesheet href="style.css">
	<% 
	//pull user requested playing board sizes
	int width = 0;
	int height = 0;
	String sWidth = request.getParameter("width");
	String sHeight = request.getParameter("height");
	if(sWidth != null){
		try {
			width = Integer.parseInt(sWidth);
		} catch (NumberFormatException e) {
			width = 11;
		}
	} else {
		width = 11;
	}
	if(sHeight != null){
		try {
			height = Integer.parseInt(sHeight);
		} catch (NumberFormatException e) {
			height = 11;
		}
	} else {
		height = 11;
	}
	//determines which is greater and passes that value to (s)ize
	int size = 100;
	if (height >= width){
		size = height;
	} else {
		size = width;
	}
	%>
		<!-- // sets the size of the individual boxes to the correct height-width size --> 
	<style>
		.box{
            /* 
            width: 10px;
            height: 10px;
            */
            width: <%= (100/size) %>%;
            height: <%= (100/size) %>%;
        }
	</style>
</head>
<body>
	<div class="wrapper">
		<!-- setting up the logic for changing from color1 to color 2 amongst the blocks -->
		<% for(int i = 0; i < height; i++) { %>
			<% for(int j = 0; j < width; j++) {%>
				<% if( (i+j) % 2 == 0) {%>
					<div class="box color1"></div>
				<% } else { %>
					<div class="box color2"></div>
		<% } } } //closing all curlies in one go... I'm lazy %>
	</div>
</body>
</html>