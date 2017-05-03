//
//  happyView.swift
//  mental-health-app
//
//  Created by Aspen Hsu on 5/2/17.
//  Copyright © 2017 Marisa Wong. All rights reserved.
//

import Foundation
import UIKit

class happyView: UIViewController{
    @IBAction func goToYoutube(_ sender: Any) {
        let url1 = URL(string: "https://www.youtube.com/watch?v=q8gPRE60Xcc")!
        UIApplication.shared.open(url1, options: [:], completionHandler: nil)
        
        
    }
    
    


}

