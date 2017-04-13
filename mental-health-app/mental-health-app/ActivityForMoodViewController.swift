//
//  ActivityForMoodViewController.swift
//  mental-health-app
//
//  Created by Marisa Wong on 4/12/17.
//  Copyright © 2017 Marisa Wong. All rights reserved.
//

import UIKit

class ActivityForMoodViewController: UIViewController {

    @IBOutlet weak var currentMood: UILabel!
    
    @IBOutlet weak var activitiesTable: UITableView!
    
    var selectedMood : String?
    
    var activityOptions : [Int: String] = [
        0 : "music",
        1 : "eat",
        2 : "diy"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //activitiesTable.delegate = self
        //activitiesTable.dataSource = self
        
        currentMood.text = selectedMood
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityOptions.count
    }

//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
    
    
    // send user to the activity optionthey selected 
    // or should we have button that users can explicitly click
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
