
import Moya
import Alamofire

class Repository {
	lazy var provider: MoyaProvider<UsersService> = {
		let manager = Manager.default
		
		return MoyaProvider(manager: manager, plugins: [NetworkLoggerPlugin(verbose: false)])
	}()
}
