
<%@ page import="entities.ModelProduct" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'modelProduct.label', default: 'ModelProduct')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-modelProduct" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-modelProduct" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list modelProduct">
			
				<g:if test="${modelProductInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="modelProduct.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${modelProductInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelProductInstance?.productCategory}">
				<li class="fieldcontain">
					<span id="productCategory-label" class="property-label"><g:message code="modelProduct.productCategory.label" default="Product Category" /></span>
					
						<span class="property-value" aria-labelledby="productCategory-label"><g:link controller="productCategory" action="show" id="${modelProductInstance?.productCategory?.id}">${modelProductInstance?.productCategory?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelProductInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="modelProduct.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${modelProductInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelProductInstance?.titleInt}">
				<li class="fieldcontain">
					<span id="titleInt-label" class="property-label"><g:message code="modelProduct.titleInt.label" default="Title Int" /></span>
					
						<span class="property-value" aria-labelledby="titleInt-label"><g:fieldValue bean="${modelProductInstance}" field="titleInt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelProductInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="modelProduct.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${modelProductInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelProductInstance?.ineterestFreq}">
				<li class="fieldcontain">
					<span id="ineterestFreq-label" class="property-label"><g:message code="modelProduct.ineterestFreq.label" default="Ineterest Freq" /></span>
					
						<span class="property-value" aria-labelledby="ineterestFreq-label"><g:fieldValue bean="${modelProductInstance}" field="ineterestFreq"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelProductInstance?.modelEvents}">
				<li class="fieldcontain">
					<span id="modelEvents-label" class="property-label"><g:message code="modelProduct.modelEvents.label" default="Model Events" /></span>
					
						<g:each in="${modelProductInstance.modelEvents}" var="m">
						<span class="property-value" aria-labelledby="modelEvents-label"><g:link controller="modelEvent" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${modelProductInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="modelProduct.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${modelProductInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelProductInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="modelProduct.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${modelProductInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelProductInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="modelProduct.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${modelProductInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelProductInstance?.recStatus}">
				<li class="fieldcontain">
					<span id="recStatus-label" class="property-label"><g:message code="modelProduct.recStatus.label" default="Rec Status" /></span>
					
						<span class="property-value" aria-labelledby="recStatus-label"><g:fieldValue bean="${modelProductInstance}" field="recStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelProductInstance?.products}">
				<li class="fieldcontain">
					<span id="products-label" class="property-label"><g:message code="modelProduct.products.label" default="Products" /></span>
					
						<g:each in="${modelProductInstance.products}" var="p">
						<span class="property-value" aria-labelledby="products-label"><g:link controller="product" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:modelProductInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${modelProductInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
