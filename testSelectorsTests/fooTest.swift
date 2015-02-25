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
        
        func didBarWithSpam(spam: String!, andSausages sausages: String!) {
            self.cb("\(spam) & \(sausages)")
        }
    }
    
    var fixture = foo();
    
    
    override func setUp() {
        super.setUp()
        fixture = foo();
    }
    
    func testSingleArgument() {
        var called = false
        fixture.delegate = mockDelegate() {(str) in
            XCTAssertEqual(str, "SPAM")
            called = true
        }
        fixture.barWithSpam()
        XCTAssert(called)
    }
    
    func testTwoArgumentsInitialLowerCase() {
        var called = false
        fixture.delegate = mockDelegate() {(str) in
            XCTAssertEqual(str, "SPAM & EGGS")
            called = true
        }
        fixture.barWithSpamAndEggs()
        XCTAssert(called)
    }
    
    func testTwoArgumentsInitialCap() {
        var called = false
        fixture.delegate = mockDelegate() {(str) in
            XCTAssertEqual(str, "SPAM & SAUSAGES")
            called = true
        }
        fixture.barWithSpamAndSausages()
        XCTAssert(called, "Delegate with second argument in initial caps was not called")
    }
}
