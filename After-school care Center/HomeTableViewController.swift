//
//  HomeTableViewController.swift
//  Estate Rental
//
//  Created by 潘丰 on 12/11/2020.
//

import UIKit

class HomeTableViewController: UITableViewController {
    let networkController = NetworkController()
    var news: [News] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        networkController.fetchNews(completionHandler:
            { (news) in
                DispatchQueue.main.async {
                    self.news = news
                    self.tableView.reloadData()
                }
        }) { (error) in
            DispatchQueue.main.async {
                self.news = []
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath)
        if let imageView = cell.viewWithTag(100) as? UIImageView {
                    
            networkController.fetchImage(for: news[indexPath.row].image, completionHandler: { (data) in
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data, scale:1)
                }
            }) { (error) in
                DispatchQueue.main.async {
                    imageView.image = UIImage(systemName: "house.fill")
                }
            }
            
        }
            
            if let cellLabel = cell.viewWithTag(200) as? UILabel {
                cellLabel.text = news[indexPath.row].title
            }
            
            if let cellLabel = cell.viewWithTag(300) as? UILabel {
                cellLabel.text = news[indexPath.row].detail
            }

            return cell
    }

}
