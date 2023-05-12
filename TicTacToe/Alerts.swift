//
//  Alerts.swift
//  TicTacToe
//
//  Created by MacBook Pro on 07/05/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    static let humanWin    = AlertItem(title: Text("You Win!"),
                                       message: Text("You just beated the AI"),
                                       buttonTitle: Text("Heck Yeah"))
    
    static let computerWin    = AlertItem(title: Text("You Lost!"),
                                          message: Text("The AI you created just beated you"),
                                          buttonTitle: Text("Nice Try"))
    
    static let draw    = AlertItem(title: Text("It's a draw!"),
                                   message: Text("What a battle, seems like you both have the same IQ"),
                                   buttonTitle: Text("Rematch"))
    
}
