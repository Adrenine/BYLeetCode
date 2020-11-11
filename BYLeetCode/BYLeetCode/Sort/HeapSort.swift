//
//  HeapSort.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/9.
//

import Foundation

//《堆排序》-- 非稳定排序
// 1.思路：
// 每次构建大顶堆，每次取出堆顶元素，重构大顶堆，直
// 到所有元素都取出。
// 2.方法：
// 构建大顶堆，取出堆顶元素Top，此时Top为最大值，移
// 除Top以后重构大顶推，取出Top1，此时Top1为次大元素，
// 重复步骤，直到取出了所有元素。
// 构建小顶堆可完成从小到大排序。
// 3.时间复杂度：O(nlogn)
// 4.空间复杂度：O(1)

class HeapSrot {
    class func bigRootSort(_ nums: inout [Int]) {
        var end = nums.count - 1
        BigRootHeap.buildBigRootHeap(&nums)
        while end > 0 {
            //堆顶元素与最后一个元素交换
            let temp = nums[0]
            nums[0] = nums[end]
            nums[end] = temp
            end -= 1    //缩小大顶堆范围
            BigRootHeap.heapAdjust(&nums, size: end + 1)
        }
    }
    
    class func smallRootSort(_ nums: inout [Int]) {
        var end = nums.count - 1
        SmallRootHeap.buildSmallRootHeap(&nums)
        while end > 0 {
            //堆顶元素与最后一个元素交换
            let temp = nums[0]
            nums[0] = nums[end]
            nums[end] = temp
            end -= 1    //缩小大顶堆范围
            SmallRootHeap.heapAdjust(&nums, size: end + 1)
        }
    }
    
    class func test() {
        var array = [6,4,5,2,1]
        HeapSrot.bigRootSort(&array)
        print(array)
    }
}
