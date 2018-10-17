
import Foundation

protocol RemoveUserInteractorProvider {
	func removeUserInteractor(user: User) -> RemoveUserInteractor
}

class RemoveUserInteractor: InteractorBase<Void> {
	private let repository: UsersRepository
	private let user: User
	
	init(repository: UsersRepository, user: User) {
		self.repository = repository
		self.user = user
	}
	
	override func execute(success: @escaping () -> (), error: @escaping (NSError) -> ()) {
	}
}
