//
//  LeetCode105.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/5.
//

import Foundation

//根据一棵树的前序遍历与中序遍历构造二叉树。
//
//注意:
//你可以假设树中没有重复的元素。
//
//例如，给出
//
//前序遍历 preorder = [3,9,20,15,7]
//中序遍历 inorder = [9,3,15,20,7]
//返回如下的二叉树：
//
//    3
//   / \
//  9  20
//    /  \
//   15   7

class LeetCode105 {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> BYTreeNode<Int>? {
        return buildTree(preorder, preStart: 0, preEnd: preorder.count - 1, inorder, inStart: 0, inEnd: inorder.count - 1)
    }
    
    func buildTree(_ preorder: [Int], preStart: Int, preEnd: Int, _ inorder: [Int], inStart: Int, inEnd: Int) -> BYTreeNode<Int>? {
        if preStart > preEnd {
            return nil;
        }
        
        // root 节点对应的值就是先序遍历数组的第一个元素
        let rootVal = preorder[preStart]
        // rootVal 在中序遍历数组中的索引
        var index = 0
        for i in inStart...inEnd {
            if inorder[i] == rootVal {
                index = i
                break
            }
        }
        let leftSize = index - inStart
        let root = BYTreeNode(rootVal)
        // 递归构造左右子树
        root.left = buildTree(preorder, preStart: preStart + 1, preEnd: preStart + leftSize, inorder, inStart: inStart, inEnd: index - 1)
        root.right = buildTree(preorder, preStart: preStart + leftSize + 1, preEnd: preEnd, inorder, inStart: index + 1, inEnd: inEnd)
        
        return root
    }
    
    func test() {
        let preorder = [3,9,20,15,7]
        let inorder = [9,3,15,20,7]
        let root = buildTree(preorder, inorder)
        let tree = BYIntBinaryTree(root)
        print(tree.description)
    }
    
    var preorder = [Int]()
    func preorderTraverse(_ root: BYTreeNode<Int>?) {
        guard let root = root else {
            return
        }
        //先序遍历
        preorder.append(root.value!)
        preorderTraverse(root.left)
        preorderTraverse(root.right)
    }
    var inorder = [Int]()
    func inorderTraverse(_ root: BYTreeNode<Int>?) {
        guard let root = root else {
            return
        }
        inorderTraverse(root.left)
        //中序遍历
        inorder.append(root.value!)
        inorderTraverse(root.right)
    }
}

