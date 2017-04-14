//
//  MoodViewController.swift
//  mental-health-app
//
//  Created by Marisa Wong on 4/12/17.
//  Copyright © 2017 Marisa Wong. All rights reserved.
//

import UIKit

class MoodViewController: UIViewController{

//UICollectionViewDelegate, //UICollectionViewDataSource {

    
    @IBOutlet weak var moodCollection: UICollectionView!
    
    var dumb: Bool?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // moodCollection.delegate = self
        //moodCollection.dataSource = self

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
