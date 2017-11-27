//
//  NewsTableViewController.swift
//  day16_SlideMenu
//
//  Created by huig on 2017/11/25.
//  Copyright © 2017年 huig. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController, MenuTransitionManagerDelegate {
    
    let menuTransitionManager = MenuTransitionManager()
    let newsCell = "newsCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Everyday Moments"
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        view.backgroundColor = UIColor(red:0.062, green:0.062, blue:0.07, alpha:1)
    }
    
    func dismiss() {
        
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: newsCell, for: indexPath) as! NewsTableViewCell

        if indexPath.row == 0 {
            cell.postImageView.image = UIImage(named: "1")
            cell.postTitle.text = "Love mountain."
            cell.postAuthor.text = "Allen Wang"
            cell.authorImageView.image = UIImage(named: "a")
            
        } else if indexPath.row == 1 {
            cell.postImageView.image = UIImage(named: "2")
            cell.postTitle.text = "New graphic design - LIVE FREE"
            cell.postAuthor.text = "Cole"
            cell.authorImageView.image = UIImage(named: "b")
            
        } else if indexPath.row == 2 {
            cell.postImageView.image = UIImage(named: "3")
            cell.postTitle.text = "Summer sand"
            cell.postAuthor.text = "Daniel Hooper"
            cell.authorImageView.image = UIImage(named: "c")
            
        } else {
            cell.postImageView.image = UIImage(named: "4")
            cell.postTitle.text = "Seeking for signal"
            cell.postAuthor.text = "Noby-Wan Kenobi"
            cell.authorImageView.image = UIImage(named: "d")
            
        }

        return cell
    }
    
    @IBAction func unwindToHome(_ segue: UIStoryboardSegue) {
        let sourceController = segue.source as! MenuTableViewController
        self.title = sourceController.currentItem
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let menuTableViewController = segue.destination as! MenuTableViewController
        menuTableViewController.currentItem = self.title!
        menuTableViewController.transitioningDelegate = menuTransitionManager
        menuTransitionManager.delegate = self
        
    }

}
