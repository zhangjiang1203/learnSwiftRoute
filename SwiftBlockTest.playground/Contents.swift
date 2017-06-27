//: Playground - noun: a place where people can play

import UIKit

//闭包的语法形式
/*一般形式
{
    (paramnters) -> returnType in
        statements
}*/

var str = "Hello, playground"

let calAdd1:(Int,Int)->(Int)={
    (a:Int,b:Int)->Int in
    return a+b;
}
let result1 = calAdd1(100,100)

let calAdd2:(Int,Int)->(Int)={
    a,b in
    return a+b;
}
let result2 = calAdd2(10,10)

let calAdd3:(Int,Int)->(Int)={
    a,b in a+b
}
let result3 = calAdd3(15,30)

let calAdd4:()->Int={
    return 100+300
}
let result4 = calAdd4();

let calAdd5:()->Void={
    print("这就是服务")
}

calAdd5()

//起别名
//没有参数也没有返回值的闭包 别名Nothing
typealias nothing = ()->()
//还可以这样写
typealias anything = ()->Void
//有个一int类型的参数没有返回值的闭包
typealias printNum = (Int)->()
//有两个参数的并有一个int类型返回值的闭包
typealias add = (Int,Int)->(Int)

typealias Add = (_ num1:Int,_ num2:Int)->(Int)

let addCloser:Add

addCloser = {
    (_ num1:Int,_ num2:Int)->(Int) in
    return num1+num2
}
let result = addCloser(20,30)


//尾随闭包
func testFunc(testBlock:()->Void){
    testBlock()
}

//正常写法
testFunc(testBlock:  {
    print("正常写法")
})

//尾随闭包写法
testFunc() {
    print("尾随闭包写法")
}
//也可以把括号去掉 推荐写法
testFunc {
    print("推荐写法")
}

//值捕获 返回值--是一个没有参数有返回值的函数
func captureValue(sums amount:Int)->()->Int{
    var total = 0
    func incrementer()->Int{
        total+=amount
        return total
    }
    return incrementer
}

let result6 = captureValue(sums: 10)
print(result6())
print(result6())
print(result6())
//函数和闭包都是引用类型
//逃逸闭包
func doSomething(some:@escaping () -> Void){
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1) { 
        some()
    }
    print("函数体")
}
doSomething {
    print("逃逸闭包")
}


var completionHandler:()->String={
    "约吗？？"
}

func doSomething2(some:@escaping()->String){
    completionHandler = some
}

doSomething2{
    return "叔叔,我们不约"
}

print(completionHandler())
//逃逸闭包中注意使用self 避免引起循环引用
var completionHandlers:[()->Void]=[]
//逃逸闭包
func someFunctionWithEscapingClosure(completionHandler1:@escaping ()-> Void){
    completionHandlers.append(completionHandler1)
    
}
//非逃逸
func someFunctionWithNonesCapingClosure(closure:()->Void){
    closure()
}

class SomeClass{
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithNonesCapingClosure {
            x=200
        }
    }
    
}

//自动闭包 
var array = ["I","have","a","apple"]
print(array.count)

let removeBlock = {array.remove(at: 3)}
print("执行代码块移除\(removeBlock())")
print(array.count)










		
