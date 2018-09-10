//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Admin on 07.09.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    //MARK:- var and outlet
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var buttonArray: [UIButton]!
  
    var emojyFlagsArray = ["🚀","🥑","✝️","🇮🇹","🦄", "🇨🇾", "🇮🇱", "🇨🇦", "🐖",  "🐕",  "🐇", "🦔"]
    var emojyDictionary = [Int: String]()
    
//    var emojyFlagsArray1 = ["🦄", "🥑", "🚁", "🦄", "🐝", "🦉", "🦉", "🐔", "🐔"]
//    var emojyFlagsArray2 = ["🥑", "🥑", "🍒", "🍒", "🍖", "🍖", "🥝", "🥝"]
//    var emojyFlagsArray3 = ["✝️", "✝️", "🕎", "🕎", "⚛️", "⚛️", "☯️", "👮🏼‍♂️"]
//    var emojyFlagsArray4 = ["🚀", "🚀", "🚁", "🚁", "⛵️", "⛵️", "⛴", "⛴"]
//    var emojyFlagsArray5 = ["🐖", "🐖", "🐕", "🐕", "🐇", "🐇", "🦔", "🦔"]
//
    var currentOpenCards = 0
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips =   \(flipCount)"
        }
    }
    let game = Concentration(numberOfPairsOfCards: 5) //in buttonArrays
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //   emojyFlagsArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: emojyFlagsArray) as! [String]
        
        for i in buttonArray{
            print(i.currentTitle)
        }
        
        for i in buttonArray{
        i.setTitle("", for: .normal)
        
        }
        createDictionary()
        
        
        
    }

    //MARK:- button action
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = buttonArray.index(of: sender) {
            print(cardNumber)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
        } else {
            print("error")
        }
        
    }
    
    func updateViewFromModel() {
        
        for i in buttonArray.indices {
            if game.cards[i].isFaceUp {
                buttonArray[i].setTitle(emoji(for: game.cards[i]), for: .normal)
                buttonArray[i].backgroundColor = .white
            } else {
                buttonArray[i].setTitle("", for: .normal)
                buttonArray[i].backgroundColor = game.cards[i].isMatched ? .clear : .orange
            }
        }
    }
    
    func createDictionary() {
         emojyFlagsArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: emojyFlagsArray) as! [String]
        for i in 0 ..< game.cards.count / 2 {
            emojyDictionary[i] = emojyFlagsArray[i]
       
            
        }
        print(emojyDictionary)
        print(emojyFlagsArray)
        
    }
    
    func emoji(for card: Card) -> String {
        return emojyDictionary[card.identifier] ?? "?"
    }
    
    @IBAction func allFaceUp(_ sender: UIButton) {
       game.showAll()
        updateViewFromModel()
    }
}

