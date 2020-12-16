//
//  VideoTableViewController.swift
//  After-school care Center
//
//  Created by apple on 2020/12/1.
//

import UIKit

class VideoTableViewController: UITableViewController {
    var videos: [Video] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        AppDelegate.videoView = self
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:  #selector(reloadItin), for: UIControl.Event.valueChanged)

        self.refreshControl = refreshControl

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @objc func reloadItin() {
            
        self.tableView.reloadData()
        
        refreshControl?.endRefreshing()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if Users.currentUser.id == -1 {
            return 0;
        }
        if Users.currentUser.role == "student" {videos = Video.sampleVideo.filter { $0.Class == Users.currentUser.Class}
            return videos.count
        }
        else{videos = Video.sampleVideo.filter { $0.Class == Users.currentUser.Class}
            return videos.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videocell", for: indexPath)
        if Users.currentUser.role == "student"{
            cell.textLabel?.text = videos[indexPath.row].detail
        }
        else{
            cell.textLabel?.text = videos[indexPath.row].detail
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as?VideoPlayerViewController {
            let Index = tableView.indexPathForSelectedRow!
            print(index)
            if Users.currentUser.role == "teacher"{
                viewController.title = (videos[Index.row].detail)
                viewController.urlString=(videos[Index.row].videourl)
               
            }
            else{
                viewController.title = (videos[Index.row].detail)
                viewController.urlString=(videos[Index.row].videourl)
            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
