<%@ page import="entities.ModelEvent" %>



<div class="fieldcontain ${hasErrors(bean: modelEventInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="modelEvent.code.label" default="Code" />
		
	</label>
	<g:textField name="code" maxlength="16" value="${modelEventInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelEventInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="modelEvent.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${modelEventInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelEventInstance, field: 'titleInt', 'error')} required">
	<label for="titleInt">
		<g:message code="modelEvent.titleInt.label" default="Title Int" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titleInt" required="" value="${modelEventInstance?.titleInt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelEventInstance, field: 'modelProduct', 'error')} ">
	<label for="modelProduct">
		<g:message code="modelEvent.modelProduct.label" default="Model Product" />
		
	</label>
	<g:select id="modelProduct" name="modelProduct.id" from="${entities.ModelProduct.list()}" optionKey="id" value="${modelEventInstance?.modelProduct?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelEventInstance, field: 'eventType', 'error')} ">
	<label for="eventType">
		<g:message code="modelEvent.eventType.label" default="Event Type" />
		
	</label>
	<g:select id="eventType" name="eventType.id" from="${entities.EventType.list()}" optionKey="id" value="${modelEventInstance?.eventType?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelEventInstance, field: 'dimension', 'error')} required">
	<label for="dimension">
		<g:message code="modelEvent.dimension.label" default="Dimension" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="dimension" from="${0..10}" class="range" required="" value="${fieldValue(bean: modelEventInstance, field: 'dimension')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelEventInstance, field: 'valueDateOffset', 'error')} required">
	<label for="valueDateOffset">
		<g:message code="modelEvent.valueDateOffset.label" default="Value Date Offset" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valueDateOffset" type="number" value="${modelEventInstance.valueDateOffset}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelEventInstance, field: 'availabilityDateOffset', 'error')} required">
	<label for="availabilityDateOffset">
		<g:message code="modelEvent.availabilityDateOffset.label" default="Availability Date Offset" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="availabilityDateOffset" type="number" value="${modelEventInstance.availabilityDateOffset}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelEventInstance, field: 'debitFactor', 'error')} ">
	<label for="debitFactor">
		<g:message code="modelEvent.debitFactor.label" default="Debit Factor" />
		
	</label>
	<g:select name="debitFactor" from="${modelEventInstance.constraints.debitFactor.inList}" value="${modelEventInstance?.debitFactor}" valueMessagePrefix="modelEvent.debitFactor" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelEventInstance, field: 'creditFactor', 'error')} ">
	<label for="creditFactor">
		<g:message code="modelEvent.creditFactor.label" default="Credit Factor" />
		
	</label>
	<g:select name="creditFactor" from="${modelEventInstance.constraints.creditFactor.inList}" value="${modelEventInstance?.creditFactor}" valueMessagePrefix="modelEvent.creditFactor" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelEventInstance, field: 'blockAmountFactor', 'error')} ">
	<label for="blockAmountFactor">
		<g:message code="modelEvent.blockAmountFactor.label" default="Block Amount Factor" />
		
	</label>
	<g:select name="blockAmountFactor" from="${modelEventInstance.constraints.blockAmountFactor.inList}" value="${modelEventInstance?.blockAmountFactor}" valueMessagePrefix="modelEvent.blockAmountFactor" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelEventInstance, field: 'excessLimitFactor', 'error')} ">
	<label for="excessLimitFactor">
		<g:message code="modelEvent.excessLimitFactor.label" default="Excess Limit Factor" />
		
	</label>
	<g:select name="excessLimitFactor" from="${modelEventInstance.constraints.excessLimitFactor.inList}" value="${modelEventInstance?.excessLimitFactor}" valueMessagePrefix="modelEvent.excessLimitFactor" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelEventInstance, field: 'counterSide', 'error')} ">
	<label for="counterSide">
		<g:message code="modelEvent.counterSide.label" default="Counter Side" />
		
	</label>
	<g:select name="counterSide" from="${modelEventInstance.constraints.counterSide.inList}" value="${modelEventInstance?.counterSide}" valueMessagePrefix="modelEvent.counterSide" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelEventInstance, field: 'specialEvents', 'error')} ">
	<label for="specialEvents">
		<g:message code="modelEvent.specialEvents.label" default="Special Events" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${modelEventInstance?.specialEvents?}" var="s">
    <li><g:link controller="specialEvent" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="specialEvent" action="create" params="['modelEvent.id': modelEventInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'specialEvent.label', default: 'SpecialEvent')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: modelEventInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="modelEvent.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" maxlength="250" value="${modelEventInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelEventInstance, field: 'recStatus', 'error')} ">
	<label for="recStatus">
		<g:message code="modelEvent.recStatus.label" default="Rec Status" />
		
	</label>
	<g:select name="recStatus" from="${modelEventInstance.constraints.recStatus.inList}" value="${modelEventInstance?.recStatus}" valueMessagePrefix="modelEvent.recStatus" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelEventInstance, field: 'blockAccount', 'error')} ">
	<label for="blockAccount">
		<g:message code="modelEvent.blockAccount.label" default="Block Account" />
		
	</label>
	<g:textField name="blockAccount" value="${modelEventInstance?.blockAccount}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelEventInstance, field: 'closeAccount', 'error')} ">
	<label for="closeAccount">
		<g:message code="modelEvent.closeAccount.label" default="Close Account" />
		
	</label>
	<g:textField name="closeAccount" value="${modelEventInstance?.closeAccount}"/>
</div>

