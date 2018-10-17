
import Swinject

extension Assembly {
	func registerRepositories() {
		container.register(UsersRepository.self) { _ in
			UsersRepositoryDefault()
		}.inObjectScope(.container)
	}
}
