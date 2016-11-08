//
//  ViewController.swift
//  PitchPerfect
//
//  Created by AndrewLStanley on 11/7/16.
//  Copyright © 2016 LeanSixLabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecording: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(_ sender: AnyObject) {
        print("Button pressed yo!")
        recordingLabel.text = "Recording in progress..."
    }
    @IBAction func stopRecording(_ sender: AnyObject) {
        print("Stop recording button pressed.")
    }

}

