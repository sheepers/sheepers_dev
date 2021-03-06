<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
    <head>
        <meta charset="utf-8">
        <title>Sheepers</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Le styles -->

        <link href="/sheepers/css/datepicker.css" rel="stylesheet">
        <link href="/sheepers/css/bootstrap.css" rel="stylesheet">
        <link href="/sheepers/css/layout.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">


        <style>
        body {
            padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
        }
        </style>
        <link href="/sheepers/css/bootstrap-responsive.css" rel="stylesheet">


        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
        <link rel="shortcut icon" href="../assets/ico/favicon.png">

        <g:layoutHead/>

    </head>

    <body>
     <div class="navbar navbar-inverse navbar-fixed-top">
         <div class="navbar-inner">
             <div class="container">

                 <!--<a class="pull-left"  href="#"><img class="img-circle"  src="${resource(dir: 'images', file: 'sheeps.jpg')}"></a>-->

                 %{--<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">--}%
                     %{--<span class="icon-bar"></span>--}%
                     %{--<span class="icon-bar"></span>--}%
                     %{--<span class="icon-bar"></span>--}%
                 %{--</a>--}%

                 <a class="brand pull-right" href="/sheepers/user/dash">Sheepers</a>
                 <div class="nav-collapse collapse">
                 <p class="navbar-text pull-left">
                     <sec:ifLoggedIn>
                          <a href="/sheepers/profile/show" class="navbar-link"><sec:username/></a> :ברוך הבא
                     </sec:ifLoggedIn>
                     <sec:ifNotLoggedIn>
                             שלום אורח
                         </p>
                     </sec:ifNotLoggedIn>
                     <ul class="nav pull-right">
                         <li>
                             <a href="#">צור קשר <i class="icon-envelope icon-white"></i></a>
                         </li>
                         <li>
                             <a href="#">מי אנחנו <i class="icon-heart icon-white"></i></a>
                         </li>
                         <li >
                             <a href="#">בית <i class="icon-home icon-white"></i></a>
                         </li>
                     </ul>
                 </div><!--/.nav-collapse -->
             </div>
         </div>
     </div>

   <!--
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container">
                <a class="brand" href="/sheepers/user/dash">Sheepers</a>
                <div class="navbar-content">
                    <ul class="nav pull-right">
                        <li>
                            <a href="#">צור קשר</a>
                        </li>
                        <li>
                            <a href="#">מי אנחנו</a>
                        </li>
                        <li class="active">
                            <a href="#">בית</a>
                        </li>
                    </ul>
                    <p class="navbar-text pull-left">
                         <a href="../profile/show" class="navbar-link"><sec:username/></a>
                    </p>
                </div>
            </div>
        </div>
    </div>
    -->
    <g:layoutBody/>

    <!-- Le javascript
   ================================================== -->
     <!-- Placed at the end of the document so the pages load faster -->

	<!--	<div id="grailsLogo" role="banner"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'sheeps.jpg')}" alt="Grails"/></a></div>-->


	</body>

</html>
