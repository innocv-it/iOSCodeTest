
class UsersListModuleBuilderDefault: UsersListModuleBuilder {
	let usersListViewProvider: UsersListViewProvider
	let usersListPresenterProvider: UsersListPresenterProvider
	let usersListWireframeProvider: UsersListWireframeProvider
	var usersListView: UsersListView!
	var usersListPresenter: UsersListPresenter!
	var usersListWireframe: UsersListWireframe!
	
	required init(usersListViewProvider: UsersListViewProvider, usersListPresenterProvider: UsersListPresenterProvider, usersListWireframeProvider: UsersListWireframeProvider) {
		self.usersListViewProvider = usersListViewProvider
		self.usersListPresenterProvider = usersListPresenterProvider
		self.usersListWireframeProvider = usersListWireframeProvider
	}
	
	func build() {
		usersListView = usersListViewProvider.usersListView
		usersListPresenter = usersListPresenterProvider.usersListPresenter
		usersListWireframe = usersListWireframeProvider.usersListWireframe
		
		usersListView.presenter = usersListPresenter
		usersListPresenter.view = usersListView
		usersListPresenter.wireframe = usersListWireframe
	}
}
