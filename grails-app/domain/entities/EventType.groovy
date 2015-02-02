package entities

class EventType {
    String  code        // suggested AT LEAST "fin", "adm", "sys" and "inf"
    String  title
    String  titleInt
    String  notes
    Date    dateCreated
    Date    lastUpdated     
    String  recStatus = "Active"

    static mapping = {
        recStatus index:'RecordStatus_Idx'
    }   
        
    static constraints = {
        code (unique:true)
        title (unique:true)
        titleInt (unique:true)
        notes (nullable:true, size:0..250)
        dateCreated()
        lastUpdated()
        recStatus(editable:false, inList:["Active", "Deleted"])
    }
}
