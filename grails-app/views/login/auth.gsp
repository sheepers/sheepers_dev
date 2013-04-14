<!DOCTYPE html>
<html dir="rtl">
<head>
    <title><g:message code='spring.security.ui.login.title'/></title>
    <meta name='layout' content='main'/>
    <r:require module="application"/>
    <r:layoutResources/>
</head>

<body>
<div class="container">
    <div class="hero-unit hidden-phone">
        <h1 class="aaa pull-right" id="aaa">.פשוט להוביל .Sheepers</h1>
        <p>השוק הפתוח לתחרותיות בענףהשוק הפתוח לתחרותיות בענףהשוק הפתוח לתחרותיות
        בענףהשוק הפתוח לתחרותיות בענףהשוק הפתוח לתחרותיות בענףהשוק הפתוח לתחרותיות
        בענףהשוק הפתוח לתחרותיות בענףהשוק הפתוח לתחרותיות בענףהשוק הפתוח לתחרותיות
        בענףהשוק הפתוח לתחרותיות בענףהשוק הפתוח לתחרותיות בענףהשוק הפתוח לתחרותיות
        בענףהשוק הפתוח לתחרותיות בענף
            <br>
        </p>
        <span class="label label-success">יש לך משאית ? הרשם כאן</span>
        <p></p>
        <a class="btn pull-right btn-primary btn-large" href="#loginModal" role="button" data-backdrop="true"  data-toggle="modal"  >הרשם</a>
        <a class="btn pull-left btn-inverse btn-large" href="#myModal">מוביל&nbsp;</a>
    </div>
</div>
%{--=============--}%


<div class="modal hide" id="loginModal" role="dialog">


    <div class="well">
        <legend>Sign in to WebApp</legend>
        <form action='${postUrl}' method='POST' id="loginForm" name="loginForm" autocomplete='off'>

            <div class="alert alert-block alert-error fade in">
                <a class="close" data-dismiss="alert" href="#">&times;</a>Incorrect Username or Password!
            </div>
            <input  class="span3" type="text" placeholder="שם משתמש" name="j_username" id="username"  />
            <input  class="span3" type="password" placeholder="סיסמא" name="j_password" id="password"  />


            <label  class="span3">
                <g:message code='spring.security.ui.login.rememberme'/><input type="checkbox" name="${rememberMeParameter}" id="remember_me" checked="checked" />
            </label> |
            <span class="forgot-link ">
                <g:link controller='register' action='forgotPassword'><g:message code='spring.security.ui.login.forgotPassword'/></g:link>
            </span>
            <label class="checkbox">
            <input type="checkbox" name="remember" value="1"> Remember Me
            </label>
            <div class="modal-footer">
                <input id="loginButton_submit" class="btn btn-primary" type="submit" value="התחבר"></input>
            </div>
        </form>
    </div>

</div>




%{--===========--}%
<div class="login s2ui_center ui-corner-all" style='text-align:center;'>
	<div class="login-inner">
	<form action='${postUrl}' method='POST' id="loginForm" name="loginForm" autocomplete='off'>
	<div class="sign-in">

	<h1><g:message code='spring.security.ui.login.signin'/></h1>

	<table>
		<tr>
			<td><label for="username">Email</label></td>
			<td><input name="j_username" id="username" size="20" /></td>
		</tr>
		<tr>
			<td><label for="password"><g:message code='spring.security.ui.login.password'/></label></td>
			<td><input type="password" name="j_password" id="password" size="20" /></td>
		</tr>
		<tr>
			<td colspan='2'>
				<input type="checkbox" class="checkbox" name="${rememberMeParameter}" id="remember_me" checked="checked" />
				<label for='remember_me'><g:message code='spring.security.ui.login.rememberme'/></label> |
				<span class="forgot-link">
					<g:link controller='register' action='forgotPassword'><g:message code='spring.security.ui.login.forgotPassword'/></g:link>
				</span>
			</td>
		</tr>
		<tr>
			<td colspan='2'>
				<s2ui:linkButton elementId='register' controller='register' params="[userType:'Customer']" messageCode='register as a customer'/>
                <s2ui:linkButton elementId='registerc' controller='register' params="[userType:'Carrier']" messageCode='register as Carrier' />
				<s2ui:submitButton elementId='loginButton' form='loginForm' messageCode='spring.security.ui.login.login'/>
			</td>
		</tr>
	</table>

	</div>
	</form>
	</div>
</div>

<script>
$(document).ready(function() {
	$('#username').focus();
});

<s2ui:initCheckboxes/>

</script>
<r:layoutResources/>
</body>
</html>




