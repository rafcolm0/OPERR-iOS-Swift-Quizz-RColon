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
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.imageView.image = UIImage(named: String.init(format: "img%d", self.cellId));
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }
}
