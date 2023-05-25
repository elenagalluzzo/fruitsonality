//
//  ViewController.swift
//  Fruitsonality
//
//  Created by Elena Galluzzo on 2023-04-05.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionLabelView: UIView!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    
    var fruitQuizModel = FruitQuizModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabelView.layer.cornerRadius = 20
        option1Button.layer.cornerRadius = 10
        option2Button.layer.cornerRadius = 10
        option3Button.layer.cornerRadius = 10
        option4Button.layer.cornerRadius = 10
        updateQuestion()
    }
    
    @IBAction func optionPressed(_ sender: UIButton) {
        let chosenOption = sender.currentTitle!
        if fruitQuizModel.isQuizEnded {
            endQuiz()
        } else {
            fruitQuizModel.nextQuestion()
        }
        updateQuestion()
        fruitQuizModel.trackAnswers(chosenOption: chosenOption)
    }
    
    func updateQuestion() {
        questionLabel.text = fruitQuizModel.getCurrentQuestion()
        option1Button.setTitle(fruitQuizModel.getOption1(), for: .normal)
        option2Button.setTitle(fruitQuizModel.getOption2(), for: .normal)
        option3Button.setTitle(fruitQuizModel.getOption3(), for: .normal)
        option4Button.setTitle(fruitQuizModel.getOption4(), for: .normal)
    }
    
    func endQuiz() {
        self.performSegue(withIdentifier: "showResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            if let destinationVC = segue.destination as? ResultViewController {
                destinationVC.fruitQuizModel = fruitQuizModel
                destinationVC.delegate = self
            }
        }
    }
}

extension QuizViewController: ResultViewDelegate {
    func resetFruitModel() {
        fruitQuizModel = FruitQuizModel()
        updateQuestion()
    }
}

