//
//  ViewController.swift
//  Quiz
//
//  Created by Bobby Hamrick on 1/11/17.
//  Copyright © 2017 Bobby Hamrick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //declare the question label
    @IBOutlet var questionLabel: UILabel!
    
    //declare the answer label
    @IBOutlet var answerLabel: UILabel!
    
    //initiate an array of questions
    let questions: [String] = ["What is 7+7?",
                               "What is the capital of Vermont",
                               "What is cognac made from?",
                               "Who is the main actor in Cast Away?",
                               "What can you find on the beach?"
    ]
    
    //initiate an array of answers
    let answers: [String] = ["14",
                             "Montpelier",
                             "Grapes",
                             "Tom Hanks",
                             "Lots of Sand"
    ]
    
    //keep track of what question the user is on
    var currentQuestionIndex: Int = 0
    
    //func showNextQuestion(UIButton)
    //displays the next question in the quiz
    @IBAction func showNextQuestion(_ sender: UIButton){
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count{
            currentQuestionIndex = 0
        }
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }

    //func showAnswer(UIButton)
    //displays the answer to the question
    @IBAction func showAnswer(_ sender: UIButton){
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    //func viewDidLoad()
    //load the initial screen of the quiz app
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
}

