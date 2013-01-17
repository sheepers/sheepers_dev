package sheepers

class Profile {

    enum UserType  {Customer,Carrier}
    String userPhoneNumber

    static belongsTo = User
    static hasOne = [user: User]

    static constraints = {
       userPhoneNumber nullable: true
    }
}
