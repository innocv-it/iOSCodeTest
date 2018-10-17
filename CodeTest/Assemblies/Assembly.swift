
import UIKit
import Swinject

class Assembly {
	let container = Container()
	
	init() {
		container.register(UIApplication.self) { _ in
			UIApplication.shared
		}.inObjectScope(.container)
		
		container.register(ApplicationManagerAdapter.self) { r in
			ApplicationManager(application: r.resolve(UIApplication.self)!, rootModuleProvider: self)
		}
		
		registerRepositories()
	}
	
	func applicationManager() -> ApplicationManagerAdapter {
		return container.resolve(ApplicationManagerAdapter.self)!
	}
}
