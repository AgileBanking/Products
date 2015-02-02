package entities

class ModelEvent {

    String        code
    String        title
    String        titleInt
    ModelProduct  modelProduct
    EventType     eventType
    int           dimension = 0
    String        closeAccount = "N"          // C=Close, N=No Operation 
    String        blockAccount = "N"          // B=Block, U=Unblock, N=No operation
    String        debitFactor =  "N"          // Add (+) or Subtract (-) from the Debit Total
    String        creditFactor = "N"          // Add (+) or Subtract (-) from the Credit Total
    String        blockAmountFactor = "N"     // Add (+) or Subtract (-) , (A for All), (R for replace) from the Blocked Total
    String        excessLimitFactor = "N"     // Add (+) or Subtract (-) , (R for replace) from the Excess Limit Amount 
    int           valueDateOffset = 0
    int           availabilityDateOffset = 0
    String        counterSide = "none"
    String        notes
    Date          dateCreated
    Date          lastUpdated     
    String        recStatus = "Active"
    

    String toString() {"$code: $title/$titleInt"}

    static hasMany = [specialEvents: SpecialEvent]
    static belongsTo = ModelProduct

    static mapping = {
        recStatus index:'RecordStatus_Idx'
    }   
        
    static constraints = {
      code(size:1..16, unique:true)
      title(blank:false)
      titleInt(blank:false)
      modelProduct(nullable:true)
      eventType(nullable:true)
      dimension(range:0..10)
      valueDateOffset()
      availabilityDateOffset()
      debitFactor(maxsize:1, inList:["+", "-", "N"])
      creditFactor(maxsize:1, inList:["+", "-", "N"])
      blockAmountFactor(maxsize:1, inList:["+", "-", "A", "R", "N"])
      excessLimitFactor(maxsize:1, inList:["+", "-", "R", "N"])
      counterSide(inList:["none", "cash", "net"])
      specialEvents(nullable:true)
      notes(blank:true, nullable:true, size:0..250)
      dateCreated()
      lastUpdated()      
      recStatus(editable:false, inList:["Active", "Deleted"])
    }
}
