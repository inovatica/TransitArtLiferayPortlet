<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>

<%@ page import="com.liferay.portal.kernel.util.Constants" %>
<%@ page import="com.liferay.portal.kernel.util.GetterUtil" %>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@ page import="com.liferay.portal.kernel.util.Validator"%>
<%@ page import="com.liferay.portlet.PortletPreferencesFactoryUtil"%>

<liferay-theme:defineObjects />
<liferay-portlet:actionURL portletConfiguration="true" var="configurationUrl" />

<%
	String transitArtUrl = ("pl".equals(locale.getLanguage())) ? "http://transitart.io/pl/" : "http://transitart.io/en/";

	String city = null;
	String pageType = null;

	String portletResource = ParamUtil.getString(request, "portletResource");
	if (Validator.isNotNull(portletResource)) {
		city = GetterUtil.getString(PortletPreferencesFactoryUtil.getPortletSetup(request, portletResource).getValue("city", null));
		pageType = GetterUtil.getString(PortletPreferencesFactoryUtil.getPortletSetup(request, portletResource).getValue("page", null));
	}
%>

<aui:form action="<%=configurationUrl%>" method="POST" name="form" cssClass="transitart-edit">
    <aui:input name="<%=Constants.CMD%>" type="hidden" value="<%=Constants.UPDATE%>" />

	<aui:field-wrapper>
		<aui:column>
			<aui:a href="<%=transitArtUrl%>" target="_blank" cssClass="transitart-logo"></aui:a>
		</aui:column>
		<aui:column>
			<aui:field-wrapper cssClass="transitart-contact-link">
				<aui:a href="<%=transitArtUrl%>" target="_blank" label="own.timetables.info"></aui:a>			
			</aui:field-wrapper>
		</aui:column>
	</aui:field-wrapper>

	<aui:field-wrapper>
		<aui:column>
			<aui:select name="preferences--city--" label="portlet.config.city">
				<aui:option value="auckland" selected="<%=(\"auckland\".equals(city))%>" label="auckland" />
				<aui:option value="budapeszt" selected="<%=(\"budapeszt\".equals(city))%>" label="budapest" />
				<aui:option value="chicago" selected="<%=(\"chicago\".equals(city))%>" label="chicago" />
				<aui:option value="lodz" selected="<%=(\"lodz\".equals(city))%>" label="lodz" />
				<aui:option value="sanfrancisco" selected="<%=(\"sanfrancisco\".equals(city))%>" label="sanfrancisco" />
				<aui:option value="toronto" selected="<%=(\"toronto\".equals(city))%>" label="toronto" />
				<aui:option value="vancouver" selected="<%=(\"vancouver\".equals(city))%>" label="vancouver" />
				<aui:option value="warszawa" selected="<%=(\"warszawa\".equals(city))%>" label="warsaw" />
			</aui:select>
		</aui:column>
		<aui:column>
			<aui:select name="preferences--page--" label="portlet.config.page">
				<aui:option value="timetables" selected="<%=(\"timetables\".equals(pageType))%>" label="page.timetables" />
				<aui:option value="router" selected="<%=(\"router\".equals(pageType))%>" label="page.router" />
			</aui:select>		
		</aui:column>
	</aui:field-wrapper>

	<aui:field-wrapper cssClass="timetables-portlet-configuration-bottom">
		<aui:column>
       		<aui:button type="submit" />
       		<aui:field-wrapper cssClass="details" label="portlet.config.reload"/>
    	</aui:column>		
	</aui:field-wrapper>

</aui:form>
