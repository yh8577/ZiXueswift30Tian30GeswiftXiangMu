//
//  ViewController.swift
//  RandomColorization音乐播放颜色渐变
//
//  Created by yihui on 2017/11/23.
//  Copyright © 2017年 yihui. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    private var audioPlayer = AVAudioPlayer()
    
    let gradientLayer = CAGradientLayer()
    
    var timer : Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   

    @IBAction func btnClick(_ sender: Any) {
        
        let music = URL(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")!)
        
        do {
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: music)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
        catch let audioError as NSError{
            print(audioError)
        }
        
        if (timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.random), userInfo: nil, repeats: true)
        }
        
        //graditent color
        gradientLayer.frame = view.bounds
        let color1 = UIColor(white: 0.5, alpha: 0.2).cgColor as CGColor
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).cgColor as CGColor
        let color3 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3).cgColor as CGColor
        let color4 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).cgColor as CGColor
        let color5 = UIColor(white: 0.4, alpha: 0.2).cgColor as CGColor
        
        gradientLayer.colors = [color1, color2, color3, color4, color5]
        gradientLayer.locations = [0.10, 0.30, 0.50, 0.70, 0.90]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.addSublayer(gradientLayer)
        
    }
    
    @objc private func random() {
        
        view.backgroundColor = randomColor()
    }
    
    // 生成随机色
    private func randomColor() -> UIColor {
        
        let r = CGFloat(drand48())
        let g =  CGFloat(drand48())
        let b = CGFloat(drand48())
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }

}

