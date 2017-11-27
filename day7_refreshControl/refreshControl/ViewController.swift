//
//  ViewController.swift
//  refreshControl
//
//  Created by yihui on 2017/11/23.
//  Copyright © 2017年 yihui. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let cellIdentifer = "cellIdentifer"
    
    var favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅"]

    var refreshControl = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        refreshControl.addTarget(self, action: #selector(ViewController.didRoadEmoji), for: .valueChanged)
        
        refreshControl.backgroundColor = UIColor(red:0.113, green:0.113, blue:0.145, alpha:1)
        let attributes = [NSForegroundColorAttributeName: UIColor.white]
        refreshControl.attributedTitle = NSAttributedString(string: "Last updated on \(Date())", attributes: attributes)
        refreshControl.tintColor = UIColor.white
   
        tableView.refreshControl = refreshControl
        
        title = "emoji"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteEmoji.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer)! as UITableViewCell
        
        cell.textLabel!.text = self.favoriteEmoji[indexPath.row] + "\(indexPath.row)"
        cell.textLabel!.textAlignment = NSTextAlignment.center
        cell.textLabel!.font = UIFont.systemFont(ofSize: 30)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    func didRoadEmoji() {
        favoriteEmoji += favoriteEmoji
        tableView.reloadData()
        refreshControl.endRefreshing()
    }

}

