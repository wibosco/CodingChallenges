// Created 27/03/2022.

import XCTest

@testable import LeetCode

final class SubdomainVisitCountTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let cpdomains = ["9001 discuss.leetcode.com"]
        
        let subDomainCounts = SubdomainVisitCount().subdomainVisits(cpdomains)
        
        let expectedSubDomainCounts = ["9001 leetcode.com", "9001 discuss.leetcode.com", "9001 com"]
        
        //order isn't important
        for subDomainCount in subDomainCounts {
            XCTAssertTrue(expectedSubDomainCounts.contains(subDomainCount))
        }
    }
    
    func test_B() {
        let cpdomains = ["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]
        
        let subDomainCounts = SubdomainVisitCount().subdomainVisits(cpdomains)
        
        let expectedSubDomainCounts = ["901 mail.com", "50 yahoo.com", "900 google.mail.com", "5 wiki.org", "5 org", "1 intel.mail.com", "951 com"]
        
        //order isn't important
        for subDomainCount in subDomainCounts {
            XCTAssertTrue(expectedSubDomainCounts.contains(subDomainCount))
        }
    }
}
