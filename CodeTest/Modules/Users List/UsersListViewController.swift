
import UIKit

class UsersListViewController: UITableViewController, UsersListView {
	var presenter: UsersListPresenter!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		title = "Users"
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addUserButtonTap))
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		presenter.viewWillAppear()
	}
	
	func loadData() {
		tableView.reloadData()
	}
	
	@objc func addUserButtonTap() {
		presenter.addUserButtonTap()
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter.numberOfUsers
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellIdentifier = "UserCell"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
		
		let user = presenter.user(for: indexPath.section, at: indexPath.row)
		cell.textLabel?.text = user.name
		
		let formatter = DateFormatter()
		formatter.locale = Locale.current
		formatter.dateStyle = .medium
		cell.detailTextLabel?.text = formatter.string(from: user.birthdate)
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		presenter.selectUser(for: indexPath.section, at: indexPath.row)
	}
}
