package entities

class Product  {

    String        code
    String        title
    String        titleInt
    ModelProduct  modelProduct
    int           dimensions = 1
    Date          activeSince = new Date()
    Date          activeUntil = new Date() + 36524
    String        status = "Draft"
    int           marketingVersion = 1
    long          minOpeningAmount = 0
    long          maxOpeningAmount =-1 //no limit
    int           dormantPeriod =-1    //no limit
    String        notes
    Date          dateCreated
    Date          lastUpdated      
    String        recStatus = "Active"

    String toString() {"$code: $title/$titleInt"}

    static belongsTo = ModelProduct

    static hasMany = [specialEvents: SpecialEvent, productPolicies:ProductPolicy]

    static mapping = {
        recStatus index:'RecordStatus_Idx'
    }   
    
    static constraints = {
      code(blank:false, unique:true)
      title(blank:false, unique:true)
      titleInt(blank:false, unique:true)
      modelProduct()
      productPolicies()
      dimensions(nullable:true)
      activeSince(nullable:true)
      activeUntil(nullable:true)
      status(blank:false, inList:["Draft", "Active","Inactive","OutOfMarket"])
      marketingVersion(min:1)
      minOpeningAmount()
      maxOpeningAmount(nullable:true)
      dormantPeriod(nullable:true)
      specialEvents(nullable:true)
      notes(nullable:true, size:0..255)
      dateCreated()
      lastUpdated()      
      recStatus(editable:false, inList:["Active", "Deleted"])
    }
}
