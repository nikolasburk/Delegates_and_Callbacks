//
//  Board.swift
//  TicTacToe
//
//  Created by Nikolas Burk on 30/06/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

protocol BoardDelegate: class {
  func fieldWasTappedAtPosition(xPosition: Int, yPosition: Int)
}

class Board: UIView {

  weak var delegate: BoardDelegate?
  var callback: ((Int, Int) -> ())?
  
  init(fieldWidth: CGFloat, fieldHeight: CGFloat) {
    
    let boardFrame = CGRectMake(0, 0, 3*fieldWidth, 3*fieldHeight)
    super.init(frame: boardFrame)
    
    for i in 0..<9 {
      let xPosition = i % 3
      let x = CGFloat(xPosition) * fieldWidth
      let yPosition = i / 3
      let y = CGFloat(yPosition) * fieldHeight
      let currentFieldFrame = CGRectMake(x, y, fieldWidth, fieldHeight)
      let field = Field(frame: currentFieldFrame, xPosition: xPosition, yPosition: yPosition)
      field.layer.borderWidth = 1.0
      print("add view at position: \(xPosition), \(yPosition)")
      
      let tap = UITapGestureRecognizer(target: self, action: #selector(Board.handleTap(_:)))
      field.addGestureRecognizer(tap)
      
      self.addSubview(field)
    }
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func handleTap(tap: UITapGestureRecognizer) {
    
    let tappedField = tap.view as! Field
    print("handle tap at position: (\(tappedField.xPosition), \(tappedField.yPosition))")
    
    callback?(tappedField.xPosition, tappedField.yPosition)
    delegate?.fieldWasTappedAtPosition(tappedField.xPosition, yPosition: tappedField.yPosition)
    
  }
  
}
