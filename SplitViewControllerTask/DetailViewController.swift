//
//  DetailViewController.swift
//  SplitViewControllerTask
//
//  Created by Robert Berry on 1/20/18.
//  Copyright © 2018 Robert Berry. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // Outlets & Variables
    
    @IBOutlet weak var detailViewImage: UIImageView!
    
    var team: Team? {
        didSet {
            refreshUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshUI() {
        loadViewIfNeeded()
        detailViewImage.image = team?.logo 
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

// Updates detailViewController when a team is selected. 

extension DetailViewController: TeamSelectionDelegate {
    
    func teamSelected(_ newTeam: Team) {
        team = newTeam
    }
}
