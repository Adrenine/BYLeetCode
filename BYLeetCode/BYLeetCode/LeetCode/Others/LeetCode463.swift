//
//  LeetCode463.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/10/30.
//

import Foundation

//给定一个包含 0 和 1 的二维网格地图，其中 1 表示陆地 0 表示水域。
//
//网格中的格子水平和垂直方向相连（对角线方向不相连）。整个网格被水完全包围，但其中恰好有一个岛屿（或者说，一个或多个表示陆地的格子相连组成的岛屿）。
//
//岛屿中没有“湖”（“湖” 指水域在岛屿内部且不和岛屿周围的水相连）。格子是边长为 1 的正方形。网格为长方形，且宽度和高度均不超过 100 。计算这个岛屿的周长。
//
//
//
//示例 :
//
//输入:
//[[0,1,0,0],
// [1,1,1,0],
// [0,1,0,0],
// [1,1,0,0]]
//
//输出: 16

class LeetCode463 {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        guard let a = firstIsland(grid) else {
            return 0
        }
        let row = a.0
        let colum = a.1
        var array = grid
        process(&array, row, colum)
        return sum
    }
    var sum = 0
    func process(_ grid: inout [[Int]], _ row: Int, _ colum: Int) {
        
        // 遇到边界（row/colum越界即边界）或者遇到水域（值为0）
        if row < 0 || row >= grid.count || colum < 0 || colum >= grid[row].count || grid[row][colum] == 0 {
            sum += 1
            return
        }
        // 0在上面过滤了，这里过滤2，即已遍历过的方格
        if (grid[row][colum] != 1) {
            return
        }
        // 将该方格标记为已走过
        grid[row][colum] = 2
        
        //遍历上面一格
        process(&grid, row - 1, colum)
        //遍历左边一格
        process(&grid, row, colum - 1)
        //遍历下面一格
        process(&grid, row + 1, colum)
        //遍历右边一格
        process(&grid, row, colum + 1)
    }
    
    func firstIsland(_ grid: [[Int]]) -> (Int, Int)? {
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == 1 {
                    return (i, j)
                }
            }
        }
        return nil
    }
    
    func test() {
        print(islandPerimeter([[0,1,1],[1,1,0]])) // 10
        print(islandPerimeter([[0,1,0,0],[1,1,1,0],
                               [0,1,0,0],[1,1,0,0]])) // 16
    }
}
