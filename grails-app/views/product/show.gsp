
<%@ page import="entities.Product" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-product" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list product">
			
				<g:if test="${productInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="product.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${productInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="product.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${productInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.titleInt}">
				<li class="fieldcontain">
					<span id="titleInt-label" class="property-label"><g:message code="product.titleInt.label" default="Title Int" /></span>
					
						<span class="property-value" aria-labelledby="titleInt-label"><g:fieldValue bean="${productInstance}" field="titleInt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.modelProduct}">
				<li class="fieldcontain">
					<span id="modelProduct-label" class="property-label"><g:message code="product.modelProduct.label" default="Model Product" /></span>
					
						<span class="property-value" aria-labelledby="modelProduct-label"><g:link controller="modelProduct" action="show" id="${productInstance?.modelProduct?.id}">${productInstance?.modelProduct?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.productPolicies}">
				<li class="fieldcontain">
					<span id="productPolicies-label" class="property-label"><g:message code="product.productPolicies.label" default="Product Policies" /></span>
					
						<g:each in="${productInstance.productPolicies}" var="p">
						<span class="property-value" aria-labelledby="productPolicies-label"><g:link controller="productPolicy" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.dimensions}">
				<li class="fieldcontain">
					<span id="dimensions-label" class="property-label"><g:message code="product.dimensions.label" default="Dimensions" /></span>
					
						<span class="property-value" aria-labelledby="dimensions-label"><g:fieldValue bean="${productInstance}" field="dimensions"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.activeSince}">
				<li class="fieldcontain">
					<span id="activeSince-label" class="property-label"><g:message code="product.activeSince.label" default="Active Since" /></span>
					
						<span class="property-value" aria-labelledby="activeSince-label"><g:formatDate date="${productInstance?.activeSince}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.activeUntil}">
				<li class="fieldcontain">
					<span id="activeUntil-label" class="property-label"><g:message code="product.activeUntil.label" default="Active Until" /></span>
					
						<span class="property-value" aria-labelledby="activeUntil-label"><g:formatDate date="${productInstance?.activeUntil}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="product.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${productInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.marketingVersion}">
				<li class="fieldcontain">
					<span id="marketingVersion-label" class="property-label"><g:message code="product.marketingVersion.label" default="Marketing Version" /></span>
					
						<span class="property-value" aria-labelledby="marketingVersion-label"><g:fieldValue bean="${productInstance}" field="marketingVersion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.minOpeningAmount}">
				<li class="fieldcontain">
					<span id="minOpeningAmount-label" class="property-label"><g:message code="product.minOpeningAmount.label" default="Min Opening Amount" /></span>
					
						<span class="property-value" aria-labelledby="minOpeningAmount-label"><g:fieldValue bean="${productInstance}" field="minOpeningAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.maxOpeningAmount}">
				<li class="fieldcontain">
					<span id="maxOpeningAmount-label" class="property-label"><g:message code="product.maxOpeningAmount.label" default="Max Opening Amount" /></span>
					
						<span class="property-value" aria-labelledby="maxOpeningAmount-label"><g:fieldValue bean="${productInstance}" field="maxOpeningAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.dormantPeriod}">
				<li class="fieldcontain">
					<span id="dormantPeriod-label" class="property-label"><g:message code="product.dormantPeriod.label" default="Dormant Period" /></span>
					
						<span class="property-value" aria-labelledby="dormantPeriod-label"><g:fieldValue bean="${productInstance}" field="dormantPeriod"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.specialEvents}">
				<li class="fieldcontain">
					<span id="specialEvents-label" class="property-label"><g:message code="product.specialEvents.label" default="Special Events" /></span>
					
						<g:each in="${productInstance.specialEvents}" var="s">
						<span class="property-value" aria-labelledby="specialEvents-label"><g:link controller="specialEvent" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="product.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${productInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="product.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${productInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="product.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${productInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.recStatus}">
				<li class="fieldcontain">
					<span id="recStatus-label" class="property-label"><g:message code="product.recStatus.label" default="Rec Status" /></span>
					
						<span class="property-value" aria-labelledby="recStatus-label"><g:fieldValue bean="${productInstance}" field="recStatus"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:productInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${productInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
