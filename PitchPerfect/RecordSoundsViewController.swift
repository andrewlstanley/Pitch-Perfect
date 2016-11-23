//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by AndrewLStanley on 11/7/16.
//  Copyright © 2016 LeanSixLabs. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecording: UIButton!

    var audioRecorder: AVAudioRecorder!
    
    override func viewWillAppear(_ animated: Bool) {
        stopRecording.isEnabled = false
    }

    @IBAction func recordAudio(_ sender: AnyObject) {
        print("Button pressed!")
        recordingLabel.text = "Recording"
        stopRecording.isEnabled = true
        recordButton.isEnabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURL(withPathComponents: pathArray)
        print(filePath!)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        
    }
    @IBAction func stopRecording(_ sender: AnyObject) {
        
        stopRecording.isEnabled = false
        recordButton.isEnabled = true
        recordingLabel.text = "Tap to Record"
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if (flag) {
            self.performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
            } else {
                print("The saving of the recording failed.")
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "stopRecording") {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            playSoundsVC.recordedAudioURL = recordedAudioURL as URL!
        }
    }
}



