import Foundation

class UserDetailsPresenterDefault: UserDetailsPresenter {
   
	weak var view: UserDetailsView?
	var wireframe: UserDetailsWireframe!
	
	var selectedUserName: String {
		return user.name ?? ""
	}
	
	private var user: User
	private let strategy: UserManagementStrategy
	private let removeUserInteractorProvider: RemoveUserInteractorProvider
	
	init(user: User, strategy: UserManagementStrategy, removeUserInteractor: RemoveUserInteractorProvider) {
		self.user = user
		self.strategy = strategy
		self.removeUserInteractorProvider = removeUserInteractor
	}
	
	func viewDidLoad() {
		if strategy is UserModificationStrategy {
			view?.setViewTitle("Details")
			view?.userName = user.name!
			view?.birthdate = user.birthdate
			view?.showDeleteButton()
		} else {
			view?.setViewTitle("Add User")
			view?.disableEditButton()
		}
	}
	
	func saveUserButtonTap() {
		user.name = view?.userName
		user.birthdate = view?.birthdate ?? Date()
		
		strategy.saveUser(user, success: { user in
			self.wireframe.goBack(from: self.view!)
		}) { error in
			print(error)
		}
	}
    
	func userNameRowDidChangeTo(text: String) {
		if text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
			view?.disableEditButton()
		} else {
			view?.enableEditButton()
		}
	}
}
