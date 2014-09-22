//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Daniel Gilbert on 9/19/14.
//  Copyright (c) 2014 Daniel Gilbert. All rights reserved.
//

import UIKit

let firstTiger = Tiger(name: "Tigger", age: 3, breed: "Bengal", image: UIImage(named:"BengalTiger.jpg"))
let secondTiger = Tiger(name: "Tigress", age: 8, breed: "Indochinese", image: UIImage(named:"IndochineseTiger.jpg"))
let thirdTiger = Tiger(name: "Jacob", age: 5, breed: "Malayan", image: UIImage(named:"MalayanTiger.jpg"))
let fourthTiger = Tiger(name: "Spar", age: 9, breed: "Siberian", image: UIImage(named:"SiberianTiger.jpg"))
let myTigers:[Tiger] = [firstTiger,secondTiger,thirdTiger,fourthTiger]

var index:Int = 0

class ViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblBreed: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myImageView.image = myTigers[0].image
        lblName.text = myTigers[0].name
        lblBreed.text = myTigers[0].breed
        lblAge.text = "\(myTigers[0].age)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnBarNextPressed(sender: UIBarButtonItem) {
        if (myTigers.count - 1) == index {
            index = 0
        }else {
            index++
        }
        
        myImageView.image = myTigers[index].image
        lblName.text = myTigers[index].name
        lblBreed.text = myTigers[index].breed
        lblAge.text = "\(myTigers[index].age)"
    }

    @IBAction func btnBarPrevPressed(sender: UIBarButtonItem) {
        if 0 == index {
            index = myTigers.count - 1
        }else {
            index--
        }
        
        myImageView.image = myTigers[index].image
        lblName.text = myTigers[index].name
        lblBreed.text = myTigers[index].breed
        lblAge.text = "\(myTigers[index].age)"
    }
}

