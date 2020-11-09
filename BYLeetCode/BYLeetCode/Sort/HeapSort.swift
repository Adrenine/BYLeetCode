//
//  HeapSort.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/9.
//

import Foundation

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
