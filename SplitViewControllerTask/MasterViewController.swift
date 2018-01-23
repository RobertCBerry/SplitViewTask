//
//  MasterViewController.swift
//  SplitViewControllerTask
//
//  Created by Robert Berry on 1/20/18.
//  Copyright © 2018 Robert Berry. All rights reserved.
//

import UIKit

protocol TeamSelectionDelegate: class {
    func teamSelected(_ newTeam: Team)
}

class MasterViewController: UITableViewController {
    
    // Constants & Variables
    
    let teams = [
        Team(teamName: "Arizona Cardinals", teamLogo: "Arizona"),
        Team(teamName: "Atlanta Falcons", teamLogo: "Atlanta"),
        Team(teamName: "Baltimore Ravens", teamLogo: "Baltimore"),
        Team(teamName: "Buffalo Bills", teamLogo: "Buffalo"),
        Team(teamName: "Carolina Panthers", teamLogo: "Carolina"),
        Team(teamName: "Chicago Bears", teamLogo: "Chicago"),
        Team(teamName: "Cincinnati Bengals", teamLogo: "Cincinnati"),
        Team(teamName: "Cleveland Browns", teamLogo: "Cleveland"),
        Team(teamName: "Dallas Cowboys", teamLogo: "Dallas"),
        Team(teamName: "Denver Broncos", teamLogo: "Denver"),
        Team(teamName: "Detroit Lions", teamLogo: "Detroit"),
        Team(teamName: "Green Bay Packers", teamLogo: "Green Bay"),
        Team(teamName: "Houston Texans", teamLogo: "Houston"),
        Team(teamName: "Indianapolis Colts", teamLogo: "Indianapolis"),
        Team(teamName: "Jacksonville Jaguars", teamLogo: "Jacksonville"), 
        Team(teamName: "Kansas City Chiefs", teamLogo: "Kansas City"),
        Team(teamName: "Los Angeles Chargers", teamLogo: "Los Angeles Chargers"),
        Team(teamName: "Los Angeles Rams", teamLogo: "Los Angeles Rams"),
        Team(teamName: "Miami Dolphins", teamLogo: "Miami"),
        Team(teamName: "Minnesota Vikings", teamLogo: "Minnesota"),
        Team(teamName: "New England Patriots", teamLogo: "New England"),
        Team(teamName: "New Orleans Saints", teamLogo: "New Orleans"),
        Team(teamName: "New York Giants", teamLogo: "New York Giants"),
        Team(teamName: "New York Jets", teamLogo: "New York Jets"),
        Team(teamName: "Oakland Raiders", teamLogo: "Oakland"),
        Team(teamName: "Philadelphia Eagles", teamLogo: "Philadelphia"),
        Team(teamName: "Pittsburgh Steelers", teamLogo: "Pittsburgh"),
        Team(teamName: "San Francisco 49ers", teamLogo: "San Francisco"),
        Team(teamName: "Seattle Seahawks", teamLogo: "Seattle"),
        Team(teamName: "Tampa Bay Buccaneers", teamLogo: "Tampa Bay"),
        Team(teamName: "Tennessee Titans", teamLogo: "Tennessee"),
        Team(teamName: "Washington Redskins", teamLogo: "Washington")
    ]
    
    // Adds property for object conforming to the delegate protocol. 
    
    weak var delegate: TeamSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        
        let team = teams[indexPath.row]
        cell.textLabel?.text = team.teamName

        return cell
    }
    
    // Method notifies us whenever a user selects a row in the table. 
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedTeam = teams[indexPath.row]
        delegate?.teamSelected(selectedTeam)
        
        // Displays the detailViewController as a detailViewNavigationController. 
        
        if let detailViewController = delegate as? DetailViewController,
            let detailNavigationController = detailViewController.navigationController {
            splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
        }
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    // Method allows detail view controller to reflect proper row in master view controller.
   
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let team = teams[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.team = team
            }
        }
    }
}

// Possible method for displaying images. 

// https://stackoverflow.com/questions/31626088/swift-displaying-different-images-when-cell-is-tapped
