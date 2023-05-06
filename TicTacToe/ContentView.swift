//
//  ContentView.swift
//  TicTacToe
//
//  Created by MacBook Pro on 06/05/23.
//

import SwiftUI

struct ContentView: View {
    // to make the columns
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    @State private var moves: [Move?] = Array(repeating: nil, count: 9)
    @State private var isGameboardDisabled = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: columns, spacing: 5) {
                    // loop to make 9 circles
                    ForEach(0..<9) {i in
                        ZStack {
                            Circle()
                                .foregroundColor(.black)
                                .opacity(0.5)
                                .frame(width: geometry.size.width/3-15, height: geometry.size.height/3-110)
                            
                            // image inside cirlce
                            Image(systemName: moves[i]?.indicator ?? "")
                                .resizable()
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(.yellow)
                        }
                        .onTapGesture {
                            if isSquareOccupied(in: moves, forIndex: i ) { return }
                            moves[i] = Move(player: .human, boardIndex: i)
                            isGameboardDisabled = true
                            
                            // check for win condition or draw
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                let computerPosition = determineComputerMovePosition(in: moves)
                                moves[computerPosition] = Move(player: .computer, boardIndex: computerPosition)
                                isGameboardDisabled = false

                            }
                            
                        }
                    }
                }
                Spacer()
            }
            .disabled(isGameboardDisabled)
            .padding()
        }
    }
    // checker if circle is filled or not
    func isSquareOccupied(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: {$0?.boardIndex == index})
    }
    
    // make bot play / bot's turn
    func determineComputerMovePosition(in moves: [Move?]) -> Int {
        var movePosition = Int.random(in: 0..<9)
        
        while isSquareOccupied(in: moves, forIndex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        
        return movePosition
    }
    
    // win or draw condition
    func checkWinCondition
}

enum Player {
    case human, computer
}

// create move object
struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
