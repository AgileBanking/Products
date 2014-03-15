package entities

class ModelProduct {

    String              code
    ProductCategory     productCategory
    String              title
    String              titleInt
    String              type
    String              ineterestFreq
    String              notes
    Date                dateCreated
    Date                lastUpdated      
    String              recStatus = "Active"

    String toString() {"$code: $title/$titleInt"}

    static belongsTo = ProductCategory
    static hasMany = [products:Product, modelEvents: ModelEvent]

    static mapping = {
        recStatus index:'RecordStatus_Idx'
    }   
        
    
    static constraints = {
      code(size:1..16, unique:true)
      productCategory()
      title(blank:false, unique:true)
      titleInt(blank:false, unique:true)
      type(blank:false,inList:["Open", "Schedule", "Mixed"])
      ineterestFreq(inList:["SCH", "N/A", "EOD", "EOW", "EOM", "EOQ", "EOS", "EOY"])
      modelEvents(nullable:true)
      notes(nullable:true, size:0..255)
      dateCreated()
      lastUpdated()
      recStatus(editable:false, inList:["Active", "Deleted"])
    }

}