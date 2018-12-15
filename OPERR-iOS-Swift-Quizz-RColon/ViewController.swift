//
//  ViewController.swift
//  OPERR-iOS-Swift-Quizz-RColon
//
//  Created by Rafael Colon on 12/15/18.
//  Copyright © 2018 rafaelColon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var mainCollectionView: UICollectionView!
    var currentlySelectedCell:IndexPath?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCollectionCell", for: indexPath) as! MainUICollectionCell;
        cell.imageView.image = UIImage(named: String.init(format: "img%d", indexPath.row));
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.currentlySelectedCell = indexPath;
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let selected = self.currentlySelectedCell{
            //animated false here because its been animated in cell's isSelected-willSet
            self.mainCollectionView.deselectItem(at: selected, animated: false);
            self.currentlySelectedCell = nil;
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        //resume animations
    }
    
}

