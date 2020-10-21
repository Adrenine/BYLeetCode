//
//  TreeNode.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/10/21.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
