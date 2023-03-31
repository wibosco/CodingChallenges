//
//  OffByOne.swift
//  CrackingTheCodingInterview
//
//  Created by William Boles on 30/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//CtCI 1.5
final class OffByOne {
    
    /**
     Can transform one string into another one with only one change: inserting new charatcer, removing existing character or transforming existing character.
     */
    static func canTransformSourceStringIntoDestinationStringWithOneChange(source: String, destination: String) -> Bool {
        if abs(source.count - destination.count) > 1 {
            return false
        }
        
        if source == destination {
            return true
        }
        
        if source.count == destination.count {
            return canConvertByOneTransformationBetweenStrings(source: source, destination: destination)
        } else {
            return canConvertByOneInsertionOrDeletionBetweenStrings(source: source, destination: destination)
        }
    }
    
    static func canConvertByOneTransformationBetweenStrings(source: String, destination: String) -> Bool {
        var foundDifferentCharacters = false
        
        for characterIndex in source.indices {
            if source[characterIndex] != destination[characterIndex] {
                if foundDifferentCharacters {
                    return false
                }
                
                foundDifferentCharacters = true
            }
        }
        
        return true
    }
    
    static func canConvertByOneInsertionOrDeletionBetweenStrings(source: String, destination: String) -> Bool {
        let sortedSource = String(source.sorted { (a: Character, b: Character) -> Bool in
            return a > b
        })
        
        let sortedDestination = String(destination.sorted { (a: Character, b: Character) -> Bool in
            return a > b
        })
        
        if source.count > destination.count {
            return sortedSource.contains(sortedDestination)
        } else {
            return sortedDestination.contains(sortedSource)
        }
    }
}
