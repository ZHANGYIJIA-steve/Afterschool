//
//  taskTableViewController.swift
//  After-school care Center
//
//  Created by 潘丰 on 30/11/2020.
//

import UIKit

class taskTableViewController: UITableViewController {
    var homeworks: [Homework] = []
    var students: [Users] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        AppDelegate.taskView = self
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:  #selector(reloadItin), for: UIControl.Event.valueChanged)

        self.refreshControl = refreshControl

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    @objc func reloadItin() {
            
        self.tableView.reloadData()
        
        refreshControl?.endRefreshing()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Users.currentUser.id == -1 {
            return 0;
        }
        if Users.currentUser.role == "student" {homeworks = Homework.sampleHomework.filter { $0.Class == Users.currentUser.Class}
            return homeworks.count
        }
        else{students = Users.sampleData.filter { $0.role == "student"}
            return students.count
        }
        // #warning Incomplete implementation, return the number of rows
    
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homework", for: indexPath)
        if Users.currentUser.role == "student"{
            cell.textLabel?.text = homeworks[indexPath.row].detail
        }
        else{
            cell.textLabel?.text = students[indexPath.row].username
        }
        // Configure the cell...
        return cell
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? DetailViewController {
            let Index = tableView.indexPathForSelectedRow!
            if Users.currentUser.role == "teacher"{
                viewController.Target_ID = (students[Index.row].id)
                viewController.titlecontent = (students[Index.row].username)
                viewController.state = (students[Index.row].arrived)
            }
            else{
                
                viewController.Target_ID = (homeworks[Index.row].id)
                viewController.titlecontent = (homeworks[Index.row].detail)
                viewController.state = (homeworks[Index.row].finished)
            }
            viewController.prevController = self
        }
    }
}
