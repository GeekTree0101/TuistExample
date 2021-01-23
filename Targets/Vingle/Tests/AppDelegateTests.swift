import XCTest

@testable import Vingle

import Nimble
import RxTest
import RxBlocking

import RxRelay

final class AppDelegateTests: XCTestCase {

  func test_hello() throws {
    let hello = "hello"
    let behavior = BehaviorRelay(value: "test")


    expect(hello) == "hello"
    expect(try behavior.toBlocking().first()) == "test"
  }
}
