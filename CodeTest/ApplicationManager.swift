
import UIKit

protocol ApplicationManagerAdapter {
	var applicationWindow: UIWindow { get }
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
}

class ApplicationManager: ApplicationManagerAdapter {
	private let application: UIApplication
	private let rootModuleProvider: RootModuleBuilderProvider
	
	lazy var applicationWindow: UIWindow = {
		let window = UIWindow(frame: UIScreen.main.bounds)
		let rootModule = rootModuleProvider.rootModuleBuilder()
		window.backgroundColor = .white
		rootModule.buildRootModule(in: window)
		
		return window
	}()
	
	init(application: UIApplication, rootModuleProvider: RootModuleBuilderProvider) {
		self.application = application
		self.rootModuleProvider = rootModuleProvider
	}
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
		return true
	}
}
