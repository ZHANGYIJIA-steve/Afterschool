//
//  video.swift
//  After-school care Center
//
//  Created by apple on 2020/12/1.
//

import Foundation
struct Video{
    let id:Int
    let Class:Int
    let detail: String
    let videourl: String
    
    
    
    
}

extension Video{
    
    static let sampleVideo: [Video] = [
       Video(id: 1, Class: 1, detail: "新冠肺炎", videourl: "https://stream7.iqilu.com/10339/upload_transcode/202002/18/20200218114723HDu3hhxqIT.mp4"),
        Video(id: 2, Class: 1, detail: "茅台小龙虾", videourl: "https://v-cdn.zjol.com.cn/276986.mp4"),
        Video(id: 3, Class: 1, detail: "抢购iphone11", videourl: "https://v-cdn.zjol.com.cn/280443.mp4"),
        Video(id: 4, Class: 2, detail: "尼斯湖水怪", videourl: "https://v-cdn.zjol.com.cn/277004.mp4"),
        Video(id: 5, Class: 2, detail: "Big Buck Bunny", videourl: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"),
        Video(id: 6, Class: 2, detail: "trailer", videourl: "https://media.w3.org/2010/05/sintel/trailer.mp4"),
        
    ]
}
