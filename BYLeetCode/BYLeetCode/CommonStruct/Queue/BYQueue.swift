//
//  BYQueue.swift
//  BYLeetCode
//
//  Created by Kystar's Mac Book Pro on 2020/9/21.
//

import Foundation

public protocol BYQueueProtocol {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool {get}
    var peek: Element? {get}
}
