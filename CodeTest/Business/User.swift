
import Foundation
import ObjectMapper

struct User: ImmutableMappable {
	private(set) var id: Int?
	var name: String?
	var birthdate = Date()
	
	private let dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
		
		return formatter
	}()
	
	init() {
		
	}
	
	init(id: Int, name: String) {
		self.id = id
		self.name = name
	}
	
	init(name: String, birthdate: Date) {
		self.name = name
		self.birthdate = birthdate
	}
	
	init(map: Map) throws {
		id = try? map.value("id")
		name = try? map.value("name")
		birthdate = try map.value("birthdate", using: DateFormatterTransform(dateFormatter: dateFormatter))
	}
	
	func mapping(map: Map) {
		id >>> map["id"]
		name >>> map["name"]
		birthdate >>> (map["birthdate"], DateFormatterTransform(dateFormatter: dateFormatter))
	}
}
