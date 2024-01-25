//
//  Subtraction_Cancellation_Exercise_2UITestsLaunchTests.swift
//  Subtraction Cancellation Exercise 2UITests
//
//  Created by PHYS 440 Marco on 1/25/24.
//

import XCTest

final class Subtraction_Cancellation_Exercise_2UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
