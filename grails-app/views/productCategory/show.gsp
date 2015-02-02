
<%@ page import="entities.ProductCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productCategory.label', default: 'ProductCategory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-productCategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-productCategory" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list productCategory">
			
				<g:if test="${productCategoryInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="productCategory.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${productCategoryInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productCategoryInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="productCategory.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${productCategoryInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productCategoryInstance?.titleInt}">
				<li class="fieldcontain">
					<span id="titleInt-label" class="property-label"><g:message code="productCategory.titleInt.label" default="Title Int" /></span>
					
						<span class="property-value" aria-labelledby="titleInt-label"><g:fieldValue bean="${productCategoryInstance}" field="titleInt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productCategoryInstance?.productClass}">
				<li class="fieldcontain">
					<span id="productClass-label" class="property-label"><g:message code="productCategory.productClass.label" default="Product Class" /></span>
					
						<span class="property-value" aria-labelledby="productClass-label"><g:fieldValue bean="${productCategoryInstance}" field="productClass"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productCategoryInstance?.explicitContract}">
				<li class="fieldcontain">
					<span id="explicitContract-label" class="property-label"><g:message code="productCategory.explicitContract.label" default="Explicit Contract" /></span>
					
						<span class="property-value" aria-labelledby="explicitContract-label"><g:formatBoolean boolean="${productCategoryInstance?.explicitContract}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productCategoryInstance?.parentCategory}">
				<li class="fieldcontain">
					<span id="parentCategory-label" class="property-label"><g:message code="productCategory.parentCategory.label" default="Parent Category" /></span>
					
						<span class="property-value" aria-labelledby="parentCategory-label"><g:link controller="productCategory" action="show" id="${productCategoryInstance?.parentCategory?.id}">${productCategoryInstance?.parentCategory?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productCategoryInstance?.modelProducts}">
				<li class="fieldcontain">
					<span id="modelProducts-label" class="property-label"><g:message code="productCategory.modelProducts.label" default="Model Products" /></span>
					
						<g:each in="${productCategoryInstance.modelProducts}" var="m">
						<span class="property-value" aria-labelledby="modelProducts-label"><g:link controller="modelProduct" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productCategoryInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="productCategory.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${productCategoryInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productCategoryInstance?.userId}">
				<li class="fieldcontain">
					<span id="userId-label" class="property-label"><g:message code="productCategory.userId.label" default="User Id" /></span>
					
						<span class="property-value" aria-labelledby="userId-label"><g:fieldValue bean="${productCategoryInstance}" field="userId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productCategoryInstance?.orgUnitId}">
				<li class="fieldcontain">
					<span id="orgUnitId-label" class="property-label"><g:message code="productCategory.orgUnitId.label" default="Org Unit Id" /></span>
					
						<span class="property-value" aria-labelledby="orgUnitId-label"><g:fieldValue bean="${productCategoryInstance}" field="orgUnitId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productCategoryInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="productCategory.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${productCategoryInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productCategoryInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="productCategory.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${productCategoryInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productCategoryInstance?.recStatus}">
				<li class="fieldcontain">
					<span id="recStatus-label" class="property-label"><g:message code="productCategory.recStatus.label" default="Rec Status" /></span>
					
						<span class="property-value" aria-labelledby="recStatus-label"><g:fieldValue bean="${productCategoryInstance}" field="recStatus"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:productCategoryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${productCategoryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
