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
    
    
    @IBOutlet weak var songsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songsTable.delegate = self
        songsTable.dataSource = self
        
        gettingSongName()
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
        do {
            let audioPath = Bundle.main.path(forResource: songs[indexPath.row], ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            
        } catch {
            print("couldn't play song")
        }

    }

 
    
    func gettingSongName() {
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
        
        do {
            let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for song in songPath {
                var mySong = song.absoluteString
                if mySong.contains(".mp3") {
                    let findString = mySong.components(separatedBy: "/")
                    mySong = findString[findString.count-1]
                    mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                    mySong = mySong.replacingOccurrences(of: ".mp3", with: "")
                    print(mySong)
                    songs.append(mySong)
                    
                }
            }
            songsTable.reloadData()
        }
        catch {
            
        }
    }
}
