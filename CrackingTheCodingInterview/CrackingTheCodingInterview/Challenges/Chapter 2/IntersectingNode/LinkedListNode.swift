//
//  LinkedListNode.swift
//  CrackingTheCodingInterview
//
//  Created by William Boles on 30/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

final class LinkedListNode {
    var value: Int
    var next: LinkedListNode?
    
    // MARK: - Init
    
    init(value: Int) {
        self.value = value
    }
}

extension LinkedListNode: Equatable {
    static func == (lhs: LinkedListNode, rhs: LinkedListNode) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension LinkedListNode: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
