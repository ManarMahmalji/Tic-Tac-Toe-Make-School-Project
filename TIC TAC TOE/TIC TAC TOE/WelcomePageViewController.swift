//
//  WelcomePageViewController.swift
//  TIC TAC TOE
//
//  Created by Manar Mahmalji on 8/23/17.
//  Copyright © 2017 Manar Mahmalji. All rights reserved.
//

import Foundation
import UIKit
class WelcomePageViewController: UIViewController{
    
    @IBAction func unwindToWelcomeOageViewController(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            if identifier == "newGameButtonTapped"{
                let destination = segue.destination as! ViewController
                destination.newGame1 = true
                
            
        }
        
    }
    
     
    
    func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    }
}

