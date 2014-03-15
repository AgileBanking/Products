class BootStrap {

    def init = { servletContext ->
        def pc1 = new entities.ProductCategory(code:"AS", title:"Ενεργητικό", titleInt:"Asset").save()
        def pc2 = new entities.ProductCategory(code:"LB", title:"Παθητικό", titleInt:"Liability").save()      
        
        def et1 = new entities.EventType(code:"fin", title:"Οικονομικό", titleInt:"Financial").save()
        def et2 = new entities.EventType(code:"adm", title:"Διαχειριστικό", titleInt:"Administrative").save()
        def et3 = new entities.EventType(code:"sys", title:"Συστημικό", titleInt:"Systemic").save()
        def et4 = new entities.EventType(code:"inf", title:"Πληροφοριακά", titleInt:"Informative").save()
    }
    def destroy = {
    }
}
