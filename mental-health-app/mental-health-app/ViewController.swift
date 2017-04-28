//
//  ViewController.swift
//  mental-health-app
//
//  Created by Marisa Wong on 4/12/17.
//  Copyright © 2017 Marisa Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var OpeningLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var flowerPower: UIImageView!
    
    
    var thePerfColor: UIColor?
    var pk: CGSize?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        thePerfColor = UIColor(hue: 0.689, saturation: 0.21, brightness: 0.67, alpha: 1.0)
        self.view.backgroundColor = thePerfColor
        
        OpeningLabel.text = "Hello there, how are you feeling today?"
        OpeningLabel.numberOfLines = 3
        OpeningLabel.textAlignment = .center
        OpeningLabel.font = UIFont(name: "Noteworthy-Bold", size: 35)
        OpeningLabel.textColor = .white
        
        instructionLabel.text = "Click on the flower to continue!"
        instructionLabel.numberOfLines = 1
        instructionLabel.textAlignment = .center
        instructionLabel.font = UIFont(name: "Noteworthy-Bold", size: 20)
        instructionLabel.textColor = .white
        
        flowerPower.image = UIImage(named: "flower bunch yellow")
    
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        flowerPower.isUserInteractionEnabled = true
        flowerPower.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        performSegue(withIdentifier: "toMoods", sender: self)
        // Your action
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

