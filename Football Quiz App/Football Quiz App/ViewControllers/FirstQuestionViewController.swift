//
//  FirstQuestionViewController.swift
//  Football Quiz App
//
//  Created by Niraj Thapa on 7/4/21.
//

import UIKit

class FirstQuestionViewController: UIViewController {

    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var score: UILabel!
    
    var answer : String = ""
    var quizQuestion : QuizQuestions?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let firstQz = quizQuestion?.selectedQuestions[0] else { return }  //firstQz has assigned value quizQuestion (this var
        question.text = firstQz.question
        answer = firstQz.answer
        option1.setTitle( firstQz.options[0], for: .normal)
        option2.setTitle( firstQz.options[1], for: .normal)
        option3.setTitle( firstQz.options[2], for: .normal)
        option4.setTitle( firstQz.options[3], for: .normal)
        score.text = "Score:\(quizQuestion?.score ?? 0 )"
    }
     
    
    @IBAction func optionSelected(_ sender: UIButton) {
        option1.isEnabled = false
        option2.isEnabled = false
        option3.isEnabled = false
        option4.isEnabled = false
        nextButton.isEnabled = true
        
        
        if sender.currentTitle == answer {
            sender.backgroundColor = .green
            sender.setTitleColor(.white, for: .normal)
            quizQuestion?.score += 1
            score.text = "Score:\(quizQuestion?.score ?? 0 )"
        }
        else{
            sender.backgroundColor = .red
            sender.setTitleColor(.white, for: .normal)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondQuestion"{
            guard let firstVC = segue.destination as? SecondQuestionViewController else { return }
            firstVC.quizQuestion = quizQuestion
        }
    }
    
}
