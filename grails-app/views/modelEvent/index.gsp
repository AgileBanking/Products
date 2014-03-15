
<%@ page import="entities.ModelEvent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'modelEvent.label', default: 'ModelEvent')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-modelEvent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-modelEvent" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'modelEvent.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'modelEvent.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="titleInt" title="${message(code: 'modelEvent.titleInt.label', default: 'Title Int')}" />
					
						<th><g:message code="modelEvent.modelProduct.label" default="Model Product" /></th>
					
						<th><g:message code="modelEvent.eventType.label" default="Event Type" /></th>
					
						<g:sortableColumn property="dimension" title="${message(code: 'modelEvent.dimension.label', default: 'Dimension')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${modelEventInstanceList}" status="i" var="modelEventInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${modelEventInstance.id}">${fieldValue(bean: modelEventInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: modelEventInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: modelEventInstance, field: "titleInt")}</td>
					
						<td>${fieldValue(bean: modelEventInstance, field: "modelProduct")}</td>
					
						<td>${fieldValue(bean: modelEventInstance, field: "eventType")}</td>
					
						<td>${fieldValue(bean: modelEventInstance, field: "dimension")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${modelEventInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
