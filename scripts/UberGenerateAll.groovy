import org.codehaus.groovy.grails.commons.GrailsClassUtils as GCU
import groovy.text.SimpleTemplateEngine
import org.codehaus.groovy.grails.commons.spring.GrailsRuntimeConfigurator;
import org.codehaus.groovy.grails.scaffolding.*
import org.springframework.mock.web.MockServletContext
import org.springframework.core.io.Resource;

Ant.property(environment:"env") 
grailsHome = Ant.project.properties."environment.GRAILS_HOME"

includeTargets << new File ( "${grailsHome}/scripts/Package.groovy" )

generateViews = true
generateController = true

target('default': "The description of the script goes here!") {
    depends( checkVersion, packageApp )
    typeName = "Domain Class"
    doStuff()
}

target(doStuff: "The implementation task") {

    rootLoader.addURL(classesDir.toURL())
    def beans = new grails.spring.WebBeanBuilder().beans {
        resourceHolder(org.codehaus.groovy.grails.commons.spring.GrailsResourceHolder) {
            this.resources = "file:${basedir}/grails-app/domain/**/*.groovy"
        }
        grailsResourceLoader(org.codehaus.groovy.grails.commons.GrailsResourceLoaderFactoryBean) {
            grailsResourceHolder = resourceHolder
        }
        def pluginResources = [] as Resource[]
        if(new File("${basedir}/plugins/*/plugin.xml").exists()) {
            pluginResources = "file:${basedir}/plugins/*/plugin.xml"
        }

        pluginMetaManager(org.codehaus.groovy.grails.plugins.DefaultPluginMetaManager, pluginResources) 
        grailsApplication(org.codehaus.groovy.grails.commons.DefaultGrailsApplication.class, ref("grailsResourceLoader"))
    }
                                                    
    appCtx = beans.createApplicationContext()     
    appCtx.servletContext = new MockServletContext()
    grailsApp = appCtx.grailsApplication 

    grailsApp.initialise()
    def domainClasses = grailsApp.domainClasses

    if(!domainClasses) {
        println "Domain classes not found in grails-app/domain, trying hibernate mapped classes..."     
        try {
            def config = new GrailsRuntimeConfigurator(grailsApp, appCtx) 
            appCtx = config.configure(appCtx.servletContext)                
        } 
        catch(Exception e) {
            println e.message
            e.printStackTrace()
        }
        domainClasses = grailsApp.domainClasses
    }
    
    if(domainClasses) {
        def generator = new DefaultGrailsTemplateGenerator()
        domainClasses.each { domainClass ->
            if(generateViews) {
                event("StatusUpdate", ["Generating views for domain class ${domainClass.fullName}"])                
                generator.generateViews(domainClass,".")                                                        
            }                                                                                     
            if(generateController) {
                event("StatusUpdate", ["Generating controller for domain class ${domainClass.fullName}"])     
                generator.generateController(domainClass,".")             
            }
            event("StatusUpdate", ["Finished generation for domain class ${domainClass.fullName}"])            
        }
        event("StatusFinal", ["Finished generation for domain classes"])
    }
    else {
        event("StatusFinal", ["No domain class found"])
    }
}