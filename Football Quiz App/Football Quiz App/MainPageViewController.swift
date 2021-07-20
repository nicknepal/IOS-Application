//
//  MainPageViewController.swift
//  Football Quiz App
//
//  Created by Niraj Thapa on 7/4/21.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet weak var letStart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        letStart.primarybtn()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == "quizstart"{
            var quiz = QuizQuestions()
            quiz.loadQuestions()
            guard let firstVC = segue.destination as? FirstQuestionViewController else { return }
            firstVC.quizQuestion = quiz
        }
    }
    
    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {}
    
}


extension UIButton{
    func primarybtn(){
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize.init(width: 0, height: 0)
    }
}
