//
//  ViewController.swift
//  MP4背景
//
//  Created by yihui on 2017/11/23.
//  Copyright © 2017年 yihui. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    var mediaPlayerVC = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


        self.configMediaPlayer()

        loginButton.layer.cornerRadius = 4
        signupButton.layer.cornerRadius = 4

    }

    func configMediaPlayer() {
        
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        mediaPlayerVC.player = AVPlayer(url: url)
        mediaPlayerVC.videoGravity = AVLayerVideoGravityResizeAspectFill
        mediaPlayerVC.showsPlaybackControls = false
        mediaPlayerVC.view.alpha = 1
        mediaPlayerVC.view.frame = view.bounds
        NotificationCenter.default.addObserver(self, selector: #selector(repeatPlay), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: mediaPlayerVC.player?.currentItem)
        view.addSubview(mediaPlayerVC.view)
        view.sendSubview(toBack: mediaPlayerVC.view)
        mediaPlayerVC.player?.play()
    }
    
    func repeatPlay() {
        mediaPlayerVC.player?.seek(to: kCMTimeZero)
        mediaPlayerVC.player?.play()
    }
    

    @IBAction func click(_ sender: Any) {
        print("惦记我")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

