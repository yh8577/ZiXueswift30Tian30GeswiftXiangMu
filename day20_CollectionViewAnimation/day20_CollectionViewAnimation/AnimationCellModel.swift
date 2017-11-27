//
//  AnimationCellModel.swift
//  day20_CollectionViewAnimation
//
//  Created by huig on 2017/11/26.
//  Copyright © 2017年 huig. All rights reserved.
//


struct AnimationCellModel {
    let imagePath: String
    
    init(imagePath: String?) {
        self.imagePath = imagePath ?? ""
    }
}
