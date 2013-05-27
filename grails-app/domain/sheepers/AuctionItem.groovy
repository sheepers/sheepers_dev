package sheepers



class AuctionItem {

    static belongsTo = [Auction]
    static hasOne = [auction: Auction]
    //BigInteger id

    String  typeOfItem
    String  size
    boolean deleted
    static transients = [ 'deleted' ]

    String comments
    String amountOfBoxes
    //boolean isFragile
    //Set<byte[]> pictures



static constraints = {
        comments( blank: true  )
        amountOfBoxes (blank : true)
        size inList:["Small","Medium","Large","XtraLarge"]
        typeOfItem inList:["Closet", "Bed", "Piano"," Refrigerator", "Stove", "Table", "Box", "Extra"]

    }



}


