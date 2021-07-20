//
//  ResultsViewController.swift
//  Quiz App Ios app
//
//  Created by Niraj Thapa on 7/5/21.
//

import UIKit

class ResultsViewController: UIViewController {

    var quizQuestion : QuizQuestions?
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var startAgain: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        score.text = "Your score is: \(quizQuestion?.score ?? 0 )"
        
        switch quizQuestion?.score ?? -1 {
        case 0..<3:
            message.text = "Please try again!"
        case 3:
            message.text = "Good Job!"
        case 4:
            message.text = "Excellent Work!"
        case 5:
            message.text = "You are Genius!"
        default:
            message.text = "Something went Wrong"
            
        }
        message.commentText()
        startAgain.primarybtn()
    }
    
    
}



extension UILabel{
    func commentText(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSize.init(width: 0, height: 0)
    }
}
