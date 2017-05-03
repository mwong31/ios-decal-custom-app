//
//  MusicTableViewController.swift
//  mental-health-app
//
//  Created by Marisa Wong on 4/29/17.
//  Copyright © 2017 Marisa Wong. All rights reserved.
//

import UIKit
import AVFoundation

var audioPlayer = AVAudioPlayer()

class MusicTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    var songs : [String] = []
    var selectedSong : String = ""
    var selectedRow : Int = -1
    var playingMusic : Bool = false
    
    @IBOutlet weak var songsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songsTable.delegate = self
        songsTable.dataSource = self
        print(songs)
        
        //gettingSongName()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell") as! MusicTableViewCell
        cell.songTitle.text = songs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("yay clicked on meeeee")
        selectedSong = songs[indexPath.row]
        print (indexPath.row)
        print (selectedRow)
        if (selectedRow == indexPath.row && playingMusic == true) {
            audioPlayer.pause()
            playingMusic = false
        }
        do {
            let audioPath = Bundle.main.path(forResource: songs[indexPath.row], ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            selectedRow = indexPath.row
            audioPlayer.play()
            playingMusic = true
        } catch {
            print("couldn't play song")
        }

    }
}
