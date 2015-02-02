package entities
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.*
import grails.converters.*

@Transactional(readOnly = true)
class SpecialEventController {
    
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
            respond SpecialEvent.list(params), model:[specialEventInstanceCount: SpecialEvent.count()]
        } 
        else {
            respond SpecialEvent.findAllByRecStatus(params.recStatus, params), model:[specialEventInstanceCount: SpecialEvent.count()] 
        } 
    }


    def show(SpecialEvent specialEventInstance) {
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (params.recStatus != "All" && specialEventInstance.recStatus != params.recStatus) { 
            notFound()
            return
        }            
        respond specialEventInstance
    }

    def create() {
        respond new SpecialEvent(params)
    }

    @Transactional
    def save(SpecialEvent specialEventInstance) {
        if (specialEventInstance == null) {
            notFound()
            return
        }

        if (specialEventInstance.hasErrors()) {
            respond specialEventInstance.errors, view:'create'
            return
        }

        specialEventInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'specialEventInstance.label', default: 'SpecialEvent'), specialEventInstance.id])
                redirect specialEventInstance
            }
            '*' { respond specialEventInstance, [status: CREATED] }
        }
    }

    def edit(SpecialEvent specialEventInstance) {
        respond specialEventInstance
    }

    @Transactional
    def update(SpecialEvent specialEventInstance) {
        if (specialEventInstance == null) {
            notFound()
            return
        }

        if (specialEventInstance.hasErrors()) {
            respond specialEventInstance.errors, view:'edit'
            return
        }

        specialEventInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SpecialEvent.label', default: 'SpecialEvent'), specialEventInstance.id])
                redirect specialEventInstance
            }
            '*'{ respond specialEventInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SpecialEvent specialEventInstance) {
        //Pretend deletion
        // example: http://localhost:9991/Commons/specialEvent/delete.json?id=2
        if (specialEventInstance == null) {
            notFound()
            return
        }
        specialEventInstance.recStatus="Deleted"
        specialEventInstance.save flush:true
    
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SpecialEvent.label', default: 'SpecialEvent'), specialEventInstance.id])
                redirect action:"index", method:"GET"
            }
             '*'{ 
                respond specialEventInstance //, [status: NO_CONTENT] 
            }
        }
    }
    
    @Transactional 
    def undelete(SpecialEvent specialEventInstance) { 
        // example: http://localhost:9991/Commons/specialEvent/undelete.json?id=2
        if (specialEventInstance == null) {
            notFound()
            return
        }
        specialEventInstance.recStatus="Active"
        specialEventInstance.save flush:true 

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.undeleted.message', args: [message(code: 'SpecialEvent.label', default: 'SpecialEvent'), specialEventInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ 
              respond specialEventInstance 
            }
        }
    }    

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'specialEventInstance.label', default: 'SpecialEvent'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }   
    
    def shortList() {
        // example: <server:port>/Commons/specialEvent/shortList
        params.max = Math.min(params.max ?: 50, 100) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        def specialEventInstance 
        if (params.recStatus == "All" ) { 
            specialEventInstance = SpecialEvent.list(params)
        } 
        else {
            specialEventInstance = SpecialEvent.findAllByRecStatus(params.recStatus, params)
        } 
        if (specialEventInstance==null) {
            request.withFormat {
                '*'{ render status: NOT_FOUND }
            }
            return
        }
        def result =[:]
        specialEventInstance.each {
            result["$it.id"] = [ title:"$it.toString()"] 
        }
        withFormat{       
                html {render result as JSON}
                xml  {render  result as XML}
                '*' {render result as JSON}    
        }  
    }    
    
}