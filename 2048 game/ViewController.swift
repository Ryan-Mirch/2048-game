//
//  ViewController.swift
//  2048 game
//
//  Created by user913781 on 2/1/19.
//  Copyright © 2019 Ryan Mirch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let logic: Logic = Logic()

    @IBOutlet weak var GameOverLabel: UILabel!
    
    @IBOutlet weak var spot1: UILabel!
    @IBOutlet weak var spot2: UILabel!
    @IBOutlet weak var spot3: UILabel!
    @IBOutlet weak var spot4: UILabel!
    @IBOutlet weak var spot5: UILabel!
    @IBOutlet weak var spot6: UILabel!
    @IBOutlet weak var spot7: UILabel!
    @IBOutlet weak var spot8: UILabel!
    @IBOutlet weak var spot9: UILabel!
    @IBOutlet weak var spot10: UILabel!
    @IBOutlet weak var spot11: UILabel!
    @IBOutlet weak var spot12: UILabel!
    @IBOutlet weak var spot13: UILabel!
    @IBOutlet weak var spot14: UILabel!
    @IBOutlet weak var spot15: UILabel!
    @IBOutlet weak var spot16: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        // Do any additional setup after loading the view, typically from a nib.
        logic.initialize()
        drawBoard()
        
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        
        var somethingMoved = false
        if gesture.direction == UISwipeGestureRecognizer.Direction.left {
            print("Swipe Left")
            somethingMoved = logic.swipe(direction: "left", updateBoard: true)
        }
        
        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
            print("Swipe Right")
            logic.swipe(direction: "right", updateBoard: true)
        }
        
        if gesture.direction == UISwipeGestureRecognizer.Direction.up {
            print("Swipe Up")
            logic.swipe(direction: "up", updateBoard: true)
        }
        
        if gesture.direction == UISwipeGestureRecognizer.Direction.down {
            print("Swipe Down")
            logic.swipe(direction: "down", updateBoard: true)
        }
        
        drawBoard()
        let gameStatus = logic.gameOverCheck()
        
        if(gameStatus == -1){
            GameOverLabel.text = "Game Over"
        }
        
        if(gameStatus == 1){
            GameOverLabel.text = "You Win!"
        }
        
    }
    func drawBoard(){
        let board = logic.getBoard()
        
        spot1.text = String(board[0][0])
        spot2.text = String(board[0][1])
        spot3.text = String(board[0][2])
        spot4.text = String(board[0][3])
        spot5.text = String(board[1][0])
        spot6.text = String(board[1][1])
        spot7.text = String(board[1][2])
        spot8.text = String(board[1][3])
        spot9.text = String(board[2][0])
        spot10.text = String(board[2][1])
        spot11.text = String(board[2][2])
        spot12.text = String(board[2][3])
        spot13.text = String(board[3][0])
        spot14.text = String(board[3][1])
        spot15.text = String(board[3][2])
        spot16.text = String(board[3][3])
    }


}

