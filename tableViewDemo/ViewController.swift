//
//  ViewController.swift
//  tableViewDemo
//
//  Created by RajaSoftwareLabs on 01/10/15.
//  Copyright © 2015 jatin. All rights reserved.
//

import UIKit

protocol cellModelChanged {
  func cellModelSwitchTapped(model: SampleTableViewCell, isSwitchOn: Bool)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, cellModelChanged {

  @IBOutlet weak var tableView: UITableView!
  var feedModel: [SampleCellModel] = []


  func setData() {
    for(var i=0; i<20; i++) {
      let cellModel: SampleCellModel = SampleCellModel(name: "Jatin-\(i)", address: "pune-\(i)", isInvited: false, profilePic: UIImage(named: "profile"))
      feedModel.append(cellModel)
    }
    tableView.delegate = self
    tableView.dataSource  = self
  }

  override func viewDidLoad() {
    super.viewDidLoad()
      setData()
    tableView.registerNib(UINib(nibName: "SampleTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "cell")
  }

}

// MARK: Table View Delegate
extension ViewController {

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return feedModel.count
  }

  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 102
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! SampleTableViewCell
    let model = feedModel[indexPath.row]
    cell.nameLabel.text = model.name
    cell.addressLabel.text = model.address
    cell.invitedSwitch.setOn(model.isInvited, animated: true)
    cell.profileImageView?.image = model.profilePic
    cell.delegate = self
    return cell
  }

  func cellModelSwitchTapped(model: SampleTableViewCell, isSwitchOn: Bool) {
    let model = feedModel[(tableView.indexPathForCell(model)?.row)!]
    model.isInvited = isSwitchOn
  }
  
}

