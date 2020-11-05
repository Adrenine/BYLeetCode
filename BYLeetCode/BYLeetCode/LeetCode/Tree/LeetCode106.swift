//
//  LeetCode106.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/5.
//

import Foundation

//根据一棵树的中序遍历与后序遍历构造二叉树。
//
//注意:
//你可以假设树中没有重复的元素。
//
//例如，给出
//
//中序遍历 inorder = [9,3,15,20,7]
//后序遍历 postorder = [9,15,7,20,3]
//返回如下的二叉树：
//
//    3
//   / \
//  9  20
//    /  \
//   15   7

class LeetCode106 {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> BYTreeNode<Int>? {
        return buildTree(inorder, inStart: 0, inEnd: inorder.count - 1, postorder, postStart: 0, postEnd: postorder.count - 1)
    }
    
    func buildTree(_ inorder: [Int], inStart: Int, inEnd: Int, _ postorder: [Int], postStart: Int, postEnd: Int) -> BYTreeNode<Int>? {
        if inStart > inEnd {
            return nil
        }
        // root节点对应的值就是后序遍历数组的最后一个元素
        let rootVal = postorder[postEnd]
        // rootVal 在中序遍历数组中的索引
        var index = 0
        for i in inStart...inEnd {
            if inorder[i] == rootVal {
                index = i
                break
            }
        }
        let root = BYTreeNode(rootVal)
        let leftSize = index - inStart
        //递归构造左右子树
        root.left = buildTree(inorder, inStart: inStart, inEnd: index - 1, postorder, postStart: postStart, postEnd: postStart + leftSize - 1)
        root.right = buildTree(inorder, inStart: index + 1, inEnd: inEnd, postorder, postStart: postStart + leftSize, postEnd: postEnd - 1 )
        return root
    }
    
    func test() {
        let inorder = [9,3,15,20,7]
        let postorder = [9,15,7,20,3]
        let root = buildTree(inorder, postorder)
        let tree = BYIntBinaryTree(root)
        print(tree.description)
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
    
    var postorder = [Int]()
    func postorderTraverse(_ root: BYTreeNode<Int>?) {
        guard let root = root else {
            return
        }
        postorderTraverse(root.left)
        postorderTraverse(root.right)
        //后序遍历
        postorder.append(root.value!)
    }
}
