package entities
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.*
import grails.converters.*

@Transactional(readOnly = true)
class EventTypeController {
    
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
        params.max = Math.min(max ?: 10, 100) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize() 
        if (params.recStatus == "All" ) { 
            respond EventType.list(params), model:[eventTypeInstanceCount: EventType.count()]
        } 
        else {
            respond EventType.findAllByRecStatus(params.recStatus, params), model:[eventTypeInstanceCount: EventType.count()] 
        } 
    }


    def show(EventType eventTypeInstance) {
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (params.recStatus != "All" && eventTypeInstance.recStatus != params.recStatus) { 
            notFound()
            return
        }            
        respond eventTypeInstance
    }

    def create() {
        respond new EventType(params)
    }

    @Transactional
    def save(EventType eventTypeInstance) {
        if (eventTypeInstance == null) {
            notFound()
            return
        }

        if (eventTypeInstance.hasErrors()) {
            respond eventTypeInstance.errors, view:'create'
            return
        }

        eventTypeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'eventTypeInstance.label', default: 'EventType'), eventTypeInstance.id])
                redirect eventTypeInstance
            }
            '*' { respond eventTypeInstance, [status: CREATED] }
        }
    }

    def edit(EventType eventTypeInstance) {
        respond eventTypeInstance
    }

    @Transactional
    def update(EventType eventTypeInstance) {
        if (eventTypeInstance == null) {
            notFound()
            return
        }

        if (eventTypeInstance.hasErrors()) {
            respond eventTypeInstance.errors, view:'edit'
            return
        }

        eventTypeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EventType.label', default: 'EventType'), eventTypeInstance.id])
                redirect eventTypeInstance
            }
            '*'{ respond eventTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EventType eventTypeInstance) {
        //Pretend deletion
        // example: http://localhost:9993/Products/eventType/delete.json?id=4
        if (eventTypeInstance == null) {
            notFound()
            return
        }
        eventTypeInstance.recStatus="Deleted"
        eventTypeInstance.save flush:true
    
        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EventType.label', default: 'EventType'), eventTypeInstance.id])
                redirect action:"index", method:"GET"
            }
             '*'{ 
                respond eventTypeInstance 
            }
        }
    }
    
    @Transactional 
    def undelete(EventType eventTypeInstance) { 
        println "from Undelete with id=$params.id"
        // example: http://localhost:9993/Products/eventType/undelete.json?id=4
        if (eventTypeInstance == null) {
            notFound()
            return
        }
        eventTypeInstance.recStatus="Active"
        eventTypeInstance.save flush:true 

        request.withFormat {
            form {
                flash.message = message(code: 'default.undeleted.message', args: [message(code: 'EventType.label', default: 'EventType'), eventTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ 
              respond eventTypeInstance
            }
        }
    }    

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventTypeInstance.label', default: 'EventType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }   
    
    def shortList() {
        // example: <server:port>/Commons/eventType/shortList
        params.max = Math.min(params.max ?: 50, 100) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        def eventTypeInstance 
        if (params.recStatus == "All" ) { 
            eventTypeInstance = EventType.list(params)
        } 
        else {
            eventTypeInstance = EventType.findAllByRecStatus(params.recStatus, params)
        } 
        if (eventTypeInstance==null) {
            request.withFormat {
                '*'{ render status: NOT_FOUND }
            }
            return
        }
        def result =[:]
        eventTypeInstance.each {
            result["$it.id"] = [code:"$it.code", title:"$it.title", titleInt:"$it.titleInt", notes:"$it.notes"] 
        }
        withFormat{       
                html {render result as JSON}
                xml  {render  result as XML}
                '*' {render result as JSON}    
        }  
    }    
    
}