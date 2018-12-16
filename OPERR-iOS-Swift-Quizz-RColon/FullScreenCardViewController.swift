//
//  FullScreenCardViewController.swift
//  OPERR-iOS-Swift-Quizz-RColon
//
//  Created by Rafael Colon on 12/15/18.
//  Copyright © 2018 rafaelColon. All rights reserved.
//

import Foundation
import UIKit

class FullScreenCardViewController: UIViewController {
    var cellId:Int!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cardLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.imageView.image = UIImage(named: String.init(format: "img%d", self.cellId));
        switch self.cellId {
        case 0:
            self.cardLabel.text = "iOS logo, duh.";
            break;
        case 1:
            self.cardLabel.text = "Android logo, duh.";
            break;
        case 2:
            self.cardLabel.text = "Apple logo, duh.";
            break;
        default:
            break;
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        //reverse segue "cardToView" to trigger CardDismissionAnimator
        self.dismiss(animated: true, completion: nil);
    }
}
