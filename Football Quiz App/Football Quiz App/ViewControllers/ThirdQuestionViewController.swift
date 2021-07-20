//
//  ThirdQuestionViewController.swift
//  Football Quiz App
//
//  Created by Niraj Thapa on 7/5/21.
//

import UIKit

class ThirdQuestionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var score: UILabel!
    
    
    var pickerdata : [String] = []
    var quizQuestion : QuizQuestions?
    var answer : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let thirdQz = quizQuestion?.selectedQuestions[2] else { return }
        question.text = thirdQz.question
        answer = thirdQz.answer
        self.picker.delegate = self
        self.picker.dataSource = self
        score.text = "Score:\(quizQuestion?.score ?? 0 )"
        pickerdata = thirdQz.options
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        4
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerdata[row]
    }
  
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nextButton.isEnabled = true
        pickerView.isUserInteractionEnabled = false
        if pickerdata.firstIndex(of: answer)! == row {
            picker.backgroundColor = .green
            quizQuestion?.score += 1
            score.text = "Score:\(quizQuestion?.score ?? 0 )"
        }
        else{
            picker.backgroundColor = .red
        }

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fourthQuestion"{
            guard let four = segue.destination as? FourthQuestionViewController else { return }
            four.quizQuestion = quizQuestion
        }
    }
    

}
