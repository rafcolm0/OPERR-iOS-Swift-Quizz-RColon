//
//  ViewController.swift
//  OPERR-iOS-Swift-Quizz-RColon
//
//  Created by Rafael Colon on 12/15/18.
//  Copyright © 2018 rafaelColon. All rights reserved.
//

import UIKit

/**
  DISCLAIMER: I am aware that TASK 2 and TASK 3 are incomplete. My experience and exposure to animation on iOS is very basic and most of the time by only using built-in objects instead of customized handlers.  I understand and can follow through overriding and handling UIViewControllerTransitioningDelegate, but am not comfortable experimenting with imitating the App Store's magnifying animations presented on the task videos.  For this reason, I am performing simple animations instead just to exemplify where the core steps happen.  Nevertheless, with a bit more research and time, I would be able to complete both tasks with any major difficulty.
 **/
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIViewControllerTransitioningDelegate {
    @IBOutlet weak var mainCollectionView: UICollectionView!
    var currentlySelectedCell:IndexPath?;

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //recycler a MainUICollectionCell and setup respective UIImage
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCollectionCell", for: indexPath) as! MainUICollectionCell;
        cell.imageView.image = UIImage(named: String.init(format: "img%d", indexPath.row));
        //init a long press gesture listener and assign it to this current cell
        let longPress = UILongPressGestureRecognizer.init(target: self, action: #selector(longPressedAction(_:)))
        longPress.minimumPressDuration = 1.0
        cell.addGestureRecognizer(longPress)
        return cell;
    }
    
    @objc func longPressedAction(_ gestureRecognizer: UILongPressGestureRecognizer) {
        guard gestureRecognizer.state != .ended else {  //ignore all long press states except for ended
            return;
        }
        let point = gestureRecognizer.location(in: self.mainCollectionView);
        //uicollection view found, perform segue to open full screen card view
        if let indexPath = self.mainCollectionView.indexPathForItem(at: point){
            //triggers CardPresentationAnimator
            self.performSegue(withIdentifier: "cardToView", sender: indexPath.row);
        } else {
            //in theory, else never happens, but we would have here some sort of error logging mechanism, and alert the user
            print("index path not found!");
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "cardToView") {  //if statement to diff when many segues are been used
            let controller = segue.destination as! FullScreenCardViewController;
            //cellId is cell index to determine which UIImage to use
            controller.cellId = (sender as! Int);
            //sets ViewController as the delegate for these cardview - fullscreen animated segue transitions
            controller.transitioningDelegate = self;
            controller.modalPresentationStyle = UIModalPresentationStyle.custom;
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.currentlySelectedCell = indexPath;
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let selected = self.currentlySelectedCell{  //deselect any currently SELECTED cell when user scrolls uicollection
            //animated false here because its been animated in cell's isSelected-willSet
            self.mainCollectionView.deselectItem(at: selected, animated: false);
            self.currentlySelectedCell = nil;
        }
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CardDismissionAnimator();   //custom animation manager for dismissing
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CardPresentationAnimator();  //custom animation manager for presenting
    }
}

