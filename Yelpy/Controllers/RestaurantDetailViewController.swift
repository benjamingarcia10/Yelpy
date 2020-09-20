//
//  DetailViewController.swift
//  Yelpy
//
//  Created by Memo on 5/26/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import Lottie
import AlamofireImage


class RestaurantDetailViewController: UIViewController {

    // ––––– TODO: Configure outlets
    // NOTE: Make sure to set images to "Content Mode: Aspect Fill" on the
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var reviewsLabel: UILabel!
    
    // –––––  Lab 4: create an animation view
    var animationView: AnimationView?
    
    // Initialize restaurant variable
    var r: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ––––– Lab 4 TODO: Start animations
        startAnimations()
        
        configureOutlets()
        
        // ––––– Lab 4: stop animations, you can add a timer to stop the animation
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(self.stopAnimations), userInfo: nil, repeats: false)
    }
    
    
    // ––––– Lab 4 TODO: Call animation functions to start
    func startAnimations(){
        animationView = .init(name: "4762-food-carousel")
        
        let animationSize = view.frame.width - 50
        let xPos = (view.frame.width / 2) - (animationSize / 2)
        let yPos = (view.frame.height / 2) - (animationSize / 2)
        
        animationView!.frame = CGRect(x: xPos, y: yPos, width: animationSize, height: animationSize)
        animationView!.contentMode = .scaleAspectFit
        view.addSubview(animationView!)
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 5
        animationView!.play()
    }

    
    // ––––– Lab 4 TODO: Call animation functions to stop
    @objc func stopAnimations(){
      animationView?.stop()
      view.subviews.last?.removeFromSuperview()
    }

    
    // ––––– TODO: Configure outlets :)
    func configureOutlets() {
        nameLabel.text = r.name
        reviewsLabel.text = String(r.reviews)
        starImage.image = Stars.dict[r.rating]!
        headerImage.af.setImage(withURL: r.imageURL!)
        
        // Extra: Add tint opacity to image to make text stand out
        let tintView = UIView()
        tintView.backgroundColor = UIColor(white: 0, alpha: 0.3) //change to your liking
        tintView.frame = CGRect(x: 0, y: 0, width: headerImage.frame.width, height: headerImage.frame.height)

        headerImage.addSubview(tintView)
    }


}
