
import Swinject

extension Assembly: UsersListModuleBuilderProvider, UsersListViewProvider, UsersListPresenterProvider, UsersListWireframeProvider {
	func usersListModuleBuilder() -> UsersListModuleBuilder {
		container.register(UsersListModuleBuilder.self) { _ in
			UsersListModuleBuilderDefault(usersListViewProvider: self, usersListPresenterProvider: self, usersListWireframeProvider: self)
		}
		
		container.register(UsersListView.self) { _ in
			let storyboard = UIStoryboard(name: "Storyboard", bundle: nil)
			return storyboard.instantiateViewController(withIdentifier: "UsersListViewController") as! UsersListViewController
		}
		
		container.register(UsersListPresenter.self) { _ in
			UsersListPresenterDefault(interactor: self)
		}
		
		container.register(UsersListWireframe.self) { _ in
			UsersListWireframeDefault(userDetailsModuleProvider: self)
		}
		
		return container.resolve(UsersListModuleBuilder.self)!
	}
	
	var usersListView: UsersListView {
		return container.resolve(UsersListView.self)!
	}
	
	var usersListPresenter: UsersListPresenter {
		return container.resolve(UsersListPresenter.self)!
	}
	
	var usersListWireframe: UsersListWireframe {
		return container.resolve(UsersListWireframe.self)!
	}
}
