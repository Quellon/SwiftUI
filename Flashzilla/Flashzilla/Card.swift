//
//  Card.swift
//  Flashzilla
//
//  Created by Quellon Naicker on 1/22/25.
//

import Foundation

struct Card: Codable{
    var prompt: String
    var answer: String
    
    static let example = Card(prompt: "who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
