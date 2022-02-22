import UIKit

var greeting = "Hello, playground"

// 第五章 函数与闭包技术

// 完成函数的基本格式：func methodName(param1,param2,...)->returnValue{实现部分}


// 判断是否大于0的功能 ?号左右要加空格
func isMoreThan0(count:Int) -> Bool {
    return count>0 ? true:false
}
isMoreThan0(count: 1)

func myFunc1() -> Void {
    print("无返回值")
}

func myFunc2() {
    print("无返回值2")
}
myFunc1()
myFunc2()

// 模拟数据查询函数，返回的是元祖数据类型
func searchData(dataId:String) -> (success:Bool,data:String) {
    let success = true
    let data = "返回的数据"
    return (success,data)
}

if searchData(dataId: "dff").success {
    print(searchData(dataId: "dff").data)
}

// 返回Optional类型值的函数
func myFunc4(count:Int) -> Int?{
    guard count > 100 else {
        return nil
    }
    return count-100
}
print(myFunc4(count: 99)) // nil
print(myFunc4(count: 101))// Optional(1)
if let tmp = myFunc4(count: 101) {
    print(tmp)
}

// 多参数函数默认内部命名与外部命名相同
func myFunc5(param1:Int,param2:Int,param3:Int){
    // 内部命名在函数里使用，在这里为内部命名
    param1+param2+param3
}
// 外部命名 在这里为waibu
myFunc5(param1: 1, param2: 2, param3: 3)

// 再添加一下名称作为参数的外部命名
func myFun6(out1 param1:Int,out1 param2:Int,out3 param3:Int){
    param1+param2+param3
}

// out1为外部命名
myFun6(out1: 1, out1: 2, out3: 4)

// 省略外部命名的函数，上面两种一种是和内部一致一种是单独定义
func myFunc7(_ param1:Int,_ param2:Int,_ param3:Int){
    param1+param2+param3
}
myFunc7(1, 2, 5)


// 可以有默认值
func myFunc8(param1:Int,param2:Int=10,param3:Int){
    param1+param2+param3
}
// 默认param2=10
myFunc8(param1: 0, param3: 1)

// 参数不定的函数
func myFunc10(param:Int ... ,param2:Int){
    var sum = 0
    for item in param {
        sum = sum + item
    }
    print(sum + param2)
}
myFunc10(param: 1,2,3, param2: 100)

// 传入的值不支持修改，修改需要加inout标识，
func myFunc12(param:inout Int){
    param += 1
}
var para = 10
myFunc12(param: &para)
print(para)


// 函数编程 声明函数，在其他地方构建函数体，对函数变量进行赋值  in：闭包关键字
var addFunc :(Int,Int) -> Int
addFunc = {
    (param1:Int,param2:Int) in
    return param1+param2
}
addFunc(1,1)

// 通过函数对函数变量进行赋值
func addFunc1(param1:Int,param2:Int)->Int{
    return param1+param2
}
addFunc = addFunc1
print(addFunc(1,2))

// 函数体可以作为参数
func myFunc14(param:(Int,Int)->Int){
    print(param(1,7))
}
myFunc14(param: addFunc)

// 函数可以作为参数，也可以作为返回值使用
var addFunc2:(Int,Int)->Int
func myFun15() -> (Int,Int)-> Int {
    return {
        (param1:Int,param2:Int) in
            return param1+param2
    }
}
addFunc2 = myFun15()
addFunc2(2,2)//4

// 嵌套函数，调用函数返回的还是函数
func myFunc16() -> (Int,Int)->Int {
    // 返回的是函数
    func subFunc(param1:Int,param2:Int)->Int{
        return param1+param2
    }
    return subFunc
}
// 调用直接两个括号
myFunc16()(1, 100)


// 5.3 理解闭包结构
// 标准函数
func myFunc17(param:Int)->Int{
    return param*param
}
// 闭包形式 {(参数列表)->返回值 in 闭包体}
let myClosures = {
    (param:Int)->Int in
    return param*param
}
myFunc17(param: 1)
myClosures(1)

// 闭包返回值可以省略
let myClosures2 = {
    (param:Int) in return param*param
}
myClosures2(2)

// 排序函数理解闭包 加入inout标识支持修改
func mySort(array:inout Array<Any>, sortClosure:(Any,Any)->Bool) -> Array<Any>{
    
    // 冒泡排序
    for indexI in array.indices {
        if indexI == array.count-1 {
            break
        }
        for indexJ in 0 ... ((array.count-1)-indexI-1){
            if sortClosure(array[indexJ],array[indexJ+1]) {
                
            } else{
              // 进行元素交换
                array.swapAt(indexJ, indexJ+1)
            }
        }
    }
    return array
}
// 测试一般的数组 in后面不能加{}
var array:Array<Any> = [1,2,3,5,6,3,4]
let sort1 = {(i:Any,nextI:Any)->Bool in
    return (i as! Int)<(nextI as! Int)}
mySort(array: &array,sortClosure: sort1)

// 编写一个自定义类来进行排序
class Student :CustomStringConvertible {
    let chengji:Int
    let name:String
    init(_ name:String,_ chengji:Int){
        self.name = name
        self.chengji=chengji
    }
    
    //自定义打印方法，相当于toString
    var description: String {
        return ("\(name)成绩为：\(chengji)")
    }
}

let xiaomi = Student("小米",100)
let xiaoming = Student("小明",90)
var stuArray :Array<Any> = [xiaomi,xiaoming]
let result = mySort(array: &stuArray, sortClosure: {(i:Any,nextI:Any) in return
    (i as! Student).chengji < (nextI as! Student).chengji
    })
print(result)

// 更省略的方式
let result23 = mySort(array: &stuArray,sortClosure:{
    ($0 as! Student).chengji > ($1 as! Student).chengji
})
// 后置闭包，省略了key和将 {} 后置
let result22 = mySort(array: &stuArray){
    ($0 as! Student).chengji > ($1 as! Student).chengji
}
print(result22)

// 因为闭包可以后置，那么如果只有一个参数且为闭包时，使用时可以简写
// 非逃逸闭包
func myFunc15(closure:(Int,Int)->Bool){
        print("闭包简写")
}
// 使用时
myFunc15 {
    $0 > $1
}


// 自动闭包：不能有参数，且表达式只能是一句话
func myFunc16(closure: @autoclosure () -> Bool){
    print("自动闭包")
}
myFunc16(closure: 1+2+3>10)

// 逃逸闭包  可以作为返回值返回，通常用于异步操作
func myFunc17(closure: @autoclosure @escaping () -> Bool){
    
}
