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
            4 : "I want to relax",
            5 : "I'm really stressed out",
            6 : "I'm homesick",
            7 : "I'm so late all the time",
            8 : "lack of self-esteem",
            9: "I think I might be depressed",
            10: "I need instant happiness"
    ]
    
    
    var moodsDict: [String : UIImage] = [
        "I'm feeling tired" : #imageLiteral(resourceName: "snowflake"),
        "I'm feeling adventurous" : #imageLiteral(resourceName: "snowflake") ,
        "I just got a bad grade back" : #imageLiteral(resourceName: "snowflake"),
        "I'm hungry" : #imageLiteral(resourceName: "snowflake"),
        "I want to relax" : #imageLiteral(resourceName: "snowflake"),
        "I'm really stressed out": #imageLiteral(resourceName: "snowflake"),
        "I'm homesick" : #imageLiteral(resourceName: "snowflake"),
        "I'm so late all the time" : #imageLiteral(resourceName: "snowflake"),
        "lack of self-esteem" : #imageLiteral(resourceName: "snowflake"),
        "I think I might be depressed": #imageLiteral(resourceName: "snowflake"),
        "I need instant happiness": #imageLiteral(resourceName: "snowflake")
        ]
    
    
    var moodsResult : [String : String] = [
        "I'm feeling tired" : "If you're feeling tired...",
        "I'm feeling adventurous" : "If you're feeling adventurous...",
        "I just got a bad grade back" : "If you're down about a bad grade...",
        "I'm hungry" : "If you're hungry",
        "I want to relax" : "If you want to relax...",
        "I'm really stressed out": "If you are stressed...",
        "I'm homesick" : "If you are homesick",
        "I'm so late all the time" : "LOL" ,
        "lack of self-esteem" : "If you feel down about yourself...",
        "I think I might be depressed": "I will help you as best I can",
        "I need instant happiness": "This should make you happy"
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
        if (indexPath.row == 2){
            performSegue(withIdentifier: "segue_badGrade", sender: self)
        } else if (indexPath.row == 0) { performSegue(withIdentifier: "tiredSegue", sender: self)
        } else if (indexPath.row == 10){
            performSegue(withIdentifier: "segueHappy", sender: self)
        }else if (indexPath.row == 9){
            let url1 = URL(string: "https://www.psycom.net/depression-test/")!
            UIApplication.shared.open(url1, options: [:], completionHandler: nil)
        }else if (indexPath.row == 5){
            performSegue(withIdentifier: "stressedSegue", sender: self)
        }
        else if (indexPath.row == 7){
            performSegue(withIdentifier: "lateSegue", sender: self)
        }
        else {performSegue(withIdentifier: "activitiesForMood", sender: self)
    }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "activitiesForMood" {
                if let dest = segue.destination as? ActivityForMoodViewController {
                    dest.selectedMood = moodsResult[selectedMood]
                    dest.thisMood = selectedMood
                }
            } else if identifier == "segue_badGrade" {
                if let dest = segue.destination as?BadGradeViewController{
                print (moodsResult[selectedMood])
                }
            } else if identifier == "tiredSegue" {
                if let dest = segue.destination as? tiredView{
                    dest.thisMood = selectedMood
                    print ("tired")
            }
            } else if identifier == "segueHappy" {
                if let dest = segue.destination as? happyView{
                    print("happy")
                }
                
            }else if identifier == "stressedSegue" {
                if let dest = segue.destination as? stressedView{
                    dest.thisMood = selectedMood
                    print("happy")
                }
            }else if identifier == "lateSegue" {
                if let dest = segue.destination as? lateView{
                    print("happy")
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


