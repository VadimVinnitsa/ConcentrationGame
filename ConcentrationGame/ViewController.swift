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
  
    var emojyFlagsArray = ["🇮🇹", "🇮🇹", "🇨🇾", "🇨🇾", "🇮🇱", "🇮🇱", "🇨🇦", "🇨🇦"]
    var emojyFlagsArray1 = ["🦄", "🦄", "🐝", "🐝", "🦉", "🦉", "🐔", "🐔"]
    var emojyFlagsArray2 = ["🥑", "🥑", "🍒", "🍒", "🍖", "🍖", "🥝", "🥝"]
    var emojyFlagsArray3 = ["✝️", "✝️", "🕎", "🕎", "⚛️", "⚛️", "☯️", "👮🏼‍♂️"]
    var emojyFlagsArray4 = ["🚀", "🚀", "🚁", "🚁", "⛵️", "⛵️", "⛴", "⛴"]
    var emojyFlagsArray5 = ["🐖", "🐖", "🐕", "🐕", "🐇", "🐇", "🦔", "🦔"]
    
    var currentOpenCards = 0
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips =   \(flipCount)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emojyFlagsArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: emojyFlagsArray) as! [String]
        
        for i in buttonArray{
            print(i.currentTitle)
        }
        
    }
    

    //MARK:- func
    func reversCard(emojy: String, sender: UIButton){
        flipCount += 1
        sender.isEnabled = false
        
        if sender.currentTitle == emojy {
            sender.setTitle("", for: .normal)
            sender.backgroundColor = .orange
        }else {
            sender.setTitle(emojy, for: .normal)
            sender.backgroundColor = .white
        }
        print(sender.currentTitle)
        
        currentOpenCards += 1
        if currentOpenCards == 2 {
            if isEqualTwoCard(){
                currentOpenCards = 0
                print("2 card to garbage")
                twoCardToCarbage()
            } else {
                currentOpenCards = 0
                print("close 2 card")
                closeOpenVisibleCard()
            }
        }
        
    }
    
    func twoCardToCarbage(){
        for i in buttonArray{
            if i.currentTitle != ""{
                i.isHidden = true
            }
        }
    }
    
    func isEqualTwoCard() -> Bool {
        var count = 0
        var emojy1 = ""
        var emojy2 = ""
        
        for i in buttonArray{
            if i.currentTitle != "" && count == 0 {
                count = 1
                emojy1 = i.currentTitle!
                
            } else {
                if i.currentTitle != "" && count == 1 {
                    emojy2 = i.currentTitle!
                }
            }
            
        }
        return emojy1 == emojy2 ? true : false
        
    }
    
    func closeOpenVisibleCard(){
        for i in buttonArray{
            i.isEnabled = false
        }
        
        print("begin animation")
        UIView.animate(withDuration: 3, delay: 0, options: [], animations: {
            for i in self.buttonArray{
                i.setTitle("", for: .normal)
                i.backgroundColor = .orange
            }
        }) { (finished ) in
            
            print("all buttton Enable")
            for i in self.buttonArray{
                i.isEnabled = true
            }
        }
        
        
    }
    //MARK:- button action
    @IBAction func buttonPressed(_ sender: UIButton) {
        let cardNumber = buttonArray.index(of: sender)
        print(cardNumber)
        
        
        reversCard(emojy: emojyFlagsArray[cardNumber!], sender: sender)
        
    }
}

