//
//  FourthQuestionViewController.swift
//  Football Quiz App
//
//  Created by Niraj Thapa on 7/5/21.
//

import UIKit

class FourthQuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var score: UILabel!
    var quizQuestion : QuizQuestions?
    var answer : String = ""
    var options : [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let fourQz = quizQuestion?.selectedQuestions[3] else { return }
        question.text = fourQz.question
        answer = fourQz.answer
        options = fourQz.options
        self.tableview?.dataSource = self
        self.tableview?.delegate = self
        score.text = "Score:\(quizQuestion?.score ?? 0 )"
        print(options,answer)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.isUserInteractionEnabled = false
        nextButton.isEnabled = true
        
        if options[indexPath.row] == answer{
            tableview.backgroundColor = .green
            quizQuestion?.score += 1
            score.text = "Score:\(quizQuestion?.score ?? 0 )"
        }
        else{
            tableview.backgroundColor = .red
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fivethQuestion"{
            guard let five = segue.destination as? FivethQuestionViewController else { return }
            five.quizQuestion = quizQuestion

        }
    }
}
