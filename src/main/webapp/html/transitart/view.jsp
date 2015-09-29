<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="javax.portlet.PortletPreferences" %>
<%@ page import="java.util.ResourceBundle" %>

<portlet:defineObjects />

 <%
	 String language = renderRequest.getLocale().getLanguage();
	
	 PortletPreferences preferences = renderRequest.getPreferences();
	 String city = (String) preferences.getValue("city", null);
	 String pageType = (String) preferences.getValue("page", "router");
	 
	 ResourceBundle messages = portletConfig.getResourceBundle(renderRequest.getLocale());
 %>

<c:choose>

	<c:when test="<%=(city != null)%>">
		<link rel="stylesheet" href="http://transitart.io/wp-content/<%=city%>/main.css">
 		<script src="http://transitart.io/wp-content/<%=city%>/optimized-module.js"></script>
		<div id="poloko-module" data-api-key="<%=city%>" data-lang="<%=language%>" data-page="<%=pageType%>"><div data-ui-view></div></div>
		<a href="<%=messages.getString("transitart.url")%>" target="_blank"><img src="<%=renderRequest.getContextPath()%>/by_transitart.png"/></a>
	</c:when>
	
	<c:otherwise>
		<jsp:include page="default.jsp" />
	</c:otherwise>

</c:choose>