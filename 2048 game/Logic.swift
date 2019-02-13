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
    
    func insertValueInRandomOpenSpot(value: Int){ //false if the board is full
        
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
    
    //returns true if something moved
    func swipe(direction: String, updateBoard: Bool ) -> Bool{
        var newBoard =  board
        
        //combine right to left
        if(direction == "left"){
            for row in 0...3{
                newBoard[row] = combine(array: board[row])
            }
        }
        
        //combine left to right
        if(direction == "right"){
            for row in 0...3{
                
                var arrayToCombine = board[row]
                arrayToCombine.reverse()
                var combinedArray = combine(array: arrayToCombine)
                
                combinedArray.reverse()
                newBoard[row] = combinedArray
            }
        }
        
        //combine bottom to top
        if(direction == "up"){
            for col in 0...3{
                
                let arrayToCombine = [board[0][col],
                                      board[1][col],
                                      board[2][col],
                                      board[3][col]]
                
                var combinedArray = combine(array: arrayToCombine)
                
                for i in 0...3{
                    newBoard[i][col] = combinedArray[i]
                }
            }
        }
        
        //combine top to bottom
        if(direction == "down"){
            for col in 0...3{
                
                var arrayToCombine = [board[0][col],
                                      board[1][col],
                                      board[2][col],
                                      board[3][col]]
                
                arrayToCombine.reverse()
                
                var combinedArray = combine(array: arrayToCombine)
                combinedArray.reverse()
                
                for i in 0...3{
                    newBoard[i][col] = combinedArray[i]
                }
            }
        }
        
        var somethingMoved = false
        if(newBoard != board){
            somethingMoved = true
        }
        
        if(updateBoard){
            board = newBoard
            if(somethingMoved){
                insertValueInRandomOpenSpot(value: 2)
            }
        }
        return somethingMoved
    }
    
    func combine(array: [Int]) -> [Int] { // combines right into left
        var newArray = array
        var hasBeenCombined = [false, false, false, false]
        for i in 1...3 {
            
            if(newArray[i] != 0){
                var newSpot = i
                
                //this loop moves the number into the farthest open spot
                while newSpot > 0 {
                    if newArray[newSpot - 1] == 0 {
                        newSpot = newSpot - 1
                    }
                    else {
                        break
                    }
                }
                
                //if new spot is actually a new spot
                if(newSpot != i){
                    
                    //move number to it
                    newArray[newSpot] = newArray[i]
                    newArray[i] = 0
                }
                
                if(newSpot != 0) {
                    // this combines the number with the next if they are the same
                    // and if that number hasnt already been combined
                    if(newArray[newSpot] == newArray[newSpot - 1] &&
                        hasBeenCombined[newSpot - 1] == false){
                        
                        newArray[newSpot - 1] = newArray[newSpot] * 2
                        newArray[newSpot] = 0
                        hasBeenCombined[newSpot - 1] = true
                        
                    }
                }
            }
        }
        return newArray
    }
    
    //returns -1 if you lost, 0 if the game isnt over, 1 if you won
    func gameOverCheck() -> Int {
        for x in 0...3{
            for y in 0...3{
                //if the number 2048 is on the board, you win
                if board[x][y] == 2048 {
                    return 1
                }
            }
        }
        
        for x in 0...3{
            for y in 0...3{
                //if the number 0 is on the board, you continue playing
                if board[x][y] == 0 {
                    return 0
                }
            }
        }
        
        //if there isnt a 0 on the board, test every swipe direction.
        //if swipe returns true, something moved, so the game continues.
        if(swipe(direction: "left", updateBoard: false)) { return 0 }
        if(swipe(direction: "right", updateBoard: false)) { return 0 }
        if(swipe(direction: "up", updateBoard: false)) { return 0 }
        if(swipe(direction: "down", updateBoard: false)) { return 0 }
        
        //if nothing moves after every test swipe, you lose.
        return -1
    }
    
    struct xyPoint{
        let x: Int
        let y: Int
    }
}
