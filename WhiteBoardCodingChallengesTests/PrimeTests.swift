//
//  PrimeTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import WhiteBoardCodingChallenges

class PrimeTests: XCTestCase {
    
    // MARK: TestLifecycle
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    // MARK: IsPrime
    
    func test_isPrimeTrue() {
        
        XCTAssertTrue(Prime.isPrime(value: 5))
    }
    
    func test_isPrimeFalseEven() {
        
        XCTAssertFalse(Prime.isPrime(value: 28))
    }
    
    func test_isPrimeFalseOdd() {
        
        XCTAssertFalse(Prime.isPrime(value: 55))
    }
    
    // MARK: PrimeFactors
    
    func test_primeFactors() {
        
        Prime.primeFactors(value: 864)
        
        XCTAssertTrue(true)
    }
    
}
