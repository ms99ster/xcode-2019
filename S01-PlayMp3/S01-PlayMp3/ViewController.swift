//
//  ViewController.swift
//  S01-PlayMp3
//
//  Created by Li Wenya Colin on 2019/1/14.
//  Copyright © 2019 Li Wenya Colin. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {
    var player: AVPlayer?
    var repeatNumber: Int /Users/wl98336/code/xcode-2019/S02-showText/S02-showText/ViewController.swift= 0;
    var maxRepeatNumber : Int = 1;
    var itemDuration:Float64 = 0;
    
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var play3Btn: UIButton!
    
    @IBAction func playBtnClicked(_ sender: Any) {
        play3Btn.isEnabled = false;
        maxRepeatNumber = 1;
        if player?.rate == 0 {
            player?.play()
            playBtn.setTitle("Pause", for: .normal)
        }else{
            player?.pause()
            playBtn.setTitle("Continue", for: .normal)
        }
    }
    @IBAction func play3BtnClicked(_ sender: Any) {
        playBtn.isEnabled = false;
        maxRepeatNumber = 3;
        if player?.rate == 0 {
            player?.play()
            play3Btn.setTitle("Pause", for: .normal)
        }else{
            player?.pause()
            play3Btn.setTitle("Continue", for: .normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: "https://fs-gateway.esdict.cn/store_main/sentencemp3/0qDG0C7bnZrL0jhpVb9T4OGdAnM=.mp3")
        let playerItem: AVPlayerItem? = AVPlayerItem.init(url: url!)
        itemDuration = CMTimeGetSeconds(playerItem!.asset.duration)
        player = AVPlayer.init(playerItem: playerItem)
        
        NotificationCenter.default.addObserver(self, selector: #selector(finishedPlaying),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
    }
    
    @objc func finishedPlaying(myNotification:NSNotification) {
       
        player?.seek(to: CMTime.zero)
        repeatNumber = repeatNumber + 1
         print(repeatNumber)
        if repeatNumber == maxRepeatNumber {
            playBtn.setTitle("Play", for: .normal)
            playBtn.isEnabled = true;
            play3Btn.setTitle("Play 3 Times", for: .normal)
            play3Btn.isEnabled = true;
            repeatNumber = 0
        }else{
            sleep(UInt32(itemDuration))
            player?.play();
        }
    }
}

