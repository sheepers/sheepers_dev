<html>

<head>
<title><g:message code='spring.security.ui.forgotPassword.title'/></title>
<meta name='layout' content='register'/>
</head>

<body>

<p/>

<s2ui:form width='350' height='220' elementId='forgotPasswordFormContainer'
           titleCode='spring.security.ui.forgotPassword.header' center='true'>

	<g:form action='forgotPassword' name="forgotPasswordForm" autocomplete='off'>

	<g:if test='${emailSent}'>
	<br/>
	<g:message code='spring.security.ui.forgotPassword.sent'/>
	</g:if>

	<g:else>

	<br/>
	<h4>Enter your Email and a password reset link will be sent to you</h4>

	<table>
		<tr>
			<td><label for="username">Email</label></td>
			<td><g:textField name="username" size="25" /></td>
		</tr>
	</table>

	<s2ui:submitButton elementId='reset' form='forgotPasswordForm' messageCode='spring.security.ui.forgotPassword.submit'/>

	</g:else>

	</g:form>
</s2ui:form>

<script>
$(document).ready(function() {
	$('#username').focus();
});
</script>

</body>
</html>
