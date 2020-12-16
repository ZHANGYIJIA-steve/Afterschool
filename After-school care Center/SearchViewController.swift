//
//  SearchViewController.swift
//  After-school care Center
//
//  Created by apple on 2020/12/1.
//

import UIKit
import WebKit

class SearchViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    var context: String?
    @IBOutlet weak var website: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSearchView()
        

        // Do any additional setup after loading the view.
    }
    func setSearchView() {
        self.title = context!+"的搜索结果"
        let urlString = "https://www.baidu.com/s?wd="+context!
        self.view.backgroundColor = UIColor.white
        let newUrl = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = NSURL(string: newUrl)
        let request = NSURLRequest.init(url: url! as URL)
        
        self.website?.load(request as URLRequest)
        self.website.navigationDelegate = self
        self.website.uiDelegate = self
        
    }
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
