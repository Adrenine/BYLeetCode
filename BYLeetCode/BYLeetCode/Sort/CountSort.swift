//
//  CountSort.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/9.
//

import Foundation

class CountSort {
    class func countSort(_ nums: inout [Int]) {
        //最大值
        var max = nums[0]
        for i in 1..<nums.count {
            if max < nums[i] {
                max = nums[i]
            }
        }
        
        //新建数组
        var array = Array.init(repeating: 0, count: max+1)
        for i in 0..<nums.count {
            let index = nums[i]
            array[index] = array[index] + 1
        }
        
        var index = 0
        for i in 0..<array.count {
            let count = array[i]
            for _ in 0..<count {
                nums[index] = i
                index += 1
            }
        }
    }
    
    class func test() {
        var array = [1,3,1,2,6,7,9,8,5,4,0,10]
        let _ = CountSort.countSort(&array)
        print(array)
    }
}
