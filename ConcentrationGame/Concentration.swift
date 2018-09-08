//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by Admin on 08.09.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        cards[index].isFaceUp = !cards[index].isFaceUp
        print("card - \(index)  isFaceUp - \(cards[index].isFaceUp)")
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1 ... numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
            
            
        }
    
    }
    
}
