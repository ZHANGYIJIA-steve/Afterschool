//
//  UserViewController.swift
//  Estate Rental
//
//  Created by 潘丰 on 12/11/2020.
//

import UIKit

class AnnounceViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let networkController = NetworkController()
    var Anns: [Announcement] = []
    @IBOutlet var TBView: UITableView!
    @IBOutlet weak var contentView: UITextField!
    @IBAction func SendMessage(_ sender: Any) {
        if Users.currentUser.role == "teacher"{
            let Ann = Announcement(author: Users.currentUser.username, avatar: Users.currentUser.avatar, content: contentView.text ?? " ")
            Announcement.Anns.append(Ann);
            contentView.text=""
            TBView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        TBView.dataSource = self
        TBView.delegate = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Found",Announcement.Anns.count)
        return Announcement.Anns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnnCell", for: indexPath)
        if let imageView = cell.viewWithTag(100) as? UIImageView {
            networkController.fetchImage(for: Announcement.Anns[indexPath.row].avatar, completionHandler: { (data) in
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data, scale:1)
                }
            }) { (error) in
                DispatchQueue.main.async {
                    imageView.image = UIImage(systemName: "person.fill")
                }
            }
        }
            
            if let cellLabel = cell.viewWithTag(200) as? UILabel {
                cellLabel.text = Announcement.Anns[indexPath.row].author
            }
            
            if let cellLabel = cell.viewWithTag(300) as? UILabel {
                cellLabel.text = Announcement.Anns[indexPath.row].content
            }
        
            return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 144.0
        }
    
}
