//
//  ViewController.swift
//  SwiftOfLife
//
//  Created by Parick De Marta on 10/06/14.
//  Copyright (c) 2014 Parick De Marta. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
 
    @IBOutlet var scene : UILabel
    var gol = Gol(rows: 40, columns: 40)
    var timer:NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seed()
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.001, target: self, selector: "play:", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func play(timer:NSTimer){
            scene.text = gol.render()
    }

    func seed() {
        for _ in 0..400 {
            var randomRow = Int(arc4random_uniform(40))
            var randomCol = Int(arc4random_uniform(40))
            gol[randomRow, randomCol] = true
        }
    }

}

