//
//  ViewController.swift
//  Derrick Quiz
//
//  Created by Derrick Ward on 10/20/16.
//  Copyright © 2016 Derrick Ward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionLabel : UILabel!
    @IBOutlet var answerLabel : UILabel!
    
    let questions : [String] = ["What is Derrick's Middle Name?",
                                "What college did Derrick go to?",
                                "What was Derrick's Major?"]
    let answers : [String] = ["Kyle","University of Pittsburgh","Computer Engineering"]
    
    var questionIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        questionLabel.text=questions[0] //Show the first question
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
        questionLabel.text = questions[questionIndex]
    }
    
    //Operations to be completed when showAnswer is clicked
    @IBAction func showAnswer(sender:AnyObject){
        answerLabel.text=answers[questionIndex]
    }

}

