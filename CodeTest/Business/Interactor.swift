
import Foundation

protocol Interactor {
	associatedtype ResultType
	
	func execute(success: @escaping (ResultType) -> (), error: @escaping (NSError) -> ())
}

class InteractorBase<T>: Interactor {
	typealias ResultType = T
	
	func execute(success: @escaping (T) -> (), error: @escaping (NSError) -> ()) {
		fatalError("\(#function) must be overriden")
	}
}
