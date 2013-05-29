
<%@ page import="sheepers.Profile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">

        <g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
        <r:require modules="forms"/>
        <r:require module="upload"/>
        <r:require module="application"/>
        <r:layoutResources/>

    </head>
	<body>
    <header class="page-header pull-right">
         <span class="span12"/>
        <div class="pull-right"><h1> ${profileInstance?.perName}</h1></div>
    </header>
    <div class="container-fluid">
		<div id="show-profile" class="row-fluid content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
            </g:if>

            <g:if test="${profileInstance?.userType}='Carrier">

                <div class="pull-left" id="profImg"></div>
            </g:if>

            <g:if test="${profileInstance?.perAdd}">
                <div class="fieldcontain">

                    <span class="property-value pull-right" ><h3><g:fieldValue bean="${profileInstance}" field="perAdd"/></h3></span>

                </div>
            </g:if>
            <g:if test="${profileInstance?.userPhoneNumber}">
				<div class="fieldcontain">
                        <span class="span12"/>
						<div class="property-value pull-right" ><h3><g:fieldValue bean="${profileInstance}" field="userPhoneNumber"/></h3></div>
					
				</div>
				</g:if>
            <g:if test="${profileInstance?.user.username}">
                <div class="fieldcontain">
                    <span class="span12"/>
                    <div class="property-value pull-right" ><h3><g:fieldValue bean="${profileInstance}" field="user.username"/></h3></div>

                </div>
            </g:if>

            <g:if test="${profileInstance?.userType}='Carrier">
                <g:if test="${profileInstance?.aboutTxt}">
                    <div class="fieldcontain">
                        <span class="span12"/>
                        <div class="property-value pull-right" ><p class="span6"><h4>${profileInstance.aboutTxt}</h4></p></div>

                    </div>

                </g:if>
            </g:if>
		</div>
    </div>
    <r:script>
    $(function(){
                  <g:remoteFunction  action="getImages" controller="image" update="[success:'profImg']" />

        });

    </r:script>
    <r:layoutResources/>
	</body>


</html>


