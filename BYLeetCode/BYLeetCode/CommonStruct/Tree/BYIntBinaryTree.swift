//
//  BYBinaryTree.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/10/26.
//

import Foundation

class BYIntBinaryTree {
    
    var root: BYTreeNode<Int>?
    
    init(_ root: BYTreeNode<Int>? = nil) {
        self.root = root
    }
    
    func serialize() -> String {
        guard let root = root else {
            return ""
        }
        
        var res = "", queue: [BYTreeNode<Int>?] = [root]
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            if let node = node {
                res.append(String(describing: node.value ?? -1)+",")
                queue.append(node.left)
                queue.append(node.right)
            } else {
                res.append("#,")
            }
        }
        res.remove(at: res.index(before: res.endIndex))
        
        return res
    }
    
    static func deserialize(_ string: String) -> BYIntBinaryTree? {
        
        if string.count < 1 {
            return nil
        }
        
        var chars = Array(string)
        chars = chars.filter {
            $0 != " "
        }.filter {
            $0 != ","
        }
        var val = String(chars[0])
        let root = BYTreeNode<Int>(Int(val))
        var queue : [BYTreeNode<Int>?] = [root]
        var i = 1
        while !queue.isEmpty && i < chars.count {
            let node = queue.removeFirst()
            val = String(chars[i])
            if !val.elementsEqual("#") {
                node?.left = BYTreeNode(Int(val))
                queue.append(node?.left)
            }
            i += 1
            val = String(chars[i])
            if !val.elementsEqual("#") {
                node?.right = BYTreeNode(Int(val))
                queue.append(node?.right)
            }
            i += 1
        }
        let tree = BYIntBinaryTree()
        tree.root = root
        return tree
    }
}

extension BYIntBinaryTree: CustomStringConvertible {
    var description: String {
        return serialize()
    }
}
