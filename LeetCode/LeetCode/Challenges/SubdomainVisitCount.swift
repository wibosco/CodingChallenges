//
//  SubdomainVisitCount.swift
//  LeetCode
//
//  Created by William Boles on 27/03/2022.
//

import Foundation

//https://leetcode.com/problems/subdomain-visit-count/
struct SubdomainVisitCount {
    
    //Time: O(n * k) where n is the number of elements in `cpdomains`
    //               where k is the max domains inside each `cpdomains` element
    //Space: O(n * k)
    //string
    //array
    //counting
    //dictionary
    //
    //Solution Description:
    //Iterate through all `cpdomains` and split the `count` from the `domains`. Then split the `domains` and iterate
    //througgh them in reverse order, gradually building up `currentDomain` with each new element. `currentDomain` can then
    //be used as a key for `domainsCount`. `domainsCount` allows us to combine domain counts across multiple `cpdomains`
    //that share at least a subdomain. Once all `cpdomains` elements have been iterated we combine the key and value
    //combinations `domainsCount` into the expected string array format and return that array.
    static func subdomainVisits(_ cpdomains: [String]) -> [String] {
        var domainsCount = [String: Int]()
        
        for cpdomain in cpdomains {
            let values = cpdomain.components(separatedBy: " ")
            let count = Int(values[0])!
            let domains = values[1].components(separatedBy: ".")
            var currentDomain = ""
            
            for domain in domains.reversed() {
                if currentDomain.isEmpty {
                    currentDomain = domain
                } else {
                    currentDomain = "\(domain).\(currentDomain)"
                }
                
                domainsCount[currentDomain, default: 0] += count
            }
        }
        
        var domains = [String]()
        
        for (key, value) in domainsCount {
            let result = "\(value) \(key)"
            domains.append(result)
        }
        
        return domains
    }
}
