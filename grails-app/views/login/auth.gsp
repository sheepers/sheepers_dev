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
        <span class="label label-success ">יש לך משאית ? הרשם כאן</span>
        <p></p>
        <a class="btn pull-right btn-primary btn-large" href="#loginModal" role="button" data-backdrop="true"  data-toggle="modal"  >הכנס</a>
        <a class="pull-right facebook well-small" href="#" ><h5> הכנס עם פייסבוק</h5></a>
        %{--<a class="btn btn-success btn-large offset7" href="#myModal">מוביל&nbsp;</a>--}%
        <s2ui:linkButton class="btn signup-btn btn-large " elementId='register' controller='register' params="[userType:'Carrier']" messageCode='הרשמה למובילים' />
    </div>
</div>
%{--=============--}%


<div class="modal hide fade" id="loginModal" role="dialog">


    <div class="well">
        <legend> להמשך, אנא מלא פרטיך </legend>
        <form action='${postUrl}' method='POST' id="loginForm" name="loginForm" autocomplete='off' >

            %{--<div class="alert alert-block alert-error fade in">--}%
                %{--<a class="close" data-dismiss="alert" href="#">&times;</a>Incorrect Username or Password!--}%
            %{--</div>--}%
            <input  class="span3" type="text" placeholder="שם משתמש" name="j_username" id="username"  />
            <input  class="span3" type="password" placeholder="סיסמא" name="j_password" id="password"  />


            %{--<label  class="span3">--}%
                %{--<g:message code='spring.security.ui.login.rememberme'/><input type="checkbox" name="${rememberMeParameter}" id="remember_me" checked="checked" />--}%
            %{--</label> |--}%
            <span class="forgot-link ">
                <g:link controller='register' action='forgotPassword'>שכחתי סיסמא</g:link>
            </span>
            <label class="checkbox">
            <input type="checkbox" name="${rememberMeParameter}" id="remember_me" checked="checked"> זכור אותי
            </label>
            <div class="modal-footer">
                <s2ui:linkButton elementId='register' controller='register' params="[userType:'Carrier']" messageCode='הרשם כמוביל' />
                %{--<s2ui:submitButton class="btn btn-primary" elementId='loginButton' form='loginForm' messageCode='הכנס'/>--}%
                <s2ui:linkButton class="btn signup-btn" elementId='register' controller='register' params="[userType:'Customer']" messageCode='הרשם'/>
                <input id="loginButton_submit" class="btn btn-primary" type="submit" value="הכנס "/>
            </div>
        </form>
    </div>

</div>

<!--begin footer -->
<footer class="footer">
    <div class="container">
        <!--footer container-->
        <div class="row-fluid">
            <div class="span3">
                <section>
                    <h4><span>Contact Us</span></h4>
                    <p>Corporate-Elegance Creative<br>
                        1255 Nowhere Street<br>
                        Tampa, FL 33655<br>
                        <strong>phone:</strong> <a href="tel:8135551234" class="tele">813.555.1234</a><br>
                        <strong>fax:</strong> 813.555.1235<br>
                        <span class="overflow"><strong>email:</strong> <a href="mailto:email@domain.com">email@companydomain.com</a></span> </p>
                </section>
                <!--close section-->

                <section>
                    <h4><span>Follow Us</span></h4>
                    <ul class="social">
                        <li><a data-original-title="RSS" class="fc-webicon rss round" href="#" title=""></a></li>
                        <li><a data-original-title="Facebook" class="fc-webicon facebook round" href="#" title=""></a></li>
                        <li><a data-original-title="Twitter" class="fc-webicon twitter round" href="#" title=""></a></li>
                        <li><a data-original-title="Skype" class="fc-webicon skype round" href="#" title=""></a></li>
                        <li><a data-original-title="dribble" class="fc-webicon dribbble round" href="#" title=""></a></li>
                        <li><a data-original-title="Skype" class="fc-webicon linkedin round" href="#" title=""></a></li>
                    </ul>
                </section>
                <!--close section-->
            </div>
            <!-- close .span3 -->

            <!--section containing newsletter signup and recent images-->
            <div class="span5">
                <section>
                    <h4><span>Stay Updated</span></h4>
                    <p>Sign up for our newsletter. We won't share your email address.</p>
                    <form action="yourscript.php" method="post">
                        <div class="input-append append-fix custom-append row-fluid">
                            <input class="span8" placeholder="Email Address" name="email" type="email">
                            <button class="btn btn-primary">Sign Up</button>

                        </div></form>
                    <!--close input-append-->
                </section>
                <!--close section-->

                <section>
                    <h4><span>Recent Images</span></h4>
                    <ul class="image-widget clearfix">
                        <li class=""><a href="#"><img src="demo/image-widget/1.png" alt=""></a></li>
                        <li class=""><a href="#"><img src="demo/image-widget/2.png" alt=""></a></li>
                        <li class=""><a href="#"><img src="demo/image-widget/3.png" alt=""></a></li>
                        <li class=""><a href="#"><img src="demo/image-widget/4.png" alt=""></a></li>
                        <li class=""><a href="#"><img src="demo/image-widget/5.png" alt=""></a></li>
                        <li class=""><a href="#"><img src="demo/image-widget/6.png" alt=""></a></li>
                        <li class=""><a href="#"><img src="demo/image-widget/7.png" alt=""></a></li>
                        <li class=""><a href="#"><img src="demo/image-widget/8.png" alt=""></a></li>
                        <li class=""><a href="#"><img src="demo/image-widget/9.png" alt=""></a></li>
                        <li class=""><a href="#"><img src="demo/image-widget/10.png" alt=""></a></li>
                        <li class=""><a href="#"><img src="demo/image-widget/11.png" alt=""></a></li>
                        <li class=""><a href="#"><img src="demo/image-widget/12.png" alt=""></a></li>
                    </ul>
                </section>
                <!--close section-->
            </div>
            <!-- close .span5 -->

            <!--section containing blog posts-->
            <div class="span4">
                <section>
                    <h4><span>About Us</span></h4>
                    <p>Immortal robot bodies are the new rage. Religion can’t provide immortal robot bodies. Flying heads in bubbles are also popular. The cost of preserving a head is much less than the entire body and at least you can keep your face. But with the immortal robot, after you die, your soul or spirit is digitized and your flesh body rots, but you don’t care, ‘cause having an immortal robot body is ultra cool and sexy. While you’re still on earth, your immortal robot body sits in storage ready for the fateful day. You betcha, it does provide peace of mind or piece of mind. <span class="small">© Christina Arasmo Beymer (me).</span></p>
                </section>
            </div>
            <!-- close .span4 -->
        </div>
        <!-- close .row-fluid-->
    </div>
    <!-- close footer .container-->
