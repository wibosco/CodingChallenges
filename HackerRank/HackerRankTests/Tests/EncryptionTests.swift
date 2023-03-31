//
//  EncryptionTests.swift
//  CodingChallenges
//
//  Created by William Boles on 12/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

final class EncryptionTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let encryptedValue = Encryption.encrypt(originalString: "haveaniceday")
        
        XCTAssertEqual("hae and via ecy", encryptedValue)
    }
    
    func test_B() {
        let encryptedValue = Encryption.encrypt(originalString: "feedthedog")
        
        XCTAssertEqual("fto ehg ee dd", encryptedValue)
    }
    
    func test_C() {
        let encryptedValue = Encryption.encrypt(originalString: "chillout")
        
        XCTAssertEqual("clu hlt io", encryptedValue)
    }
}
