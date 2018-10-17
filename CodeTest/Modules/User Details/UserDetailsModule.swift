
import Foundation

protocol UserDetailsView: class {
	var presenter: UserDetailsPresenter! { get set }
	var userName: String? { get set }
	var birthdate: Date { get set }
	
	func setViewTitle(_ title: String)
	func showDeleteButton()
	func enableEditButton()
	func disableEditButton()
}

protocol UserDetailsPresenter {
	var view: UserDetailsView? { get set }
	var wireframe: UserDetailsWireframe! { get set }
	
	var selectedUserName: String { get }
	func viewDidLoad()
	func saveUserButtonTap()
	func removeUserButtonTap()
	func userNameRowDidChangeTo(text: String)
}

protocol UserDetailsWireframe {
	func goBack(from view: UserDetailsView)
}

protocol UserManagementStrategy {
	func saveUser(_ user: User, success: @escaping (User) -> (), error: @escaping (NSError) -> ())
}

enum UserAction: String {
	case addUser
	case modifyUser
}

protocol UserDetailsModuleBuilder: ModuleBuilder {
	var userDetailsViewProvider: UserDetailsViewProvider { get }
	var userDetailsPresenterProvider: UserDetailsPresenterProvider { get }
	var userDetailsWireframeProvider: UserDetailsWireframeProvider { get }
	var userDetailsView: UserDetailsView! { get set }
	var userDetailsPresenter: UserDetailsPresenter! { get set }
	var userDetailsWireframe: UserDetailsWireframe! { get set }
	
	var userAction: UserAction { get }
	
	init(userDetailsViewProvider: UserDetailsViewProvider, userDetailsPresenterProvider: UserDetailsPresenterProvider, userDetailsWireframeProvider: UserDetailsWireframeProvider, userAction: UserAction)
}

protocol UserDetailsModuleBuilderProvider {
	func userDetailsModuleBuilder(user: User, action: UserAction) -> UserDetailsModuleBuilder
}

protocol UserDetailsViewProvider {
	var userDetailsView: UserDetailsView { get }
}

protocol UserDetailsPresenterProvider {
	func userDetailsPresenter(userAction: UserAction) -> UserDetailsPresenter
}

protocol UserDetailsWireframeProvider {
	var userDetailsWireframe: UserDetailsWireframe { get }
}
