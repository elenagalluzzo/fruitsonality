//
//  ResultViewController.swift
//  Fruitsonality
//
//  Created by Elena Galluzzo on 2023-04-06.
//

import UIKit

protocol ResultViewDelegate: AnyObject {
    func resetFruitModel()
}

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultLabelView: UIView!
    @IBOutlet weak var fruitImageView: UIImageView!
    @IBOutlet weak var retryButton: UIButton!
    
    weak var delegate: ResultViewDelegate?
    
    var fruitQuizModel: FruitQuizModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitImageView.image = nil
        resultLabel.text = nil
        resultLabelView.layer.cornerRadius = 20
        retryButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getResult()
    }
    
    @IBAction func retryAction(_ sender: UIButton) {
        self.dismiss(animated: true)
        delegate?.resetFruitModel()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func getResult() {
        guard let fruitQuizModel = fruitQuizModel else { return }
        let countedSet = NSCountedSet(array: fruitQuizModel.answersArray)
        let mostFrequent = countedSet.max { countedSet.count(for: $0) < countedSet.count(for: $1) }
        if mostFrequent as! String == "option1"{
            resultLabel.textColor = .orange
            resultLabel.text = "Cool Clementine"
            fruitImageView.image = UIImage(named: "Cool Clementine")
        } else if mostFrequent as! String == "option2"{
            resultLabel.textColor = .red
            resultLabel.text = "Angry Apple"
            fruitImageView.image = UIImage(named: "Angry Apple")
        } else if mostFrequent as! String == "option3"{
            resultLabel.textColor = .systemPink
            resultLabel.text = "Sweet Strawberry"
            fruitImageView.image = UIImage(named: "Sweet Strawberry")
        } else {
            resultLabel.textColor = .blue
            resultLabel.text = "Blue Blueberry"
            fruitImageView.image = UIImage(named: "Blue Blueberry")
        }
    }

}
