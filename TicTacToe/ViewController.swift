//
//  ViewController.swift
//  TicTacToe
//
//  Created by Nikolas Burk on 30/06/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var board: Board!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    board = Board(fieldWidth: 100, fieldHeight: 100)
    view.addSubview(board)
    board.center = view.center

    board.callback = { (xPosition: Int, yPosition: Int) in
      print("fieldWasTappedAtPosition \(xPosition), \(yPosition) - callback")
    }
    board.delegate = self
  
  }
  
  
}

extension ViewController: BoardDelegate {
  
  func fieldWasTappedAtPosition(xPosition: Int, yPosition: Int) {
    print("fieldWasTappedAtPosition \(xPosition), \(yPosition) - delegate")
  }
  
}

