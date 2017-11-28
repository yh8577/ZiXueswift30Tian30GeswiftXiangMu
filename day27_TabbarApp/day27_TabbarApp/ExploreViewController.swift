//
//  ExploreViewController.swift
//  day27_TabbarApp
//
//  Created by jyh on 2017/11/28.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {

    @IBOutlet weak var exploreImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        exploreImageView.alpha = 0
        exploreImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: { () -> Void in
            
            self.exploreImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.exploreImageView.alpha = 1
            
        }, completion: nil )
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
