//
//  TreeNode.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/10/21.
//

import Foundation

public class BYTreeNode<E> where E: Equatable & CustomStringConvertible {
    typealias E = E
    public var value: E?
    public var left: BYTreeNode?
    public var right: BYTreeNode?
    public convenience init(_ value: E?) {
        self.init(value, left:nil, right:nil)
    }
    
    public init(_ value: E?, left: BYTreeNode? = nil, right: BYTreeNode? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

