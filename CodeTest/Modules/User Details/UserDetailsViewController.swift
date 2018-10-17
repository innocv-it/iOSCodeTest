
import UIKit
import Eureka

class UserDetailsViewController: FormViewController, UserDetailsView {
	var presenter: UserDetailsPresenter!
	
	var userName: String? {
		get {
			guard let row = form.rowBy(tag: "nameRow") as? TextRow else {
				fatalError("No 'nameRow' tag found")
			}
			
			return row.value
		}
		set {
			guard let row = form.rowBy(tag: "nameRow") as? TextRow else {
				fatalError("No 'nameRow' tag found")
			}
			
			row.value = newValue
		}
	}
	
	var birthdate: Date {
		get {
			guard let row = form.rowBy(tag: "dateRow") as? DateInlineRow else {
				fatalError("No 'dateRow' tag found")
			}
			
			return row.value!
		}
		set {
			guard let row = form.rowBy(tag: "dateRow") as? DateInlineRow else {
				fatalError("No 'dateRow' tag found")
			}
			
			row.value = newValue
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		navigationItem.largeTitleDisplayMode = .never
		
		form.append(Section { section in
			let nameRow = TextRow(tag: "nameRow")
			nameRow.title = "Name"
			nameRow.placeholder = "Enter name here"
			
			nameRow.onChange { [weak self] textRow in
				self?.presenter.userNameRowDidChangeTo(text: textRow.value ?? "")
			}
			
			section.append(nameRow)
			
			let birthdateRow = DateInlineRow(tag: "dateRow")
			birthdateRow.title = "Birthdate"
			birthdateRow.value = Date()
			section.append(birthdateRow)
		})
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveUserButtonTap))
		navigationItem.rightBarButtonItem?.style = .done
		
		presenter.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let row = form.rowBy(tag: "nameRow") as? TextRow {
            row.cell.textField.becomeFirstResponder()
        }
    }
	
	func setViewTitle(_ title: String) {
		self.title = title
	}
	
	func enableEditButton() {
		navigationItem.rightBarButtonItem?.isEnabled = true
	}
	
	func disableEditButton() {
		navigationItem.rightBarButtonItem?.isEnabled = false
	}
	
	func showDeleteButton() {
		form.append(Section { section in
			let buttonRow = ButtonRow()
			buttonRow.cell.tintColor = .red
			buttonRow.title = "Delete User"
			
			buttonRow.onCellSelection { [weak self] _, _ in
				let alertController = UIAlertController(title: "Remove user", message: "Are you sure you want to remove \(self!.presenter.selectedUserName)?", preferredStyle: .alert)
				alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
				alertController.addAction(UIAlertAction(title: "Remove", style: .destructive, handler: { _ in
				}))
				
				self?.present(alertController, animated: true, completion: nil)
			}
			
			section.append(buttonRow)
		})
	}
	
	@objc func saveUserButtonTap() {
		presenter.saveUserButtonTap()
	}
}
