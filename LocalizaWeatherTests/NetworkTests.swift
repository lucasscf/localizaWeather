//
//  NetworkTests.swift
//  LocalizaWeatherTests
//
//  Created by Lucas Franco on 27/04/20.
//  Copyright © 2020 Lucas Franco. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import LocalizaWeather

class NetworkTests: QuickSpec {
    
    override func spec() {
        super.spec()
        describe("Request") {
            
            var currentWeather: CurrentWeather?
            var returnedError: Error?
            
            beforeEach {
                currentWeather = nil
                returnedError = nil
            }
            
            context("RequestOrign - Success") {
                beforeEach {
                    
                    var lat = "-19.00000"
                    var lon = "-43.00000"
                    
                    Network.requestOrign(lat: lat, lon: lon, completion: {
                        result in currentWeather = result
                    })
                    
                }
                it("Returns Success") {
                    expect(returnedError).toEventually(beNil(), timeout: 1)
                    expect(currentWeather).toEventuallyNot(beNil(), timeout: 1)
                    expect(currentWeather?.coord.lat) != 0.0
                    expect(currentWeather?.coord.lon) != 0.0
                }
            }
            
            context("RequestOrign - Error") {
                beforeEach {
                    
                    var lat = ""
                    var lon = ""
                    
                    Network.requestOrign(lat: lat, lon: lon, completion: {
                        result in currentWeather = result
                    })
                    
                }
                it("Returns Error") {
                    expect(returnedError).toEventually(beNil(), timeout: 1)
                    expect(currentWeather).toEventually(beNil(), timeout: 1)
                    expect(currentWeather?.coord.lat).toEventually(beNil(), timeout: 1)
                    expect(currentWeather?.coord.lon).toEventually(beNil(), timeout: 1)
                }
            }
            
            context("RequestDestin - Success") {
                beforeEach {
                    
                    var q = "Belo Horizonte"
                    
                    Network.requestDestin(q: q, completion: {
                        result in currentWeather = result
                    })
                    
                }
                it("Returns Success") {
                    expect(returnedError).toEventually(beNil(), timeout: 1)
                    expect(currentWeather).toEventuallyNot(beNil(), timeout: 1)
                    expect(currentWeather?.coord.lat) != 0.0
                    expect(currentWeather?.coord.lon) != 0.0
                }
            }
            
            context("RequestDestin - Error") {
                beforeEach {
                    
                    var q = ""
                    
                    Network.requestDestin(q: q, completion: {
                        result in currentWeather = result
                    })
                    
                }
                it("Returns Error") {
                    expect(returnedError).toEventually(beNil(), timeout: 1)
                    expect(currentWeather).toEventually(beNil(), timeout: 1)
                    expect(currentWeather?.coord.lat).toEventually(beNil(), timeout: 1)
                    expect(currentWeather?.coord.lon).toEventually(beNil(), timeout: 1)
                }
            }
        }
    }
    
    
}
