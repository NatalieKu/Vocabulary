//
//  WordViewController.swift
//  Vocabulary
//
//  Created by MEI KU on 2017/9/19.
//  Copyright © 2017年 Natalie KU. All rights reserved.
//

import UIKit

class mainViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        
        let controller = segue.destination as! EnglishViewController
        
        if segue.identifier == "myLike" {
            controller.alphabet = "myLike"
        }
        else {
            
            controller.alphabet = segue.identifier
            
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
