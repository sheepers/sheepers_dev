grails.servlet.version = "3.0" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.tomcat.nio = true
//grails.glassfish.websocket = true

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()

        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        //mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
    }
    dependencies {
        compile('org.atmosphere:atmosphere-runtime:1.0.0.beta5') {
            excludes 'slf4j-api', 'atmosphere-ping'
        }
        compile 'org.imgscalr:imgscalr-lib:4.2'
//        build ":glassfish:0.1.2"
/*        build("org.apache.tomcat:tomcat-catalina-ant:$grailsVersion") {
        transitive = false
    }
    build "org.apache.tomcat.embed:tomcat-embed-core:$grailsVersion"
    build "org.apache.tomcat.embed:tomcat-embed-jasper:$grailsVersion"
    build "org.apache.tomcat.embed:tomcat-embed-logging-log4j:$grailsVersion"

*/
//        build 'org.slf4j:slf4j-api:1.6.6'
//        build 'org.slf4j:slf4j-log4j12:1.6.6'
//
//        build 'org.glassfish.main.extras:glassfish-embedded-all:3.1.2'
    }

    plugins {
        runtime ":hibernate:$grailsVersion"
        runtime ":jquery:1.8.3"
        runtime ":resources:1.1.6"
        runtime (":atmosphere:0.4.2.3"){
            exclude 'atmosphere-runtime'
        }

        // Uncomment these (or add new ones) to enable additional resources capabilities
        //runtime ":zipped-resources:1.0"
        //runtime ":cached-resources:1.0"
        //runtime ":yui-minify-resources:0.1.4"

        build ":tomcat:$grailsVersion"

        runtime ":database-migration:1.2.1"

//        compile ":ajax-uploader:1.1"
        compile ':cache:1.0.1'
    }
}
