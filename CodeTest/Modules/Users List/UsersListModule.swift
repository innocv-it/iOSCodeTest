
protocol UsersListView: class {
	var presenter: UsersListPresenter! { get set }
	
	func loadData()
}

protocol UsersListPresenter {
	var view: UsersListView! { get set }
	var wireframe: UsersListWireframe! { get set }
	
	var numberOfUsers: Int { get }
	
	func viewWillAppear()
	func addUserButtonTap()
	func user(for section: Int, at index: Int) -> User
	func selectUser(for section: Int, at index: Int)
}

protocol UsersListWireframe {
	init(userDetailsModuleProvider: UserDetailsModuleBuilderProvider)
	
	func showAddUser(from view: UsersListView)
	func showDetails(for user: User, from view: UsersListView)
}

protocol UsersListModuleBuilder: ModuleBuilder {
	var usersListViewProvider: UsersListViewProvider { get }
	var usersListView: UsersListView! { get set }
	var usersListPresenterProvider: UsersListPresenterProvider { get }
	var usersListPresenter: UsersListPresenter! { get set }
	var usersListWireframeProvider: UsersListWireframeProvider { get }
	var usersListWireframe: UsersListWireframe! { get set }
	
	init(usersListViewProvider: UsersListViewProvider, usersListPresenterProvider: UsersListPresenterProvider, usersListWireframeProvider: UsersListWireframeProvider)
}

protocol UsersListModuleBuilderProvider {
	func usersListModuleBuilder() -> UsersListModuleBuilder
}

protocol UsersListViewProvider {
	var usersListView: UsersListView { get }
}

protocol UsersListPresenterProvider {
	var usersListPresenter: UsersListPresenter { get }
}

protocol UsersListWireframeProvider {
	var usersListWireframe: UsersListWireframe { get }
}
