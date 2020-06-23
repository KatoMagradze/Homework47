//
//  ViewController.swift
//  Homework47
//
//  Created by Kato on 6/23/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wallpaperImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var flowers = [Flower]()
    let transition = PopAnimator()
    
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Do any additional setup after loading the view.
        
        self.addWallpaperBlur()
        self.addFlowers()
    }

    func addWallpaperBlur() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.3
        blurEffectView.frame = wallpaperImageView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        wallpaperImageView.addSubview(blurEffectView)
    }
    
    func addFlowers() {
        var rose = Flower(flowerImage: UIImage(named: "roses_vc")!, flowerName: "Rose")
        var daisy = Flower(flowerImage: UIImage(named: "daisies_vc")!, flowerName: "Daisy")
        var sunflower = Flower(flowerImage: UIImage(named: "sunflowers_vc")!, flowerName: "Sunflower")
        var lily = Flower(flowerImage: UIImage(named: "lilies_vc")!, flowerName: "Lily")
        var tulip = Flower(flowerImage: UIImage(named: "tulips_vc")!, flowerName: "Tulip")
        var carnation = Flower(flowerImage: UIImage(named: "carnations_vc")!, flowerName: "Carnation")
        
        rose.flowerDescription = "A rose is a woody perennial flowering plant of the genus Rosa, in the family Rosaceae, or the flower it bears. There are over three hundred species and tens of thousands of cultivars."
        daisy.flowerDescription = "Bellis perennis is a common European species of daisy, of the family Asteraceae, often considered the archetypal species of that name."
        sunflower.flowerDescription = "Helianthus annuus, the common sunflower, is a large annual forb of the genus Helianthus grown as a crop for its edible oil and edible fruits."
        lily.flowerDescription = "Lilium is a genus of herbaceous flowering plants growing from bulbs, all with large prominent flowers. Lilies are a group of flowering plants which are important in culture and literature in much of the world."
        tulip.flowerDescription = "Tulips form a genus of spring-blooming perennial herbaceous bulbiferous geophytes. The flowers are usually large, showy and brightly colored, generally red, pink, yellow, or white."
        carnation.flowerDescription = "Dianthus caryophyllus, commonly known as the carnation or clove pink, is a species of Dianthus. It is probably native to the Mediterranean region but its exact range is unknown due to extensive cultivation for the last 2,000 years."
        
        
        
        flowers.append(rose)
        flowers.append(daisy)
        flowers.append(sunflower)
        flowers.append(lily)
        flowers.append(tulip)
        flowers.append(carnation)
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flowers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "flowers_cell", for: indexPath) as! FlowersCollectionViewCell
        
        cell.layer.cornerRadius = 10
        cell.flowerImageView.image = flowers[indexPath.row].flowerImage
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        
        performSegue(withIdentifier: "details_segue", sender: flowers[indexPath.row])
        
    }
    
}

extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let detailsViewController = segue.destination as? DetailsViewController {
            
            detailsViewController.backgroudImage = flowers[selectedIndex].flowerImage
            detailsViewController.name = flowers[selectedIndex].flowerName
            detailsViewController.flowerdescription = flowers[selectedIndex].flowerDescription
            detailsViewController.transitioningDelegate = self
        }
        
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        //transition.presenting = true
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            
        //transition.presenting = false
            
        return nil
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = collectionView.frame.width / 2
        
        return CGSize(width: itemWidth - 20 - 20, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}


struct Flower {
    let flowerImage: UIImage
    let flowerName: String
    var flowerDescription = ""
}

