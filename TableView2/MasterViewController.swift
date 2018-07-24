//
//  ViewController.swift
//  TableView2
//
//  Created by admin on 6/28/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
//tach Delegeta va dataSource thanh cac class rieng biet
class MasterViewController: UIViewController {
    
    @IBOutlet var secondView: UIView!
    
    @IBOutlet weak var footerView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameSwitch: UISwitch!
    let stringDataSource = StringDataSource()
    let numbersDataSource = NumbersDataSource()
    let numbersDetelegate = NumbersTableViewDelegate()
    // xuat hien noData
    var hasNoData : Bool = false {
        didSet {
            hasNoData ? (tableView.tableFooterView = secondView) : (tableView.tableFooterView = footerView)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameSwitch.isOn ? (hasNoData = numbersDataSource.numbers.count == 0) : ( hasNoData = stringDataSource.str.count == 0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = stringDataSource
        numbersDataSource.masterTableView = self
        stringDataSource.masterTableView = self
    }
    @IBAction func changeStaget(mySwitch: UISwitch) {
        if mySwitch.isOn {
            hasNoData = stringDataSource.str.count == 0
        } else {
            hasNoData = numbersDataSource.numbers.count == 0
        }
        tableView.reloadData()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewcontroller = segue.destination as? DetailViewController {
            if let index = tableView.indexPathForSelectedRow {
                if nameSwitch.isOn {
                    viewcontroller.name = stringDataSource.str[index.row]
                }
                else {
                    viewcontroller.name = String(numbersDataSource.numbers[index.row])
                }
            }
            
        }
        
    }
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if let detailViewController = unwindSegue.source as? DetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                if nameSwitch.isOn {
                    stringDataSource.str[indexPath.row] = detailViewController.name ?? ""
                } else {
                    numbersDataSource.numbers[indexPath.row] = Int(detailViewController.name ?? "") ?? 0
                }
            }
            else {
                if nameSwitch.isOn {
                    stringDataSource.str.append(detailViewController.name ?? "")
                }
                else {
                    numbersDataSource.numbers.append(Int(detailViewController.name ?? "") ?? 0)
                }
            }
        }
        tableView.reloadData()
    }
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//        }
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//                if editingStyle == .delete {
//                    // Delete the row from the data source
//                    if nameSwitch.isOn {
//                        stringDataSource.str.remove(at: indexPath.row)
//                        tableView.deleteRows(at: [indexPath], with: .fade)
//                }
//                    else {
//
//                        numbersDataSource.numbers.remove(at: indexPath.row)
//                        tableView.deleteRows(at: [indexPath], with: .fade)
//                    }
//
//        }
//    }
}

