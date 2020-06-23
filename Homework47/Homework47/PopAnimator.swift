//
//  PopAnimator.swift
//  Homework47
//
//  Created by Kato on 6/23/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 0.6
    var presenting = true
    var originFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        
        containerView.addSubview(toView)
        toView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        UIView.animate(
            withDuration: duration,
            delay: 0.0,
            usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0.2,
            animations: {
                toView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        },
            completion: { _ in
                transitionContext.completeTransition(true)
        }
        )
        
    }
    

}
