<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content">

<c:set var="imagePos" value="${content.value.RadioSelect}" />
<c:set var="title" value="${content.value.Title}" />
<c:set var="label" value="${content.value.Label}" />
<c:set var="text" value="${content.value.Text}" />
<c:set var="image" value="${content.value.Image}" />

	<!-- About Section -->
	<c:choose>
		<c:when test="${imagePos eq '1'}">
			<div class="w3-row w3-padding-64" id="about">
				<div class="w3-col m6 w3-padding-large w3-hide-small">
					<img src="<cms:link>${image}</cms:link>" class="w3-round w3-image w3-opacity-min" alt="Table Setting" width="600" height="750">
				</div>

				<div class="w3-col m6 w3-padding-large">
					<h1 class="w3-center">${title}</h1><br>
					<h5 class="w3-center">${label}</h5>
					<p class="w3-large">${text}</p>
				</div>
			</div>
		</c:when>
		<c:when test="${imagePos eq '2'}">
			<!-- Menu Section -->
			<div class="w3-row w3-padding-64" id="menu">
				<div class="w3-col l6 w3-padding-large">
					<h1 class="w3-center">${title}</h1><br>
					<h4>${label}</h4>
					${text}
				</div>

				<div class="w3-col l6 w3-padding-large">
					<img src="<cms:link>${image}</cms:link>" class="w3-round w3-image w3-opacity-min" alt="Menu" style="width:100%">
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<h1>Choosing your Radio select image: ${imagePos} </h1>
		</c:otherwise>
	</c:choose>
</cms:formatter>