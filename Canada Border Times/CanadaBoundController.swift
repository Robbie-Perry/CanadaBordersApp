//
//  CanadaBoundController.swift
//  Canada Border Times
//
//  Created by Robbie Perry on 2018-04-17.
//  Copyright © 2018 Robbie Perry. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CrossingTableViewCell: UITableViewCell {
    @IBOutlet weak var port: UILabel!
    @IBOutlet weak var crossing: UILabel!
    @IBOutlet weak var delay: UILabel!
}

class CanadaBoundController: UITableViewController {
    
    var crossings = [String]()
    var crossingList = [Crossing]()
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        Alamofire.request(url!).responseJSON { response in
            if let data = response.data {
                if let json = try? JSON(data: data) {
                    for crossing in json.arrayValue {
                        let port = crossing["port"].string
                        let cross = crossing["crossing"] == "N/A" ? nil : (crossing["crossing"]).string
                        let delay = crossing["travellersdelay"].string
                        
                        var newCrossing = "\(crossing["port"])"
                        newCrossing += "\t\t\t\t\(crossing["travellersdelay"])\n"
                        newCrossing += crossing["crossing"] == "N/A" ? "" : "(\(crossing["crossing"]))"
                        
                        self.crossingList.append(Crossing(port: port!, crossing: cross, delay: delay!))
                        
                        self.crossings.append(newCrossing)
                        let indexPath = IndexPath(row: 0, section: 0)
                        
                        self.tableView.insertRows(at: [indexPath], with: .automatic)
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crossings.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CrossingTableViewCell
        
        let crossing = self.crossingList[indexPath.row]
        cell.port?.text = crossing.port
        cell.crossing.text = crossing.crossing
        cell.delay?.text = crossing.delay
        
        if crossing.delay?.lowercased() == "no delay" {
            cell.backgroundColor = UIColor(red: 129/255.0, green: 199/255.0, blue: 132/255.0, alpha: 1)
        } else {
            print(crossing.delay!)
            let strArr = crossing.delay?.split(separator: " ")
            let intVal = Int(strArr![0].components(separatedBy: CharacterSet.decimalDigits.inverted)[0])!
            if intVal > 9 {
                cell.backgroundColor = UIColor(red: 229/255.0, green: 115/255.0, blue: 115/255.0, alpha: 1)
            } else {
                cell.backgroundColor = UIColor(red: 255/255.0, green: 241/255.0, blue: 118/255.0, alpha: 1)
            }
            
        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
