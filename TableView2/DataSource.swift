//
//  DataSource.swift
//  TableView2
//
//  Created by admin on 7/12/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class DataSource: NSObject {
    var movies: [Int] = []
    
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            //cach 3
            //        if number.count == 0 {
            //            tableView.tableFooterView = noDataView
            //        } else {
            //            tableView.tableFooterView = footerView
            //        }
            //cach 1
            //        if number.count == 0 {
            //            hasNoData = true
            //        } else {
            //            hasNoData = false
            //        }
            //cach 2
            print(number.count == 0)
            hasNoData = (number.count == 0)
        }
        
        // MARK: - Table view data source
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        }
        // #warning Incomplete implementation, return the number of rows
        return number.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = String(number[indexPath.row])
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index  = tableView.indexPathForSelectedRow {
            if let viewTableController = segue.destination as? ViewController {
                viewTableController.name = String(number[index.row])
            }
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if let index1 = tableView.indexPathForSelectedRow {
            if let viewTable = unwindSegue.source as? ViewController {
                if viewTable.name != nil && Int(viewTable.name!) != nil {
                    number[index1.row] = Int(viewTable.name!)!
                }
            }
            
            //        } else {
            //            if let viewTable2 = unwindSegue.source as? ViewController {
            //                if let name = viewTable2.name {
            //                    number.append(Int(name)!)
            //                }
            //            }
        }
        tableView.reloadData()
    }
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            number.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        //cach 1
        //        if number.count == 0 {
        //            hasNoData = true
        //        } else {
        //            hasNoData = false
        //        }
        //cach 2
        print(number.count == 0)
        hasNoData = (number.count == 0)
        
        //cach 3
        //        if number.count == 0 {
        //            tableView.tableFooterView = noDataView
        //        } else {
        //            tableView.tableFooterView = footerView
        //        }
    }
}




    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

}
