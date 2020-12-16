// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import XCTest
//@testable import Labs

func convertToCelsius(fahrenheit: Double) -> Double {
    return 0.0
}

class TemperatureTests: XCTestCase {
    
    func testFahrenheitToCelsius() {
        let fahrenheitValue = 32.0
        let celsiusValue = convertToCelsius(fahrenheit: fahrenheitValue)
        print("\(fahrenheitValue)° F equals \(celsiusValue)° C")
        XCTAssertEqual(0.0, celsiusValue, accuracy: 0.0001)
    }

}
