//
//  UserViewController.swift
//  Estate Rental
//
//  Created by 潘丰 on 12/11/2020.
//

import UIKit
class DetailViewController: UIViewController {
    var titlecontent:String?
    var state:Bool?
    var role:String?
    var Target_ID:Int?
    var prevController:UIViewController?
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var StateLabel: UILabel!
    
    @IBAction func SearchFunction(_ sender: Any) {
        
        
    }
    
    @IBOutlet weak var searchtext: UITextField!
    @IBAction func UpdateState(_ sender: UIButton) {
        self.state=true;
        if Users.currentUser.role == "teacher"{
            for index in 0..<Users.sampleData.count {
                if Users.sampleData[index].id == self.Target_ID{
                    print("Before ",Users.sampleData[index].username," now is ",Users.sampleData[index].arrived)
                    Users.sampleData[index].arrived = true
                    print("modified ",Users.sampleData[index].username," now is ",Users.sampleData[index].arrived)
                    break
                }
            }
        }
        else{
            for index in 0..<Homework.sampleHomework.count {
                if Homework.sampleHomework[index].id == self.Target_ID{
                    Homework.sampleHomework[index].finished = true
                    print("modified ",Homework.sampleHomework[index].detail," now is ",Homework.sampleHomework[index].finished)
                    break
                }
            }
        }
        prevController?.loadView()
        self.viewDidLoad()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        TitleLabel.text = titlecontent
        role = Users.currentUser.role
        if(role == "student" && state == false){
            StateLabel.text = "Not Finished"
        }
        if(role == "student" && state == true){
            StateLabel.text = "Finished"
        }
        if(role == "teacher" && state == false){
            StateLabel.text = "Not Arrived"
        }
        if(role == "teacher" && state == true){
            StateLabel.text = "Arrived"
        }
        
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SearchViewController {
                
            
            viewController.context = searchtext.text          }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
}
