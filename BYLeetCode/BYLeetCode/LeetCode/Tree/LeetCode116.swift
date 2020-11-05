//
//  LeetCode116.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/4.
//

import Foundation

//给定一个完美二叉树，其所有叶子节点都在同一层，每个父节点都有两个子节点。二叉树定义如下：
//
//struct Node {
//  int val;
//  Node *left;
//  Node *right;
//  Node *next;
//}
//填充它的每个 next 指针，让这个指针指向其下一个右侧节点。如果找不到下一个右侧节点，则将 next 指针设置为 NULL。
//
//初始状态下，所有 next 指针都被设置为 NULL。

//         1 -> NULL
//       /   \
//      2  -> 3 -> NULL
//     / \   / \
//    4->5->6->7 -> NULL
//提示：
//
//你只能使用常量级额外空间。
//使用递归解题也符合要求，本题中递归程序占用的栈空间不算做额外的空间复杂度。

class LeetCode116 {
    func connect(_ root: BYTreeNode<Int>?) -> BYTreeNode<Int>? {
        guard let root = root else {
            return nil
        }
        
        connect(root.left, with: root.right)
        return root
    }
    
    func connect(_ node1: BYTreeNode<Int>?, with node2: BYTreeNode<Int>?) {
        guard let node1 = node1 else {
            return
        }
        guard let node2 = node2 else {
            return
        }
        
        //先序遍历
        node1.next = node2
        
        //共同父节点
        connect(node1.left, with: node1.right)
        connect(node2.left, with: node2.right)
        //父节点为兄弟节点
        connect(node1.right, with: node2.left)
    }
    
    func test() {
//        [1,2,3,4,5,6,7]
        let tree = BYIntBinaryTree(with: "1,2,3,4,5,6,7")
        let root = tree.root
        _ = connect(root)   //[1,#,2,3,#,4,5,6,7,#]
        print(root!)
    }
}

