package sheepers



class AuctionItem {

    static belongsTo = [Auction]
    static hasOne = [auction: Auction]
    //BigInteger id

    EtypeOfItem typeOfItem
    ESize size
    boolean deleted
    static transients = [ 'deleted' ]

    String comments
    String amountOfBoxes
    //boolean isFragile
    //Set<byte[]> pictures



static constraints = {
        comments( blank: true )
        amountOfBoxes (blank : true)

    }



}


