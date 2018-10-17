
import Foundation

protocol UsersRepository {
	func getAll(success: @escaping (_ users: [User]) -> (), error: @escaping (NSError) -> ())
	func addUser(_ user: User, success: @escaping (User) -> (), error: @escaping (NSError) -> ())
	func modifyUser(_ user: User, success: @escaping (User) -> (), error: @escaping (NSError) -> ())
	func removeUser(_ user: User, success: @escaping () -> (), error: @escaping (NSError) -> ())
}
