//
//  LeetCode652.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/5.
//

import Foundation

//652. 寻找重复的子树

//给定一棵二叉树，返回所有重复的子树。对于同一类的重复子树，你只需要返回其中任意一棵的根结点即可。
//
//两棵树重复是指它们具有相同的结构以及相同的结点值。
//
//示例 1：
//
//        1
//       / \
//      2   3
//     /   / \
//    4   2   4
//       /
//      4
//下面是两个重复的子树：
//
//      2
//     /
//    4
//和
//
//    4
//因此，你需要以列表的形式返回上述重复子树的根结点。

class LeetCode652 {
    //记录所有树以及出现的次数
    var allTrees = [String: Int]()
    //记录重复的子树根节点
    var res = [BYTreeNode<Int>?]()
    
    func findDuplicateSubtrees(_ root: BYTreeNode<Int>?) -> [BYTreeNode<Int>?] {
        _ = traverseTree(root)
        
        return res
    }
    
    func traverseTree(_ root: BYTreeNode<Int>?) -> String {
        guard let root = root else {
            return "#";
        }
        let left = traverseTree(root.left)
        let right = traverseTree(root.right)
        let subTree = left + "," + right + "," + String(describing: "\(root.value!)")
        var freq = allTrees[subTree]
        if freq == nil {
            freq = 0
            allTrees[subTree] = 0
        }
        
        // 多次重复也只会被加入结果集一次
        if freq == 1 {
            res.append(root)
        }
        allTrees[subTree] = freq! + 1
        
        return subTree
    }
    
    func test() {
        let tree = BYIntBinaryTree(with: "0,0,0,0,#,#,0,#,#,0,#")
        let arr = findDuplicateSubtrees(tree.root)
        // [0],[0,0]
        for i in arr {
            print(BYIntBinaryTree.init(i).description)
        }
        
    }
}
