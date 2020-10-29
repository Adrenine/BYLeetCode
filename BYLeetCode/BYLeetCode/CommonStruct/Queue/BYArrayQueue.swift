//
//  BYArrayQueue.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/10/24.
//

import Foundation

public struct BYArrayQueue<T>: BYQueueProtocol {
    private var array: [T] = []
    public init() {}
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public var peek: T? {
        return array.first
    }
    
    @discardableResult
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    @discardableResult
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}

extension BYArrayQueue: CustomStringConvertible {
    public var description: String {
        return array.description
    }
}
