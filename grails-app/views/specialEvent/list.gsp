
<%@ page import="entities.SpecialEvent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'specialEvent.label', default: 'SpecialEvent')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-specialEvent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-specialEvent" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="specialEvent.modelEvent.label" default="Model Event" /></th>
					
						<g:sortableColumn property="eventUsage" title="${message(code: 'specialEvent.eventUsage.label', default: 'Event Usage')}" />
					
						<g:sortableColumn property="valueDateOffset" title="${message(code: 'specialEvent.valueDateOffset.label', default: 'Value Date Offset')}" />
					
						<g:sortableColumn property="availabilityDateOffset" title="${message(code: 'specialEvent.availabilityDateOffset.label', default: 'Availability Date Offset')}" />
					
						<g:sortableColumn property="activationDate" title="${message(code: 'specialEvent.activationDate.label', default: 'Activation Date')}" />
					
						<g:sortableColumn property="deactivationDate" title="${message(code: 'specialEvent.deactivationDate.label', default: 'Deactivation Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${specialEventInstanceList}" status="i" var="specialEventInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${specialEventInstance.id}">${fieldValue(bean: specialEventInstance, field: "modelEvent")}</g:link></td>
					
						<td>${fieldValue(bean: specialEventInstance, field: "eventUsage")}</td>
					
						<td>${fieldValue(bean: specialEventInstance, field: "valueDateOffset")}</td>
					
						<td>${fieldValue(bean: specialEventInstance, field: "availabilityDateOffset")}</td>
					
						<td><g:formatDate date="${specialEventInstance.activationDate}" /></td>
					
						<td><g:formatDate date="${specialEventInstance.deactivationDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${specialEventInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