</footer>
<!--/close footer-->

<!--change this to your stuff-->
<section class="footer-credits">
    <div class="container">
        <ul class="clearfix">
            <li>© 2013 Your Company Name. All rights reserved.</li>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
        </ul>
    </div>
    <!--close footer-credits container-->
</section>
<!--close section .footer-credits-->
<span style="display: none;" class="backToTop"><a href="#top"><i class="e-icon-up-open-big"></i></a></span>
</div>
<!-- close #page-->



%{--===========--}%
%{--original form--}%
%{--<div class="login s2ui_center ui-corner-all" style='text-align:center;'>--}%
	%{--<div class="login-inner">--}%
	%{--<form action='${postUrl}' method='POST' id="loginForm" name="loginForm" autocomplete='off'>--}%
	%{--<div class="sign-in">--}%

	%{--<h1><g:message code='spring.security.ui.login.signin'/></h1>--}%

	%{--<table>--}%
		%{--<tr>--}%
			%{--<td><label for="username">Email</label></td>--}%
			%{--<td><input name="j_username" id="username" size="20" /></td>--}%
		%{--</tr>--}%
		%{--<tr>--}%
			%{--<td><label for="password"><g:message code='spring.security.ui.login.password'/></label></td>--}%
			%{--<td><input type="password" name="j_password" id="password" size="20" /></td>--}%
		%{--</tr>--}%
		%{--<tr>--}%
			%{--<td colspan='2'>--}%
				%{--<input type="checkbox" class="checkbox" name="${rememberMeParameter}" id="remember_me" checked="checked" />--}%
				%{--<label for='remember_me'><g:message code='spring.security.ui.login.rememberme'/></label> |--}%
				%{--<span class="forgot-link">--}%
					%{--<g:link controller='register' action='forgotPassword'><g:message code='spring.security.ui.login.forgotPassword'/></g:link>--}%
				%{--</span>--}%
			%{--</td>--}%
		%{--</tr>--}%
		%{--<tr>--}%
			%{--<td colspan='2'>--}%
				%{--<s2ui:linkButton elementId='register' controller='register' params="[userType:'Customer']" messageCode='register as a customer'/>--}%
                %{--<s2ui:linkButton elementId='register' controller='register' params="[userType:'Carrier']" messageCode='register as Carrier' />--}%
				%{--<s2ui:submitButton elementId='loginButton' form='loginForm' messageCode='spring.security.ui.login.login'/>--}%
			%{--</td>--}%
		%{--</tr>--}%
	%{--</table>--}%

	%{--</div>--}%
	%{--</form>--}%
	%{--</div>--}%
%{--</div>--}%
%{--=======================--}%
<script>
$(document).ready(function() {
	$('#username').focus();
    });

<s2ui:initCheckboxes/>

</script>
<r:layoutResources/>
</body>
</html>




