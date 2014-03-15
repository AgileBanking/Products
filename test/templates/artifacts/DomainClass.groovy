@artifact.package@class @artifact.name@ {   
    // Record Stamp
    Long            userId    = 0          // person.id from Parties  (0=System)
    Long            orgUnitId = 0          // orgUnit.id from Commons (0=System)
    Date            dateCreated
    Date            lastUpdated
    String          recStatus = "Active"
    
    static mapping = {
//        recStatus index:'RecordStatus_Idx'
    }    
    
    static constraints = {
        // Record stamp
        userId()
        orgUnitId()
        dateCreated() // implied => editable:false, bindable: false
        lastUpdated() // implied => editable:false, bindable: false
        recStatus(editable:false, nullable:false, inList:["Active", "Draft","Deleted"])
    }
}
