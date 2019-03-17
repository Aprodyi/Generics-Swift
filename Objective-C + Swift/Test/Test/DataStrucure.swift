//
//  DataStrucure.swift
//  Test
//
//  Created by Владимир on 16.03.2019.
//  Copyright © 2019 Aleksandr Sychev. All rights reserved.
//

import Foundation


class Queue<QueueElement> {
    typealias Element = QueueElement
    private var queue: [Element] = []
    
    var count: Int {
        return queue.count
    }
    
    var front : Element?{
        return queue.first
    }
    
    func addElement(_ element: Element) {
        self.queue.append(element)
    }
    
    subscript(i: Int) -> Element? {
        return self.queue[i]
    }
    
    func pop() -> Element? {
        if queue.isEmpty {
            return nil
        } else{
            return queue.removeFirst()
        }
    }
}


class QueueForObjectiveC : NSObject {
    private let internalQueue = Queue<String>()
    
    @objc func addElement(_ element: String){
        internalQueue.addElement(element)
    }
    
    @objc var count: Int {
        return internalQueue.count
    }
    
    @objc subscript(i: Int) -> String? {
        return internalQueue[i]
    }
    
    @objc var front : String? {
        return internalQueue.front
    }
    
    @objc func pop() -> String? {
        return internalQueue.pop()
    }
}
