// Created 15/11/2021.

import Foundation

//https://leetcode.com/problems/copy-list-with-random-pointer/
struct CopyListWithRandomPointer {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(n)
    //linked list
    //dictionary
    //
    //Solution Description:
    //In a single pass we iterate through the list and create copies of the current original `next` and `random` nodes. These
    //copies are then set on the `next` and `random` property of the current copy node. Both the original and copy nodes are
    //then moved forward. To avoid making multiple copies of the same node we store each copy of a node we make in `map` to
    //be retrieved when required. Once all original nodes have been copied we return the copied head node.
    func copyRandomList(_ head: ListNodeRandom?) -> ListNodeRandom? {
        guard let head else {
            return nil
        }
        var tail: ListNodeRandom? = head

        let copyHead = ListNodeRandom(head.val)
        var copyTail: ListNodeRandom? = copyHead

        var map = [ListNodeRandom: ListNodeRandom]()
        map[head] = copyHead
        
        while let t = tail {
            if let next = t.next {
                let copyNext = map[next] ?? ListNodeRandom(next.val)
                copyTail?.next = copyNext

                map[next] = copyNext //can't rely on a defaulted dictionary value here as it doesn't save it
            }

            if let random = t.random {
                let copyRandom = map[random] ?? ListNodeRandom(random.val)
                copyTail?.random = copyRandom

                map[random] = copyRandom //can't rely on a defaulted dictionary value here as it doesn't save it
            }

            tail = t.next
            copyTail = copyTail?.next
        }
        
        return copyHead
    }
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(n) where n is the number of nodes in the list
    //linked list
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
    func copyRandomList2(_ head: ListNodeRandom?) -> ListNodeRandom? {
        guard let head = head else {
            return nil
        }

        var copies = [ListNodeRandom: ListNodeRandom]()
        constructList(head, &copies)
        
        return copies[head]
    }
    
    @discardableResult
    private func constructList(_ original: ListNodeRandom?, _ copies: inout [ListNodeRandom: ListNodeRandom]) -> ListNodeRandom? {
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
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(n) where n is the number of nodes in the list
    //linked list
    //dictionary
    //
    //Solution Description:
    //We iterate through the linked list storing a copy each node into a dictionary with the original node being used as the
    //key, if this isn't the first time through we add `originalCopy` as the `next` property of the previous copy, if the
    //original node has a random node then we also create this node and add it to the dictionary. Once all copies have been
    //made we use the `head` node to return its copy
    func copyRandomList3(_ head: ListNodeRandom?) -> ListNodeRandom? {
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
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(n) where n is the number of nodes in the list
    //linked list
    //dictionary
    //multi-pass
    //
    //Solution Description:
    //First we iterate through the linked list storing a copy each node into a dictionary with the original node being used
    //as the key (without attempting to set the `next` or `random` properties). Next we iterate through the original list
    //again, this time setting the `next` and `random` properties. Once all copies have been made we use the `head` node to
    //return its copy.
    func copyRandomList4(_ head: ListNodeRandom?) -> ListNodeRandom? {
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
