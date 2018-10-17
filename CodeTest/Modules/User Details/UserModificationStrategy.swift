
import Foundation

class UserModificationStrategy: UserManagementStrategy {
	private let modifyUserInteractor: ModifyUserInteractorProvider
	
	init(modifyUserInteractor: ModifyUserInteractorProvider) {
		self.modifyUserInteractor = modifyUserInteractor
	}
	
	func saveUser(_ user: User, success: @escaping (User) -> (), error: @escaping (NSError) -> ()) {
		let interactor = modifyUserInteractor.modifyUserInteractor(user: user)
		interactor.execute(success: success, error: error)
	}
}
