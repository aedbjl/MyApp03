//
//  ViewController.swift
//  2017062001
//
//  Created by iii-user on 2017/6/20.
//  Copyright © 2017年 iii-user. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textInput: UITextField!
    
    @IBOutlet weak var labelResult: UILabel!
    
    @IBOutlet weak var textHistory: UITextView!
    
    private var stringAnswer:String?
    private var counter = 0
    @IBAction func click(_ sender: Any) {
        counter += 1
        let stringInput = textInput.text!
        print(stringInput)
        
        
    
        let stringResult = BradAPI.checkAB(answer: stringAnswer!, guess: stringInput)
        labelResult.text = stringResult
        textHistory.text.append("\(stringInput)=> \(stringResult)\n")
        textInput.text = ""
        if stringResult == "3A0B"{
            showWinnerDialog()
        }else if counter == 10 {
            showLoserDialog()
        }
        textInput.resignFirstResponder()
        
    }
    
    func showWinnerDialog(){
        let alert:UIAlertController = UIAlertController(title: "Game Result", message: "Congratulatons", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: {
            (action:UIAlertAction) -> Void in
            self.initRound()
        })
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    func showLoserDialog(){
        let alert:UIAlertController = UIAlertController(title: "Game Result", message: "What a shame\n The Answer is:\(stringAnswer!)", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: {
            (action:UIAlertAction)-> Void in
            self.initRound()
        })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil )
    }
    
    private func initRound(){
        textInput.text = ""
        labelResult.text = "Show Result"
        textHistory.text = ""
        stringAnswer = BradAPI.createAnswer(3)
        counter = 0
        textInput.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        click(self)
        return true
    }
    // called when 'return' key pressed. return NO to ignore.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textInput.delegate = self
        stringAnswer = BradAPI.createAnswer(3)
//        print(stringAnswer!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

