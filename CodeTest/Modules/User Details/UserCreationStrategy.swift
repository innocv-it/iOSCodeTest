
import Foundation

class UserCreationStrategy: UserManagementStrategy {
	private let addUserInteractor: AddUserInteractorProvider
	
	init(addUserInteractor: AddUserInteractorProvider) {
		self.addUserInteractor = addUserInteractor
	}
	
	func saveUser(_ user: User, success: @escaping (User) -> (), error: @escaping (NSError) -> ()) {
		let interactor = addUserInteractor.addUserInteractor(user: user)
		interactor.execute(success: success, error: error)
	}
}
