package entities

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.*
import grails.converters.*

@Transactional(readOnly = true)
class ProductCategoryController {
    
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
            respond ProductCategory.list(params), model:[productCategoryInstanceCount: ProductCategory.count()]
        } 
        else {
            respond ProductCategory.findAllByRecStatus(params.recStatus, params), model:[productCategoryInstanceCount: ProductCategory.count()] 
        } 
    }


    def show(ProductCategory productCategoryInstance) {
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (params.recStatus != "All" && productCategoryInstance.recStatus != params.recStatus) { 
            notFound()
            return
        }            
        respond productCategoryInstance
    }

    def create() {
        respond new ProductCategory(params)
    }

    @Transactional
    def save(ProductCategory productCategoryInstance) {
        if (productCategoryInstance == null) {
            notFound()
            return
        }

        if (productCategoryInstance.hasErrors()) {
            respond productCategoryInstance.errors, view:'create'
            return
        }

        productCategoryInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'productCategoryInstance.label', default: 'ProductCategory'), productCategoryInstance.id])
                redirect productCategoryInstance
            }
            '*' { respond productCategoryInstance, [status: CREATED] }
        }
    }

    def edit(ProductCategory productCategoryInstance) {
        respond productCategoryInstance
    }

    @Transactional
    def update(ProductCategory productCategoryInstance) {
        if (productCategoryInstance == null) {
            notFound()
            return
        }

        if (productCategoryInstance.hasErrors()) {
            respond productCategoryInstance.errors, view:'edit'
            return
        }

        productCategoryInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ProductCategory.label', default: 'ProductCategory'), productCategoryInstance.id])
                redirect productCategoryInstance
            }
            '*'{ respond productCategoryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ProductCategory productCategoryInstance) {
        //Pretend deletion
        // example: http://localhost:9991/Commons/productCategory/delete.json?id=2
        if (productCategoryInstance == null) {
            notFound()
            return
        }
        productCategoryInstance.recStatus="Deleted"
        productCategoryInstance.save flush:true
    
        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ProductCategory.label', default: 'ProductCategory'), productCategoryInstance.id])
                redirect action:"index", method:"GET"
            }
             '*'{ 
                respond productCategoryInstance //, [status: NO_CONTENT] 
            }
//             '*'{ render status: NO_CONTENT }
        }
    }
    
    @Transactional 
    def undelete(ProductCategory productCategoryInstance) { 
        // example: http://localhost:9991/Commons/productCategory/undelete.json?id=2
        if (productCategoryInstance == null) {
            notFound()
            return
        }
        productCategoryInstance.recStatus="Active"
        productCategoryInstance.save flush:true 

        request.withFormat {
            form {
                flash.message = message(code: 'default.undeleted.message', args: [message(code: 'ProductCategory.label', default: 'ProductCategory'), productCategoryInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ 
              respond productCategoryInstance //, [status: NO_CONTENT] 
//              render status: NO_CONTENT 
            }
        }
    }    

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'productCategoryInstance.label', default: 'ProductCategory'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }   
    
    def shortList() {
        // example: <server:port>/Commons/productCategory/shortList
        params.max = Math.min(params.max ?: 50, 100) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        def productCategoryInstance 
        if (params.recStatus == "All" ) { 
            productCategoryInstance = ProductCategory.list(params)
        } 
        else {
            productCategoryInstance = ProductCategory.findAllByRecStatus(params.recStatus, params)
        } 
        if (productCategoryInstance==null) {
            request.withFormat {
                '*'{ render status: NOT_FOUND }
            }
            return
        }
        def result =[:]
        productCategoryInstance.each {
            result["$it.id"] = [code:"$it.code", title:"$it.title", titleInt:"$it.titleInt", notes:"$it.notes"] 
        }
        withFormat{       
                html {render result as JSON}
                xml  {render  result as XML}
                '*' {render result as JSON}    
        }  
    }    
    
}