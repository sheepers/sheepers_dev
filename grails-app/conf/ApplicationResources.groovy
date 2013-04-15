modules = {
    application {
        dependsOn 'jquery, jquery-ui'
        resource url:'/js/application.js'
        resource url:'/js/jquery.metadata.js'
        resource url:'/js/jquery.ui.writetable.js'
        resource url:'/js/bootstrap.js'
        resource url:'/js/bootstrap-datepicker.js'
        resource url:'/js/bootstrap-modal.js'
//        resource url:'/js/bootstrap-tab.js'
//        resource url:'/js/bootstrap-tooltip.js'
    }
}