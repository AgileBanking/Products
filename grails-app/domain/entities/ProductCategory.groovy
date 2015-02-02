package entities

class ProductCategory {
    String          code
    String          title
    String          titleInt
    String          productClass = "Asset"
    boolean         explicitContract = false
    ProductCategory parentCategory          // self-reference to allow a tree structute
    String          notes
    // Record stamp
    Long            userId    = 0          // person.id from Parties  (0=System)
    Long            orgUnitId = 0          // orgUnit.id from Commons (0=System)
    Date            dateCreated 
    Date            lastUpdated 
    String          recStatus = "Active"

    
    static hasMany = [modelProducts: ModelProduct]

    String toString()  {"$code: $title/$titleInt"}

    static mapping = {
        recStatus index:'RecordStatus_Idx'
    }   
    
    static constraints = {
      code(nullable:false, blank:false, unique:true, size:1..16)
      title(blank:false, nullable:false, unique:true)
      titleInt(blank:false, nullable:false, unique:true)
      productClass(nullable:false, inList:["Asset", "Liability", "Contigent"])
      explicitContract()
      parentCategory(blank:true, nullable:true)
      modelProducts(nullable:true)
      notes(blank:true, nullable:true, size:0..65535)
      // Record stamp
      userId()
      orgUnitId()
      dateCreated() // implied => editable:false, bindable: false
      lastUpdated() // implied => editable:false, bindable: false
      recStatus(editable:false, inList:["Active", "Deleted"])
    }
}
