
<%@ page import="entities.ProductPolicy" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productPolicy.label', default: 'ProductPolicy')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-productPolicy" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-productPolicy" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list productPolicy">
			
				<g:if test="${productPolicyInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="productPolicy.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${productPolicyInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPolicyInstance?.titleInt}">
				<li class="fieldcontain">
					<span id="titleInt-label" class="property-label"><g:message code="productPolicy.titleInt.label" default="Title Int" /></span>
					
						<span class="property-value" aria-labelledby="titleInt-label"><g:fieldValue bean="${productPolicyInstance}" field="titleInt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPolicyInstance?.product}">
				<li class="fieldcontain">
					<span id="product-label" class="property-label"><g:message code="productPolicy.product.label" default="Product" /></span>
					
						<span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show" id="${productPolicyInstance?.product?.id}">${productPolicyInstance?.product?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPolicyInstance?.currencyISO}">
				<li class="fieldcontain">
					<span id="currencyISO-label" class="property-label"><g:message code="productPolicy.currencyISO.label" default="Currency ISO" /></span>
					
						<span class="property-value" aria-labelledby="currencyISO-label"><g:fieldValue bean="${productPolicyInstance}" field="currencyISO"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPolicyInstance?.termUnit}">
				<li class="fieldcontain">
					<span id="termUnit-label" class="property-label"><g:message code="productPolicy.termUnit.label" default="Term Unit" /></span>
					
						<span class="property-value" aria-labelledby="termUnit-label"><g:fieldValue bean="${productPolicyInstance}" field="termUnit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPolicyInstance?.fromTerm}">
				<li class="fieldcontain">
					<span id="fromTerm-label" class="property-label"><g:message code="productPolicy.fromTerm.label" default="From Term" /></span>
					
						<span class="property-value" aria-labelledby="fromTerm-label"><g:fieldValue bean="${productPolicyInstance}" field="fromTerm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPolicyInstance?.toTerm}">
				<li class="fieldcontain">
					<span id="toTerm-label" class="property-label"><g:message code="productPolicy.toTerm.label" default="To Term" /></span>
					
						<span class="property-value" aria-labelledby="toTerm-label"><g:fieldValue bean="${productPolicyInstance}" field="toTerm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPolicyInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="productPolicy.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${productPolicyInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPolicyInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="productPolicy.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${productPolicyInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPolicyInstance?.recStatus}">
				<li class="fieldcontain">
					<span id="recStatus-label" class="property-label"><g:message code="productPolicy.recStatus.label" default="Rec Status" /></span>
					
						<span class="property-value" aria-labelledby="recStatus-label"><g:fieldValue bean="${productPolicyInstance}" field="recStatus"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:productPolicyInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${productPolicyInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
