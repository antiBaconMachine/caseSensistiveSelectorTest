//
//  fooTest.swift
//  testSelectors
//
//  Created by Ollie Edwards on 23/02/2015.
//  Copyright (c) 2015 mobbu. All rights reserved.
//

import UIKit
import XCTest

class fooTest: XCTestCase {

    class mockDelegate:NSObject, fooProtocol {
        let cb:(String)->();
        
        init(cb:(String)->()) {
            self.cb = cb;
        }
        
        func didBarWithSpam(spam: String!) {
            self.cb(spam)
        }
        
        func didBarWithSpam(spam: String!, andEggs eggs: String!) {
            self.cb("\(spam) & \(eggs)")
        }
    }
    
    var fixture = foo();
    
    
    override func setUp() {
        super.setUp()
        fixture = foo();
    }
    
    func testFoo() {
        var i = 0;
        fixture.delegate = mockDelegate() {(str) in
            if (i == 0) {
                XCTAssertEqual(str, "SPAM");
            } else {
                XCTAssertEqual(str, "SPAM & EGGS");
            }
            i++;
        }
        fixture.go();
        XCTAssertEqual(i, 2, "cb not called twice");
    }
    
}
