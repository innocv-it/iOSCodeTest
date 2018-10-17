
import Swinject

extension Assembly: RootModuleBuilderProvider, RootViewControllerProvider {
	func rootModuleBuilder() -> RootModuleBuilder {
		container.register(RootModuleBuilder.self) { _ in
			RootModuleBuilderDefault(rootViewControllerProvider: self, usersListModuleBuilderProvider: self)
		}
		
		container.register(RootView.self) { _ in
			RootViewController()
		}
		
		return container.resolve(RootModuleBuilder.self)!
	}
	
	var rootView: RootView {
		return container.resolve(RootView.self)!
	}
}
