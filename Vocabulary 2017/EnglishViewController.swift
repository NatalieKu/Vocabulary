//
//  EnglishViewController.swift
//  Vocabulary
//
//  Created by MEI KU on 2017/9/19.
//  Copyright © 2017年 Natalie KU. All rights reserved.
//

import UIKit
import AVFoundation

class EnglishViewController: UIViewController {

    var array = [String]()
    var index = 0
    
    @IBOutlet weak var collectionBtn: UIButton!
    
    @IBAction func gobackEnglishpage(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func speak(_ sender: Any) {
        let line = array[index]
        let dataArray = line.components(separatedBy: "\t")
        let speechUtterance = AVSpeechUtterance(string: dataArray[0])
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        let synth = AVSpeechSynthesizer()
        synth.speak(speechUtterance)
        
    }
    
    @IBAction func speakSentance(_ sender: Any) {
        
        let line = array[index]
        let dataArray = line.components(separatedBy: "\t")
        let speechUtterance = AVSpeechUtterance(string: dataArray[2])
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        let synth = AVSpeechSynthesizer()
        synth.speak(speechUtterance)
        
    }
    
    
    
    
    @IBAction func collectionBtnpressed(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        let line = array[index]
        let dataArray = line.components(separatedBy: "\t")
        var isLike = userDefaults.bool(forKey: dataArray[0])
        
        var likeArray = userDefaults.array(forKey: "likes")
        
        if likeArray == nil {
            likeArray = []
        }
        isLike = !isLike
        
        if isLike {
            collectionBtn.setTitle("⭐️", for: UIControlState.normal)
            
            likeArray?.append(line)
        }
        else {
            collectionBtn.setTitle("☆", for: UIControlState.normal)
            
            var i = 0
            for data in likeArray! as! [String] {
                if data == line {
                    break
                }
                i = i + 1
            }
            
            likeArray?.remove(at: i)
            
        }
        userDefaults.set(isLike, forKey: dataArray[0])
        userDefaults.set(likeArray!, forKey: "likes")
        
        userDefaults.synchronize()
        
    }
    
    
    
    @IBAction func next(_ sender: Any) {
        
        if index == array.count - 1 {
            index = 0
        }
        else {
            index = index + 1
            
        }
        let line = array[index]
        let dataArray = line.components(separatedBy: "\t")
        
        vocabularyLabel.text = dataArray[0]
        sentenceLabel.text = dataArray[2]
        
        vocabularyLabel.alpha = 0
        sentenceLabel.alpha = 0
        
        UIView.animate(withDuration: 1) {
            self.vocabularyLabel.alpha = 1
            self.sentenceLabel.alpha = 1
        }
        
        let userDefaults = UserDefaults.standard
        let isLike = userDefaults.bool(forKey: dataArray[0])
        if isLike {
            collectionBtn.setTitle("⭐️",  for: UIControlState.normal)
        }
        else {
            collectionBtn.setTitle("☆", for: UIControlState.normal)
            
        }
        
    }
    
    @IBAction func prev(_ sender: Any) {
        if index == 0 {
            index = array.count - 1
            
        }
        else {
            index = index - 1
        }
        let line = array[index]
        let dataArray = line.components(separatedBy: "\t")
        
        vocabularyLabel.text = dataArray[0]
        sentenceLabel.text = dataArray[2]
        
        vocabularyLabel.alpha = 0
        sentenceLabel.alpha = 0
        
        UIView.animate(withDuration: 1) {
            self.vocabularyLabel.alpha = 1
            self.sentenceLabel.alpha = 1
        }
        
        let userDefaults = UserDefaults.standard
        let isLike = userDefaults.bool(forKey: dataArray[0])
        if isLike {
            collectionBtn.setTitle("⭐️",  for: UIControlState.normal)
        }
        else {
            collectionBtn.setTitle("☆", for: UIControlState.normal)
            
        }
        
        
    }
    
    
    
    
    var alphabet:String!
    
    @IBOutlet weak var vocabularyLabel: UILabel!
    
    @IBOutlet weak var sentenceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        navigationItem.title = alphabet
        
        if alphabet == "myLike" {
            
            
            let defaults = UserDefaults.standard
            let likes =  defaults.array(forKey: "likes") as? [String]
            if likes == nil {
                array = []
            }
            else {
                array = likes!
            }
            
            collectionBtn.isHidden = true
            
        }
        else {
            let url = Bundle.main.url(forResource: alphabet, withExtension: "txt")
            let content = try? String(contentsOf: url!)
            array = content!.components(separatedBy: "\n")
        }
        
        
        let line = array[0]
        let dataArray = line.components(separatedBy: "\t")
        
        vocabularyLabel.text = dataArray[0]
        sentenceLabel.text = dataArray[2]
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let navController = segue.destination as! UINavigationController
        let controller = navController.viewControllers.first as! ChineseViewController
        let line = array[index]
        let dataArray = line.components(separatedBy: "\t")
        
        controller.vocabulary = dataArray[1]
        controller.sentance = dataArray[3]
        
    }
    
    
}

