//
//  UITesting.swift
//  GOT-Challenge-Swift
//
//  Created by Conrado Mateu Gisbert on 16/03/17.
//  Copyright © 2017 conradomateu. All rights reserved.
//

import Foundation
import KIF
import Nimble
import UIKit
@testable import GOT_Challenge_Swift

class UITesting: KIFTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {

        tester().tapView(withAccessibilityLabel: "Sansa Stark")

        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
