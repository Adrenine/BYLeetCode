//
//  LeetCode654.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/5.
//

import Foundation

//给定一个不含重复元素的整数数组。
//一个以此数组构建的最大二叉树定义如下：
//1.二叉树的根是数组中的最大元素。
//2.左子树是通过数组中最大值左边部分构造出的最大二叉树。
//3.右子树是通过数组中最大值右边部分构造出的最大二叉树。
//
//通过给定的数组构建最大二叉树，并且输出这个树的根节点。
//示例 ：
//
//输入：[3,2,1,6,0,5]
//输出：返回下面这棵树的根节点：
//
//      6
//    /   \
//   3     5
//    \    /
//     2  0
//       \
//        1
//
//
//提示：
//
//给定的数组的大小在 [1, 1000] 之间。
class LeetCode654 {
    func constructMaximumBinaryTree(_ nums: [Int]) -> BYTreeNode<Int>? {
        return buildTree(nums, start: 0, end: nums.count - 1)
    }
    
    func buildTree(_ nums: [Int], start: Int, end: Int) -> BYTreeNode<Int>? {
        
        if nums.count < 1 {
            return nil
        }
        if start > end {
            return nil
        }
        // 找到数组最大值以及最大值的索引
        var index = -1
        var maxVal = Int.min
        for i in start...end {
            let num = nums[i]
            if maxVal < num {
                maxVal = num
                index = i
            }
        }
        
        let root = BYTreeNode(maxVal)
        root.left = buildTree(nums, start: start, end: index - 1)
        root.right = buildTree(nums, start: index + 1, end: end)
        return root
    }
    
    func test() {
        let root = constructMaximumBinaryTree(
            [3,2,1,6,0,5])
        let tree = BYIntBinaryTree(root)
        print(tree.description)
        
    }
}
