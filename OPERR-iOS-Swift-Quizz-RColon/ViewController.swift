//
//  ViewController.swift
//  OPERR-iOS-Swift-Quizz-RColon
//
//  Created by Rafael Colon on 12/15/18.
//  Copyright © 2018 rafaelColon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIViewControllerTransitioningDelegate {
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
        let longPress = UILongPressGestureRecognizer.init(target: self, action: #selector(longPressedAction(_:)))
        longPress.minimumPressDuration = 1.0
        cell.addGestureRecognizer(longPress)
        return cell;
    }
    
    @objc func longPressedAction(_ gestureRecognizer: UILongPressGestureRecognizer) {
        guard gestureRecognizer.state != .ended else {
            return;
        }
        let point = gestureRecognizer.location(in: self.mainCollectionView);
        if let indexPath = self.mainCollectionView.indexPathForItem(at: point){
            self.performSegue(withIdentifier: "cardToView", sender: indexPath.row);
        } else {
            print("Could not find index path");
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "cardToView") {
            let controller = segue.destination as! FullScreenCardViewController;
            controller.cellId = (sender as! Int);
            controller.transitioningDelegate = self;
            controller.modalPresentationStyle = UIModalPresentationStyle.custom;
        }
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
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CardDismissionAnimator();
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CardPresentationAnimator();
    }
}

