<%@page buffer="none" session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
body {font-family: "Times New Roman", Georgia, Serif;}
h1,h2,h3,h4,h5,h6 {
    font-family: "Playfair Display";
    letter-spacing: 5px;
}
</style>

<cms:enable-ade/>
<cms:headincludes type="css" />
</head>

<body>
	<c:if test="${cms.isEditMode}">
    	<div id="in-editmode"></div>
        <div id="toolbar-placeholder" style="height: 55px"></div>
    </c:if>
<!-- Navbar (sit on top) -->
<cms:include file="%(link.weak:/system/modules/com.mydemo/elements/navtop.jsp:db8c023d-187b-11e8-9fc2-95537aa4fefc)" />

<!-- Header -->
	<cms:container  name="wrapper1" type="head">
		<h4>Drap and drop your content here </h4>
	</cms:container>

<!-- Page content -->
<div class="w3-content" style="max-width:1100px">

  <!-- About Section -->
	<cms:container  name="wrapper2">
		<h4>Drap and drop your content here </h4>
	</cms:container>
  
  <hr>
  
  <!-- Menu Section -->
	<cms:container  name="wrapper3">
		<h4>Drap and drop your content here </h4>
	</cms:container>

  <hr>

  <!-- Contact Section -->
	<cms:container  name="wrapper4">
		<h4>Drap and drop your content here </h4>
	</cms:container>
  
<!-- End page content -->
</div>

<!-- Footer -->
<cms:include file="%(link.weak:/system/modules/com.mydemo/elements/footer.jsp:c72ba39a-187b-11e8-9fc2-95537aa4fefc)" />

</body>
</html>
