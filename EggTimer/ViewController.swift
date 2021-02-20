//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    let softTime = 5
//    let mediumTime = 8
//    let hardTime = 12

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timerText: UILabel!
    
    let eggTimes = [
        "Soft": 5 * 60,
        "Medium": 8 * 60,
        "Hard": 12 * 60
    ]
    
    var counter = 60
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func pressedButton(_ sender: UIButton) {
        
//        print(sender.currentTitle!)
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        guard let hardness = sender.currentTitle else { return }
        counter = eggTimes[hardness]!
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        

    }

    
    @objc func updateCounter() {
        //example functionality
        
        if counter > 0 {
            timerText.text = "\(counter) seconds."
            counter -= 1
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timerText.text = "Timer Over!"
            timer.invalidate()
        }
    }
    

}
