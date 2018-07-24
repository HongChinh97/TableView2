//
//  StringDataSource.swift
//  TableView2
//
//  Created by admin on 7/12/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class StringDataSource: NSObject, UITableViewDataSource {
    var str = ["Hoa Hong", "Hoa Mai", "Hoa Dao", "Hoa Sen"]
    var masterTableView : MasterViewController!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return str.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = str[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        str.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        masterTableView.hasNoData = str.count == 0
    }
    

}
