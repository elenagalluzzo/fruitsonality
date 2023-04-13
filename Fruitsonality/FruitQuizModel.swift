//
//  FruitQuizModel.swift
//  Fruitsonality
//
//  Created by Elena Galluzzo on 2023-04-05.
//

import Foundation

struct FruitQuizModel {
   
    var questionNumber = 0
    
    var answersArray = [String]()
    var isQuizEnded = false
    
    
    let quizQuestions = [
        QuizModel(
            question: "You have ran into a friend. How do you greet them?",
            option1: "Sup.",
            option2: "I don’t want to talk to you!",
            option3: "It’s nice to see you!",
            option4: "Sobs"
        ),
        QuizModel(
            question: "You are getting lunch with your friend. What do you order?",
            option1: "Filet mignon with truffle fries.",
            option2: "Nothing. The menu sucks.",
            option3: "Red velvet cake with sprinkles.",
            option4: "A tub of ice cream."
        ),
        QuizModel(
            question: "Your friend told you about their break-up. How do you comfort them?",
            option1: "Their loss. Let’s go to a bar.",
            option2: "I don’t care.",
            option3: "I’m so sorry!",
            option4: "Cry with them"
        ),
        QuizModel(
            question: "The waiter has brought the bill. How do you react?",
            option1: "This one’s on me. ;)",
            option2: "What are you looking at me for?",
            option3: "I got it! I’ll treat you today.",
            option4: "My wallet was stolen."
        ),
        QuizModel(
            question: "You and your friend are parting ways. How do you say goodbye?",
            option1: "I gotta bounce. Catch you later.",
            option2: "Don’t contact me again.",
            option3: "Goodbye! Nice meeting you!",
            option4: "Sobs. They all leave."
        )
    
    ]
    
    func getCurrentQuestion() -> String {
        return quizQuestions[questionNumber].question
    }
    
    func getOption1() -> String {
        return quizQuestions[questionNumber].option1
    }
    
    func getOption2() -> String {
        return quizQuestions[questionNumber].option2
    }
    
    func getOption3() -> String {
        return quizQuestions[questionNumber].option3
    }
    
    func getOption4() -> String {
        return quizQuestions[questionNumber].option4
    }
    
    mutating func nextQuestion() {
        if questionNumber < quizQuestions.count - 1 {
            questionNumber += 1
            if questionNumber == quizQuestions.count - 1 {
                isQuizEnded = true
            }
        }
    }
    
    mutating func trackAnswers(chosenOption: String) {
        if chosenOption == quizQuestions[questionNumber-1].option1{
            answersArray.append("option1")
        } else if chosenOption == quizQuestions[questionNumber-1].option2{
            answersArray.append("option2")
        } else if chosenOption == quizQuestions[questionNumber-1].option3{
            answersArray.append("option3")
        } else {
            answersArray.append("option4")
        }
    }
}
