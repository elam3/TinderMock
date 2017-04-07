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
        let velocity = (sender as AnyObject).velocity(in: view)
        
        print("translation \(translation)")
        
        if (sender as AnyObject).state == .began {
            cardInitialCenter = cardImageView.center
        } else if (sender as AnyObject).state == .changed {
            
        } else if (sender as AnyObject).state == .ended {
            
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
