import Foundation

public class MyClass {
    public private(set) var title: String = ""

    public required init() {
        // This is required to expose the initialiser
    }

    public func add(title: String) {
        self.title = "Did you find it?"
    }
}
