
<%@ page import="entities.ModelEvent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'modelEvent.label', default: 'ModelEvent')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-modelEvent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-modelEvent" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list modelEvent">
			
				<g:if test="${modelEventInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="modelEvent.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${modelEventInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelEventInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="modelEvent.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${modelEventInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelEventInstance?.titleInt}">
				<li class="fieldcontain">
					<span id="titleInt-label" class="property-label"><g:message code="modelEvent.titleInt.label" default="Title Int" /></span>
					
						<span class="property-value" aria-labelledby="titleInt-label"><g:fieldValue bean="${modelEventInstance}" field="titleInt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelEventInstance?.modelProduct}">
				<li class="fieldcontain">
					<span id="modelProduct-label" class="property-label"><g:message code="modelEvent.modelProduct.label" default="Model Product" /></span>
					
						<span class="property-value" aria-labelledby="modelProduct-label"><g:link controller="modelProduct" action="show" id="${modelEventInstance?.modelProduct?.id}">${modelEventInstance?.modelProduct?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelEventInstance?.eventType}">
				<li class="fieldcontain">
					<span id="eventType-label" class="property-label"><g:message code="modelEvent.eventType.label" default="Event Type" /></span>
					
						<span class="property-value" aria-labelledby="eventType-label"><g:link controller="eventType" action="show" id="${modelEventInstance?.eventType?.id}">${modelEventInstance?.eventType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelEventInstance?.dimension}">
				<li class="fieldcontain">
					<span id="dimension-label" class="property-label"><g:message code="modelEvent.dimension.label" default="Dimension" /></span>
					
						<span class="property-value" aria-labelledby="dimension-label"><g:fieldValue bean="${modelEventInstance}" field="dimension"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelEventInstance?.valueDateOffset}">
				<li class="fieldcontain">
					<span id="valueDateOffset-label" class="property-label"><g:message code="modelEvent.valueDateOffset.label" default="Value Date Offset" /></span>
					
						<span class="property-value" aria-labelledby="valueDateOffset-label"><g:fieldValue bean="${modelEventInstance}" field="valueDateOffset"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelEventInstance?.availabilityDateOffset}">
				<li class="fieldcontain">
					<span id="availabilityDateOffset-label" class="property-label"><g:message code="modelEvent.availabilityDateOffset.label" default="Availability Date Offset" /></span>
					
						<span class="property-value" aria-labelledby="availabilityDateOffset-label"><g:fieldValue bean="${modelEventInstance}" field="availabilityDateOffset"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelEventInstance?.debitFactor}">
				<li class="fieldcontain">
					<span id="debitFactor-label" class="property-label"><g:message code="modelEvent.debitFactor.label" default="Debit Factor" /></span>
					
						<span class="property-value" aria-labelledby="debitFactor-label"><g:fieldValue bean="${modelEventInstance}" field="debitFactor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelEventInstance?.creditFactor}">
				<li class="fieldcontain">
					<span id="creditFactor-label" class="property-label"><g:message code="modelEvent.creditFactor.label" default="Credit Factor" /></span>
					
						<span class="property-value" aria-labelledby="creditFactor-label"><g:fieldValue bean="${modelEventInstance}" field="creditFactor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelEventInstance?.blockAmountFactor}">
				<li class="fieldcontain">
					<span id="blockAmountFactor-label" class="property-label"><g:message code="modelEvent.blockAmountFactor.label" default="Block Amount Factor" /></span>
					
						<span class="property-value" aria-labelledby="blockAmountFactor-label"><g:fieldValue bean="${modelEventInstance}" field="blockAmountFactor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelEventInstance?.excessLimitFactor}">
				<li class="fieldcontain">
					<span id="excessLimitFactor-label" class="property-label"><g:message code="modelEvent.excessLimitFactor.label" default="Excess Limit Factor" /></span>
					
						<span class="property-value" aria-labelledby="excessLimitFactor-label"><g:fieldValue bean="${modelEventInstance}" field="excessLimitFactor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelEventInstance?.counterSide}">
				<li class="fieldcontain">
					<span id="counterSide-label" class="property-label"><g:message code="modelEvent.counterSide.label" default="Counter Side" /></span>
					
						<span class="property-value" aria-labelledby="counterSide-label"><g:fieldValue bean="${modelEventInstance}" field="counterSide"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelEventInstance?.specialEvents}">
				<li class="fieldcontain">
					<span id="specialEvents-label" class="property-label"><g:message code="modelEvent.specialEvents.label" default="Special Events" /></span>
					
						<g:each in="${modelEventInstance.specialEvents}" var="s">
						<span class="property-value" aria-labelledby="specialEvents-label"><g:link controller="specialEvent" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${modelEventInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="modelEvent.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${modelEventInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelEventInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="modelEvent.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${modelEventInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelEventInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="modelEvent.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${modelEventInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelEventInstance?.recStatus}">
				<li class="fieldcontain">
					<span id="recStatus-label" class="property-label"><g:message code="modelEvent.recStatus.label" default="Rec Status" /></span>
					
						<span class="property-value" aria-labelledby="recStatus-label"><g:fieldValue bean="${modelEventInstance}" field="recStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelEventInstance?.blockAccount}">
				<li class="fieldcontain">
					<span id="blockAccount-label" class="property-label"><g:message code="modelEvent.blockAccount.label" default="Block Account" /></span>
					
						<span class="property-value" aria-labelledby="blockAccount-label"><g:fieldValue bean="${modelEventInstance}" field="blockAccount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modelEventInstance?.closeAccount}">
				<li class="fieldcontain">
					<span id="closeAccount-label" class="property-label"><g:message code="modelEvent.closeAccount.label" default="Close Account" /></span>
					
						<span class="property-value" aria-labelledby="closeAccount-label"><g:fieldValue bean="${modelEventInstance}" field="closeAccount"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:modelEventInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${modelEventInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
