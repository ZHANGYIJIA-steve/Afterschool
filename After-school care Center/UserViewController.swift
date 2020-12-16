//
//  UserViewController.swift
//  Estate Rental
//
//  Created by 潘丰 on 12/11/2020.
//

import UIKit

class UserViewController: UIViewController {

    let networkController = NetworkController()
    override func viewDidLoad() {
        super.viewDidLoad()
        if Users.currentUser.id != -1{
            networkController.fetchImage(for: Users.currentUser.avatar, completionHandler: { (data) in
                DispatchQueue.main.async {
                    self.AvatarView.image = UIImage(data: data, scale:1)
                }
            }) { (error) in
                DispatchQueue.main.async {
                    self.AvatarView.image = UIImage(imageLiteralResourceName: "Damuzhi")
                }
            }
            self.NameLabel.text = Users.currentUser.username
        }
        else{
            NameLabel.text = "Damuzhi"
            AvatarView.image = UIImage(imageLiteralResourceName: "Damuzhi")
        }
        AppDelegate.videoView?.tableView.reloadData()
        AppDelegate.taskView?.tableView.reloadData()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var AvatarView: UIImageView!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBAction func LoginRequest(_ sender: UIButton) {
        if(Users.currentUser.id != -1){
            Users.currentUser.id = -1
            self.viewDidLoad()
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? LoginViewController {
            viewController.father = self
        }
   }
}
