//
//  Field.swift
//  TicTacToe
//
//  Created by Nikolas Burk on 30/06/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class Field: UIView {

  let xPosition: Int
  let yPosition: Int
  
  init(frame: CGRect, xPosition: Int, yPosition: Int) {
    self.xPosition = xPosition
    self.yPosition = yPosition
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
