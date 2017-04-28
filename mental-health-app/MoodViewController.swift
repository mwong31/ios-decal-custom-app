//
//  MoodViewController.swift
//  mental-health-app
//
//  Created by Marisa Wong on 4/12/17.
//  Copyright © 2017 Marisa Wong. All rights reserved.
//

import UIKit

class MoodViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var moodCollection: UICollectionView!
    
    var selectedMood : String = ""
    
    var moodsArray : [Int: String] =
        [
            0 : "I'm feeling tired",
            1 : "I'm feeling adventurous",
            2 : "I just got a bad grade back",
            3 : "I'm hungry",
            4 : "I want to relax"
    ]
    
    
    var moodsDict: [String : UIImage] = [
        "I'm feeling tired" : #imageLiteral(resourceName: "snowflake"),
        "I'm feeling adventurous" : #imageLiteral(resourceName: "adventurous"),
        "I just got a bad grade back" : #imageLiteral(resourceName: "flower bunch yellow"),
        "I'm hungry" : #imageLiteral(resourceName: "snowflake"),
        "I want to relax" : #imageLiteral(resourceName: "snowflake")]
    
    
    var moodsResult : [String : String] = [
        "I'm feeling tired" : "If you're feeling tired...",
        "I'm feeling adventurous" : "If you're feeling adventurous...",
        "I just got a bad grade back" : "If you're down about a bad grade...",
        "I'm hungry" : "If you're hungry",
        "I want to relax" : "If you want to relax..."
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moodCollection.delegate = self
        moodCollection.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moodsDict.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currMood : String = moodsArray[indexPath.row]!
        let currImage : UIImage = moodsDict[currMood]!
        let currCell = moodCollection.dequeueReusableCell(withReuseIdentifier: "mood", for: indexPath) as! MoodCollectionViewCell
        currCell.moodImage.image = currImage
        currCell.moodLabel.text = currMood
        currCell.moodLabel.textColor = .white
        return currCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        selectedMood = moodsArray[indexPath.row]!
        if (indexPath.row != 2){
            performSegue(withIdentifier: "activitiesForMood", sender: self)
        }else { performSegue(withIdentifier: "segue_badGrade", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "activitiesForMood" {
                if let dest = segue.destination as? ActivityForMoodViewController {
                    dest.selectedMood = moodsResult[selectedMood]
                }
            } else if identifier == "segue_badGrade" {
                if let dest = segue.destination as?BadGradeViewController{
                print (moodsResult[selectedMood])
                }
            }
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


