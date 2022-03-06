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

// 如果定义的值为Int值，那么会依次递增
enum IntEnum:Int {
    case 一 = 1
    case 二
    case 三
    case 四
}
var intEnum = IntEnum(rawValue: 1)
print(IntEnum.三.rawValue)


// 枚举的相关值，枚举类型的设计思路是帮助开发者将一些简单的同类数据进行整合
// 定义形状枚举
enum Shape {
    // 圆形，设置圆心和半径为相关值
    case circle(center:(Double,Double),radius:Double)
    // 矩形，设置中心，宽高为相关值
    case rect(center:(Double,Double),width:Double,height:Double)
    // 三角形，设置3个定点为相关值
    case triangle(point1:(Double,Double),point2:(Double,Double),point3:(Double,Double))
}

// 创建圆形枚举示例
var circle = Shape.circle(center: (1, 1), radius: 2)
// 创建矩形枚举实例
var rect = Shape.rect(center: (2, 3), width: 2, height: 3)
// 创建三角形枚举实例
var triangle = Shape.triangle(point1: (3,3), point2: (2, 2), point3: (1, 1))

// 写一个匹配函数，参数为Shape枚举类型
func shapeFunc(param:Shape) {
    switch (param) {
        case let .circle(center, radius):
            // 里面要用center值，所以上面要有let?
            print("此圆的圆心为\(center),半径为\(radius)")
        case let .rect(center, width, height):
            print("此矩形的中心为\(center),\(width),\(height)")
        case let .triangle(point1, point2, point3):
            print("此三角形的定点为\(point1),\(point2),\(point3)")
    }
}

shapeFunc(param: circle)
shapeFunc(param: rect)
shapeFunc(param: triangle)

// 递归枚举
// 递归算法实现正整数阶乘
func mathsFunc(num:Int) -> Int{
    let tmp = num-1
    if tmp>0{
        return mathsFunc(num: tmp)*num
    }else{
        return 1
    }
}
print(mathsFunc(num: 3))

// 使用枚举来模拟加减乘除四则运算
indirect enum Expression{
    // 单个数字 _匿名
    case num(_ param:Int)
    // 加法运算
    case add(param1:Expression,param2:Expression)
    // 减法
    case sub(param1:Expression,param2:Expression)
    // 乘法
    case mul(param1:Expression,param2:Expression)
    // 除法
    case div(param1:Expression,param2:Expression)
}

// 枚举递归，还是用方法实现
func expressionFunc(param:Expression)->Int{
    switch param {
    case let .num(param):
        return param
    case let .add(param1, param2):
        // param是expressionFunc里的，param1是Expression.add里的
        return expressionFunc(param: param1)+expressionFunc(param: param2)
    case .sub(param1: let param1, param2: let param2):
        return expressionFunc(param: param1)-expressionFunc(param: param2)
    case .mul(param1: let param1, param2: let param2):
        return expressionFunc(param: param1)*expressionFunc(param: param2)
    case .div(param1: let param1, param2: let param2):
        return expressionFunc(param: param1)/expressionFunc(param: param2)
    }
}

// 1 * (1+1)
expressionFunc(param: Expression.mul(param1: Expression.num(1), param2: (Expression.add(param1: Expression.num(1), param2: Expression.num(1)))))

// 练习：自定义后缀运算符 *!
postfix operator *!
postfix func *!(param:Int)->Int{
    var result=1
    var tmp = param
    while tmp>0 {
        result *= tmp
        tmp-=1
    }
    return result
}
// 5的阶乘
5*!
