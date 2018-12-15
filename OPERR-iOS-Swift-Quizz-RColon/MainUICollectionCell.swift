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

    override var isSelected: Bool {
        willSet(newValue) {
            if newValue {
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                    self.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                }, completion: nil)
            } else {
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
                }, completion: nil)
            }
        }
    }
}
