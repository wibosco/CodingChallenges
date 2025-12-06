// Created 01/06/2016.

import Foundation

final class BinarySearchTreeDepthNode {

    // MARK: Properties
    
    var value: Int
    var depth: Int
    
    var left: BinarySearchTreeDepthNode?
    var right: BinarySearchTreeDepthNode?
    
    // MARK: Init
    
    init(value: Int, depth: Int) {
        self.value = value
        self.depth = depth
    }
}
