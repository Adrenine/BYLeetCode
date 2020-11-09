//
//  ShellSort.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/6.
//

import Foundation

//《希尔排序》-- 非稳定排序
// 1.思路：
//将数组逻辑上分成间距为d的N组，然后对这N组进行插入排序(插入
//排序所作用的数据量比较小（每一个小组），插入效率比较高)，缩
//小间距d1=d/2，对N1组同样进行排序，直到dn=1，完成排序。
// 2.方法：
//数组array，长度为count，间距d=count/2，遍历0<=index<d，
//插入排序逻辑数组[array[index],array[index+d]]，然后缩小
//间距d1=d/2的N1组，同样进行插入排序，直到dn=1，排序完成以后，数
//组为全有序。
// 3.时间复杂度：O(n^2)
// 4.空间复杂度：O(1)

class ShellSort {
    class func shellSort(_ nums: inout [Int]) {
        let count = nums.count
        var dis = count >> 1
        while dis>0 {
            for i in dis..<count {
                insert(&nums, dis: dis, index: i)
            }
            dis = dis >> 1
        }
    }
    
    class private func insert(_ nums: inout [Int], dis: Int, index: Int) {
        let inserted = nums[index]
        var j = index - dis
        while j >= 0 && inserted < nums[j] {
            nums[j+dis] = nums[j]
            j -= dis
        }
        nums[j+dis] = inserted
    }
    
    class func test() {
        var array = [8,5,3,4,9,7]
        ShellSort.shellSort(&array)
        print(array)
    }
}
