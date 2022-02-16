import UIKit

var greeting = "Hello, playground"

// 第四章 基本运算符与程序流程控制

// 基本都知道，查漏补缺

// 元组赋值

// 元组解构赋值
var (n1,n2,n3) = (1,2,3)
print(n1,n2,n3)

// 元组比较
var  group1 = (1,2,3)
var  group2 = (2,2,3)
print(group1 < group2) // true 类型要一致

// 三目运算
var m = 2
var n = 3
print(m > n ? "m>n" : "m<=n")

// 空合并运算符
var q :Int? = 8
var value : Int
value = q ?? 0 // q不为空取q，否则取0

var range1 = 0 ... 9 // 包含9 [0,9]
0 ..< 9 // 不包含9 [0,9)

range1 ~= 8 // 是否包含8

for index in range1 {
    print(index)
}
for _ in range1 {
    print("不用使用值")
}

// 遍历字典
var collect : Dictionary = [1:"1",2:"2",3:"33"]
for (x1,y1) in collect {
    print(x1,y1)
}

// switch 语句没有break，默认有这个
var string1 = "1"
switch string1 {
    case "1":
        print("是1")
    default:
        print("")
}

switch string1 {
    case "1","2":
        print("是1或2")
    default:
        print("")
}
var num = 1
switch num {
    case 0 ... 3:
        print("在0到3中")
    default:
        print("")
}

var tuple = (0,0)
switch tuple {
    case (0,1):
        print("Sure")
    case (_,1):
        print("Sure")
    case (0...2,0...2):
        print("区间")
    default:
        print("default")
}
