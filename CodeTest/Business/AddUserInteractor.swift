
import Foundation

protocol AddUserInteractorProvider {
	func addUserInteractor(user: User) -> AddUserInteractor
}

class AddUserInteractor: InteractorBase<User> {
	private let repository: UsersRepository
	private let user: User
	
	init(repository: UsersRepository, user: User) {
		self.repository = repository
		self.user = user
	}
	
	override func execute(success: @escaping (User) -> (), error: @escaping (NSError) -> ()) {
		repository.addUser(user, success: success, error: error)
	}
}
