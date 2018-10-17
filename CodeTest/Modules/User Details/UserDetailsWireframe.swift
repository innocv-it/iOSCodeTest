
import UIKit

class UserDetailsWireframeDefault: UserDetailsWireframe {
	func goBack(from view: UserDetailsView) {
		let fromView = view as! UIViewController
		fromView.navigationController?.popViewController(animated: true)
	}
}
