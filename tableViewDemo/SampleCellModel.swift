//
//  cellModel.swift
//  tableViewDemo
//
//  Created by RajaSoftwareLabs on 01/10/15.
//  Copyright © 2015 jatin. All rights reserved.
//

import Foundation
import UIKit

public class SampleCellModel {
  var name: String!
  var address: String!
  var isInvited: Bool!
  var profilePic: UIImage!

  init(name: String, address: String, isInvited: Bool, profilePic: UIImage!) {
    self.name = name
    self.address = address
    self.isInvited = isInvited
    self.profilePic = profilePic ?? nil
  }

  func switchTapped(sender: UISwitch) {

  }
}