//
//  PositionViewController.swift
//  day25_BasicAnimation
//
//  Created by jyh on 2017/11/28.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class PositionViewController: UIViewController {
    @IBOutlet weak var Position1: UIView!
    @IBOutlet weak var Position2: UIView!
    @IBOutlet weak var Position3: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.8, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: UIViewAnimationOptions(), animations: { () -> Void in
            
            self.Position1.center.x = self.view.bounds.width - self.Position1.center.x
            self.Position1.center.y = self.Position1.center.y + 30
            self.Position2.center.x = self.view.bounds.width -  self.Position2.center.x
            self.Position2.center.y = self.Position2.center.y + 30
            
        }, completion: nil )
        
        UIView.animate(withDuration: 0.6, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: { () -> Void in
            
            self.setHeight(180)
            self.Position3.center.y = self.view.bounds.height - self.Position3.center.y
            
        }, completion: nil )
        
    }
    
    func setHeight(_ height: CGFloat) {
        
        var frame: CGRect = self.Position3.frame
        frame.size.height = height
        
        self.Position3.frame = frame
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
