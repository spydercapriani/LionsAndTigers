//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Daniel Gilbert on 9/19/14.
//  Copyright (c) 2014 Daniel Gilbert. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblBreed: UILabel!
    @IBOutlet weak var lblFact: UILabel!
    
    var myTigers:[Tiger] = []
    var index:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let firstTiger = Tiger(name: "Tigger", age: 3, breed: "Bengal", image: UIImage(named:"BengalTiger.jpg"))
        let secondTiger = Tiger(name: "Tigress", age: 8, breed: "Indochinese", image: UIImage(named:"IndochineseTiger.jpg"))
        let thirdTiger = Tiger(name: "Jacob", age: 5, breed: "Malayan", image: UIImage(named:"MalayanTiger.jpg"))
        let fourthTiger = Tiger(name: "Spar", age: 9, breed: "Siberian", image: UIImage(named:"SiberianTiger.jpg"))
        myTigers += [firstTiger, secondTiger, thirdTiger, fourthTiger]
        
        displayTiger()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnBarNextPressed(sender: UIBarButtonItem) { // cycle forwards through tigers
        if (myTigers.count - 1) == index {
            index = 0
        }else {
            index++
        }
        displayTiger()
    }

    @IBAction func btnBarPrevPressed(sender: UIBarButtonItem) { // cycle backwards through tigers
        if 0 == index {
            index = myTigers.count - 1
        }else {
            index--
        }
        displayTiger()
    }
    
    @IBAction func btnRandomPressed(sender: UIBarButtonItem) { // cycle randomly through tigers
        var randomIndex:Int
        do {
            randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        } while randomIndex == index
        index = randomIndex
        displayTiger()
    }
    
    func displayTiger(){
        let tiger = myTigers[index]
        // Animate transition between tigers after button pressed
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                self.myImageView.image = tiger.image
                self.lblName.text = tiger.name
                self.lblBreed.text = tiger.breed
                self.lblAge.text = "\(tiger.age)"
                self.lblFact.text = tiger.randomFact()
            }, completion: { (finished: Bool) -> () in
                
            })
    }
}

