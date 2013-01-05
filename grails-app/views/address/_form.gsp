<%@ page import="sheepers.Address" %>



<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="address.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${addressInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'floorNumber', 'error')} required">
	<label for="floorNumber">
		<g:message code="address.floorNumber.label" default="Floor Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="floorNumber" type="number" value="${addressInstance.floorNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'street', 'error')} ">
	<label for="street">
		<g:message code="address.street.label" default="Street" />
		
	</label>
	<g:textField name="street" value="${addressInstance?.street}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'street_number', 'error')} ">
	<label for="street_number">
		<g:message code="address.street_number.label" default="Streetnumber" />
		
	</label>
	<g:textField name="street_number" value="${addressInstance?.street_number}"/>
</div>

