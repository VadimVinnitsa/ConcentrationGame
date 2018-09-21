//
//  Card.swift
//  ConcentrationGame
//
//  Created by Admin on 08.09.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
   
    
 private static var identifierFactory = -1
    
   private static func getUniqueIdentifier() -> Int {
          identifierFactory += 1
        return identifierFactory
      
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
        
    }
 
    
    
}
