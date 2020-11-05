//
//  LeetCode226.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/4.
//

import Foundation

//翻转一棵二叉树。
//
//示例：
//
//输入：
//
//     4
//   /   \
//  2     7
// / \   / \
//1   3 6   9
//输出：
//
//     4
//   /   \
//  7     2
// / \   / \
//9   6 3   1

class LeetCode226 {
    func invertTree(_ root: BYTreeNode<Int>?) -> BYTreeNode<Int>? {
        guard let r = root else {
            return nil
        }
        
        let left = invertTree(r.left)
        let right = invertTree(r.right)
        r.left = right
        r.right = left
        return r
    }
    
    func invertTree1(_ root: BYTreeNode<Int>?) -> BYTreeNode<Int>? {
        guard let r = root else {
            return nil
        }
        let temp = root?.left
        root?.left = root?.right
        root?.right = temp
        _ = invertTree(r.left)
        _ = invertTree(r.right)
        return r
    }
    
    func test() {
        let tree1 = BYIntBinaryTree(with: "1,2,3,#,#,4,5")
        print(tree1.serialize())
        let n1 = invertTree(tree1.root)
        print(BYIntBinaryTree(n1).serialize())
        
        let tree2 = BYIntBinaryTree(with: "1,2,3,#,#,4,5")
        print(tree2.serialize())
        let n2 = invertTree1(tree2.root)
        print(BYIntBinaryTree(n2).serialize())
    }
}
