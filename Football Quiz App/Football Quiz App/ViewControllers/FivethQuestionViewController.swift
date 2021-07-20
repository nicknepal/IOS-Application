//
//  FivethQuestionViewController.swift
//  Football Quiz App
//
//  Created by Niraj Thapa on 7/5/21.
//

import UIKit

class FivethQuestionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var finishedbutton: UIButton!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var score: UILabel!
    
    var images = [#imageLiteral(resourceName: "player1") , #imageLiteral(resourceName: "player2") , #imageLiteral(resourceName: "player4") , #imageLiteral(resourceName: "player3") ]
    var quizQuestion : QuizQuestions?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        score.text = "Score:\(quizQuestion?.score ?? 0 )"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageview = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        imageview.image.image = images[indexPath.row]
        imageview.image.contentMode = .scaleAspectFit
        return imageview
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.isUserInteractionEnabled = false
        
        finishedbutton.isEnabled = true
        if indexPath.row ==  3 {
            collectionView.backgroundColor = .green
            quizQuestion?.score += 1
            score.text = "Score:\(quizQuestion?.score ?? 0 )"
        }
        else{
            collectionView.backgroundColor = .red
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "results"{
            guard let five = segue.destination as? ResultsViewController else { return }
            five.quizQuestion = quizQuestion
        }
    }
    
}
