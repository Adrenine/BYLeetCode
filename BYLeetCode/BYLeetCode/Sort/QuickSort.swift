//
//  QuickSort.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/7.
//

import Foundation

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
