//
//  BucketSort.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/9.
//

import Foundation

class BucketSort {
    class func bucketSort(_ nums: inout [Int]) {
        guard nums.count > 0 else {
            return
        }
        //得到最大值与最小值以及他们的差
        var max = nums[0]
        var min = max
        for n in nums {
            if max < n {
                max = n
            }
            if min > n {
                min = n
            }
        }
        let dis = max - min
        let count = nums.count
        var bucket = Array.init(repeating: [Int](), count: count)
        for i in 0..<count {
            let num = (nums[i] - min) * (count - 1) / dis
            bucket[num].append(nums[i])
        }
        
        for i in 0..<bucket.count {
            var array = bucket[i]
            array.sort()
            bucket[i] = array
        }
        
        var index = 0
        bucket.forEach { (array) in
            array.forEach { (n) in
                nums[index] = n
                index += 1
            }
        }
    }
    
    
    class func test() {
        var array = [1,3,1,2,6,7,9,8,5,4,0,10]
        let _ = BucketSort.bucketSort(&array)
        print(array)
    }
}
