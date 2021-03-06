//
//  ViewController.swift
//  Quiz
//
//  Created by Bobby Hamrick on 1/11/17.
//  Copyright © 2017 Bobby Hamrick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //declare variable to hold the screen width
    var screenWidth: CGFloat!
    
    //declare the question label
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    //declare the answer label
    @IBOutlet var answerLabel: UILabel!
    
    //initiate an array of questions
    let questions: [String] = ["What is 7+7?",
                               "What is the capital of Vermont?",
                               "What is cognac made from?"
    ]
    
    //initiate an array of answers
    let answers: [String] = ["14",
                             "Montpelier",
                             "Grapes"
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
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }

    //func showAnswer(UIButton)
    //displays the answer to the question
    @IBAction func showAnswer(_ sender: UIButton){
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    func animateLabelTransitions(){
        view.layoutIfNeeded()
        //animate the alpha
        //and center the x constraints
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth

        
        /*UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
            self.view.layoutIfNeeded()
        }, completion: { _ in
            swap(&self.currentQuestionLabel,
                 &self.nextQuestionLabel)
            swap(&self.currentQuestionLabelCenterXConstraint,
                 &self.nextQuestionLabelCenterXConstraint)
            
            self.updateOffScreenLabel()
        })*/
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [],
                       animations: {
                        //self.currentQuestionLabel.alpha = 0
                        self.currentQuestionLabel.alpha = 1
                        self.nextQuestionLabel.alpha = 1
                        self.view.layoutIfNeeded()
                       },
                       completion: { _ in
                        swap(&self.currentQuestionLabel,
                             &self.nextQuestionLabel)
                        swap(&self.currentQuestionLabelCenterXConstraint,
                             &self.nextQuestionLabelCenterXConstraint)
                        
                        self.updateOffScreenLabel()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        nextQuestionLabel.alpha = 1
        //nextQuestionLabel.alpha = 0
    }
    
    //func viewDidLoad()
    //load the initial screen of the quiz app
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenWidth = view.frame.width
        
        currentQuestionLabel.text = questions[currentQuestionIndex]
        
        updateOffScreenLabel()
    }
    
    func updateOffScreenLabel(){
        //let screenWidth = view.frame.width
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)
        layoutGuide.widthAnchor.constraint(equalToConstant: screenWidth*2).isActive = true
        //currentQuestionLabelCenterXConstraint = layoutGuide.trailingAnchor.constraint(equalTo: layoutGuide.leadingAnchor)
        //nextQuestionLabelCenterXConstraint = layoutGuide.leadingAnchor.constraint(equalTo: layoutGuide.trailingAnchor)

        //nextQuestionLabelCenterXConstraint.constant = -screenWidth
        nextQuestionLabelCenterXConstraint.constant = -layoutGuide.layoutFrame.width
    }

}

