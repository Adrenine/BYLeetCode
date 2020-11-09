//
//  MergeSort.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/6.
//

import Foundation

//《归并排序》-- 稳定排序
// 1.思路：
// 将待排序的数分成两半后排好序，再将两个排好序的序列合并
//为一个有序序列。
// 2.方法：
//分：不断的分，直到只有一个元素，此时只含一个元素的序列是有序的。
//合：取出两个有序数组中较小的那个放入一个辅助数组中，直到有序数
//组都取完。
// 3.时间复杂度：O(nlog(n))
// 4.空间复杂度：O(n)

class MergeSort {
    class func mergeSort(_ nums: inout [Int]) {
        var temp : [Int] = Array.init(repeating: -1, count: nums.count)
        sort(&nums, temp: &temp, left: 0, right: nums.count - 1)
    }
    
    class func sort(_ nums: inout [Int], temp: inout [Int], left: Int, right: Int) {
        // left == right时，此时只有一个元素，终止递归
        if left < right {
            let center = (left + right) >> 1
            // left -> center递归
            sort(&nums, temp: &temp, left: left, right: center)
            // center + 1 -> right递归
            sort(&nums, temp: &temp, left: center+1, right: right)
            merge(&nums, temp: &temp, left: left, center: center, right: right)
        }
    }
    
    class private func merge(_ nums: inout [Int], temp: inout [Int], left: Int, center: Int, right: Int) {
        var i = left
        var j = center + 1
        // 先通过比较将两个有序数组合并为一个有序数组，
        // 结果暂放temp数组
        for k in left...right {
            if i > center { //左边没有元素了
                temp[k] = nums[j]
                j += 1
            } else if j > right { //右边没有元素了
                temp[k] = nums[i]
                i += 1
            } else if (nums[i] < nums[j]) { //取较小的
                temp[k] = nums[i]
                i += 1
            } else {
                temp[k] = nums[j]
                j += 1
            }
        }
        
        //数据回填
        for k in left...right {
            nums[k] = temp[k]
        }
    }
    
    class func test() {
        var array = [8,5,3,4,9,7]
        MergeSort.mergeSort(&array)
        print(array)
    }
}

class MergeSort1 {
    class func mergeSort(_ array: [Int])->[Int]{
        //1、如果数组为空或包含单个元素，则无法将其拆分为更小的部分，返回数组就行
        guard array.count > 1 else{
            return array
        }
        
        //2、找到中间索引
        let middleIndex = array.count/2
        
        //3、使用上一步中的中间索引，递归的分割数组的左侧
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        
        //4、递归的分割数组的右侧
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        
        //5、将所有值合并在一起，确保它始终排序
        return merge(leftArray, rightArray)
    }
    
    //合并算法
    class private func merge(_ leftArray : [Int], _ rightArray : [Int])->[Int] {
        
        //1、合并时需要两个索引来跟踪两个数组的进度
        var leftIndex = 0
        var rightIndex = 0
        
        //2、合并后的数组，目前时空的，需要在下面的操作中添加其他数组中的元素构建
        var orderedArray = [Int]()
        
        //3、while循环将比较左侧和右侧的元素，并添加到orderedArray。同时确保结果保持有序
        while leftIndex < leftArray.count && rightIndex < rightArray.count {
            if leftArray[leftIndex] < rightArray[rightIndex] {
                orderedArray.append(leftArray[leftIndex])
                leftIndex += 1
            } else if leftArray[leftIndex] > rightArray[rightIndex]{
                orderedArray.append(rightArray[rightIndex])
                rightIndex += 1
            } else {
                orderedArray.append(leftArray[leftIndex])
                leftIndex += 1
                orderedArray.append(rightArray[rightIndex])
                rightIndex += 1
            }
        }
        
        //4、如果前一个while循环完成，意味着left/right中的一个内容已经完全合并到orderedArray中，不需要再比较，只需要依次添加剩下的数组的剩余元素
        while leftIndex < leftArray.count {
            orderedArray.append(leftArray[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightArray.count {
            orderedArray.append(rightArray[rightIndex])
            rightIndex += 1
        }
        
        return orderedArray
    }
}
