//
//  ViewController.swift
//  ApplePie
//
//  Created by martynov on 2017-10-13.
//  Copyright © 2017 martynov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords = ["elephant", "electron", "gasoline", "barn"]
    let incorrectMovesAllowed = 7
    
    var totalWins = 0
    var totalLosses = 0
    
    
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBOutlet var letterButtons: [UIButton]!

   
    var currentGame: Game!

    // Starting new round
    func newRound(){
        let newWord  = listOfWords.removeFirst()
        currentGame = Game(word: newWord.lowercased(), incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }
 
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        // turning off tapped letter
        sender.isEnabled = false
        
        let letterAsString = sender.titleLabel?.text?.lowercased()
        let letter = Character(letterAsString!)
        currentGame.checkLetter(inside: letter)
        
        updateUI()
        print(currentGame.guessedLetters)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newRound()
    }
    
    func updateUI() {
        
        correctWordLabel.text = currentGame.guessedLetters.map({String($0) + " "}).joined()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

