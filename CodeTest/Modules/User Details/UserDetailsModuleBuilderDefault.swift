
class UserDetailsModuleBuilderDefault: UserDetailsModuleBuilder {
	let userDetailsViewProvider: UserDetailsViewProvider
	let userDetailsPresenterProvider: UserDetailsPresenterProvider
	let userDetailsWireframeProvider: UserDetailsWireframeProvider
	var userDetailsView: UserDetailsView!
	var userDetailsPresenter: UserDetailsPresenter!
	var userDetailsWireframe: UserDetailsWireframe!
	
	let userAction: UserAction
	
	required init(userDetailsViewProvider: UserDetailsViewProvider, userDetailsPresenterProvider: UserDetailsPresenterProvider, userDetailsWireframeProvider: UserDetailsWireframeProvider, userAction: UserAction) {
		self.userDetailsViewProvider = userDetailsViewProvider
		self.userDetailsPresenterProvider = userDetailsPresenterProvider
		self.userDetailsWireframeProvider = userDetailsWireframeProvider
		self.userAction = userAction
	}
	
	func build() {
		userDetailsView = userDetailsViewProvider.userDetailsView
		userDetailsPresenter = userDetailsPresenterProvider.userDetailsPresenter(userAction: userAction)
		userDetailsWireframe = userDetailsWireframeProvider.userDetailsWireframe
		
		userDetailsView.presenter = userDetailsPresenter
		userDetailsPresenter.view = userDetailsView
		userDetailsPresenter.wireframe = userDetailsWireframe
	}
}
