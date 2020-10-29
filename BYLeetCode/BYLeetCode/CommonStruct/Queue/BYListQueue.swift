//
//  BYListQueue.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/10/24.
//

import Foundation

public class BYListQueue<E>: BYQueueProtocol where E: Equatable & CustomStringConvertible {
    private var list = BYLinkedList<E>()
    
    public func enqueue(_ element: E) -> Bool {
        list.append(element: element)
        return true
    }
    
    public func dequeue() -> E? {
        return list.isEmpty ? nil : list.removeFirst()?.value
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    public var peek: Element? {
        return list.head?.value
    }
}

extension BYListQueue: CustomStringConvertible {
    public var description: String {
        return list.description
    }
}
