package entities

class ProductPolicy {   
    String      title
    String      titleInt
    String      currencyISO
    String      termUnit = "S"
    int         fromTerm = 1
    int         toTerm = 99999
    Date        dateCreated
    Date        lastUpdated
    String      recStatus = "Active"
    
    static mapping = {
        recStatus index:'RecordStatus_Idx'
    }    
    
    static belongsTo = [product:Product]
    static constraints = {
        title()
        titleInt()
        product()
        currencyISO(size:3..3)
        termUnit(inList:["W", "M", "Q", "S", "Y", "-"])
        fromTerm()
        toTerm()
        dateCreated() // implied => editable:false, bindable: false
        lastUpdated() // implied => editable:false, bindable: false
        recStatus(editable:false, inList:["Active", "Deleted"])
    }
}
