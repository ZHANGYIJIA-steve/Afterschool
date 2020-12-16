//
//  Announcement.swift
//  After-school care Center
//
//  Created by 潘丰 on 1/12/2020.
//

import Foundation
//
//  News.swift
//  After-school care Center
//
//  Created by 潘丰 on 21/11/2020.
//

import Foundation
struct Announcement: Codable {
    var author:String
    var avatar:String
    var content:String
}

extension Announcement{
    static var Anns: [Announcement] = []
}
