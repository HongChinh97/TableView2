//
//  ObjectsDataSource.swift
//  TableView2
//
//  Created by admin on 7/12/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class NumbersDataSource: NSObject, UITableViewDataSource {
    
    var numbers = Array(1...8)
    var masterTableView : MasterViewController!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(numbers[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            numbers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            masterTableView.hasNoData = numbers.count == 0
        }
        
        
    }


}
