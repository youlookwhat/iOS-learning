import UIKit

var greeting = "Hello, playground"

var str = "newValue"
print(str+"hello")

print(greeting)

/**
 * 这是注释
 */

var obj:String?
if obj==nil{
    print("是空的")
}

var 景彬 = "景彬1"
print(景彬)

var bool1 = true
var bool2 = false

print(bool1)

var car:(String,Int) = ("奔驰",200000)
var car1:(name:String,price:Int) = ("奔驰",200000)
print(car1.name)

// 提示
// var objS:String? = "HS"
var objS:String? = nil
if (objS != nil) {
    print("是的")
}else{
    print("不是")
}

// 如果objS有值则创建一个常量tem，然后赋值objS
if let tem = objS {
    print(tem)
}else{
    objS = "HS121"
    print(objS!)
}


var obj4:Int?
obj4 = 3
print(obj4!+1)

// 声明为隐私解析的变量
var obj5:Int!
obj5 = 3
print(obj5+2)

// 别名
// 为Int定义别名Price
typealias Price = Int
var ren:Price = 100
print(ren)

// 2.6第二章练习题
var a:Int = 1
var b = 2
var c = a
a = b
b = c
print(a)
print(b)

var count1 = 25// 十进制
var count2 = 0o31// 八进制
var count3 = 0x19// 十六机制 值为25
var count4 = 0b00011001 // 二进制


var bundle:(pencil:Int,eraser:Int,pencilCase:Int)=(2,1,15)
print(bundle)

var product:Int? = 100
if let weight = product,weight > 30{
    print("产品合格")
}

var  d = 22
print(d)

