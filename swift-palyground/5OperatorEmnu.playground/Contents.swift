import UIKit

var greeting = "Hello, playground"


// 第六章 高级运算符与枚举

// 位运算符 先不练习，和java基本一样

// 重载运算符
func addFuncInt(param1:Int,param2:Int)->Int{
    return param1+param2
}

func addFuncInt(param1:String,param2:String)->String{
    return param1+param2
}
addFuncInt(param1: "1", param2: "2")

// 自定义运算符
// 前缀 中辍 后辍运算符
// 前辍
prefix operator ++
prefix func ++ (param:Int)->Int{
    return param+1
}
++1

// 中辍
infix operator ++
func ++(param:Int,param2:Int)->Int{
    return param + param2
}
1++3

// 后辍
postfix operator **
postfix func **(param:Int)->Int{
    return param*param
}

2**


// 枚举
enum Surname {
    case 张
    case 景
    case 伍
}

var sur : Surname
sur = Surname.伍
sur = .景
print(sur)

// 需要写全每一个
switch sur {
    case .景:
        print("姓景")
    case .张:
        print("姓张")
    case .伍:
        print("姓伍")
}

// 枚举的原始值 有初始值要继承对应的值的类型
enum CharEnum : String {
    case a = "a"
    case b = "bb"
}


