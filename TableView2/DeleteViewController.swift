//
//  DeleteViewController.swift
//  TableView2
//
//  Created by admin on 7/16/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class DeleteViewController: UIViewController {
    @IBOutlet var secondView: UIView!
    
    @IBOutlet weak var footerView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameSwitch: UISwitch!
    let stringDataSource = StringDataSource()
    let numbersDataSource = NumbersDataSource()
    let numbersDetelegate = NumbersTableViewDelegate()
    var hasNoData : Bool = false {
        didSet {
            hasNoData ? (tableView.tableFooterView = secondView) : (tableView.tableFooterView = footerView)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameSwitch.isOn ? (hasNoData = numbersDataSource.numbers.count == 0) : ( hasNoData = stringDataSource.str.count == 0)

    override func viewDidLoad() {
        super.viewDidLoad()
//        numbersDataSource.masterTableView = self
//        stringDataSource.masterTableView = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
