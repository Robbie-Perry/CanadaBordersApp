//
//  ViewController.swift
//  Canada Border Times
//
//  Created by Robbie Perry on 2018-04-17.
//  Copyright © 2018 Robbie Perry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canada: UIImageView!
    @IBOutlet weak var usa: UIImageView!
    
    @IBAction func canButton(_ sender: Any) {
        canadaTapped()
    }
    @IBOutlet weak var usaButton: UIButton!
    
    @IBAction func usaBtn(_ sender: Any) {
        usaTapped()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let img = UIColor(patternImage: #imageLiteral(resourceName: "Asphalt-1"))
        self.view.backgroundColor = img
        
        let canadaTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.canadaTapped))
        let usaTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.usaTapped))
        canada.addGestureRecognizer(canadaTap)
        canada.isUserInteractionEnabled = true
        usa.addGestureRecognizer(usaTap)
        usa.isUserInteractionEnabled = true
    }
    
    @objc func usaTapped() {
        self.performSegue(withIdentifier: "show", sender: "USA Bound")
    }
    
    @objc func canadaTapped() {
        self.performSegue(withIdentifier: "show", sender: "Canada Bound")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! CanadaBoundController
        
        if sender as! String == "Canada Bound" {
            dest.url = "https://crypto-api-justin.herokuapp.com/border/data/cad"
        } else if sender as! String == "USA Bound" {
            dest.url = "https://crypto-api-justin.herokuapp.com/border/data/usa"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

