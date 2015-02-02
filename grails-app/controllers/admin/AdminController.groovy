package admin
import grails.converters.*
import groovy.json.*
import groovy.xml.MarkupBuilder
import grails.web.Action
//import org.codehaus.groovy.grails.documentation.DocumentedMethod
import grails.web.Action

        
class AdminController {   
    def grailsApplication
    
    def index() {redirect(action: "menu", params: params) }
    
    def menu() { 
        def html = """
            <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
            <html>
            <head>
              <meta content="text/html; charset=ISO-8859-1"
             http-equiv="content-type">
              <title>admin</title>
            </head>
            <body>
            <div style="text-align: left;">\n\
                <big style="color: rgb(12, 59, 150);"><big><big>\n\
                <span style="font-family: Calibri; font-weight: bold;">PRODUCTS<br></span>\n\
                <span style="font-family: Calibri;">Admin menu</span></big></big></big><br>
            </div>
            <br>
            <ol>
              <li><a href="XSD" target="_blank">Data
            Model in XML Schema[1]</a></li>
              <li><a href="JSD" target="_blank">Data
            Model in JSON Schema[1]</a></li>
              <li><a href="relationsDiagram" target="_blank">Relations
            Diagram</a></li>
              <li><a href="actionsByController" target="_blank">Actions
            by Controller [2]</a></li>\n\
            <li><a href="listMethods" target="_blank">List of easily available Methods</a></li>
            </ol>
                [1] You can address specific domain class by appending: 
                <big><span style="font-weight: bold;">?ClassName={classname}</span><br></big>\n\
                [2] You can address specific controller by appending: 
                <big><span style="font-weight: bold;">?ControllerName={controllername}</span></big><br>
            </body>
            </html>
        """
        render (html)
    }

    
    def RelationsDiagram() {
        // check if internet connection is available
        URL html = new URL('http://yuml.me');
        URLConnection urlConnection = html.openConnection();
        try {
            urlConnection.connect()
        }
        catch(e1) {
            println e1.message
        }
        // if there is internet connection ask yUML.me to draw the diagram, else use the local image
        if (urlConnection.connected) {
            def domainClasses = grailsApplication.getArtefacts("Domain")
            def classes = ''
            def classrelation = ''
            def relationships = ''
            def proType = ''
            domainClasses.each { domainClass ->
                def relations = "" // [$domainClass.name], "  // Include those are not part of relations
                def classDef = ""
                domainClass.properties.each{prop ->
                    proType = resolveName(prop.type.toString())
                        if (prop.isAssociation()){
                            // if its association only show the owning side
                            if(!prop.isBidirectional() || prop.isOwningSide() || proType == domainClass.name )
                                classrelation = getRelationship(domainClass.name, prop)
                                if (!relationships.contains(classrelation) && !relations.contains(classrelation)) {
                                    relations = "$relations \n$classrelation" 
                                }
                        } else {
                            // Domain class properties 
                            classDef += '\n' + resolveName(prop.getType().getName()) + ' ' + prop.name + ';' 
                        }
                }
                if (!relationships.contains(relations.trim())){
                    relationships += relations
                }
            } 
            // Include those are not part of relations (orphans)
            domainClasses.each { domainClass ->
                if (!relationships.contains(domainClass.name.trim())) {
                    relationships += "[$domainClass.name],"  
                }
            }
            redirect(url: "http://yuml.me/diagram/nofunky;dir:TD/class/draw2/" + classes + relationships)            
        }
        else {
            // Show the local diagram
            def reldiagram = """
                <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
                <html>
                <head>
                  <meta content="text/html; charset=ISO-8859-1"
                 http-equiv="content-type">
                  <title></title>
                </head>
                <body>\n\
                <img src="${resource(dir: 'images', file: 'RelationsDiagram.png')}" 
                     alt="Relations Diagram of Commons entites "/><br>
                </body>
                </html>
            """ 
            render (reldiagram)
        }        
    }

    
    private String getRelationship(name, prop){
        def temp = ''
        def association = ''
        if (prop.isOneToMany()){
            association = prop.isOptional() ? '1-0..*>':'1-1..*>'
        } else if (prop.isOneToOne()){
            association = prop.isOptional() ? '1-0..1>':'1-1>'
        } else if (prop.isManyToMany()){
            association = prop.isOptional() ? '*-*>':'1..*-1..*>'
        }
        if(prop.isBidirectional()){
            association = '<' + association
        }  
//        "[${name}]${association}[${prop.type}],"   
        "[${name}]${association}[${resolveName(prop.getReferencedPropertyType().getName())}]," 
    }
    
    
    def DataModelInJSON() {redirect action:"JSD"}
    
