//
//  UserViewController.swift
//  Estate Rental
//
//  Created by 潘丰 on 12/11/2020.
//

import UIKit

class LoginViewController: UIViewController {
    
    let networkController = NetworkController()
    var father:UIViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("login page launched")
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var UserNameLabel: UITextField!
    
    @IBOutlet weak var PasswordLabel: UITextField!
    
    @IBAction func LoginRequest(_ sender: UIButton) {
        let username = UserNameLabel.text
        let password = PasswordLabel.text
        for usr in Users.sampleData {
            if(usr.username == username && usr.password == password){
                Users.currentUser = usr
                break
            }
        }
        if(Users.currentUser.id != -1){
            let alert = UIAlertController(
                    title: "Congratulation!",
                message: "Welcome to Damuzhi nursery\(username ?? "Username")", preferredStyle: .alert)
            alert.addAction(
                    UIAlertAction(title: "OK", style: .default, handler: { (action) in
                        print("OK button pressed!")
                    })
                )
            self.present(alert, animated: true, completion: nil)
            father?.viewDidLoad()
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(
                    title: "Oops! Login faild",
                message: "There is sth wrong with your account~", preferredStyle: .alert)
            alert.addAction(
                    UIAlertAction(title: "OK", style: .default, handler: { (action) in
                        print("OK button pressed!")
                    })
                )
                self.present(alert, animated: true, completion: nil)
        }
        
    }
}
