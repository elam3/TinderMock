//
//  CardsViewControllerViewController.swift
//  TinderMock
//
//  Created by Edison Lam on 4/6/17.
//  Copyright © 2017 Edison Lam. All rights reserved.
//

import UIKit

class CardsViewControllerViewController: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanCard(_ sender: Any) {
        // Common properties to access from Pan Gesture Recognizer
        let location = (sender as AnyObject).location(in: view)
        let translation = (sender as AnyObject).translation(in: view)
        //let velocity = (sender as AnyObject).velocity(in: view)
        
        // Initialize a rotation transform
        cardImageView.transform = cardImageView.transform.rotated(by: CGFloat())
        
        
        print("translation \(translation)")
        
        if (sender as AnyObject).state == .began {
            cardInitialCenter = cardImageView.center
        } else if (sender as AnyObject).state == .changed {
            //cardImageView.center = CGPoint(x: cardInitialCenter.x, y: cardInitialCenter.y + translation.y)
            
            // If the user starts dragging in the bottom half of the card, reverse the above rotation.
            var dir = 1.0
            if cardInitialCenter.y < location.y {
                dir = 1.0
            } else {
                dir = -1.0
            }
            
            // For positive horizontal translations, rotate the image clockwise. 
            if translation.x > 0 {
                // Update the rotation from an existing transform
                cardImageView.transform = cardImageView.transform.rotated(by: CGFloat(3.14 * dir * M_PI / 180))
            }
            // For negative horizontal translations, rotate the image counterclockwise.
            else if translation.x < 0 {
                // Update the rotation from an existing transform
                cardImageView.transform = cardImageView.transform.rotated(by: CGFloat(-3.14 * dir * M_PI / 180))
            }
        } else if (sender as AnyObject).state == .ended {
            // If the x translation is greater than 50, animate it off screen to the right. 
            if translation.x > 50 {
                UIView.animate(withDuration:0.4, animations: {
                    self.cardImageView.center = CGPoint(x: self.cardInitialCenter.x + 500, y: self.cardInitialCenter.y + translation.y)
                })

            }
            // If the x translation is less than 50, animate it off screen to the left.
            else if translation.x < 50 {
                UIView.animate(withDuration:0.4, animations: {
                    self.cardImageView.center = CGPoint(x: self.cardInitialCenter.x - 500, y: self.cardInitialCenter.y + translation.y)
                })
            }
            // Otherwise, restore the original center and transform.
            else {
                cardImageView.transform = CGAffineTransform.identity
            }
        }
    }

    @IBAction func onMsgBtnPressed(_ sender: Any) {
    }
    
    @IBAction func onPrefBtnPressed(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
