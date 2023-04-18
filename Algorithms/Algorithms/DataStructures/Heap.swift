//
//  Heap.swift
//  Algorithms
//
//  Created by William Boles on 22/05/2022.
//

import Foundation

//A heap (also known as a binary heap) is a complete binary tree (not s binary search tree) inside an array, so it does not use
//parent/child pointers. A heap is sorted based on the "heap property" that determines the order of the nodes in the tree. There
//are two kinds of heaps: a max-heap and a min-heap which are different by the order in which they store the tree nodes. In a
//max-heap, parent nodes have a greater value than each of their children. In a min-heap, every parent node has a smaller value
//than its child nodes. Just like in any binary tree, a heap can be split into mulitple subtrees where the relationship between
//parent and child nodes needs to the same e.g. parent is larger or equal to any child nodes - this relationship in a heap is
//called the "heap propery". A max-heap always stores the largest element at the root of the tree; a min-heap, always store the
//smallest item at the root of the tree. The root of the heap has the maximum or minimum element, but the sort order of other
//elements are not predictable. This partially sorted nature allows for insertions and removals to operate in O(log n) time
//rather than O(n) that would be required for a fully sorted array.
//
//N.B. Don’t confuse these heaps with memory heaps - memory heaps are a different concept.
//
//N.B. Elements with an index > (heap.count / 2) are leaf nodes.
//
//N.B. A complete binary tree is one where all the levels of the binary tree are completely filled except (possibly) the last
//level, which is filled from left side.
//
//See: https://github.com/raywenderlich/swift-algorithm-club/tree/master/Heap
struct Heap<Element> {
    private var elements: [Element]
    private let priorityFunction: (Element, Element) -> Bool
    
    // MARK: - Init
    
    init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    
    private mutating func buildHeap() {
        for index in (0 ..< count / 2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }
    
    // MARK: - Helpers
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    // MARK: - Indexing
    
    private func isRoot(_ index: Int) -> Bool {
        return (index == 0)
    }
    
    private func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1 //left child of an element is always 2i + 1
    }
    
    private func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2 //left child of an element is always 2i + 2 i.e. left child + 1
    }
    
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2 //parent of an element is always (i - 1)/2) which is an integer division i.e. floor
    }
    
    // MARK: - Priority
    
    private func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    // MARK: - Queuing
    
    mutating func insert(_ element: Element) {
        //When inserting an element and element we first add it to the end of `elements` and then "sift" it up into
        //it's correct index. This sifting is controlled by comparing element and ensuring that the higher value
        //element is the parent.
        elements.append(element)
        siftUp(elementAtIndex: count - 1) //move newer added element to correct index in heap
    }
    
    @discardableResult
    mutating func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }
        
        //swap the top of the heap with the last element in the heap before removing the old top to maintain the correct
        //heap structure of a balanced binary tree
        elements.swapAt(0, count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            //new top is potentially out of order now so need to sift it down to its correct position/index
            siftDown(elementAtIndex: 0)
        }
        
        return element
    }
    
    // MARK: - Sifting
    
    private mutating func siftUp(elementAtIndex index: Int) {
        guard !isRoot(index) else {
            return
        }
        
        let parentIndex = parentIndex(of: index)
        
        guard isHigherPriority(at: index, than: parentIndex) else {
            return
        }
        
        //move child into parents index
        elements.swapAt(index, parentIndex)
        
        //child is now at parentIndex location, check if child can move higher again
        siftUp(elementAtIndex: parentIndex)
    }
    
    private mutating func siftDown(elementAtIndex parentIndex: Int) {
        //check if child indexes have a higher priority value than index (parent) holds
        let leftChildIndex = leftChildIndex(of: parentIndex)
        let rightChildIndex = rightChildIndex(of: parentIndex)
        
        var highestPriorityIndex = parentIndex
        
        //check if the leftChildIndex element is higher priority than parentIndex
        if leftChildIndex < count && isHigherPriority(at: leftChildIndex, than: parentIndex) {
            highestPriorityIndex = leftChildIndex
        }
        
        //check if the rightChildIndex element is higher priority than highestPriorityIndex - note here that we are
        //comparing against highestPriorityIndex rather than parentIndex as parentIndex might not have been higher
        //priority than leftChildIndex. If that is the case then we know that parentIndex needs to be pushed down
        //now we are determing which of the left or right child elements to replace it with; if that isn't the case
        //then we still need to check if the right child element has higher priority than the parent element
        if rightChildIndex < count && isHigherPriority(at: rightChildIndex, than: highestPriorityIndex) {
            highestPriorityIndex = rightChildIndex
        }
        
        //parentIndex already has a higher priority than either of child nodes so can't sift down any further
        guard parentIndex != highestPriorityIndex else {
            return
        }
        
        //move parent into childs index
        elements.swapAt(parentIndex, highestPriorityIndex)
        
        //after the swap highestPriorityIndex now contains the former parentIndex element check if the former
        //parentIndex element needs to sift down more to maintain the heap property
        siftDown(elementAtIndex: highestPriorityIndex)
    }
}
