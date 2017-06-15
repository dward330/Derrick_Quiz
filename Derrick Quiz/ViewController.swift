//
//  ViewController.swift
//  Derrick Quiz
//
//  Created by Derrick Ward on 10/20/16.
//  Copyright © 2016 Derrick Ward. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet var nextQuestionLabel : UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint : NSLayoutConstraint!
    @IBOutlet var currentQuestionLabel : UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint : NSLayoutConstraint!
    @IBOutlet var answerLabel : UILabel!
    
    let questions : [String] = ["What is Derrick's Middle Name?",
                                "What college did Derrick go to?",
                                "What was Derrick's Major?"]
    let answers : [String] = ["Kyle","University of Pittsburgh","Computer Engineering"]
    
    var questionIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        
        //Show the first question
        self.currentQuestionLabel.text=questions[0];
        
        //Move next question label off screen
        self.updateOffScreenLabel();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Set the label's initial alpha
        self.nextQuestionLabel.alpha = 0;
        
        //animateLabelTransition()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Operations to be completed when showNextButton is clicked
    @IBAction func showNextQuestion(sender:AnyObject){
        
        questionIndex += 1 //increment question index counter
        
        //Figure out if we need to restart the question counter
        if (questionIndex == questions.count){
            questionIndex = 0
        }
        
        //Load the next question
        self.nextQuestionLabel.text = questions[questionIndex]
        
        //Reset the Answer Label back to an unknown state
        answerLabel.text="???";
        
        animateLabelTransition()
    }
    
    //Operations to be completed when showAnswer is clicked
    @IBAction func showAnswer(sender:AnyObject){
        answerLabel.text=answers[questionIndex]
    }
    
    //Function to animate closure
    func animateLabelTransition(){
        
        //Needed in case the labels need to be sized up and we dont want the size up handled in animations
        self.view.layoutIfNeeded();
        
        //Update Label Locations
        let screenRightEndPos = self.view.frame.width;
        self.nextQuestionLabelCenterXConstraint.constant = 0;
        self.currentQuestionLabelCenterXConstraint.constant += screenRightEndPos;
        
        //Animate the Alpha and swap labels, and label constraints
        UIView.animate(withDuration: 1,delay: 0, options: [.curveEaseInOut], animations:{
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
            self.view.layoutIfNeeded();
        }, completion:{ _ in
            swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
            swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
            
            self.updateOffScreenLabel();
        })
    }

    //Moves the Next Question Label off screen, to the left
    func updateOffScreenLabel(){
        nextQuestionLabelCenterXConstraint.constant = -view.frame.width;
    }
    
}

