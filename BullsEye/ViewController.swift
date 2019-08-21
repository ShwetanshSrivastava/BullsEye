//
//  ViewController.swift
//  BullsEye
//
//  Created by Shwetansh Srivastava on 19/08/19.
//  Copyright © 2019 Shwetansh Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue:Int = 0
    var targetValue:Int = 0
    var score = 0
    var round = 0
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var targetLabel:UILabel!
    @IBOutlet weak var scoreLabel:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startRound()
    }

    @IBAction func showAlert() {
        let differenceValue:Int = abs(targetValue - currentValue)
        var points = 100 - differenceValue
        if points == 100 {
            score += 100
            points += 100
        } else if points == 99 {
            score += 50
            points += 50
        }
        score += points
        var title:String {
            if points == 100 {
                return "Perfect"
            } else if points > 90 {
                return "You almost had it"
            } else {
                return "far from home"
            }
        }
        let message:String = "You Scored: \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Exit", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    func startRound() {
        currentValue = 50
        targetValue = Int.random(in: 1...100)
        slider.value = Float(currentValue)
        round += 1
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

