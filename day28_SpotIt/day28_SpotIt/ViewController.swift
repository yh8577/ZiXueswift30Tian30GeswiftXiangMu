//
//  ViewController.swift
//  day28_SpotIt
//
//  Created by jyh on 2017/11/28.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgMovieImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblStars: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    
    var movieInfo: [String: String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        lblRating.layer.cornerRadius = lblRating.frame.size.width/2
        lblRating.layer.masksToBounds = true
        
        if movieInfo != nil {
            populateMovieInfo()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func populateMovieInfo() {
        
        lblTitle.text = movieInfo["Title"]!
        lblCategory.text = movieInfo["Category"]!
        lblDescription.text = movieInfo["Description"]!
        lblDirector.text = movieInfo["Director"]!
        lblStars.text = movieInfo["Stars"]!
        lblRating.text = movieInfo["Rating"]!
        imgMovieImage.image = UIImage(named: movieInfo["Image"]!)
        
    }

}
