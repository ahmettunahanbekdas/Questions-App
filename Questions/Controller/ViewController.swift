//
//  ViewController.swift
//  Questions
//
//  Created by Ahmet Tunahan Bekdaş on 1.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var questionsBrain = QuetionsBrain()
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()

    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userRight = questionsBrain.checkAnswer(userAnswer)
        
        if userRight == true {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        questionsBrain.nextQuesiton()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.updateLabel()
        }

        
 
    }
    func updateLabel(){
        questionLabel.text = questionsBrain.getQuestionLabel()
        trueButton.backgroundColor = UIColor.systemPurple
        falseButton.backgroundColor = UIColor.systemPurple
        scoreLabel.text = "SCORE: \(questionsBrain.scorePoint)"
        progressBar.progress = questionsBrain.updateProgressBar()
    }
}
