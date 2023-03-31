//
//  BiggerIsGreaterTests.swift
//  CodingChallenges
//
//  Created by William Boles on 17/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

final class BiggerIsGreaterTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_biggerIsGreaterA() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater(w: "ab")
        
        XCTAssertEqual("ba", greaterPermutations)
    }
    
    func test_biggerIsGreaterB() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater(w: "bb")
        
        XCTAssertEqual("no answer", greaterPermutations)
    }
    
    func test_biggerIsGreaterC() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater(w: "hefg")
        
        XCTAssertEqual("hegf", greaterPermutations)
    }
    
    func test_biggerIsGreaterD() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater(w: "dhck")
        
        XCTAssertEqual("dhkc", greaterPermutations)
    }
    
    func test_biggerIsGreaterE() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater(w: "dkhc")
        
        XCTAssertEqual("hcdk", greaterPermutations)
    }
    
    func test_biggerIsGreaterF() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater(w: "abc")
        
        XCTAssertEqual("acb", greaterPermutations)
    }
    
    func test_biggerIsGreaterG() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater(w: "lmno")
        
        XCTAssertEqual("lmon", greaterPermutations)
    }
    
    func test_biggerIsGreaterH() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater(w: "dcba")
        
        XCTAssertEqual("no answer", greaterPermutations)
    }
    
    func test_biggerIsGreaterI() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater(w: "dcbb")
        
        XCTAssertEqual("no answer", greaterPermutations)
    }
    
    func test_biggerIsGreaterJ() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater(w: "abdc")
        
        XCTAssertEqual("acbd", greaterPermutations)
    }
    
    func test_biggerIsGreaterK() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater(w: "abcd")
        
        XCTAssertEqual("abdc", greaterPermutations)
    }
    
    func test_biggerIsGreaterL() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater(w: "fedcbabcd")
        
        XCTAssertEqual("fedcbabdc", greaterPermutations)
    }
    
    func test_biggerIsGreaterM() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater(w: "jprfovzkdlmdcesdcpdchcwoedjchcovklhrhlzfeeptoewcqpxg")
        
        XCTAssertEqual("jprfovzkdlmdcesdcpdchcwoedjchcovklhrhlzfeeptoewcqxgp", greaterPermutations)
    }
    
    func test_biggerIsGreaterN() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater(w: "zedawdvyyfumwpupuinbdbfndyehircmylbaowuptgmw")
        
        XCTAssertEqual("zedawdvyyfumwpupuinbdbfndyehircmylbaowuptgwm", greaterPermutations)
    }
    
    func test_biggerIsGreaterO() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater(w: "zyyxwwtrrnmlggfeb")
        
        XCTAssertEqual("no answer", greaterPermutations)
    }
    
    func test_biggerIsGreaterP() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater(w: "ocsmerkgidvddsazqxjbqlrrxcotrnfvtnlutlfcafdlwiismslaytqdbvlmcpapfbmzxmftrkkqvkpflxpezzapllerxyzlcf")
        
        XCTAssertEqual("ocsmerkgidvddsazqxjbqlrrxcotrnfvtnlutlfcafdlwiismslaytqdbvlmcpapfbmzxmftrkkqvkpflxpezzapllerxyzlfc", greaterPermutations)
    }
    
    func test_biggerIsGreaterQ() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater(w: "biehzcmjckznhwrfgglverxsezxuqpj")
        
        XCTAssertEqual("biehzcmjckznhwrfgglverxsjepquxz", greaterPermutations)
    }
    
    func test_biggerIsGreaterR() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater(w: "rebjvsszebhehuojrkkhszxltyqfdvayusylgmgkdivzlpmmtvbsavxvydldmsym")
        
        XCTAssertEqual("rebjvsszebhehuojrkkhszxltyqfdvayusylgmgkdivzlpmmtvbsavxvydldmyms", greaterPermutations)
    }
    
    func test_biggerIsGreaterS() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater(w: "unpzhmbgrrs")
        
        XCTAssertEqual("unpzhmbgrsr", greaterPermutations)
    }
    
    // MARK: - Alt
    
    func test_biggerIsGreaterAltA() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt(w: "ab")
        
        XCTAssertEqual("ba", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltB() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt(w: "bb")
        
        XCTAssertEqual("no answer", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltC() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt(w: "hefg")
        
        XCTAssertEqual("hegf", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltD() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt(w: "dhck")
        
        XCTAssertEqual("dhkc", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltE() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt(w: "dkhc")
        
        XCTAssertEqual("hcdk", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltF() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt(w: "abc")
        
        XCTAssertEqual("acb", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltG() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt(w: "lmno")
        
        XCTAssertEqual("lmon", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltH() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt(w: "dcba")
        
        XCTAssertEqual("no answer", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltI() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt(w: "dcbb")
        
        XCTAssertEqual("no answer", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltJ() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt(w: "abdc")
        
        XCTAssertEqual("acbd", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltK() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt(w: "abcd")
        
        XCTAssertEqual("abdc", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltL() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt(w: "fedcbabcd")
        
        XCTAssertEqual("fedcbabdc", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltM() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt(w: "jprfovzkdlmdcesdcpdchcwoedjchcovklhrhlzfeeptoewcqpxg")
        
        XCTAssertEqual("jprfovzkdlmdcesdcpdchcwoedjchcovklhrhlzfeeptoewcqxgp", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltN() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt(w: "zedawdvyyfumwpupuinbdbfndyehircmylbaowuptgmw")
        
        XCTAssertEqual("zedawdvyyfumwpupuinbdbfndyehircmylbaowuptgwm", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltO() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt(w: "zyyxwwtrrnmlggfeb")
        
        XCTAssertEqual("no answer", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltP() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt(w: "ocsmerkgidvddsazqxjbqlrrxcotrnfvtnlutlfcafdlwiismslaytqdbvlmcpapfbmzxmftrkkqvkpflxpezzapllerxyzlcf")
        
        XCTAssertEqual("ocsmerkgidvddsazqxjbqlrrxcotrnfvtnlutlfcafdlwiismslaytqdbvlmcpapfbmzxmftrkkqvkpflxpezzapllerxyzlfc", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltQ() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt(w: "biehzcmjckznhwrfgglverxsezxuqpj")
        
        XCTAssertEqual("biehzcmjckznhwrfgglverxsjepquxz", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltR() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt(w: "rebjvsszebhehuojrkkhszxltyqfdvayusylgmgkdivzlpmmtvbsavxvydldmsym")
        
        XCTAssertEqual("rebjvsszebhehuojrkkhszxltyqfdvayusylgmgkdivzlpmmtvbsavxvydldmyms", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltS() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt(w: "unpzhmbgrrs")
        
        XCTAssertEqual("unpzhmbgrsr", greaterPermutations)
    }
}
