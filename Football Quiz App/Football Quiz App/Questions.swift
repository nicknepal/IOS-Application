//
//  Questions.swift
//  Football Quiz App
//
//  Created by Niraj Thapa on 7/4/21.
//

import Foundation

struct Question {
    var question : String
    var options : [String]
    var answer : String
}

struct QuizQuestions {
    var questionsList : [Question] = []
    var selectedQuestions : [Question] = []
    var score : Int = 0
    
    
    mutating func selectQuestion() {
        var temp = questionsList                      
        for _ in 0..<4{
            let rand = Int.random(in: 0..<temp.count)
            selectedQuestions.append(temp[rand])
            temp.remove(at: rand)
        }
    }
    
    
    mutating func loadQuestions()  {
        if let path = Bundle.main.path(forResource: "QuestionList", ofType: "plist"){
            if let items = NSArray(contentsOfFile: path) as? [[String: AnyObject]] {
                for data in items {
                    let question = Question(question: data["question"] as! String, options: data["options"] as! [String] , answer: data["answer"] as! String)
                    self.questionsList.append(question)
                }
                selectQuestion()
            }
        }
    }
}

