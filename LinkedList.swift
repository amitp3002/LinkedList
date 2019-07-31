//
//  LinkedList.swift
//  
//
//  Created by Amit Patel on 7/31/19.
//

import Foundation


// Most operations are O(n) or O(1) for e.g. prepending items into the linked list
class LinkedList {
    
    private class Node {
        var data:Int
        var next:Node?
        
        init(data:Int) {
            self.data = data
            self.next = nil
        }
    }
    
    private var head:Node?
    
    func isEmpty()->Bool {
        return head == nil
    }
    
    func count()->Int {
        if head == nil {
            return 0
        }
        var current = head
        var count = 1
        while current?.next != nil {
            current = current?.next
            count += 1
        }
        return count
    }
    
    func append(item:Int) {
        if head == nil {
            head = Node(data: item)
            return
        }
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        current?.next = Node(data: item)
    }
    
    func prepend(item:Int) {
        if head == nil {
            head = Node(data: item)
        } else {
            let newHead = Node(data: item)
            let previousHead = head
            newHead.next = previousHead
            head = newHead
        }
    }
    
    
    func delete(item:Int) {
        if head?.data  == item {
            head = head?.next
        } else {
            var current = head
            var previous:Node? = nil
            while current != nil {
                previous = current
                current = current?.next
                if current?.data == item {
                    previous?.next = current?.next
                }
            }
        }
    }
    
    func reverseLinkedList() {
        if head == nil {
            return
        }
        var previous:Node? = nil
        var current = head
        var next:Node? = nil
        
        while current != nil {
            if current?.next != nil {
                head = current?.next
            }
            next = current?.next
            current?.next = previous
            previous = current
            current = next
        }
    }
    
    
    func printLinkedList() {
        if head == nil {
            print("Linked list is empty")
        } else {
            var current = head
            while current != nil {
                if let data = current?.data {
                    print("item is \(data)")
                }
                current = current?.next
            }
        }
    }
    
    func find(item:Int) throws {
        let error = NSError(domain: "Not implemented", code: -1, userInfo: nil)
        throw error
    }
}

