//
//  EncryptionTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 12/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class EncryptionTests: XCTestCase {
    
    // MARK: Tests
    
    func test_encryptionA() {
        
        let encryptedValue = Encryption.encrypt(originalString: "haveaniceday")
        
        XCTAssertEqual("hae and via ecy", encryptedValue)
    }
    
    func test_encryptionB() {
        
        let encryptedValue = Encryption.encrypt(originalString: "feedthedog")
        
        XCTAssertEqual("fto ehg ee dd", encryptedValue)
    }
    
    func test_encryptionC() {
        
        let encryptedValue = Encryption.encrypt(originalString: "chillout")
        
        XCTAssertEqual("clu hlt io", encryptedValue)
    }
}
