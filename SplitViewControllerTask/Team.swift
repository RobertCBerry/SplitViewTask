//
//  Team.swift
//  SplitViewControllerTask
//
//  Created by Robert Berry on 1/20/18.
//  Copyright © 2018 Robert Berry. All rights reserved.
//

import Foundation
import UIKit

class Team {
    
    let teamName: String
    let teamLogo: String
    
    init(teamName: String, teamLogo: String) {
        self.teamName = teamName
        self.teamLogo = teamLogo 
    }
    
    var logo: UIImage? {
        return UIImage(named: teamLogo)
    }
}
