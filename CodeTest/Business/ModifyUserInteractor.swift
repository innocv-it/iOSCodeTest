
import Foundation

protocol ModifyUserInteractorProvider {
	func modifyUserInteractor(user: User) -> ModifyUserInteractor
}

class ModifyUserInteractor: InteractorBase<User> {
	private let repository: UsersRepository
	private let user: User
	
	init(repository: UsersRepository, user: User) {
		self.repository = repository
		self.user = user
	}
	
	override func execute(success: @escaping (User) -> (), error: @escaping (NSError) -> ()) {
		repository.modifyUser(user, success: success, error: error)
	}
}
