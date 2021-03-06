//
//  PopAnimation.swift
//  test滑动转场
//
//  Created by csj on 15/6/14.
//  Copyright (c) 2015年 csj. All rights reserved.
//

import UIKit

class PopAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }

    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let from = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let to = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let v = transitionContext.containerView
        v.insertSubview(to.view, belowSubview: from.view)
        let d = self.transitionDuration(using: transitionContext)
        
        let bounds = to.view.bounds
        
        to.view.frame = CGRect(x: -bounds.size.width, y: 0, width: bounds.size.width, height: bounds.size.height)
        
        //        println(to.view.frame)
        
        UIView.animate(withDuration: d, animations: {
            from.view.transform = CGAffineTransform(translationX: UIScreen.main.bounds.size.width, y: 0)
            to.view.transform = to.view.transform.translatedBy(x: UIScreen.main.bounds.size.width, y: 0)
        }, completion: {
            (finish) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        )
    }
}
