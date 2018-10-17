
import Swinject

extension Assembly: UserDetailsModuleBuilderProvider, UserDetailsViewProvider, UserDetailsPresenterProvider, UserDetailsWireframeProvider {
	func userDetailsModuleBuilder(user: User, action: UserAction) -> UserDetailsModuleBuilder {
		container.register(UserDetailsModuleBuilder.self) { _ in
			UserDetailsModuleBuilderDefault(userDetailsViewProvider: self, userDetailsPresenterProvider: self, userDetailsWireframeProvider: self, userAction: action)
		}
		
		container.register(UserDetailsView.self) { _ in
			let storyboard = UIStoryboard(name: "Storyboard", bundle: nil)
			return storyboard.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
		}
		
		container.register(UserManagementStrategy.self, name: UserAction.addUser.rawValue) { _ in
			UserCreationStrategy(addUserInteractor: self)
		}
		
		container.register(UserManagementStrategy.self, name: UserAction.modifyUser.rawValue) { _ in
			UserModificationStrategy(modifyUserInteractor: self)
		}
		
		container.register(UserDetailsPresenter.self, name: action.rawValue) { r in
			UserDetailsPresenterDefault(user: user, strategy: r.resolve(UserManagementStrategy.self, name: action.rawValue)!, removeUserInteractor: self)
		}
		
		container.register(UserDetailsWireframe.self) { _ in
			UserDetailsWireframeDefault()
		}
		
		return container.resolve(UserDetailsModuleBuilder.self)!
	}
	
	var userDetailsView: UserDetailsView {
		return container.resolve(UserDetailsView.self)!
	}
	
	func userDetailsPresenter(userAction: UserAction) -> UserDetailsPresenter {
		return container.resolve(UserDetailsPresenter.self, name: userAction.rawValue)!
	}
	
	var userDetailsWireframe: UserDetailsWireframe {
		return container.resolve(UserDetailsWireframe.self)!
	}
}
