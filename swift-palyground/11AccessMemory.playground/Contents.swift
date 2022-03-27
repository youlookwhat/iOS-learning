import UIKit

var str = "Hello, playground"

// 第12章 Swift的高级特性

// 写访问
var name = "jingbin"
// 读访问
print(name)

// 读写权限异常：
//1.至少有一个变量在使用写权限
//2.变量访问的是同一个内存地址
//3.持续时间有重叠

// 读写权限冲突时会出现异常
// 1.inout参数读写权限冲突
var stepSize = 1
func increment(_ number:inout Int) {
    number += stepSize
}
// stepSize 既是写的值又是要读的值，有问题
//increment(&stepSize)

// 访问了同一内存地址
var stepSize2 = 1
func increment(_ number:inout Int,_ number2:inout Int){
    var _ = number+number2
}
// 同时访问了stepSize2
//increment(&stepSize2,&stepSize2)

// 2.结构体中自修改函数的读写冲突
struct Player {
    var name:String
    var health:Int
    mutating func shareHealth(player:inout Player){
        health = player.health
    }
}
var player = Player(name: "jing", health: 11)
// 不能既读又存
//player.shareHealth(player: &player)

//3.值类型中属性的读写访问权限冲突
class Demo{
    var playerInformation = (name:"jingbin",health:10)
    func balance(_ p1:inout String,_ p2:inout Int){
        
    }
    func test() {
        //inout 访问了写权限，playerInformation.name又访问了读权限
//        self.balance(&playerInformation.name, &playerInformation.health)
    }
}
// 需要满足三个条件：
/*
 1.访问的是存储属性，而不是计算属性
 2.访问的是结构体局部变量(函数中的变量)，而不是全局变量
 3.结构体不被闭包捕获，或者只是被非逃逸的闭包捕获
 */


class Demo2{
    func balance(_ p1:inout String,_ p2:inout Int){
        
    }
    func test() {
        // 在方法体里，正确
        var playerInformation = (name:"jingbin",health:10)
        self.balance(&playerInformation.name, &playerInformation.health)
    }
}

// 关联类型可以添加where约束子句
protocol Container {
    // 约束item类型为Int类型
    associatedtype Item where Item == Int
    func append(_ item:Item)
    var count:Int{get}
    subscript(i:Int) -> Item{get}
}
class Myprotocol : Container{
    // 这个地方必须指定为int类型
    typealias Item = Int
    var count: Int{
        get {
            return self.innerArray.count
        }
    }
    
    subscript(i: Int) -> Int {
        return self.innerArray[i]
    }
    
    
    func append(_ item: Int) {
        self.innerArray.append(item)
    }
    
    var innerArray = [Int]()
        
}

// 多行字符串
var multiString:String =
"""
1
2
3
456
"""
print(multiString)

// 加#可以不考虑转义字符，完整的是 #" "#
var jinString = #"\12345\"#
print(jinString)

// 遍历
let array = ["1","2","3"]
for item in array[0 ..< array.count] {
    print(item)
}
// 更简洁
for item in array[0...] {
    print(item)
}

// 动态成员查找与动态方法调用
/*
 @dynamicMemberLookup 可以为数据结构增加动态查找的能力
 @dynamicCallable 可以将类型修饰为支持动态方法调用
 */
@dynamicMemberLookup
@dynamicCallable
class CustomData {
    var name:String = ""
    var age:Int = 0
    subscript(dynamicMember menber:String) -> String {
        return "unkown"
    }
    subscript(dynamicMember menber:Int) -> Int {
        return 0
    }
    func dynamicallyCall(withArguments arg:[String]){
        print("unkown func:\(arg)")
    }
    func dynamicallyCall(withKeywordArguments pairs:KeyValuePairs<String,Int>){
        let res = pairs.map{key,value in return "[\(key):\(value)]"}.joined(separator: "")
        print(res)
    }
}

let obj = CustomData()
obj("字符串参数","a","b")
obj(a:1,b:2)


// 泛型与协议功能的增强
protocol People {
    var name:String{get set}
    var age:Int{set get}
}
protocol Teach {
    func teachSwift()
}
class Teacher : People,Teach {
    var name:String = "jing"
    var age:Int = 30
    func teachSwift() {
        print("tearch...")
    }
}
// 使用&可以对协议进行混合
func priTearcher(p:Teach&People){
    print(p.name,p.age)
    p.teachSwift()
}
