//
//  SecondQuestionViewController.swift
//  Football Quiz App
//
//  Created by Niraj Thapa on 7/5/21.
//

import UIKit

class SecondQuestionViewController: UIViewController {
    
    var quizQuestion : QuizQuestions?
    var answer : String = ""
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var option1: UILabel!
    @IBOutlet weak var option2: UILabel!
    @IBOutlet weak var switch3: UISwitch!
    @IBOutlet weak var option3: UILabel!
    @IBOutlet weak var switch4: UISwitch!
    @IBOutlet weak var option4: UILabel!
    @IBOutlet weak var nextButton: UIButton!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let secondQz = quizQuestion?.selectedQuestions[1] else { return }
        question.text = secondQz.question
        option1.text =  secondQz.options[0]
        option2.text =  secondQz.options[1]
        option3.text =  secondQz.options[2]
        option4.text = secondQz.options[3]
        answer = secondQz.answer
        score.text = "Score:\(quizQuestion?.score ?? 0 )"
    }
    
    func enablebutton() {
        switch1.isEnabled = false
        switch2.isEnabled = false
        switch3.isEnabled = false
        switch4.isEnabled = false
        nextButton.isEnabled = true
    }
    
    @IBAction func firstswitch(_ sender: Any) {
        enablebutton()
        switch1.isEnabled = true
        if option1.text == answer {
            option1.backgroundColor = .green
            quizQuestion?.score += 1
            score.text = "Score:\(quizQuestion?.score ?? 0 )"
        }
        else{
            option1.backgroundColor = .red
            option1.textColor = .white
        }
    }
    
    
    @IBAction func secondSwitch(_ sender: Any) {
        enablebutton()
        switch2.isEnabled = true

        if option2.text == answer {
            option2.backgroundColor = .green
            quizQuestion?.score += 1
            score.text = "Score:\(quizQuestion?.score ?? 0 )"
        }
        else{
            option2.backgroundColor = .red
            option2.textColor = .white
        }
    }
    
    
    @IBAction func thirdSwitch(_ sender: Any) {
        enablebutton()
        switch3.isEnabled = true

        if option3.text == answer {
            option3.backgroundColor = .green
            quizQuestion?.score += 1
            score.text = "Score:\(quizQuestion?.score ?? 0 )"
        }
        else{
            option3.backgroundColor = .red
            option3.textColor = .white
        }
    }
    
    
    @IBAction func fourSwitch(_ sender: Any) {
        enablebutton()
        switch4.isEnabled = true

        if option4.text == answer {
            option4.backgroundColor = .green
            quizQuestion?.score += 1
            score.text = "Score:\(quizQuestion?.score ?? 0 )"
        }
        else{
            option4.backgroundColor = .red
            option4.textColor = .white
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "thirdQuestion"{
            guard let firstVC = segue.destination as? ThirdQuestionViewController else { return }
            firstVC.quizQuestion = quizQuestion
        }
    }
    
}
