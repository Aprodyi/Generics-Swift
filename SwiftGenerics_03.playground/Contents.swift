import UIKit

// MARK: - Задача 3*. К выполнению необязательна.
/**
 Enum-ы не могут иметь хранимых свойств, только вычисляемые. Поэтому придется хранить значения в кейсах enum-a.
*/
enum LinkedList<Element> {
    indirect case Node(_ element: Element, next: LinkedList<Element>) // С помощью ключевого слова indirect указываем глубину 
                                                                      // рекурсии, поскольку Value типы в Swift-e имеют постоянный 
                                                                      // размер. Если бы мы не указывали точную глубину рекурсии, 
                                                                      // то поведение enum-a было бы неопределенным и непредсказуемым. 
                                                                      // С помощью indirect-а меняется способ, которым Swift 
                                                                      // хранит enum-ы, которые ссылаются на себя. Иначе enum 
                                                                      // может стать бесконечно большим: оно просто будет ссылаться 
                                                                      // на себя снова и снова, что привело бы к переполнению стека и крашу.
    case Empty
    
    init() {
        self = .Empty
    }
    
    init(_ value: Element, pointerTo: LinkedList<Element> = .Empty) {
        self = .Node(value, next: pointerTo)
    }
    
    func addNode(_ elem: Element) -> LinkedList {
        return .Node(elem, next: self)
    }
    
    mutating func addElement(element: Element) {
        self = self.addNode(element)

    }
    
    mutating func getLast() -> Element? {
        switch self {
        case .Empty:
            return nil
        case let .Node(elem, next: nextElem):
            self = nextElem
            return elem
        }
    }
    
    var count: Int {
        var innerCount = 0
        var tmpList: LinkedList<Element> = self // Создаем временный список
        // Если список не пустой, вызываем рекурсивно ф-ю caculateCount, и каждый вызов двигаемся по указателю next по элементам и суммируем счетчик innerCount, когда дойдем до последнего эл-та (т.е. до nil-a), то выходим из ф-ии
        func calculateCount() {
            switch tmpList { // Используем временный список, т.к. в не mutating ф-иях нельзя менять значения Value типов (enum-ы и структуры), а mutating могут быть только методы (calculateCount - ф-я внутри вычисляемого с-ва)
                case .Empty:
                    return
                case let .Node(_, next: nextElem):
                    innerCount += 1
                    tmpList = nextElem
                    calculateCount()
            }
        }
        calculateCount()
        return innerCount
    }
    
    subscript(i: Int) -> LinkedList<Element>? {
        var tmpList: LinkedList<Element> = self
        
        for _ in 0..<self.count - i - 1{
            switch tmpList{
            case .Empty:
                return nil
            case let .Node(_, next: nextElem):
                tmpList = nextElem
            }
        }
        return tmpList
    }
    
    mutating func insert (insertNode: Element, index: Int) { // Вставка в произвольное место
        var arrayList: [Element] = [] // Массив для хранения вытащенных элементов из списка
        let countElement = self.count
        
        for _ in 0..<countElement - index{
            switch self {
            case let .Node(elem, next: nextElem):
                self = nextElem
                arrayList.append(elem)          // Пробегаемся по элементам от 0 до i, и сохраняем вытащенные элементы в массив
            case .Empty:
                self = self.addNode(insertNode) // Если пустой список, то просто добавляем узел
            }
        }
        
        self.addElement(element: insertNode)    // Добавляем наш новый элемент
        
        for _ in 0..<countElement - index  {
            self = self.addNode(arrayList.removeLast()) // Возвращаем элементы в наш список
        }
        
    }
}

var list = LinkedList<Int>.Empty.addNode(1).addNode(2).addNode(3)
list.addElement(element: 88)
list.count
list.addElement(element: 654)

list
list.insert(insertNode: 9999, index: 1)
list[0]
list[1]
list[2]
list[3]
list[4]
list[5]

list.getLast()

list[2]
list.getLast()
list.count
list[3]
