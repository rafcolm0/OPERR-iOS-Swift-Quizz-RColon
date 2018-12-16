//
//  MainUICollectionCell.swift
//  OPERR-iOS-Swift-Quizz-RColon
//
//  Created by Rafael Colon on 12/15/18.
//  Copyright © 2018 rafaelColon. All rights reserved.
//

import Foundation
import UIKit

class MainUICollectionCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    /**
     FOR TASK 1: size scaling animation when a uicollection cell is selected is handle on isSelected observer willSet
     **/
    override var isSelected: Bool {
        willSet(newValue) {
            if newValue {  //if its about to be selected
                UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
                    //shrink image 70%
                    self.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                }, completion: nil)
            } else {  //if its about to be un-selected
                UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
                    //scale image to 100%
                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
                }, completion: nil)
            }
        }
    }
}
