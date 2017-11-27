//
//  AnimationCollectionViewCell.swift
//  day20_CollectionViewAnimation
//
//  Created by huig on 2017/11/26.
//  Copyright © 2017年 huig. All rights reserved.
//

import UIKit

class AnimationCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var animationImageView: UIImageView!
    @IBOutlet weak var animationTextView: UITextView!

    var backButtonTapped: (() -> Void)?
    
    func prepareCell(_ viewModel : AnimationCellModel) {
        animationImageView.image = UIImage(named: viewModel.imagePath)
        animationTextView.isScrollEnabled = false
        backButton.isHidden = true
        addTapEventHandler()
    }
    
    func handleCellSelected() {
        animationTextView.isScrollEnabled = false
        backButton.isHidden = false
        self.superview?.bringSubview(toFront: self)
        
    }
    
    fileprivate func addTapEventHandler() {
        backButton.addTarget(self, action: #selector(self.backButtonDidTouch(_:)), for: .touchUpInside)
    }
    
    
    func backButtonDidTouch(_ sender: UIGestureRecognizer) {
        backButtonTapped?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
