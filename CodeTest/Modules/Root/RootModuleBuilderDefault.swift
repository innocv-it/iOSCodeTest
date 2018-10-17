
import UIKit

class RootModuleBuilderDefault: RootModuleBuilder {
	let rootViewControllerProvider: RootViewControllerProvider
	let usersListModuleBuilderProvider: UsersListModuleBuilderProvider
	
	lazy var rootViewController: RootViewController = self.rootViewControllerProvider.rootView as! RootViewController
		
	required init(rootViewControllerProvider: RootViewControllerProvider, usersListModuleBuilderProvider: UsersListModuleBuilderProvider) {
		self.rootViewControllerProvider = rootViewControllerProvider
		self.usersListModuleBuilderProvider = usersListModuleBuilderProvider
	}
	
	func buildRootModule(in window: UIWindow) {
		build()
		window.rootViewController = rootViewController
	}
	
	func build() {
		let vc = UIViewController()
		vc.view.backgroundColor = .blue
		
		let usersListBuilder = usersListModuleBuilderProvider.usersListModuleBuilder()
		usersListBuilder.build()
		
		rootViewController.viewControllers = [usersListBuilder.usersListView as! UIViewController]
	}
}
