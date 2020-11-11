//
//  BucketSort.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/9.
//

import Foundation

//《桶排序》-- 取决于区间内调用的排序方法
// 1.思路：
// 类似计数排序，划分区间，放入元素，对区间内元素进行排序。
// 2.方法：
// 划分区间N1~N10，区间大小可以自定义设置，将元素放入对应
// 区间，调用其他排序方法进行排序，最后按区间累加。
// 3.时间复杂度：O(？)
// 4.空间复杂度：O(？)

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
