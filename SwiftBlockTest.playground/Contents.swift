//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
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


