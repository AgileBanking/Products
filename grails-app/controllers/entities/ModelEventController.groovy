package entities
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.*
import grails.converters.*

@Transactional(readOnly = true)
class ModelEventController {
    
    static allowedMethods = [
        index:"GET",
        show:'GET',
        edit:['GET', 'POST'],
        save:'POST',
        update:['POST','PUT'],
        delete:['POST','DELETE'],
        undelete:['POST','DELETE'],
        shortList:'GET',
        customeQuery:'GET'
    ]

    def index(Integer max) { 
        println "Hello from INDEX"
        params.max = Math.min(max ?: 10, 100) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize() 
        if (params.recStatus == "All" ) { 
            respond ModelEvent.list(params), model:[modelEventInstanceCount: ModelEvent.count()]
        } 
        else {
            respond ModelEvent.findAllByRecStatus(params.recStatus, params), model:[modelEventInstanceCount: ModelEvent.count()] 
        } 
    }

    def show(ModelEvent modelEventInstance) {
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (params.recStatus != "All" && modelEventInstance.recStatus != params.recStatus) { 
            notFound()
            return
        }            
        respond modelEventInstance
    }

    def create() {
        respond new ModelEvent(params)
    }

    @Transactional
    def save(ModelEvent modelEventInstance) {
        if (modelEventInstance == null) {
            notFound()
            return
        }

        if (modelEventInstance.hasErrors()) {
            respond modelEventInstance.errors, view:'create'
            return
        }

        modelEventInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'modelEventInstance.label', default: 'ModelEvent'), modelEventInstance.id])
                redirect modelEventInstance
            }
            '*' { respond modelEventInstance, [status: CREATED] }
        }
    }

    def edit(ModelEvent modelEventInstance) {
        respond modelEventInstance
    }

    @Transactional
    def update(ModelEvent modelEventInstance) {
        if (modelEventInstance == null) {
            notFound()
            return
        }

        if (modelEventInstance.hasErrors()) {
            respond modelEventInstance.errors, view:'edit'
            return
        }

        modelEventInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ModelEvent.label', default: 'ModelEvent'), modelEventInstance.id])
                redirect modelEventInstance
            }
            '*'{ respond modelEventInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ModelEvent modelEventInstance) {
        //Pretend deletion
        // example: http://localhost:9991/Commons/modelEvent/delete.json?id=2
        if (modelEventInstance == null) {
            notFound()
            return
        }
        modelEventInstance.recStatus="Deleted"
        modelEventInstance.save flush:true
    
        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ModelEvent.label', default: 'ModelEvent'), modelEventInstance.id])
                redirect action:"index", method:"GET"
            }
             '*'{ 
                respond modelEventInstance 
            }
        }
    }
    
    @Transactional 
    def undelete(ModelEvent modelEventInstance) { 
        // example: http://localhost:9991/Commons/modelEvent/undelete.json?id=2
        if (modelEventInstance == null) {
            notFound()
            return
        }
        modelEventInstance.recStatus="Active"
        modelEventInstance.save flush:true 

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ModelEvent.label', default: 'ModelEvent'), modelEventInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ 
              respond modelEventInstance 
            }
        }
    }    

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'modelEventInstance.label', default: 'ModelEvent'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }   
    
    def shortList() {
        // example: <server:port>/Commons/modelEvent/shortList
        params.max = Math.min(params.max ?: 50, 100) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        def modelEventInstance 
        if (params.recStatus == "All" ) { 
            modelEventInstance = ModelEvent.list(params)
        } 
        else {
            modelEventInstance = ModelEvent.findAllByRecStatus(params.recStatus, params)
        } 
        if (modelEventInstance==null) {
            request.withFormat {
                '*'{ render status: NOT_FOUND }
            }
            return
        }
        def result =[:]
        modelEventInstance.each {
            result["$it.id"] = [ title:"$it.title", titleInt:"$it.titleInt", notes:"$it.notes"] 
        }
        withFormat{       
                html {render result as JSON}
                xml  {render  result as XML}
                '*' {render result as JSON}    
        }  
    }    
    
}