    def JSD (String ClassName) {
        def appName = grailsApplication.metadata['app.name']
        def cons
//        println "appName: $appName" 
        def domains = grailsApplication.getArtefacts("Domain").sort{it.name}
        def jschema = new JsonBuilder()
        jschema."$appName"{
        domains.each { c -> 
            if (ClassName==null || "$c.name"==ClassName){
                "$c.name" { 
//                     println "--$c.name"
                     c.properties.each { p ->  
//                         println "---property: $p.name"
                        "$p.name" {           
                                //http://grails.org/doc/latest/api/org/codehaus/groovy/grails/commons/DefaultGrailsDomainClassProperty.html
//                                type "$p.typePropertyName" 
                                type  p.getReferencedPropertyType().getName().substring(p.getReferencedPropertyType().getName().lastIndexOf('.')+1)
                                if(!p.isBidirectional() || p.isOwningSide()) {
                                   if (p.isOneToMany()){           //  '1-0..*>':'1-1..*>'
                                       minOccurs "0" 
                                       maxOccurs "unbounded"
                                   } else if (p.isOneToOne()){     //  '1-0..1>':'1-1>'
                                       minOccurs "1" 
                                       maxOccurs "1"
                                   } else if (p.isManyToMany()){   //  '*-*>':'1..*-1..*>'
                                       minOccurs "0" 
                                       maxOccurs "unbounded"                                       
                                   } else if (["id", "lastUpdated", "dateCreated", "version", "recStatus"].contains(p.name))
                                       readOnly true
                                }  
                                if (p.optional) {
                                    optional true
                                    }
//                                    else {
//                                        optional false
//                                    }
                                if (p.derived) {
                                    derived true
                                }
//                                p.getAppliedConstraints().each {println "$it"}
                            }
                        }                        
                    }                  
                }
//                c.constrainedProperties.each {con ->
//                    println "constraint:  $con.getPropertyName()"
//                    cons = con.getSize()
//                    println "--isNullable: $con.getAppliedConstraint('nullable')" 
//                                if (con.isNullable()) {
//                                        isNullable true
//                                }
//                }  
            }
        }
        render jschema.toPrettyString()
    }

    def DMxml() {
        redirect(action: "XSD", params: params)
    }
    
    def DataModelInXML() {
        redirect(action: "XSD", params: params)
    }

