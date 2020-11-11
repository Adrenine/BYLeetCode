//
//  CountSort.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/9.
//

import Foundation

//《计数排序》-- 稳定排序
// 1.思路：
// 当待排数组，最大值与最小值相差不多的时候，可以生成一个从最小值到最大值有序的容器，然后将相同元素放入同一个容器，计数值加1，最后按从小到大顺序累加。
// 2.方法：
// 当数组最大值为Max，最小值为Min，则设置一个从Min到Max的
//容器，匹对值，放入容器中，计数值加1，统计完成后，将Min到
//Max每一个元素进行累加。
// 3.时间复杂度：O(n+m)，n为数组大小，m为(Max - Min)
// 4.空间复杂度：O(n+m)

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
