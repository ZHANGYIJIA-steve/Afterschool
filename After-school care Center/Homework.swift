//
//  Homework.swift
//  After-school care Center
//
//  Created by Zhang yijia on 30/11/2020.
//

import Foundation
struct Homework{
    let id:Int
    let Class:Int
    let detail: String
    
    
    
    var finished:Bool
}

extension Homework{
    
    static var sampleHomework: [Homework] = [
        Homework(id: 1, Class: 0, detail: "抄写英语单词", finished: false),
        Homework(id: 2, Class: 0, detail: "背诵《咏鹅》", finished: false),
        Homework(id: 3, Class: 0, detail: "完成口算天天练第十页", finished: false),
        Homework(id: 4, Class: 1, detail: "背诵英语课文", finished: false),
        Homework(id: 5, Class: 1, detail: "完成语文同步第二十页", finished: false),
        Homework(id: 6, Class: 1, detail: "完成数学同步第二十五页", finished: false),
        Homework(id: 7, Class: 2, detail: "英语小作文", finished: false),
        Homework(id: 8, Class: 2, detail: "看图写话", finished: false),
        Homework(id: 9, Class: 2, detail: "背诵九九乘法表", finished: false),
        
    ]
}
