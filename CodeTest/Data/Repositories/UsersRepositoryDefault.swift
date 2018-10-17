
import Foundation
import Moya
import Moya_ObjectMapper

class UsersRepositoryDefault: Repository, UsersRepository {
	func getAll(success: @escaping ([User]) -> (), error: @escaping (NSError) -> ()) {
		provider.request(.getUsers) { result in
			switch result {
			case .success(let response):
				if let users = try? response.mapArray(User.self) {
					success(users)
				}
			case .failure(let moyaError):
				error(UsersRepositoryDefault.errorFromMoyaError(moyaError, domain: result.value!.request!.url!.absoluteString))
			}
		}
	}
	
	func addUser(_ user: User, success: @escaping (User) -> (), error: @escaping (NSError) -> ()) {
		provider.request(.addUser(user: user)) { result in
			switch result {
			case .success:
                success(user)
			case .failure(let moyaError):
				error(UsersRepositoryDefault.errorFromMoyaError(moyaError, domain: result.value!.request!.url!.absoluteString))
			}
		}
	}
	
	func modifyUser(_ user: User, success: @escaping (User) -> (), error: @escaping (NSError) -> ()) {
		provider.request(.modifyUser(user: user)) { result in
			switch result {
			case .success:
                success(user)
			case .failure(let moyaError):
				error(UsersRepositoryDefault.errorFromMoyaError(moyaError, domain: result.value!.request!.url!.absoluteString))
			}
		}
	}
	
	private static func errorFromMoyaError(_ moyaError: MoyaError, domain: String) -> NSError {
		let userInfo = [
			NSLocalizedDescriptionKey: moyaError.localizedDescription
		]
		
		return NSError(domain: domain, code: 1, userInfo: userInfo)
	}
}
