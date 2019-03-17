import UIKit

// MARK: - Задача 2

protocol ContainerProtocol {
    associatedtype Element
    mutating func addElement(_ element: Element)
    var count : Int { get }
    subscript(i: Int) -> Element? { get }
}

// MARK: Очередь

struct Queue<QueueElement> : ContainerProtocol {
    typealias Element = QueueElement
    private var queue: [Element] = []   // для структур можем не использовать инициализаторы
    
    var count: Int {
        return queue.count
    }
    
    var front : Element?{
        return queue.first
    }
    
    mutating func addElement(_ element: Element) {
        self.queue.append(element)
    }
    
    subscript(i: Int) -> Element? {
        return self.queue[i]
    }
    
    mutating func pop() -> Element? { // Метод извлечения первого элемента из очереди, в протоколе нет, т.к. это специфика очереди
        if queue.isEmpty {
            return nil
        } else{
            return queue.removeFirst()
        }
    }
}

var queue = Queue<String>()
queue.addElement("1")
queue.addElement("2")
queue.addElement("3")
queue.addElement("4")

let front = queue.front
queue.pop()
let front2 = queue.front
let xxx = queue[1]
queue.addElement("new elem")
let count = queue.count
let last = queue[3]



// MARK: Односвязный список

class LinkedList<ListElement> : ContainerProtocol {
    
    typealias Element = ListElement
    
    class Node {                    // Класс узла списка
        var value: Element
        var next: Node?
        
        init(value: Element) {
            self.value = value
        }
    }
    
    var head: Node?                  // Первый узел списка (по умолчанию пусто)
    
    var last: Node? {
        guard var node = head else { // if let не можем исп-ть, т.к. у if let ограничена обл-ть видимости
            return nil               // поэтому исп. guard
        }
        while let next = node.next { // проверяем элементы, начиная с 1-го и пока не дойдем до nil-a
            node = next
        }
        return node
    }
    
    //----------------Удолетворяем требованиям протокола----------------
    
    func addElement(_ element: Element) { // Добавление элемента в конец
        if let lastNode = last {          // Если список не пустой, то добавляем элемент к last-y
            lastNode.next = Node(value: element)
        } else {
            head = Node(value: element)   // Иначе создаем head
        }
    }
    
    var count: Int {
        guard var node = head else {      // Если нет head-a, то элементов вообще нет в списке
            return 0
        }
        
        var count = 1
        while let next = node.next {      // Пробегаемся по всем элементам, пока не дойдем до nil-a
            node = next
            count = count + 1
        }
        return count
    }
    
    subscript(i: Int) -> Element? {
        if i == 0 {
            return head!.value
        } else {
            var nextNode = head!.next
            for _ in 1..<i {
                nextNode = nextNode?.next
                if nextNode == nil {
                    break
                }
            }
            return nextNode!.value
        }
    }
    
    // Реализуем доп. методы, специфичные для односвязного списка
    
    func node(index: Int) -> Node { // вспомогательная ф-я для insert-a, по сути это тотже сабскрипт (можно сделать, чтобы эта ф-я использовалась и в сабскрипте и в insert-e)
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            return node!
        }
    }
    
    func insert(insertNode: Node, index: Int) { // Вставка в произвольное место
        if index == 0 {                         // Если вставляем в начало, вместо head-a
            insertNode.next = head
            head = insertNode
        } else {
            let previousNode = self.node(index: index - 1)
            let nextNode = self.node(index: index)
            insertNode.next = nextNode         // Всавляемый элемент теперь указывает на эл-т с номером index
            previousNode.next = insertNode     // Элемент с индексом index - 1 теперь указывает на наш insertNode
        }
    }
    
    func removeAtIndex(index: Int) {          //Метод для удаления из списка (особо не заморачивался с реализацией)
        if index == 0 {
            head = node(index: 1)
        } else if index == count - 1 {
            node(index: index - 1).next = nil
        } else {
            let previousNode = self.node(index: index - 1)
            let nextNode = self.node(index: index + 1)
            previousNode.next = nextNode
            self.node(index: index).next = nil
        }
    }
}

var list = LinkedList<String>()

list.addElement("First Item")
list.addElement("Second Item")
list.head!.value
//list.last!.value

list[0]
list.addElement("222")
list[1]
list.count
list.addElement("wwww")
list.count

let insertValue = LinkedList<String>.Node(value: "Insert Value")
list.insert(insertNode: insertValue, index: 1)
list[1]
list.removeAtIndex(index: 1)
list[1]



