//
//  ViewController.swift
//  day29_ImagePickerSheetController
//
//  Created by jyh on 2017/11/28.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {

    @IBOutlet weak var userProfileImageView: UIImageView!
    
    private var profileImage: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userProfileImageView.layer.cornerRadius = userProfileImageView.bounds.width / 2
        userProfileImageView.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pickProfileImage(_ tap: UITapGestureRecognizer)
    {
        let authorization = PHPhotoLibrary.authorizationStatus()
        
        if authorization == .notDetermined {
            PHPhotoLibrary.requestAuthorization({ (status) -> Void in
                DispatchQueue.main.async(execute: { () -> Void in
                    self.pickProfileImage(tap)
                })
            })
        }
        
        if authorization == .authorized {
            let controller = ImagePickerSheetController()
            
            controller.addAction(ImageAction(title: NSLocalizedString("Take Photo or Video", comment: "Action Title"), secondaryTitle: NSLocalizedString("Use this one", comment: "Action Title"), handler: { (_) -> () in
                
                self.presentCamera()
                
            }, secondaryHandler: { (action, numberOfPhotos) -> () in
                controller.getSelectedImagesWithCompletion({ (images) -> Void in
                    self.profileImage = images[0]
                    self.userProfileImageView.image = self.profileImage
                })
            }))
            
            controller.addAction(ImageAction(title: NSLocalizedString("Cancel", comment: "Action Title"), style: .cancel, handler: nil, secondaryHandler: nil))
            
            present(controller, animated: true, completion: nil)
        }
        
        
    }
    
    func presentCamera()
    {
        
    }
}

