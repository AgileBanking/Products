package entities

class SpecialEvent {
      ModelEvent    modelEvent
      String        eventUsage = "Show"
      int           valueDateOffset = 0
      int           availabilityDateOffset = 0
      Date          activationDate = null
      Date          deactivationDate = null
      String        notes
      Date          dateCreated
      Date          lastUpdated      
      String        recStatus = "Active"
      
      String toString() {"[$modelEvent.code]: $modelEvent.title/$modelEvent.titleInt ($modelEvent.dimension)"}
      
    static belongsTo = ModelEvent

    static mapping = {
        recStatus index:'RecordStatus_Idx'
    }   
        
    static constraints = {
      modelEvent(nullable:true)     // temporarilly nullable
      eventUsage(inList:["Show","Hide"])
      valueDateOffset()
      availabilityDateOffset()
      activationDate(nullable:true, validator: { val, obj -> val >= new Date()})
      deactivationDate(nullable:true, validator: { val, obj -> val >= new Date() })
      notes(blank:true, nullable:true, size:0..255)
      dateCreated()
      lastUpdated()      
      recStatus(editable:false, inList:["Active", "Deleted"])
    }
}