    def XSD (String ClassName) {
        def appName = grailsApplication.metadata['app.name']
        def className = ClassName?.capitalize()
        def writer = new StringWriter()
        def schema = new MarkupBuilder(writer)        
        def domains = grailsApplication.getArtefacts("Domain").sort{it.name}
        def str = ""
        def ptype = []
        schema."xs:component" (name: "$appName") {
            domains.each { c ->
                if (className== null || "$c.name"==className){
//                    println "complexType: $c.name"
                    schema."xs:complexType" (name: "${c.name}") {
                      schema."xs:sequence" { 
                        c.properties.each { p ->
                           switch (p.name) {
                               case ['validationSkipMap', 'gormPersistentEntity', 'gormPersistentEntity', 'properties', 'gormDynamicFinders', 'all', 'domainClass', 'attached']:
                                   break   
                               case ['class', 'constraints', 'validationErrorsMap', 'dirtyPropertyNames', 'metaClass', 'errors', 'dirty', 'beforeInsert', 'beforeUpdate'] :
                                   break
                               default:
//                                   str = resolveName(p.getReferencedPropertyType().getName())
//                                   str = p.getReferencedPropertyType().getName().substring(p.getReferencedPropertyType().getName().lastIndexOf('.')+1)
                                   str = "$p.typePropertyName" 
                                   if (p.isAssociation()){
                                       // if its association only show the do the owning side
                                       if(!p.isBidirectional() || p.isOwningSide()) {
                                           if (p.isOneToMany()){           //  '1-0..*>':'1-1..*>'
                                               "xs:element"(name:"${p.name}", type:"${str}", minOccurs:"0", maxOccurs:"unbounded") 
                                           } else if (p.isOneToOne()){     //  '1-0..1>':'1-1>'
                                               "xs:element"(name:"${p.name}", type:"${str}", minOccurs:"1", maxOccurs:"1")
                                           } else if (p.isManyToMany()){   //  '*-*>':'1..*-1..*>'
                                               "xs:element"(name:"${p.name}", type:"${str}", minOccurs:"0", maxOccurs:"unbounded")
                                           }
                                           break
                                           }
                                           else { // not bidirectional ...
                                           }
                                   } else {
//                                           println  p.name + ' ' +resolveName(p.getType().getName()) +  ';'
                                       }    

                                   switch ( str ) {
                                       case "string":
                                           "xs:element"(name: "${p.name}", type:"xs:string", optional:"$p.optional")
                                           break
                                       case "long" :
                                           "xs:element"(name:"${p.name}", type:"xs:long", optional:"$p.optional")
                                           break
                                       case "integer" :
                                           "xs:element"(name:"${p.name}", type:"xs:integer", optional:"$p.optional")
                                           break                    
                                       case "date" :
                                           "xs:element"(name:"${p.name}", type:"xs:date", optional:"$p.optional")
                                           break     
                                       case "boolean" :
                                           "xs:element"(name:"${p.name}", type:"xs:boolean", optional:"$p.optional")
                                           break
                                       case "set" :
                                           "xs:element"(name:"${p.name}", type:"xs:boolean", optional:"$p.optional")
                                           break
                                       default:
//                                               println "$p.name $p.type ($str)"
                                           "xs:element"(name:"${p.name}", type:"${str}", optional:"$p.optional")   
                                   }
                           }
                    }
                   }
                 }
                }
            }
        }
         def xsd = '<?xml version="1.0" encoding="ISO-8859-1" ?>\n<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">\n' + writer.toString() + '\n</xs:schema>'   
         render xsd
    }
          
    
    def listMethods() {
        def myMap =[:]
        def myMethods
        def domains = grailsApplication.getArtefacts("Domain")
        domains.each {domain -> 
            if (params.domain==null || domain.name==params.domain){
                myMethods = domain.metaClass.methods*.name.sort().unique()
//                myMethods += ["TotalDynamicMethods" : "$myMethods.size" ]
                myMap["TotalDynamicMethodsFor_" + "$domain.name"]=myMethods.size
                myMap["$domain.name"]= myMethods
            } 
        }
        withFormat{
            json {render myMap as JSON}
            xml {render myMap as XML}
        }
    }  
      
    def actionsByController(String ControllerName)  {
        def componentName = grailsApplication.metadata['app.name']
        def jactions = new JsonBuilder()
        jactions."$componentName"{    
            def x = request.getRequestURL()  
            links {
                hostApp x.substring(0,x.indexOf('.dispatch')) - '/grails' - '/admin/' - "$params.action" 
                self x.substring(0,x.indexOf('.dispatch')) - '/grails'  
            }             
            grailsApplication.controllerClasses.each {cc ->    
            String controller = cc.logicalPropertyName

            if (ControllerName==null || ControllerName.toLowerCase()==controller) {
                "$controller" {                   
                    cc.clazz.methods.each { m->
                        String action = m.name 
                        def ann = m.getAnnotation(Action)
                        if (ann) { 
                            Class[] argTypes = ann.commandObjects()
                            "$action" "/${controller}/$action(${argTypes*.name.join(', ')})" - 'entities.' - '()'
                        }
                    }
                 }
            }
          }
       }   
       render jactions.toPrettyString()
    }
    
    def GetActions() {
       def List<String> actions = entities.Currency.methods.findAll({ it.getAnnotation(Action) })*.name
       render actions as JSON
    }
    
    private resolveName(def name){
        // remove bracket if an array
        if(name.lastIndexOf('[') > -1){
            name = name.replace('[','');
        }
        // remove package name
        if (name.lastIndexOf('.') > -1){
            return name.substring(name.lastIndexOf('.')+1)
        }
        return name
    }      
}