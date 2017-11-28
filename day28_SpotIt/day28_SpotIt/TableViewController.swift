//
//  TableViewController.swift
//  day28_SpotIt
//
//  Created by jyh on 2017/11/28.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class TableViewController: UITableViewController {
    
    var moviesInfo : NSMutableArray!
    var selectedMovieIndex: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        loadMoviesInfo()
//        configureTableView()
        navigationItem.title = "Movies"
        setupSearchableContent()
        
        tableView.register(UINib(nibName: "MovieSummaryCell", bundle: nil), forCellReuseIdentifier: "idCellMovieSummary")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadMoviesInfo() {
        
        if let path = Bundle.main.path(forResource: "MoviesData", ofType: "plist") {
            moviesInfo = NSMutableArray(contentsOfFile: path)
        }
    }
    
    func setupSearchableContent() {
        var searchableItems = [CSSearchableItem]()
        
        for i in 0...(moviesInfo.count - 1) {
            
            let movie = moviesInfo[i] as! [String: String]
            let searchableItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
            
            //set the title
            searchableItemAttributeSet.title = movie["Title"]!
            
            //set the image
            let imagePathParts = movie["Image"]!.components(separatedBy: ".")
            searchableItemAttributeSet.thumbnailURL = Bundle.main.url(forResource: imagePathParts[0], withExtension: imagePathParts[1])
            
            // Set the description.
            searchableItemAttributeSet.contentDescription = movie["Description"]!
            
            var keywords = [String]()
            let movieCategories = movie["Category"]!.components(separatedBy: ", ")
            for movieCategory in movieCategories {
                keywords.append(movieCategory)
            }
            
            let stars = movie["Stars"]!.components(separatedBy: ", ")
            for star in stars {
                keywords.append(star)
            }
            
            searchableItemAttributeSet.keywords = keywords
            
            let searchableItem = CSSearchableItem(uniqueIdentifier: "com.appcoda.SpotIt.\(i)", domainIdentifier: "movies", attributeSet: searchableItemAttributeSet)
            
            searchableItems.append(searchableItem)
            
            CSSearchableIndex.default().indexSearchableItems(searchableItems) { (error) -> Void in
                if error != nil {
                    print(error!.localizedDescription)
                }
            }
        }
        
    }
    
    override func restoreUserActivityState(_ activity: NSUserActivity) {
        
        if activity.activityType == CSSearchableItemActionType {
            if let userInfo = activity.userInfo {
                let selectedMovie = userInfo[CSSearchableItemActivityIdentifier] as! String
                selectedMovieIndex = Int(selectedMovie.components(separatedBy: ".").last!)
                performSegue(withIdentifier: "idSegueShowMovieDetails", sender: self)
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
        if moviesInfo != nil {
            return moviesInfo.count
        }
        print(moviesInfo.count)
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCellMovieSummary", for: indexPath) as! MovieSummaryCell

        let currentMovieInfo = moviesInfo[indexPath.row] as! [String: String]
        
        cell.lblTitle.text = currentMovieInfo["Title"]!
        cell.lblDescription.text = currentMovieInfo["Description"]!
        cell.lblRating.text = currentMovieInfo["Rating"]!
        cell.imgMovieImage.image = UIImage(named: currentMovieInfo["Image"]!)
        // Configure the cell...

        return cell
    }
 

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedMovieIndex = indexPath.row
        performSegue(withIdentifier: "idSegueShowMovieDetails", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier {
            
            if identifier == "idSegueShowMovieDetails" {
                let vc = segue.destination as! ViewController
                vc.movieInfo = moviesInfo[selectedMovieIndex] as! [String: String]
            }
            
        }
    }

}
