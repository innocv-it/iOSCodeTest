
class UsersListPresenterDefault: UsersListPresenter {
	weak var view: UsersListView!
	var wireframe: UsersListWireframe!
	private let interactorProvider: GetUsersInteractorProvider
	private var users = [User]()
	
	init(interactor: GetUsersInteractorProvider) {
		interactorProvider = interactor
	}
	
	func viewWillAppear() {
		let interactor = interactorProvider.getUsersInteractor()
		interactor.execute(success: { users in
			self.users = users
			self.view.loadData()
		}) { error in
			print(error)
		}
	}
	
	func addUserButtonTap() {
		wireframe.showAddUser(from: view)
	}
	
	var numberOfUsers: Int {
		return users.count
	}
	
	func user(for section: Int, at index: Int) -> User {
		return users[index]
	}
	
	func selectUser(for section: Int, at index: Int) {
		let user = users[index]
		wireframe.showDetails(for: user, from: view)
	}
}
