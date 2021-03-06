<%@ page import="sheepers.Auction" %>
<!DOCTYPE html>
<html>
<head>
    <g:set var="entityName" value="${message(code: 'auction.label', default: 'Auction')}" />
    <script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places&language=he&region=il"></script>
    <meta name="layout" content="main">

    %{--<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>--}%
    %{--<link href="/css/fineuploader.css" rel="stylesheet">--}%
    %{--<style>--}%
    %{--/* Fine Uploader--}%
    %{---------------------------------------------------- */--}%
    %{--.qq-upload-list {--}%
    %{--text-align: left;--}%
    %{--}--}%

    %{--/* For the bootstrapped demos */--}%
    %{--li.alert-success {--}%
    %{--background-color: #DFF0D8;--}%
    %{--}--}%

    %{--li.alert-error {--}%
    %{--background-color: #F2DEDE;--}%
    %{--}--}%

    %{--.alert-error .qq-upload-failed-text {--}%
    %{--display: inline;--}%
    %{--}--}%
    %{--</style>--}%
    %{--<meta name="layout" content="main">--}%
    %{--<r:require module="application"/>--}%
    %{--<r:require module="fileuploader"/>--}%
    <r:require module="application"/>
    <r:require module="forms"/>
    <r:require module="upload"/>
    <r:layoutResources/>
</head>
<body>

%{--<div class="container-fluid">--}%
<div id="create-auction"  dir="rtl" role="main">
%{--<h1><g:message code="default.create.label" args="[entityName]" /></h1>--}%
%{--<div class="page-header">--}%
%{--<h1 dir="rtl" >זה מה שיש לי להוביל </h1>--}%
%{--</div>--}%
    <div class="span9 pull-right">
    <g:if test="${flash.message}">
        <div class="message row-fluid" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${auctionInstance}">
        <ul class="errors text-error row-fluid" role="alert">
            <g:eachError bean="${auctionInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <g:form method="post"  >
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>

        <fieldset class="buttons">
            %{--<div class="pull-right">--}%
            <div id="bootstrapped-fine-uploader"></div>
            %{--</div>--}%

            <g:actionSubmit  class="btn btn-primary pull-right"  action="save" id="save" value="צור חדש"/>
        </fieldset>

    </g:form>
    </div>
</div>
%{--</div>--}%


%{--<script src="../js/jquery.fineuploader-3.5.0.js"></script>--}%
%{--<script src="../js/bootstrap.js"></script>--}%
<r:script>
    $(document).ready(function () {
         //Handle Datepicker
        $('#null_date').datepicker().on('changeDate',function(){
            $('#null_date').datepicker('hide');
        });

        // Handle Google



        var options = {
//           types: ['(cities)'],
            componentRestrictions: {country: 'il'}
        };

        var fromInput = document.getElementById("null_fromAdr");
        var fromAutocomplete = new google.maps.places.Autocomplete(fromInput,options);
        var toInput = document.getElementById("null_toAdr");
        var toAutocomplete = new google.maps.places.Autocomplete(toInput, options);



        google.maps.event.addListener(fromAutocomplete, 'place_changed', function() {
            var place = fromAutocomplete.getPlace();
            if (!place.geometry) {
                // Inform the user that the place was not found and return.
                fromAutocomplete.className = 'notfound';
                return;
            }
            $('#null_fromAdrLat').val(place.geometry.location.lat());
            $('#null_fromAdrLng').val(place.geometry.location.lng());
        });

        google.maps.event.addListener(toAutocomplete, 'place_changed', function() {
            var place = toAutocomplete.getPlace();
            if (!place.geometry) {
                // Inform the user that the place was not found and return.
                toAutocomplete.className = 'notfound';
                return;
            }
            $('#null_toAdrLat').val(place.geometry.location.lat());
            $('#null_toAdrLng').val(place.geometry.location.lng());

        });

//Uploader
        var uploader = new qq.FineUploader({
            element: document.getElementById('bootstrapped-fine-uploader'),

            request: {
                endpoint: '../image/upload'
            },
            validation: {
                allowedExtensions: ['jpeg', 'jpg', 'img']
//                sizeLimit: 51200 // 50 kB = 50 * 1024 bytes
            },
            text: {
                uploadButton: '<div> ...הוסף תמונות <i class="icon-plus icon-white"></i></div>',
                retryButton:  '',
                deleteButton: ''

            },
            template: '<div class="qq-uploader">' +
                    '<div class="qq-upload-button btn btn-success pull-right">{uploadButtonText}</div>' +
                    '<ul  class="qq-upload-list span4" style="margin-top: 10px; text-align: center;"></ul>' +
                    '</div>',
//                fileTemplate: '<li  class="span2">' +
//                        '<span class="qq-upload-file"></span>' +
//                        '<span class="qq-upload-size"></span>' +
//                        '<span class="qq-upload-thumbnail"></span>' +
//                        '<div class="thumbnail"> <img src="../images/grails_logo.jpg" alt="160x120"></div>' +
//                        '</li>',

            classes: {
                success: 'alert alert-success',
                fail: 'alert alert-error'


            }
//            callbacks: {
//                onComplete: function(id, fileName, responseJSON) {
//                    if (responseJSON.success) {
//                        $('#sample').append('<li class="span2">' +
//                                '<div class="thumbnail">' +
//                                '<img src="../images/grails_logo.jpg" class="img-rounded" alt="' + fileName + '">' +
//                                '</div>' +
//                                '</li>');
//                    }
//
//                }}
        });
    });



</r:script>
<r:layoutResources/>
</body>
</html>
