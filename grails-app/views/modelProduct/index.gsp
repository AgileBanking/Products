
<%@ page import="entities.ModelProduct" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'modelProduct.label', default: 'ModelProduct')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-modelProduct" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-modelProduct" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'modelProduct.code.label', default: 'Code')}" />
					
						<th><g:message code="modelProduct.productCategory.label" default="Product Category" /></th>
					
						<g:sortableColumn property="title" title="${message(code: 'modelProduct.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="titleInt" title="${message(code: 'modelProduct.titleInt.label', default: 'Title Int')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'modelProduct.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="ineterestFreq" title="${message(code: 'modelProduct.ineterestFreq.label', default: 'Ineterest Freq')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${modelProductInstanceList}" status="i" var="modelProductInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${modelProductInstance.id}">${fieldValue(bean: modelProductInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: modelProductInstance, field: "productCategory")}</td>
					
						<td>${fieldValue(bean: modelProductInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: modelProductInstance, field: "titleInt")}</td>
					
						<td>${fieldValue(bean: modelProductInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: modelProductInstance, field: "ineterestFreq")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${modelProductInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
