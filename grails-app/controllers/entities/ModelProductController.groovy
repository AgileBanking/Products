package entities
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.*
import grails.converters.*

@Transactional(readOnly = true)
class ModelProductController {
    
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
            respond ModelProduct.list(params), model:[modelProductInstanceCount: ModelProduct.count()]
        } 
        else {
            respond ModelProduct.findAllByRecStatus(params.recStatus, params), model:[modelProductInstanceCount: ModelProduct.count()] 
        } 
    }


    def show(ModelProduct modelProductInstance) {
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (params.recStatus != "All" && modelProductInstance.recStatus != params.recStatus) { 
            notFound()
            return
        }            
        respond modelProductInstance
    }

    def create() {
        respond new ModelProduct(params)
    }

    @Transactional
    def save(ModelProduct modelProductInstance) {
        if (modelProductInstance == null) {
            notFound()
            return
        }

        if (modelProductInstance.hasErrors()) {
            respond modelProductInstance.errors, view:'create'
            return
        }

        modelProductInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'modelProductInstance.label', default: 'ModelProduct'), modelProductInstance.id])
                redirect modelProductInstance
            }
            '*' { respond modelProductInstance, [status: CREATED] }
        }
    }

    def edit(ModelProduct modelProductInstance) {
        respond modelProductInstance
    }

    @Transactional
    def update(ModelProduct modelProductInstance) {
        if (modelProductInstance == null) {
            notFound()
            return
        }

        if (modelProductInstance.hasErrors()) {
            respond modelProductInstance.errors, view:'edit'
            return
        }

        modelProductInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ModelProduct.label', default: 'ModelProduct'), modelProductInstance.id])
                redirect modelProductInstance
            }
            '*'{ respond modelProductInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ModelProduct modelProductInstance) {
        //Pretend deletion
        // example: http://localhost:9991/Commons/modelProduct/delete.json?id=2
        if (modelProductInstance == null) {
            notFound()
            return
        }
        modelProductInstance.recStatus="Deleted"
        modelProductInstance.save flush:true
    
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ModelProduct.label', default: 'ModelProduct'), modelProductInstance.id])
                redirect action:"index", method:"GET"
            }
             '*'{ 
                respond modelProductInstance 
            }
        }
    }
    
    @Transactional 
    def undelete(ModelProduct modelProductInstance) { 
        // example: http://localhost:9991/Commons/modelProduct/undelete.json?id=2
        if (modelProductInstance == null) {
            notFound()
            return
        }
        modelProductInstance.recStatus="Active"
        modelProductInstance.save flush:true 

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.undeleted.message', args: [message(code: 'ModelProduct.label', default: 'ModelProduct'), modelProductInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ 
              respond modelProductInstance 
            }
        }
    }    

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'modelProductInstance.label', default: 'ModelProduct'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }   
    
    def shortList() {
        // example: <server:port>/Commons/modelProduct/shortList
        params.max = Math.min(params.max ?: 50, 100) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        def modelProductInstance 
        if (params.recStatus == "All" ) { 
            modelProductInstance = ModelProduct.list(params)
        } 
        else {
            modelProductInstance = ModelProduct.findAllByRecStatus(params.recStatus, params)
        } 
        if (modelProductInstance==null) {
            request.withFormat {
                '*'{ render status: NOT_FOUND }
            }
            return
        }
        def result =[:]
        modelProductInstance.each {
            result["$it.id"] = [code:"$it.code", title:"$it.title", titleInt:"$it.titleInt", type:"$it.type", notes:"$it.notes"] 
        }
        withFormat{       
                html {render result as JSON}
                xml  {render  result as XML}
                '*' {render result as JSON}    
        }  
    }    
    
}