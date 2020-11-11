//
//  QuickSort.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/7.
//

import Foundation

//《快速排序》-- 非稳定排序
// 1.思路：
//选一个数为基准，将小于他的数放左边，大于他的数放右边。
// 2.方法：
//数组array，选第一个数n1为基准，遍历后面的元素，将小
//于他的数放左边区间NL，大于他的数放右边NR，对于NL和NR
//区间，同样采用相同策略，选第一个数为基准，遍历后面的元
//素放到基准元素两边，直到NL和NR区间只有一个元素。
// 3.时间复杂度：O(nlogn)
// 4.空间复杂度：O(logn)

class QuickSort {
    class func quickSort(_ nums: inout [Int]) {
        sort(&nums, low: 0, high: nums.count - 1)
    }
    
    class func sort(_ nums: inout [Int], low: Int, high: Int) {
        if low < high {
            let mid = partition(&nums, low: low, high: high)
            sort(&nums, low: low, high: mid - 1)
            sort(&nums, low: mid + 1, high: high)
        }
    }
    
    class private func partition(_ nums: inout [Int], low: Int, high: Int) -> Int {
        var low = low
        var high = high
        let temp = nums[low]
        while low < high {
            while low < high && nums[high] >= temp {
                high -= 1
            }
            nums[low] = nums[high]
            while low < high && nums[low] <= temp {
                low += 1
            }
            nums[high] = nums[low]
        }
        nums[low] = temp
        return low
    }
    
    class func test() {
        var array = [8,5,3,4,9,7]
        QuickSort.quickSort(&array)
        print(array)
    }
}
