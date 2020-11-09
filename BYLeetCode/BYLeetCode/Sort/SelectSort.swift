//
//  SelectSort.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/6.
//

//《选择排序》-- 非稳定排序
// 1.思路：
//不断从未排序的元素中选择最大(最小)的元素放入已排好序的元素中。
// 2.方法：
//逻辑上分排好序N1和未排好序N2的两部分。获取未排好序N2中的最
//大（最小）元素n2，与未排好序N2的第一个元素n1进行交换。
// 3.时间复杂度：O(n^2)
// 4.空间复杂度：O(1)

import Foundation

class SelectSort {
    class func selectSort(_ nums: inout [Int]) {
        // i下标左边是已排好序的元素，右边（包括i）是无序区间
        // 最小值下标默认是无序区间第一个元素下表（即i）
        for i in 0..<nums.count - 1 {
            var minIndex = i
            for j in (i+1)..<nums.count {
                if nums[j] < nums[minIndex] {
                    minIndex = j
                }
            }
            //交换最小值与未排好序的第一个元素
            let temp = nums[minIndex]
            nums[minIndex] = nums[i]
            nums[i] = temp
        }
    }
    
    class func test() {
        var array = [8,5,3,4,9,7]
        SelectSort.selectSort(&array)
        print(array)
    }
}
