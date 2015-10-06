//
//  SampleTableViewCell.swift
//  tableViewDemo
//
//  Created by RajaSoftwareLabs on 01/10/15.
//  Copyright © 2015 jatin. All rights reserved.
//

import UIKit

class SampleTableViewCell: UITableViewCell {

  @IBOutlet weak var invitedSwitch: UISwitch!

  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var profileImageView: UIImageView!

  @IBOutlet weak var nameLabel: UILabel!
  var delegate: cellModelChanged!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  override func prepareForReuse() {
    invitedSwitch.setOn(false, animated: false)
    addressLabel.text = ""
    profileImageView.image = nil
    nameLabel.text = ""
  }

  @IBAction func switchValueChangel(sender: AnyObject) {
    let invSwitch = sender as! UISwitch
    delegate.cellModelSwitchTapped(self, isSwitchOn: invSwitch.on)
  }
}
