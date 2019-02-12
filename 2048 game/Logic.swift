//
//  Logic.swift
//  2048 game
//
//  Created by user913781 on 2/8/19.
//  Copyright © 2019 Ryan Mirch. All rights reserved.
//

import Foundation

class Logic {
    
    var board:[[Int]] = Array(repeating: Array(repeating: 0, count: 4), count: 4)
    
    func initialize(){
        board = Array(repeating: Array(repeating: 0, count: 4), count: 4)
        insertValueInRandomOpenSpot(value: 2)
        insertValueInRandomOpenSpot(value: 2)
    }
    
    func getBoard() -> [[Int]]{
        return board
    }
    
    func insertValueInRandomOpenSpot(value: Int) -> Bool{ //false if the board is full
        if boardFull(){
            return false
        }
        
        var availablePoints: [xyPoint] =  []
        
        for x in 0...3{
            for y in 0...3{
                if board[x][y] == 0 {
                    let newPoint = xyPoint(x: x, y: y)
                    availablePoints.append(newPoint)
                }
            }
        }
        
        let randomPoint = availablePoints.randomElement()
        let randomX = randomPoint?.x
        let randomY = randomPoint?.y
        
        board[randomX!][randomY!] = value
        return true
        
    }
    
    func boardFull() -> Bool {
        for x in 0...3{
            for y in 0...3{
                if board[x][y] == 0 {
                    return false
                }
            }
        }
        return true
    }
    
    struct xyPoint{
        let x: Int
        let y: Int
    }
}
