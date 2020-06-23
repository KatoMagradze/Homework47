//
//  RosesViewController.swift
//  Homework47
//
//  Created by Kato on 6/23/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var name = ""
    var flowerdescription = ""
    var backgroudImage = UIImage()
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var flowerNameLabel: UILabel!
    @IBOutlet weak var flowerDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addWallpaperBlur()
        
        backgroundImageView.image = self.backgroudImage
        flowerNameLabel.text = self.name.uppercased()
        flowerDescriptionLabel.text = self.flowerdescription
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
        
//        dismiss(animated: true, completion: nil)
        
//        view.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
//        UIView.animate(
//            withDuration: 0.6,
//            delay: 0.0,
//            usingSpringWithDamping: 0.6,
//            initialSpringVelocity: 0.2,
//            animations: {
//                self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//        }
//        )
//        dismiss(animated: true)
    }
    
    func addWallpaperBlur() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.4
        blurEffectView.frame = backgroundImageView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundImageView.addSubview(blurEffectView)
    }
    
}
