//
//  ChineseViewController.swift
//  Vocabulary
//
//  Created by yaya on 2016/12/7.
//  Copyright © 2016年 yaya. All rights reserved.
//

import UIKit

class ChineseViewController: UIViewController {
    
    
    
    @IBOutlet weak var vocabularyLabel: UILabel!
    
    @IBOutlet weak var sentanceLabel: UILabel!
    
    var vocabulary: String!
    var sentance: String!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
      
        
        vocabularyLabel.text = vocabulary
        sentanceLabel.text = sentance
        vocabularyLabel.alpha = 0
        sentanceLabel.alpha = 0
        UIView.animate(withDuration: 2) {
            self.vocabularyLabel.alpha = 1
            self.sentanceLabel.alpha = 1
        }
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    
}
