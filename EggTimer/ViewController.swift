//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
   
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    var secondsRemaining: Int = 0

    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        func startTimer(seconds: Int) {
            secondsRemaining = seconds
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
                   if secondsRemaining > 0 {
                       print ("\(secondsRemaining) seconds")
                       secondsRemaining -= 1
                   } else {
                       Timer.invalidate()
                   }
               }
           }
        if hardness == "Soft" {
            startTimer(seconds: 300)
        } else if hardness == "Medium" {
            startTimer(seconds: 420)
        } else if hardness == "Hard" {
            startTimer(seconds: 720)
        }
        
    }
    

}


    

