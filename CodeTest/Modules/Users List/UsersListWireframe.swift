
import UIKit

class UsersListWireframeDefault: UsersListWireframe {
	private let userDetailsModuleProvider: UserDetailsModuleBuilderProvider
	
	required init(userDetailsModuleProvider: UserDetailsModuleBuilderProvider) {
		self.userDetailsModuleProvider = userDetailsModuleProvider
	}
	
	func showAddUser(from view: UsersListView) {
		showDetailsModule(user: User(), from: view, action: .addUser)
	}
	
	func showDetails(for user: User, from view: UsersListView) {
		showDetailsModule(user: user, from: view, action: .modifyUser)
	}
	
	fileprivate func showDetailsModule(user: User, from view: UsersListView, action: UserAction) {
		let moduleBuilder = userDetailsModuleProvider.userDetailsModuleBuilder(user: user, action: action)
		moduleBuilder.build()
		
		let fromViewController = view as! UIViewController
		fromViewController.show(moduleBuilder.userDetailsView as! UIViewController, sender: nil)
	}
}
