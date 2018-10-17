
import Foundation

protocol GetUsersInteractorProvider {
	func getUsersInteractor() -> GetUsersInteractor
}

class GetUsersInteractor: InteractorBase<[User]> {
	private let repository: UsersRepository
	
	init(repository: UsersRepository) {
		self.repository = repository
	}
	
	override func execute(success: @escaping ([User]) -> (), error: @escaping (NSError) -> ()) {
		repository.getAll(success: success, error: error)
	}
}
