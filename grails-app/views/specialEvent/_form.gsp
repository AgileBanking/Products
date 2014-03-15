<%@ page import="entities.SpecialEvent" %>



<div class="fieldcontain ${hasErrors(bean: specialEventInstance, field: 'modelEvent', 'error')} ">
	<label for="modelEvent">
		<g:message code="specialEvent.modelEvent.label" default="Model Event" />
		
	</label>
	<g:select id="modelEvent" name="modelEvent.id" from="${entities.ModelEvent.list()}" optionKey="id" value="${specialEventInstance?.modelEvent?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: specialEventInstance, field: 'eventUsage', 'error')} ">
	<label for="eventUsage">
		<g:message code="specialEvent.eventUsage.label" default="Event Usage" />
		
	</label>
	<g:select name="eventUsage" from="${specialEventInstance.constraints.eventUsage.inList}" value="${specialEventInstance?.eventUsage}" valueMessagePrefix="specialEvent.eventUsage" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: specialEventInstance, field: 'valueDateOffset', 'error')} required">
	<label for="valueDateOffset">
		<g:message code="specialEvent.valueDateOffset.label" default="Value Date Offset" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valueDateOffset" type="number" value="${specialEventInstance.valueDateOffset}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: specialEventInstance, field: 'availabilityDateOffset', 'error')} required">
	<label for="availabilityDateOffset">
		<g:message code="specialEvent.availabilityDateOffset.label" default="Availability Date Offset" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="availabilityDateOffset" type="number" value="${specialEventInstance.availabilityDateOffset}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: specialEventInstance, field: 'activationDate', 'error')} ">
	<label for="activationDate">
		<g:message code="specialEvent.activationDate.label" default="Activation Date" />
		
	</label>
	<g:datePicker name="activationDate" precision="day"  value="${specialEventInstance?.activationDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: specialEventInstance, field: 'deactivationDate', 'error')} ">
	<label for="deactivationDate">
		<g:message code="specialEvent.deactivationDate.label" default="Deactivation Date" />
		
	</label>
	<g:datePicker name="deactivationDate" precision="day"  value="${specialEventInstance?.deactivationDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: specialEventInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="specialEvent.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="255" value="${specialEventInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: specialEventInstance, field: 'recStatus', 'error')} ">
	<label for="recStatus">
		<g:message code="specialEvent.recStatus.label" default="Rec Status" />
		
	</label>
	<g:select name="recStatus" from="${specialEventInstance.constraints.recStatus.inList}" value="${specialEventInstance?.recStatus}" valueMessagePrefix="specialEvent.recStatus" noSelection="['': '']"/>
</div>

