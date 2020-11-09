//
//  SmallRootHeap.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/11/9.
//

import Foundation

class SmallRootHeap {

    /// 构建小顶堆的层次遍历序列: f(i)<f(2i), f(i)<f(2i+1), i > 0
    class func buildSmallRootHeap(_ items: inout [Int]) {
        var i = items.count
        while i > 0 {
            adjust(&items, start: i - 1, size: items.count)
            i -= 1
        }
    }
    
    class func adjust(_ items: inout [Int], start: Int, size: Int) {
        let temp = items[start]
        var parent = start + 1 //父节点下标
        var maxChild = 2 * parent //左孩子下标
        
        //遍历当前节点以及子节点
        while maxChild <= size {
            //比较左右孩子并找出较小的下标
            if maxChild < size && items[maxChild - 1] > items[maxChild] {
                maxChild += 1
            }
            // 如果较小的那个子节点比根节点小，就将该节点的值赋值给父节点
            if temp > items[maxChild - 1] {
                items[parent - 1] = items[maxChild - 1]
            } else {
                break
            }
            parent = maxChild
            maxChild = parent << 1
        }
        
        items[parent - 1] = temp
    }
    
    class func heapAdjust(_ items: inout [Int], size: Int) {
        let temp = items[0]
        var parent = 1
        var maxChild = parent << 1
        
        while maxChild <= size {
            var m1 = items[maxChild - 1]
            let m2 = items[maxChild]
            if maxChild < size && m1 > m2 {
                maxChild += 1
            }
            m1 = items[maxChild - 1]
            if temp > m1 {
                items[parent - 1] = items[maxChild - 1]
            } else {
                break
            }
            parent = maxChild
            maxChild = parent << 1
        }
        items[parent - 1] = temp
    }

    class func test() {
        var array = [6,4,5,2,1]
        let _ = SmallRootHeap.buildSmallRootHeap(&array)
        print(array)
    }
}
