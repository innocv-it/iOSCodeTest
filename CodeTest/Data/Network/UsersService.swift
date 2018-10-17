
import Moya

enum UsersService {
	case getUsers
	case addUser(user: User)
	case modifyUser(user: User)
	case removeUser(user: User)
}

extension UsersService: TargetType {
	var baseURL: URL {
		return URL(string: "https://hello-world.innocv.com/api/user")!
	}
	
	var path: String {
		switch self {
		case .getUsers:
			return ""
		case .addUser:
			return ""
		case .modifyUser:
			return ""
		}
	}
	
	var method: Method {
		switch self {
		case .getUsers:
			return .get
		case .addUser:
			return .post
        case .modifyUser:
            return .put
        }
	}
	
	var headers: [String: String]? {
		return nil
	}
	
	var task: Task {
		switch self {
		case .getUsers:
			return .requestPlain
		case .addUser(let user), .modifyUser(let user):
			return .requestParameters(parameters: user.toJSON(), encoding: JSONEncoding.default)
        }
	}
	
	var sampleData: Data {
		return Data()
	}
}
