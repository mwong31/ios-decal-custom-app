//
//  BadGradeViewController.swift
//  mental-health-app
//
//  Created by Marisa Wong on 4/28/17.
//  Copyright © 2017 Marisa Wong. All rights reserved.
//

import UIKit

class BadGradeViewController: UIViewController {
    @IBOutlet weak var label_bad: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        label_bad.text = "Okay, don't panic! Everyone gets a bad grade at some point in their lives, the important thing is to remember that this one test grade doesn't define you"
        label_bad.textAlignment = .center
        label_bad.font = UIFont(name: "Noteworthy-Bold", size: 25)
        label_bad.numberOfLines = 0
        label_bad.textColor = .white
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
