<%@ page import="sheepers.Profile" %>

<div class="container-fluid pull-right" dir="rtl">
       <div class="row-fluid">
           <div style="margin-bottom: 30px" class="fieldcontain ${hasErrors(bean: profileInstance, field: 'perName', 'error')} ">
               <label for="perName">
        שם פרטי ומשפחה:
               </label>
               <g:textField name="perName" value="${profileInstance?.perName}"/>
           </div>

           <div style="margin-bottom: 30px" class="fieldcontain ${hasErrors(bean: profileInstance, field: 'userPhoneNumber', 'error')} ">
	                <label for="userPhoneNumber">
		מספר טלפון:
	                </label>
	                <g:textField name="userPhoneNumber" value="${profileInstance?.userPhoneNumber}"/>
            </div>

           <div style="margin-bottom: 30px" class="fieldcontain ${hasErrors(bean: profileInstance, field: 'perAdd', 'error')} ">
               <label for="perAdd">
                   כתובת:
               </label>
               <g:textField name="perAdd" value="${profileInstance?.perAdd}"/>
           </div>


           <g:if test="${profileInstance?.userType == 'Carrier'}">
               <div style="margin-bottom: 30px" class="fieldcontain ${hasErrors(bean: profileInstance, field: 'aboutTxt', 'error')} ">
                        <label for="aboutTxt">
                                                            כמה מילים על עצמך:
                        </label>
                        <g:textArea cols="1" rows="15" name="aboutTxt" value="${profileInstance?.aboutTxt}"/>
                </div>

               <div id="bootstrapped-fine-uploader"></div>

           </g:if>

       </div>
</div>

<r:script>
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

</r:script>