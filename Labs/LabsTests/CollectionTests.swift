// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import XCTest

class CollectionTests: XCTestCase {

    func testFoo() {
        let x: Int? = 12
        
        if let unwrappedX = x {
            print(unwrappedX)
        }
    }
}
