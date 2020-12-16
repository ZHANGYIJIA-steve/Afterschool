//
//  VideoPalyerViewController.swift
//  After-school care Center
//
//  Created by apple on 2020/12/1.
//

import UIKit
import AVKit

class VideoPlayerViewController: AVPlayerViewController {

    var urlString: String?
  

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        print(urlString)
       
        
        let player = AVPlayer(url: NSURL(string: urlString!)! as URL)
     self.player = player
        
        self.view.frame = CGRect(x: 20, y: 100, width: self.view.bounds.width - 40, height: 200)
       
    }
}

