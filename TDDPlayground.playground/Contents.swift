//: A UIKit based Playground for presenting user interface
  
import UIKit
import XCTest
import PlaygroundSupport

class MyViewController : UIViewController {

    var example: MyClass?

    convenience init(example: MyClass) {
        self.init()
        self.example = example
    }

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = example?.title
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}

// Using external classes (see the Sources folder)
let example = MyClass()
example.add(title: "Hello World")
let viewController = MyViewController.init(example: example)

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = viewController

// Adding Tests
class ExampleTests: XCTestCase {
    var testClass: MyClass!
    override func setUp() {
        super.setUp()
        testClass = MyClass()
    }

    func testTitle() {
        XCTAssertTrue(testClass.title.isEmpty)
        let testString = "My Test"
        testClass.add(title: testString)
        XCTAssertEqual(testString, testClass.title)
    }
}

class Observer: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}

let observer = Observer()
XCTestObservationCenter.shared.addTestObserver(observer)
ExampleTests.defaultTestSuite.run()
