import UIKit

var str = "Hello, playground"

// 第11章 类型转换、泛型、扩展与协议

// is 类型检查
var str1 :String = "jingbin"
if str1 is String {
    print("对的")
}

// as 类型转换
var str2:String = "ddd"
var sss = str2 as String
print(sss)

class MyClass {
    
}
class SubClass:MyClass {
    var name:String = "jingbin"
}

var cla:SubClass = SubClass()
var array:[MyClass] = [cla]
var arrayOne = array[0]

if arrayOne is SubClass {
    (arrayOne as! SubClass).name
    let cls2:SubClass = arrayOne as! SubClass
    cls2.name
}

// AnyObject ： 引用类型的通用类型
// Any ： 任意类型，包括引用类型和值类型

// 泛型
// 实现两个相同类型的参数互换
func exchange<T>(param1:inout T,parma2:inout T){
    let tmp = param1
    param1 = parma2
    parma2 = tmp
}
var p1 = "4"
var p2 = "5"
exchange(param1: &p1, parma2: &p2)
print(p1,p2)// 5,4



// 定义一个栈结构体，ItemType为定义栈中元素类型的泛型
struct Stack<ItemType> {
    var items:[ItemType] = []
    // 修改了属性的值，需要用mutating修饰
    mutating func push(param:ItemType){
        self.items.append(param)
    }
    mutating func pop()->ItemType{
        return self.items.removeLast()
    }
}

var stack = Stack<Int>()
stack.push(param: 1)
stack.push(param: 2)
stack.pop()
print(stack.items)//1 栈先进后出

// 为Stack栈类型添加一个扩展
extension Stack {
    func getArrary() -> [ItemType]{
        return items
    }
}
var stack2 = Stack<Int>()
stack2.push(param: 7)
stack2.push(param: 3)
stack2.pop()
print(stack2.getArrary())//7 栈先进后出

// 对泛型进行约束，可以将泛型继承，然后其他实现泛型就一定要是这个类的子类

class MyClass1 {
    
}
struct Stack2<ItemType : MyClass1> {
    var items:[ItemType] = []
    // 修改了属性的值，需要用mutating修饰
    mutating func push(param:ItemType){
        self.items.append(param)
    }
    mutating func pop()->ItemType{
        return self.items.removeLast()
    }
}
class SubMyClass: MyClass1 {
    var num :Int
    init(num:Int) {
        self.num = num
    }
    func get() -> Int {
        return num
    }
}

var s2 = Stack2<SubMyClass>()
s2.push(param: SubMyClass(num:2))
s2.push(param: SubMyClass(num:3))
s2.pop()

// 使用协议来约束泛型
protocol MyProtocol {
    
}
struct Stack3<ItemType : MyProtocol> {
    var items:[ItemType] = []
    // 修改了属性的值，需要用mutating修饰
    mutating func push(param:ItemType){
        self.items.append(param)
    }
    mutating func pop()->ItemType{
        return self.items.removeLast()
    }
}

// 协议里的泛型
protocol MyProtocol2 {
    // 实现协议时才指定类型
    associatedtype ItemType
    var param:ItemType {get set}
    func printParam(param:ItemType)->Void;
}
// 实现协议
class MyCalssP:MyProtocol2 {
    // 一定要实现这个方法和printParam，不然还是要指定类型
    var param: Int {
        get {
            return 0
        }
        set {
            
        }
    }
    
    func printParam(param: Int) {
        print(param)
    }
    
}


// 扩展与协议
class MyClass3{
    var name:String = "jing"
    init() {
        name = "哈哈"
    }
}
// 给MyClass3进行扩展
extension MyClass3 {
    
    // 扩展计算属性
    var nameAndAge :String{
        return "\(name) + 5"
        
    }
    
    // 扩展构造函数
    convenience init(name:String) {
        self.init()
        self.name  = name
    }
    
    // 扩展示例方法，类里修改属性的值不用使用mutating？结构体里要使用？
    func logName(){
        name = "是我"
        print(name)
    }
    
    // 扩展静态方法
    class func logClassName(){
        print("MyClass3")
    }
}
var c3 = MyClass3()
c3.nameAndAge //jing + 5
c3.logName()

// 对Int进行扩展
extension Int{
    // 修改本身需要使用mutating
    mutating func change(){
        self = self*self
    }
}
var r :Int = 9
r.change()

// 协议的应用
protocol ProtocolNew {
    var name:String{get}
    var age:Int {get set}
    // 静态属性
    static var className:String{get}
    // 多数情况
    func logName()
    func logName(param:String)
    // 静态方法
    static func staticLogName()
}
class ClassNew:ProtocolNew {
    static func staticLogName() {
        print("staticLogName")
    }
    
    func logName(param: String) {
        print(param)
    }
    
    func logName() {
        print(name)
    }
    
    static var className: String {
        return "ClassNew"
    }
    
    var name: String
    
    var age: Int
    init() {
        name = ""
        age = 3
    }
}

// 协议与扩展的结合
@objc protocol ClassProtocol:class {
    @objc optional func log()
}
// 为ClassProtocol中的方法提供默认实现
extension ClassProtocol {
    func log(){
        print("log")
    }
}
class ClassE:ClassProtocol {
    
}
var clsE  = ClassE()
clsE.log()
