// Created 04/05/2025.

import Testing

@testable import LeetCode

struct AnalyzeUserWebsiteVisitPatternTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let username = ["joe","joe","joe","james","james","james","james","mary","mary","mary"]
        let timestamp = [1,2,3,4,5,6,7,8,9,10]
        let website = ["home","about","career","home","cart","maps","home","home","about","career"]
        
        let result = AnalyzeUserWebsiteVisitPattern().mostVisitedPattern(username, timestamp, website)
        
        #expect(result == ["home","about","career"])
    }
    
    @Test
    func test_B() {
        let username = ["ua","ua","ua","ub","ub","ub"]
        let timestamp = [1,2,3,4,5,6]
        let website = ["a","b","a","a","b","c"]
        
        let result = AnalyzeUserWebsiteVisitPattern().mostVisitedPattern(username, timestamp, website)
        
        #expect(result == ["a","b","a"])
    }
    
    @Test
    func test_C() {
        let username = ["dowg","dowg","dowg"]
        let timestamp = [158931262,562600350,148438945]
        let website = ["y","loedo","y"]
        
        let result = AnalyzeUserWebsiteVisitPattern().mostVisitedPattern(username, timestamp, website)
        
        #expect(result == ["y","y","loedo"])
    }
    
    @Test
    func test_D() {
        let username = ["h","eiy","cq","h","cq","txldsscx","cq","txldsscx","h","cq","cq"]
        let timestamp = [527896567,334462937,517687281,134127993,859112386,159548699,51100299,444082139,926837079,317455832,411747930]
        let website = ["hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","yljmntrclw","hibympufi","yljmntrclw"]
        
        let result = AnalyzeUserWebsiteVisitPattern().mostVisitedPattern(username, timestamp, website)
        
        #expect(result == ["hibympufi","hibympufi","yljmntrclw"])
    }
    
    @Test
    func test_E() {
        let username = ["hyu","hyu","hyu","dr","dr","hyu","hyu","dr","hyu","rbqzyvz","hyu","hyu"]
        let timestamp = [843689154,476079714,961070284,625578364,920926840,340946294,447539515,227388644,376948108,641949100,767785236,877838661]
        let website = ["ckjgtzag","kvnkuovetb","whl","whl","gcunk","kv","gcunk","jytdzirgip","tjloxlamjn","cixdil","riqwxelwpi","jepphzino"]
        
        let result = AnalyzeUserWebsiteVisitPattern().mostVisitedPattern(username, timestamp, website)
        
        #expect(result == ["ckjgtzag","jepphzino","whl"])
    }
}
