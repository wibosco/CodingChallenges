//
//  NestedInteger.swift
//  CodingChallenges
//
//  Created by William Boles on 17/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

final class NestedInteger {
    private var value: Int?
    private var list: [NestedInteger]?
    
    // MARK: - Integer
    
    func isInteger() -> Bool {
        return value != nil
    }
    
    func getInteger() -> Int {
        return value!
    }
    
    func setInteger(_ value: Int) {
        self.value = value
    }
    
    // MARK: - List
    
    func add(_ elem: NestedInteger) {
        if list != nil {
            list?.append(elem)
        } else {
            list = [elem]
        }
    }
    
    func getList() -> [NestedInteger] {
        return list!
    }
}

extension NestedInteger {
    static func deserialize(_ s: String) -> NestedInteger {
        guard s[s.startIndex] == "[" else {
            let ni = NestedInteger()
            ni.setInteger(Int(s)!)
            
            return ni
        }
        
        var stack = [NestedInteger]()
        var num = ""
        
        var head: NestedInteger!
        
        for c in s {
            if c == "[" {
                let ni = NestedInteger()
                stack.last?.add(ni)
                
                stack.append(ni)
            } else if c == "]" {
                if let val = Int(num) {
                    let ni = NestedInteger()
                    ni.setInteger(val)
                    
                    stack.last?.add(ni)
                    
                    num = ""
                }
                
                head = stack.removeLast()
            } else if c == "," {
                if let val = Int(num) {
                    let ni = NestedInteger()
                    ni.setInteger(val)
                    
                    stack.last?.add(ni)
                    
                    num = ""
                }
            } else {
                num += String(c)
            }
        }
        
        return head
    }
    
    static func serialize(_ ni: NestedInteger) -> String {
        guard !ni.isInteger() else {
            return "\(ni.getInteger())"
        }
        
        var childStrings = [String]()
        for child in ni.getList() {
            childStrings.append(serialize(child))
        }

        return "[\(childStrings.joined(separator: ","))]"
    }
}
