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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        logic.initialize()
        drawBoard()
    }
    
    func drawBoard(){
        let board = logic.getBoard()
    }


}

