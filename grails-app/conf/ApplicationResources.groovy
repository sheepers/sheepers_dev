modules = {
    application {
        dependsOn 'jquery, jquery-ui'
        resource url:'/js/application.js'
        resource url:'/js/jquery.metadata.js'
        resource url:'/js/jquery.ui.writetable.js'

    }
    bootstrap{

        resource url:'/js/bootstrap.min.js'
        resource url:'/js/bootstrap.js'
        resource url:'/js/bootstrap-datepicker.js'

    }
}