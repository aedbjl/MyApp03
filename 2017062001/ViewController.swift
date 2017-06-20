//
//  ViewController.swift
//  2017062001
//
//  Created by iii-user on 2017/6/20.
//  Copyright © 2017年 iii-user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textInput: UITextField!
    
    @IBOutlet weak var labelResult: UILabel!
    
    @IBOutlet weak var textHistory: UITextView!
    
    private var stringAnswer:String?
    
    @IBAction func click(_ sender: Any) {
       let stringInput = textInput.text!
        print(stringInput)
        
        
    
        let stringResult = BradAPI.checkAB(answer: stringAnswer!, guess: stringInput)
        labelResult.text = stringResult
        textHistory.text.append("\(stringInput)=> \(stringResult)\n")
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stringAnswer = BradAPI.createAnswer()
//        print(stringAnswer!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

