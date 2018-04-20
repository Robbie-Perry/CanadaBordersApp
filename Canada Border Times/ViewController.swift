//
//  ViewController.swift
//  Canada Border Times
//
//  Created by Robbie Perry on 2018-04-17.
//  Copyright © 2018 Robbie Perry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! CanadaBoundController
        let button = sender as! UIButton
        
        if (button.titleLabel?.text! == "Canada Bound") {
            dest.url = "https://crypto-api-justin.herokuapp.com/border/data/cad"
        } else {
            dest.url = "https://crypto-api-justin.herokuapp.com/border/data/usa"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

