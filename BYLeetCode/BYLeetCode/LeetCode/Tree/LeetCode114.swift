//
//  LeetCode114.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/4.
//

import Foundation

//给定一个二叉树，原地将它展开为一个单链表。
//
//例如，给定二叉树
//
//    1
//   / \
//  2   5
// / \   \
//3   4   6
//将其展开为：
//
//1
// \
//  2
//   \
//    3
//     \
//      4
//       \
//        5
//         \
//          6

//题解：
//如何按题目要求把一棵树拉平成一条链表？很简单，以下流程：
//  1、将root的左子树和右子树拉平。
//  2、将root的右子树接到左子树下方，然后将整个左子树作为右子树。
//          1              1           1
//        /   \          /   \          \
//      2       5   =>  2     5    =>    2
//    /   \      \       \     \          \
//   3     4      6       3    6           3
//                         \                \
//                          4                4
//                                            \
//                                             5
//                                              \
//                                               6
class LeetCode114 {
    func flatten(_ root: BYTreeNode<Int>?) {
        guard let root = root else {
            return
        }
        flatten(root.left)
        flatten(root.right)
        
        // 后序遍历位置
        // 1.左右子树已被拉平成一条链表
        let left = root.left
        let right = root.right
        
        // 2.将左子树作为右子树
        root.left = nil
        root.right = left
        
        // 3.将原先的右子树接到当前右子树的末端
        var p = root
        while p.right != nil {
            p = p.right!
        }
        p.right = right
    }
    
    func test() {
        let tree = BYIntBinaryTree(with: "1,2,3")
        let root = tree.root
        flatten(root)
        let tree2 = BYIntBinaryTree(root)
        print(tree2.description)
    }
}
