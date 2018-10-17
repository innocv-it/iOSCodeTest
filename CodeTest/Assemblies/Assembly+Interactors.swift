
import Swinject

extension Assembly: GetUsersInteractorProvider, AddUserInteractorProvider, ModifyUserInteractorProvider, RemoveUserInteractorProvider {
	func getUsersInteractor() -> GetUsersInteractor {
		container.register(GetUsersInteractor.self) { r in
			GetUsersInteractor(repository: r.resolve(UsersRepository.self)!)
		}
		
		return container.resolve(GetUsersInteractor.self)!
	}
	
	func addUserInteractor(user: User) -> AddUserInteractor {
		container.register(AddUserInteractor.self) { r in
			AddUserInteractor(repository: r.resolve(UsersRepository.self)!, user: user)
		}
		
		return container.resolve(AddUserInteractor.self)!
	}
	
	func modifyUserInteractor(user: User) -> ModifyUserInteractor {
		container.register(ModifyUserInteractor.self) { r in
			ModifyUserInteractor(repository: r.resolve(UsersRepository.self)!, user: user)
		}
		
		return container.resolve(ModifyUserInteractor.self)!
	}
	
	func removeUserInteractor(user: User) -> RemoveUserInteractor {
		container.register(RemoveUserInteractor.self) { r in
			RemoveUserInteractor(repository: r.resolve(UsersRepository.self)!, user: user)
		}
		
		return container.resolve(RemoveUserInteractor.self)!
	}
}
