
import UIKit

protocol RootView {
	
}

protocol RootModuleBuilder: ModuleBuilder {
	var rootViewControllerProvider: RootViewControllerProvider { get }
	var usersListModuleBuilderProvider: UsersListModuleBuilderProvider { get }
	
	init(rootViewControllerProvider: RootViewControllerProvider, usersListModuleBuilderProvider: UsersListModuleBuilderProvider)
	func buildRootModule(in window: UIWindow)
}

protocol RootModuleBuilderProvider {
	func rootModuleBuilder() -> RootModuleBuilder
}

protocol RootViewControllerProvider {
	var rootView: RootView { get }
}
