//
//  LoginViewControllerTests.swift
//  LocalizaWeatherTests
//
//  Created by Lucas Franco on 27/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import XCTest

@testable import LocalizaWeather

class LoginViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testInitialize() {
        // Arrange
        guard let sut = getViewController() else { return } // `sut` é uma convenção: Subject Under Test
            
        // Act
        _ = sut.view
        
        XCTAssertNotNil(type(of: sut).init(), "Initialized")
        
        XCTAssertNotNil(sut.logoHeaderViewModel, "Initialized logoHeaderViewModel.")
        XCTAssertNotNil(sut.loginCenterViewModel, "Initialized loginCenterViewModel.")
        XCTAssertNotNil(sut.configFooterViewModel, "Initialized configFooterViewModel.")
        XCTAssertNotNil(sut.loginViewModel, "Initialized loginViewModel.")

        XCTAssertNotNil(sut.viewDidLoad, "viewDidLoad")
    }
    
    func getViewController() -> LoginViewController? {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            XCTAssert(false, "No viewController with that identifier")
            return nil
        }
        return vc
    }

}
