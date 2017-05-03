//
//  SongPlayerViewController.swift
//  mental-health-app
//
//  Created by Marisa Wong on 5/2/17.
//  Copyright © 2017 Marisa Wong. All rights reserved.
//

import UIKit

class SongPlayerViewController: UIViewController {

    @IBOutlet weak var songTitle: UILabel!
    
    @IBOutlet weak var songImage: UIImageView!
    
    @IBAction func play(_ sender: Any) {
    }
    
    @IBOutlet weak var pause: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
