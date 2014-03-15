
<%@ page import="entities.SpecialEvent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'specialEvent.label', default: 'SpecialEvent')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-specialEvent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-specialEvent" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list specialEvent">
			
				<g:if test="${specialEventInstance?.modelEvent}">
				<li class="fieldcontain">
					<span id="modelEvent-label" class="property-label"><g:message code="specialEvent.modelEvent.label" default="Model Event" /></span>
					
						<span class="property-value" aria-labelledby="modelEvent-label"><g:link controller="modelEvent" action="show" id="${specialEventInstance?.modelEvent?.id}">${specialEventInstance?.modelEvent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${specialEventInstance?.eventUsage}">
				<li class="fieldcontain">
					<span id="eventUsage-label" class="property-label"><g:message code="specialEvent.eventUsage.label" default="Event Usage" /></span>
					
						<span class="property-value" aria-labelledby="eventUsage-label"><g:fieldValue bean="${specialEventInstance}" field="eventUsage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${specialEventInstance?.valueDateOffset}">
				<li class="fieldcontain">
					<span id="valueDateOffset-label" class="property-label"><g:message code="specialEvent.valueDateOffset.label" default="Value Date Offset" /></span>
					
						<span class="property-value" aria-labelledby="valueDateOffset-label"><g:fieldValue bean="${specialEventInstance}" field="valueDateOffset"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${specialEventInstance?.availabilityDateOffset}">
				<li class="fieldcontain">
					<span id="availabilityDateOffset-label" class="property-label"><g:message code="specialEvent.availabilityDateOffset.label" default="Availability Date Offset" /></span>
					
						<span class="property-value" aria-labelledby="availabilityDateOffset-label"><g:fieldValue bean="${specialEventInstance}" field="availabilityDateOffset"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${specialEventInstance?.activationDate}">
				<li class="fieldcontain">
					<span id="activationDate-label" class="property-label"><g:message code="specialEvent.activationDate.label" default="Activation Date" /></span>
					
						<span class="property-value" aria-labelledby="activationDate-label"><g:formatDate date="${specialEventInstance?.activationDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${specialEventInstance?.deactivationDate}">
				<li class="fieldcontain">
					<span id="deactivationDate-label" class="property-label"><g:message code="specialEvent.deactivationDate.label" default="Deactivation Date" /></span>
					
						<span class="property-value" aria-labelledby="deactivationDate-label"><g:formatDate date="${specialEventInstance?.deactivationDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${specialEventInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="specialEvent.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${specialEventInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${specialEventInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="specialEvent.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${specialEventInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${specialEventInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="specialEvent.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${specialEventInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${specialEventInstance?.recStatus}">
				<li class="fieldcontain">
					<span id="recStatus-label" class="property-label"><g:message code="specialEvent.recStatus.label" default="Rec Status" /></span>
					
						<span class="property-value" aria-labelledby="recStatus-label"><g:fieldValue bean="${specialEventInstance}" field="recStatus"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:specialEventInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${specialEventInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
