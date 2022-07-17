//
//  UITests.swift
//  UITests
//
//  Created by Christian Ray Leovido on 17/07/2022.
//

import XCTest

class UITests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()

        snapshot("Initial")

        let tabBar = app.tabBars["Tab Bar"]

        XCTAssertTrue(tabBar.exists)
        snapshot("Home")

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        tabBar.buttons["Spend"].tap()
        snapshot("Spend")

        app.staticTexts["Spend"].tap()
        let tablesQuery = app.tables

        let descriptionTextField = tablesQuery.textFields["Description"]
        descriptionTextField.tap()
        descriptionTextField.typeText("Fancy description")

        let amountTextField = tablesQuery.textFields["Amount"]
        amountTextField.tap()
        amountTextField.typeText(Int.random(in: 1 ... 10).description)

        tablesQuery.cells["Create transaction"].children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
        app.alerts["Success"].scrollViews.otherElements.buttons["Ok"].tap()

        snapshot("Spend success")
    }
}
