//
//  InsertSort.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/5.
//

import Foundation

//《直接插入排序》-- 稳定排序
// 1.思路：
//将数组分成两部分，前半部分存放已排好序的元素，后半部分存
//放未排好序的元素。每次把未排好序的第一个元素插入到已排好序
//的部分。
// 2.方法：
//获取数组每一个元素num与其index，将num与index前面的
//每一个元素对比，直到找到第一个比他小的元素的index(s)，
//将index(s)后面的元素统统往后移一位，并将插入num到
//index(s)后面，完成一次插入，此时index前面的元素都是有
//序的，index后面的元素都是未排序的，继续下一次遍历。
// 3.时间复杂度：O(n^2)
//（1）外层循环为n
//（2）内层循环与外层循环有关，最多为n（逆序），最少为1（有序）
//时间复杂度O(n^2)，最差是全逆序，为O(n^2)，最好为全有序，为O(n)
// 4.空间复杂度：O(1)
//一个额外存储空间

class InsertSort {
    class func insertSort(_ nums: inout [Int]) {
        for i in 1..<nums.count {
            //将nums[i]插入到正确的位置
            insert(&nums, index: i)
        }
    }
    
    class private func insert(_ nums: inout [Int], index: Int) {
        //备份待插入元素
        let inserted = nums[index]
        var j = index - 1
        while j >= 0 && nums[j] > inserted  {
            nums[j+1] = nums[j] //将比待插入元素大的元素后移
            j -= 1
        }
        //将待插入元素插入正确位置
        nums[j+1] = inserted
    }
    
    class func test() {
        var array = [8,5,3,4,9,7]
        InsertSort.insertSort(&array)
        print(array)
    }
}
