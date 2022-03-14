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
