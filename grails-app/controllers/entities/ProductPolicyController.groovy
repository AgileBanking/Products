package entities
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.*
import grails.converters.*

@Transactional(readOnly = true)
class ProductPolicyController {
    
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
            respond ProductPolicy.list(params), model:[rroductPolicyInstanceCount: ProductPolicy.count()]
        } 
        else {
            respond ProductPolicy.findAllByRecStatus(params.recStatus, params), model:[rroductPolicyInstanceCount: ProductPolicy.count()] 
        } 
    }


    def show(ProductPolicy rroductPolicyInstance) {
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (params.recStatus != "All" && rroductPolicyInstance.recStatus != params.recStatus) { 
            notFound()
            return
        }            
        respond rroductPolicyInstance
    }

    def create() {
        respond new ProductPolicy(params)
    }

    @Transactional
    def save(ProductPolicy rroductPolicyInstance) {
        if (rroductPolicyInstance == null) {
            notFound()
            return
        }

        if (rroductPolicyInstance.hasErrors()) {
            respond rroductPolicyInstance.errors, view:'create'
            return
        }

        rroductPolicyInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'rroductPolicyInstance.label', default: 'ProductPolicy'), rroductPolicyInstance.id])
                redirect rroductPolicyInstance
            }
            '*' { respond rroductPolicyInstance, [status: CREATED] }
        }
    }

    def edit(ProductPolicy rroductPolicyInstance) {
        respond rroductPolicyInstance
    }

    @Transactional
    def update(ProductPolicy rroductPolicyInstance) {
        if (rroductPolicyInstance == null) {
            notFound()
            return
        }

        if (rroductPolicyInstance.hasErrors()) {
            respond rroductPolicyInstance.errors, view:'edit'
            return
        }

        rroductPolicyInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ProductPolicy.label', default: 'ProductPolicy'), rroductPolicyInstance.id])
                redirect rroductPolicyInstance
            }
            '*'{ respond rroductPolicyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ProductPolicy rroductPolicyInstance) {
        //Pretend deletion
        // example: http://localhost:9993/Products/rroductPolicy/delete.json?id=4
        if (rroductPolicyInstance == null) {
            notFound()
            return
        }
        rroductPolicyInstance.recStatus="Deleted"
        rroductPolicyInstance.save flush:true
    
        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ProductPolicy.label', default: 'ProductPolicy'), rroductPolicyInstance.id])
                redirect action:"index", method:"GET"
            }
             '*'{ 
                respond rroductPolicyInstance 
            }
        }
    }
    
    @Transactional 
    def undelete(ProductPolicy rroductPolicyInstance) { 
        println "from Undelete with id=$params.id"
        // example: http://localhost:9993/Products/rroductPolicy/undelete.json?id=4
        if (rroductPolicyInstance == null) {
            notFound()
            return
        }
        rroductPolicyInstance.recStatus="Active"
        rroductPolicyInstance.save flush:true 

        request.withFormat {
            form {
                flash.message = message(code: 'default.undeleted.message', args: [message(code: 'ProductPolicy.label', default: 'ProductPolicy'), rroductPolicyInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ 
              respond rroductPolicyInstance
            }
        }
    }    

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'rroductPolicyInstance.label', default: 'ProductPolicy'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }   
    
    def shortList() {
        // example: <server:port>/Commons/rroductPolicy/shortList
        params.max = Math.min(params.max ?: 50, 100) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        def rroductPolicyInstance 
        if (params.recStatus == "All" ) { 
            rroductPolicyInstance = ProductPolicy.list(params)
        } 
        else {
            rroductPolicyInstance = ProductPolicy.findAllByRecStatus(params.recStatus, params)
        } 
        if (rroductPolicyInstance==null) {
            request.withFormat {
                '*'{ render status: NOT_FOUND }
            }
            return
        }
        def result =[:]
        rroductPolicyInstance.each {
            result["$it.id"] = [ title:"$it.title", titleInt:"$it.titleInt", currency:"$currencyISO", notes:"$it.notes"] 
        }
        withFormat{       
                html {render result as JSON}
                xml  {render  result as XML}
                '*' {render result as JSON}    
        }  
    }    
    
}