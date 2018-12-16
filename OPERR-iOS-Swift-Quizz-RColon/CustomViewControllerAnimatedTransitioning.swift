//
//  CustomViewControllerAnimatedTransitioning.swift
//  OPERR-iOS-Swift-Quizz-RColon
//
//  Created by Rafael Colon on 12/15/18.
//  Copyright © 2018 rafaelColon. All rights reserved.
//

import Foundation
import UIKit

/**
 DISCLAIMER: I am aware that TASK 2 and TASK 3 are incomplete. My experience and exposure to animation on iOS is very basic and most of the time by only using built-in objects instead of customized handlers.  I understand and can follow through overriding and handling UIViewControllerTransitioningDelegate, but am not comfortable experimenting with imitating the App Store's magnifying animations presented on the task videos.  For this reason, I am performing simple animations instead just to exemplify where the core steps happen.  Nevertheless, with a bit more research and time, I would be able to complete both tasks with any major difficulty.
 **/

/*
 Custom class that extends UIViewControllerAnimatedTransitioning for when PRESENTING the FullScreenCardViewController
 */
class CardPresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //setup animation FullScreenCardViewController
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let containerView = transitionContext.containerView
        let animationDuration = transitionDuration(using: transitionContext)
        toViewController.view.transform = CGAffineTransform(translationX: containerView.bounds.width, y: 0)
        toViewController.view.clipsToBounds = true
        containerView.addSubview(toViewController.view)
        //fires up animation and triggers this UIViewControllerAnimatedTransitioning completion handler
        UIView.animate(withDuration: animationDuration, animations: {
            toViewController.view.transform = CGAffineTransform.identity
        }, completion: { finished in
            transitionContext.completeTransition(finished)
        })
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5;
    }
}

/*
 Custom class that extends UIViewControllerAnimatedTransitioning for when DISMISSING the FullScreenCardViewController
 */
class CardDismissionAnimator : NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5;
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //setup animation ViewController
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let containerView = transitionContext.containerView
        let animationDuration = transitionDuration(using: transitionContext)
        
        //fires up animation and triggers this UIViewControllerAnimatedTransitioning completion handler
        UIView.animate(withDuration: animationDuration, animations: {
            fromViewController.view.transform = CGAffineTransform(translationX: containerView.bounds.width, y: 0)
        }) { finished in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
