
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
         <span class="span6"/>
        <div class="pull-right"><h1> ${profileInstance?.perName}</h1></div>
    </header>
    <div class="container-fluid">
		<div id="show-profile" class="row-fluid content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
            </g:if>

            <g:if test="${profileInstance?.userType}='Carrier">

                <div class="pull-left span6" id="profImg"></div>
            </g:if>

            <g:if test="${profileInstance?.perAdd}">
                <div class="fieldcontain span6 pull-right">

                    <div class="property-value pull-right" ><h3><g:fieldValue bean="${profileInstance}" field="perAdd"/></h3></div>

                </div>
            </g:if>
            <g:if test="${profileInstance?.userPhoneNumber}">
				<div class="fieldcontain span6  pull-right">
						<div class="property-value pull-right" ><h3><g:fieldValue bean="${profileInstance}" field="userPhoneNumber"/></h3></div>
					
				</div>
				</g:if>
                <div class="fieldcontain span6  pull-right">
                    <div class="property-value pull-right" ><h3><g:fieldValue bean="${profileInstance}" field="user.username"/></h3></div>

                </div>

            <g:if test="${profileInstance?.userType}='Carrier">
                <div class="fieldcontain span6  pull-right">
                    <span class="property-value pull-right" ><h3>דירוג המוביל: 3.0   </h3></span>
                    <span class="ratings pull-left">
                        <h3>

                            <span class="icon-star"></span>
                            <span class="icon-star"></span>
                            <span class="icon-star" ></span>
                            <span class="icon-star-empty" ></span>
                            <span class="icon-star-empty" ></span>
                        </h3>
                    </span>
                </div>
                <div class="span6 well-white  pull-right">
                    <span class="pull-right"><h5 dir="rtl">אמינות: </h5></span>
                    <span class="ratings pull-left">
                        <h5>
                            <span class="icon-star"></span>
                            <span class="icon-star"></span>
                            <span class="icon-star" ></span>
                            <span class="icon-star-empty" ></span>
                            <span class="icon-star-empty" ></span>
                        </h5>
                    </span>
                </div>
                <div class="span6 well-white  pull-right">
                    <span class="pull-right"><h5 dir="rtl">מקצועיות:  </h5></span>
                    <span class="ratings pull-left">
                        <h5>
                            <span class="icon-star"></span>
                            <span class="icon-star"></span>
                            <span class="icon-star" ></span>
                            <span class="icon-star" ></span>
                            <span class="icon-star-empty" ></span>
                        </h5>
                    </span>
                </div>
                <div class="span6 well-white  pull-right">
                    <span class="pull-right"><h5 dir="rtl"> יחס והתנהגות: </h5></span>
                    <span class="ratings pull-left">
                        <h5>
                            <span class="icon-star"></span>
                            <span class="icon-star"></span>
                            <span class="icon-star" ></span>
                            <span class="icon-star" ></span>
                            <span class="icon-star-empty" ></span>
                        </h5>
                    </span>
                </div>
                <div class="span6 well-white pull-right">
                    <span class="pull-right"><h5 dir="rtl"> מחיר:  </h5></span>
                    <span class="ratings pull-left">
                        <h5>
                            <span class="icon-star"></span>
                            <span class="icon-star"></span>
                            <span class="icon-star-empty" ></span>
                            <span class="icon-star-empty" ></span>
                            <span class="icon-star-empty" ></span>
                        </h5>
                    </span>
                </div>
                <div class="span12"/>

                <g:if test="${profileInstance?.aboutTxt}">
                    <div class="fieldcontain span6 pull-right">
                        <div class="property-value" ><p ><h4 dir="rtl">${profileInstance.aboutTxt}</h4></p></div>

                    </div>
                </g:if>
                    <div class="span12 pull-right">
                        <h4 dir="rtl">המלצות: </h4>
                    </div>
                    <div class="span12 pull-right well-white">
                       <span class="pull-right"><h5>ואללה היינו מרוצים מאוד מההובלה, מהיר מאד תקתק לנו את הכל באחלה מחיר ושום דבר לא נשבר</h5></span>
                        <ul class="unstyled pull-left">
                        <li>
                            <span class="pull-right" dir="rtl"><h5>דירוג המוביל:</h5></span>
                            <span class="ratings pull-left">
                            <h5>

                                <span class="icon-star"></span>
                                <span class="icon-star"></span>
                                <span class="icon-star" ></span>
                                <span class="icon-star-empty" ></span>
                                <span class="icon-star-empty" ></span>
                            </h5>
                        </span></li>
                          <li>
                              <span class="pull-right span6" dir="rtl" ><h6>אמינות: </h6></span>
                              <span class="ratings pull-left">
                                <h6>
                                    <span class="icon-star"></span>
                                    <span class="icon-star"></span>
                                    <span class="icon-star" ></span>
                                    <span class="icon-star-empty" ></span>
                                    <span class="icon-star-empty" ></span>
                                </h6>
                            </span></li>
                           <li>
                               <span  class="pull-right" dir="rtl"><h6>מקצועיות: </h6></span>
                               <span class="ratings pull-left">
                                <h6>
                                    <span class="icon-star"></span>
                                    <span class="icon-star"></span>
                                    <span class="icon-star" ></span>
                                    <span class="icon-star" ></span>
                                    <span class="icon-star-empty" ></span>

                                </h6>
                            </span></li>
                            <li>
                                <span class="pull-right" dir="rtl"> <h6>יחס והתנהגות: </h6></span>
                                <span class="ratings pull-left">
                                <h6>
                                    <span class="icon-star"></span>
                                    <span class="icon-star"></span>
                                    <span class="icon-star" ></span>
                                    <span class="icon-star" ></span>
                                    <span class="icon-star-empty" ></span>

                                </h6>
                            </span></li>
                            <li>
                            </span><span class="pull-right" dir="rtl"><h6>מחיר:  </h6></span></li>
                                <span class="ratings pull-left">
                                <h6>
                                    <span class="icon-star"></span>
                                    <span class="icon-star"></span>
                                    <span class="icon-star-empty" ></span>
                                    <span class="icon-star-empty" ></span>
                                    <span class="icon-star-empty" ></span>

                                </h6>
                              </span>
                        </ul>
                    </div>
                    <div class="span12 pull-right well-white">
                <span class="pull-right"><h5>ואללה היינו מרוצים מאוד מההובלה, מהיר מאד תקתק לנו את הכל באחלה מחיר ושום דבר לא נשבר</h5></span>
                <ul class="unstyled pull-left">
                    <li>
                        <span class="pull-right" dir="rtl"><h5>דירוג המוביל:</h5></span>
                        <span class="ratings pull-left">
                            <h5>

                                <span class="icon-star"></span>
                                <span class="icon-star"></span>
                                <span class="icon-star" ></span>
                                <span class="icon-star-empty" ></span>
                                <span class="icon-star-empty" ></span>
                            </h5>
                        </span></li>
                    <li>
                        <span class="pull-right span6" dir="rtl" ><h6>אמינות: </h6></span>
                        <span class="ratings pull-left">
                            <h6>
                                <span class="icon-star"></span>
                                <span class="icon-star"></span>
                                <span class="icon-star" ></span>
                                <span class="icon-star-empty" ></span>
                                <span class="icon-star-empty" ></span>
                            </h6>
                        </span></li>
                    <li>
                        <span  class="pull-right" dir="rtl"><h6>מקצועיות: </h6></span>
                        <span class="ratings pull-left">
                            <h6>
                                <span class="icon-star"></span>
                                <span class="icon-star"></span>
                                <span class="icon-star" ></span>
                                <span class="icon-star" ></span>
                                <span class="icon-star-empty" ></span>

                            </h6>
                        </span></li>
                    <li>
                        <span class="pull-right" dir="rtl"> <h6>יחס והתנהגות: </h6></span>
                        <span class="ratings pull-left">
                            <h6>
                                <span class="icon-star"></span>
                                <span class="icon-star"></span>
                                <span class="icon-star" ></span>
                                <span class="icon-star" ></span>
                                <span class="icon-star-empty" ></span>

                            </h6>
                        </span></li>
                    <li>
                    </span><span class="pull-right" dir="rtl"><h6>מחיר:  </h6></span></li>
                    <span class="ratings pull-left">
                        <h6>
                            <span class="icon-star"></span>
                            <span class="icon-star"></span>
                            <span class="icon-star-empty" ></span>
                            <span class="icon-star-empty" ></span>
                            <span class="icon-star-empty" ></span>

                        </h6>
                    </span>
                </ul>
            </div>

                    <div class="span12 pull-right well-white">
                <span class="pull-right"><h5>ואללה היינו מרוצים מאוד מההובלה, מהיר מאד תקתק לנו את הכל באחלה מחיר ושום דבר לא נשבר</h5></span>
                <ul class="unstyled pull-left">
                    <li>
                        <span class="pull-right" dir="rtl"><h5>דירוג המוביל:</h5></span>
                        <span class="ratings pull-left">
                            <h5>

                                <span class="icon-star"></span>
                                <span class="icon-star"></span>
                                <span class="icon-star" ></span>
                                <span class="icon-star-empty" ></span>
                                <span class="icon-star-empty" ></span>
                            </h5>
                        </span></li>
                    <li>
                        <span class="pull-right span6" dir="rtl" ><h6>אמינות: </h6></span>
                        <span class="ratings pull-left">
                            <h6>
                                <span class="icon-star"></span>
                                <span class="icon-star"></span>
                                <span class="icon-star" ></span>
                                <span class="icon-star-empty" ></span>
                                <span class="icon-star-empty" ></span>
                            </h6>
                        </span></li>
                    <li>
                        <span  class="pull-right" dir="rtl"><h6>מקצועיות: </h6></span>
                        <span class="ratings pull-left">
                            <h6>
                                <span class="icon-star"></span>
                                <span class="icon-star"></span>
                                <span class="icon-star" ></span>
                                <span class="icon-star" ></span>
                                <span class="icon-star-empty" ></span>

                            </h6>
                        </span></li>
                    <li>
                        <span class="pull-right" dir="rtl"> <h6>יחס והתנהגות: </h6></span>
                        <span class="ratings pull-left">
                            <h6>
                                <span class="icon-star"></span>
                                <span class="icon-star"></span>
                                <span class="icon-star" ></span>
                                <span class="icon-star" ></span>
                                <span class="icon-star-empty" ></span>

                            </h6>
                        </span></li>
                    <li>
                    </span><span class="pull-right" dir="rtl"><h6>מחיר:  </h6></span></li>
                    <span class="ratings pull-left">
                        <h6>
                            <span class="icon-star"></span>
                            <span class="icon-star"></span>
                            <span class="icon-star-empty" ></span>
                            <span class="icon-star-empty" ></span>
                            <span class="icon-star-empty" ></span>

                        </h6>
                    </span>
                </ul>
            </div>

            </g:if>
		</div>
    </div>

    <r:script>
    $(function(){
                  <g:remoteFunction  id="${profileInstance.id}" action="getProfileImages" controller="image" update="[success:'profImg']" />


        });

    </r:script>
    <r:layoutResources/>
	</body>


</html>


