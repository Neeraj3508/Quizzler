//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    
    
    @IBOutlet weak var score: UILabel!
    var brain = quizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = brain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        brain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(resetColor), userInfo: nil, repeats: false)
        updateUI()
    }
    func updateUI() {
        score.text = "Score : \(brain.getScore())"
        currentLabel.text = brain.updateLabel()
        option1.setTitle(brain.getOption1(), for: .normal)
        option2.setTitle(brain.getOption2(), for: .normal)
        option3.setTitle(brain.getOption3(), for: .normal)
        progressBar.progress = brain.getProgress()
    }
    @objc func resetColor() {
        option1.backgroundColor = UIColor.clear
        option2.backgroundColor = UIColor.clear
        option3.backgroundColor = UIColor.clear
    }
}

