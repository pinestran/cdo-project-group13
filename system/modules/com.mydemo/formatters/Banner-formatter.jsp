<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content">
<c:set var="title" value="${content.value.Title}" />
<c:set var="image" value="${content.value.Image}" />
	<header class="w3-display-container w3-content w3-wide" style="max-width:1600px;min-width:500px" id="home">
  		<img class="w3-image" src="<cms:link>${image}</cms:link>" alt="Hamburger Catering" width="1600" height="800">
  		<div class="w3-display-bottomleft w3-padding-large w3-opacity">
    		<h1 class="w3-xxlarge">${title}</h1>
  		</div>
	</header>
</cms:formatter>