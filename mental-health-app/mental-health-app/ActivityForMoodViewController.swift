//
//  ActivityForMoodViewController.swift
//  mental-health-app
//
//  Created by Marisa Wong on 4/12/17.
//  Copyright © 2017 Marisa Wong. All rights reserved.
//

import UIKit

class ActivityForMoodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var currentMood: UILabel!
    
    @IBOutlet weak var activitiesTable: UITableView!
    
    var selectedMood : String?
    
    var selectedActivity : String?
    
    var activitiy : [String : UIImage] = [
        "listen" : #imageLiteral(resourceName: "music"),
        "explore" : #imageLiteral(resourceName: "foodFood"),
        "read" : #imageLiteral(resourceName: "artHands")]
    
    var activityOptions : [Int: String] = [
        0 : "listen",
        1 : "explore",
        2 : "read"
    ]
    
    override func viewDidLoad() {
        activitiesTable.tableFooterView = UIView()
        super.viewDidLoad()
        activitiesTable.delegate = self
        activitiesTable.dataSource = self
        
        currentMood.text = selectedMood
        currentMood.textAlignment = .center
        currentMood.font = UIFont(name: "Noteworthy-Bold", size:20)
        // Do any additional setup after loading the view.
    }

    
    let MinHeight: CGFloat = 100.0
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tHeight = tableView.bounds.height
        
        let temp = tHeight/CGFloat(activityOptions.count)
        
        return temp > MinHeight ? temp : MinHeight
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityOptions.count
    }
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell") as! TableViewCell
        cell.activityName.text = activityOptions[indexPath.row]
        let currAct : String = activityOptions[indexPath.row]!
        let currImage : UIImage = activitiy[currAct]!
        cell.actImage.image = currImage
        cell.activityName.font = UIFont(name: "Noteworthy-Bold", size: 25)
        cell.activityName.textColor = .white
        return cell
    }
    
    
    
   //  send user to the activity optionthey selected
   //  or should we have button that users can explicitly click
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //selectedActivity = activityOptions[indexPath.row]!
        if (indexPath.row == 1) {
            performSegue(withIdentifier: "toMusic", sender: self)
        } else if (indexPath.row == 0) {
            performSegue(withIdentifier: "toMap", sender: self)
        } else {
            print ("hello")
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
        
            if let dest = segue.destination as? PlacesActivityViewController {
                dest.currMood = selectedMood
            }
            
            if let dest = segue.destination as? MusicViewController {
                print("i am going to music!")
            }
            
        }
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
