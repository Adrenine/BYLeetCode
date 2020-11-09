//
//  BubbleSort.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/6.
//

import Foundation

//《冒泡排序》-- 稳定排序
// 1.思路：
//交换相邻的两个元素，每个循环找到一个最大(最小)的元素，放到结
//尾，然后以相同方法找到剩余元素中次最大(最小)的元素，放到次结尾，
//以此类推。
// 2.方法：
//数组array，长度为count，遍历相邻元素，比较交换，然后最大的元素
//到结尾，然后对结尾前面的元素进行同样操作。
// 3.时间复杂度：O(n^2)
// 4.空间复杂度：O(1)

class BubbleSort {
    class func bubbleSort(_ nums: inout [Int]) {
        for i in 0..<nums.count - 1 {   //遍历每一个元素
            for j in 0..<nums.count - i - 1 {   //遍历剩余未排序的元素
                
                let n1 = nums[j]
                let n2 = nums[j+1]
                if (n1 > n2) {
                    nums[j] = n2
                    nums[j+1] = n1
                }
            }
        }
    }
    
    class func test() {
        var array = [8,5,3,4,9,7]
        BubbleSort.bubbleSort(&array)
        print(array)
    }
}
