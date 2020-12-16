//
//  News.swift
//  After-school care Center
//
//  Created by 潘丰 on 21/11/2020.
//

import Foundation
struct Users{
    var id:Int
    var username:String
    var password: String
    var role: String
    var grade:Int
    var Class:Int
    var avatar:String
    var arrived:Bool
}

extension Users {
    
    static var sampleData: [Users] = [
        Users(id:1,username:"Mr Pan",password: "panfeng",role:"teacher",grade: 0,Class: 0,avatar:"https://avatars3.githubusercontent.com/u/32627723?s=460&u=4d8f93f594a3ac4fe5dd0c5b24b851c67eafb102&v=4",arrived:false),
        Users(id:2,username:"Mr Zhang",password: "zhangyijia",role:"teacher",grade: 0,Class: 0,avatar:"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606427180864&di=9a16714e8b571e2413b0f0ce3d1f6918&imgtype=0&src=http%3A%2F%2Fs7.rr.itc.cn%2Fg%2FN%2F3I%2FrMZrebm.jpg",arrived:false),
        Users(id:3,username:"pan feng",password: "damuzhi",role:"student",grade: 3,Class: 1,avatar:"https://avatars3.githubusercontent.com/u/32627723?s=460&u=4d8f93f594a3ac4fe5dd0c5b24b851c67eafb102&v=4",arrived:false),
        Users(id:4,username:"pan feng2",password: "damuzhi",role:"student",grade: 3,Class: 1,avatar:"https://avatars3.githubusercontent.com/u/32627723?s=460&u=4d8f93f594a3ac4fe5dd0c5b24b851c67eafb102&v=4",arrived:false),
        Users(id:5,username:"lisa",password: "damuzhi",role:"student",grade: 4,Class: 2,avatar:"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3780364818,3054883450&fm=26&gp=0.jpg",arrived:false),
        Users(id:6,username:"martin pan",password: "damuzhi",role:"student",grade: 4,Class: 2,avatar:"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606427287548&di=21efc343608737832fd3290c4a4701d9&imgtype=0&src=http%3A%2F%2Fpic1.58cdn.com.cn%2Fzhuanzh%2Fn_v2799a35217a36416ea04c45f5b51e202a.jpg%3Fw%3D750%26h%3D0",arrived:false),
    ]
    static var currentUser = Users(id:-1,username:"username",password: "password",role:"teacher",grade: 0,Class: 0,avatar:"",arrived:false)
}
