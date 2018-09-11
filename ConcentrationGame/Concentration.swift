//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by Admin on 08.09.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import GameplayKit

class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyOneFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp{
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
                
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    

    
    func chooseCard(at index: Int) {
                if !cards[index].isMatched {
                    if let matchIndex = indexOfOneAndOnlyOneFaceUpCard, matchIndex != index {
                        if cards[matchIndex].identifier == cards[index].identifier {
                            cards[matchIndex].isMatched = true
                            cards[index].isMatched = true
                        }
                        cards[index].isFaceUp = true
                    } else {
                        indexOfOneAndOnlyOneFaceUpCard = index
                    }
                }
        
    }
    
    //    var number = 0
    //    var array = [Int]()
    
//    func chooseCard () {
//    if cards[index].isMatched || cards[index].isFaceUp { return }
//    if number == 0 || number == 1 {  // 0 or 1
//    cards[index].isFaceUp = true
//    number += 1
//    } else { // 2 card
//    for i in cards {
//    if i.isFaceUp {
//    array.append(i.identifier)
//    }
//    }
//    if array[0] == array[1] {
//    for i in cards.indices {
//    if cards[i].isFaceUp {
//    cards[i].isMatched = true
//    }
//    }
//    }
//    for i in cards.indices {
//    cards[i].isFaceUp = false
//    }
//
//    array.removeAll()
//    number = 1
//    cards[index].isFaceUp = true
//
//    } // end else
//
//    print("card - \(index)  isFaceUp - \(cards[index].isFaceUp)  match \(cards[index].isMatched)")
//    }
//
    
    func showAll() {
        for i in cards.indices {
            cards[i].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1 ... numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: cards) as! [Card]
        
    }
    
}
