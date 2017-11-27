//
//  RotationViewController.swift
//  day25_BasicAnimation
//
//  Created by jyh on 2017/11/28.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func spin() {
        
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveLinear, animations: {
            
            self.image1.transform = self.image1.transform.rotated(by: CGFloat(Double.pi))
            self.image2.transform = self.image2.transform.rotated(by: CGFloat(Double.pi))
            self.image3.transform = self.image3.transform.rotated(by: CGFloat(Double.pi))
            self.image4.transform = self.image4.transform.rotated(by: CGFloat(Double.pi))
            self.image5.transform = self.image5.transform.rotated(by: CGFloat(Double.pi))
            self.image6.transform = self.image6.transform.rotated(by: CGFloat(Double.pi))
            self.image7.transform = self.image7.transform.rotated(by: CGFloat(Double.pi))
            self.image8.transform = self.image8.transform.rotated(by: CGFloat(Double.pi))
            self.textLabel.transform = self.textLabel.transform.rotated(by: CGFloat(Double.pi))
            
        }) { (finished) -> Void in
            self.spin()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.spin()
        
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
