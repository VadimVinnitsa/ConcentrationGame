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
    @IBOutlet weak var flipCountLabel: UILabel! {
        didSet {
            let atr : [NSAttributedStringKey: Any] = [
                .strokeWidth : 5.0,
                .strokeColor : UIColor.orange
            ]
            let atrStr = NSAttributedString(string: "Flips =   0", attributes: atr)
            flipCountLabel.attributedText = atrStr
        }
    }
    
    @IBOutlet var buttonArray: [UIButton]!
    
    private var emojyFlagsArray = ["🚀","🥑","✝️","🇮🇹","🦄", "🇨🇾", "🇮🇱", "🇨🇦", "🐖",  "🐕",  "🐇", "🦔"]
    private  var emojyDictionary = [Int: String]()
    
    //    var emojyFlagsArray1 = ["🦄", "🥑", "🚁", "🦄", "🐝", "🦉", "🦉", "🐔", "🐔"]
    //    var emojyFlagsArray2 = ["🥑", "🥑", "🍒", "🍒", "🍖", "🍖", "🥝", "🥝"]
    //    var emojyFlagsArray3 = ["✝️", "✝️", "🕎", "🕎", "⚛️", "⚛️", "☯️", "👮🏼‍♂️"]
    //    var emojyFlagsArray4 = ["🚀", "🚀", "🚁", "🚁", "⛵️", "⛵️", "⛴", "⛴"]
    //    var emojyFlagsArray5 = ["🐖", "🐖", "🐕", "🐕", "🐇", "🐇", "🦔", "🦔"]
    
    var currentOpenCards = 0
    private(set)  var flipCount = 0 {
        didSet {
            let atr : [NSAttributedStringKey: Any] = [
                .strokeWidth : 5.0,
                .strokeColor : UIColor.orange
            ]
            let atrStr = NSAttributedString(string: "Flips =   \(flipCount)", attributes: atr)
            flipCountLabel.attributedText = atrStr
        }
    }
    
    private lazy var game = Concentration(numberOfPairsOfCards: buttonArray.count / 2) //in buttonArrays
    
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
    
    private  func emoji(for card: Card) -> String {
        return emojyDictionary[card.identifier] ?? "?"
    }
    
    @IBAction func allFaceUp(_ sender: UIButton) {
        game.showAll()
        updateViewFromModel()
    }
}

