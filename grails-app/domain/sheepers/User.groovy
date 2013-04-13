package sheepers

class User {

	transient springSecurityService

    //static hasOne = [profile : Profile]
    Profile profile
	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	static constraints = {
		username blank: false, unique: true
        profile  unique:  true
        //bids nullable:  true
        //auctions nullable:  true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
        //profile cascade : "persist,merge,save-update"
        profile cascade: "all-delete-orphan"
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
