//
//  AnimationImageCollection.swift
//  day20_CollectionViewAnimation
//
//  Created by huig on 2017/11/26.
//  Copyright © 2017年 huig. All rights reserved.
//

import UIKit

struct AnimationImageCollection {
    fileprivate let imagePaths = ["1", "2", "3", "4", "5"]
    
    var images: [AnimationCellModel]
    
    init() {
        // map 等同 for

        images = imagePaths.map { AnimationCellModel(imagePath: $0) }
    }
}
