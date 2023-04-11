//
//  CopyListWithRandomPointer.swift
//  LeetCode
//
//  Created by William Boles on 15/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/copy-list-with-random-pointer/
//linked list
struct CopyListWithRandomPointer {
    
    //Time: O(n) `n` is the number of nodes in the list
    //Space: O(n) `n` is the number of nodes in the list
    //recursive
    //DFS
    //
    //Solution Description:
    //We iterate through list, make copies of the nodes that we come across and store those copied nodes in `copies` dictionary
    //with the original node being the key and the copy being the value (we do this as we don't want any duplicate copies being
    //made). The iteration and building of these copies happen recursively. First we check if we already have made a copy of
    //the original node, if we have we return it else we create a copy and attempt to fill its `next` and `random` properties
    //before return it - this is a depth first approach. Once all copies have been made we use the `head` node to return its
    //copy
    static func copyRandomList(_ head: ListNodeRandom?) -> ListNodeRandom? {
        guard let head = head else {
            return nil
        }

        var copies = [ListNodeRandom: ListNodeRandom]()
        constructList(head, &copies)
        
        return copies[head]
    }
    
    @discardableResult
    private static func constructList(_ original: ListNodeRandom?, _ copies: inout [ListNodeRandom: ListNodeRandom]) -> ListNodeRandom? {
        guard let original = original else {
            return nil
        }
        
        if let copy = copies[original] {
            return copy
        }
        
        let copy = ListNodeRandom(original.val)
        copies[original] = copy
        
        copy.next = constructList(original.next, &copies)
        copy.random = constructList(original.random, &copies)
        
        return copy
    }
    
    //Time: O(n) `n` is the number of nodes in the list
    //Space: O(n) `n` is the number of nodes in the list
    //dictionary
    //
    //Solution Description:
    //We iterate through the linked list storing a copy each node into a dictionary with the original node being used as the
    //key, if this isn't the first time through we add `originalCopy` as the `next` property of the previous copy, if the
    //orignal node has a random node then we also create this node and add it to the dictionary. Once all copies have been
    //made we use the `head` node to return its copy
    static func copyRandomListDictionary(_ head: ListNodeRandom?) -> ListNodeRandom? {
        guard let head = head else {
            return nil
        }
        
        var mapping = [ListNodeRandom: ListNodeRandom]()
        var originalNode: ListNodeRandom? = head
        var previousCopiedNode: ListNodeRandom?
        
        while let on = originalNode {
            let originalCopy = mapping[on] ?? ListNodeRandom(on.val)
            mapping[on] = originalCopy
            
            previousCopiedNode?.next = originalCopy
            previousCopiedNode = originalCopy
                
            if let originalRandom = originalNode?.random {
                let randomCopy = mapping[originalRandom] ?? ListNodeRandom(originalRandom.val)
                mapping[originalRandom] = randomCopy
                
                originalCopy.random = randomCopy
            }
            
            originalNode = on.next
        }
        
        return mapping[head]
    }
    
    //Time: O(n) `n` is the number of nodes in the list
    //Space: O(n) `n` is the number of nodes in the list
    //dictionary
    //
    //Solution Description:
    //First we iterate through the linked list storing a copy each node into a dictionary with the original node being used
    //as the key (without attempting to set the `next` or `random` properties). Next we iterate through the original list
    //again, this time setting the `next` and `random` properties. Once all copies have been made we use the `head` node to
    //return its copy
    static func copyRandomListDictionaryMutiplePass(_ head: ListNodeRandom?) -> ListNodeRandom? {
        guard let head = head else {
            return nil
        }
        
        var mapping = [ListNodeRandom: ListNodeRandom]()
        var originalNode: ListNodeRandom? = head
        while let on = originalNode {
            mapping[on] = ListNodeRandom(on.val)
            originalNode = on.next
        }
        
        originalNode = head
        while let on = originalNode {
            let mappedNode = mapping[on]!
            if let onn = on.next {
                mappedNode.next = mapping[onn]!
            }
            
            if let onr = on.random {
                mappedNode.random = mapping[onr]!
            }
            
            originalNode = on.next
        }
        
        return mapping[head]
    }
}
