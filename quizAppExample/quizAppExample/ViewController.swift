//
//  ViewController.swift
//  quizAppExample
//
//  Created by Murat Han on 30.01.2020.
//  Copyright © 2020 mracipayam. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let questions = ["What is your favorite pet?","How you doin?","You have whatsapp?"]
    let answers = [["dog","cat","bird"],["Joey","Ross","Rachel"],["Yes","No","I do not know"]]
    
    //variables
    var currentQuestion = 0
    var rightAnswerPlacement = 0
    var points = 0
    
    //Label
    @IBOutlet weak var label: UILabel!
    
    //Buttons
    @IBAction func action(_ sender: Any) {
        if (sender as AnyObject).tag == rightAnswerPlacement {
            print("RIGHT!")
            points += 1
        }
        else {
            print("WRONG!")
        }
        if (currentQuestion != questions.count){
            newQuestion()
        }
        else {
            performSegue(withIdentifier: "showScore", sender: self)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
    }
    
    //Functions that displays new questions
    func newQuestion(){
        label.text = questions[currentQuestion]
        
        rightAnswerPlacement = Int(arc4random_uniform(3)+1)
        
        //Create a button
        var button : UIButton = UIButton()
        
        var x = 1
        
        for i in 1...3 {
            button = view.viewWithTag(i) as! UIButton
            
            if i == rightAnswerPlacement {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
            
        }
        currentQuestion += 1
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

