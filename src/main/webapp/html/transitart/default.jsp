<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ page import="java.util.ResourceBundle" %>

<liferay-theme:defineObjects />
<portlet:defineObjects />

<%
	ResourceBundle messages = portletConfig.getResourceBundle(locale);
%>

<div id="transitart-portlet-info">
	<img title="TransitArt" id="transitart-white-logo" src="<%=renderRequest.getContextPath()%>/logo_light.png">
	<h1 class="text-center" id="transitart-portlet-info-content"><%=messages.getString("portlet.config.info")%></h1>
</div>