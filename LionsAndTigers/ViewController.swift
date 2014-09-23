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
    @IBOutlet weak var btnPrevious: UIBarButtonItem!
    
    var myTigers:[Tiger] = []
    var myLions:[Lion] = []
    var myCubs:[LionCub] = []
    var currentAnimal = (species: "Tiger", index: 0) // store current animal information to be displayed
    var prevAnimal = (species: "Tiger", index: 0) // store previous animal regardless of species
    var prevTiger = (species: "Tiger", index: 0) // store last known tiger that was displayed
    var prevLion = (species: "Lion", index: 0) // store last known lion that was displayed
    var prevCub = (species: "Cub", index: 0) // store last known lion cub that was displayed

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let firstTiger = Tiger(name: "Tigger", age: 3, breed: "Bengal", image: UIImage(named:"BengalTiger.jpg"))
        let secondTiger = Tiger(name: "Tigress", age: 8, breed: "Indochinese", image: UIImage(named:"IndochineseTiger.jpg"))
        let thirdTiger = Tiger(name: "Jacob", age: 5, breed: "Malayan", image: UIImage(named:"MalayanTiger.jpg"))
        let fourthTiger = Tiger(name: "Spar", age: 9, breed: "Siberian", image: UIImage(named:"SiberianTiger.jpg"))
        myTigers += [firstTiger, secondTiger, thirdTiger, fourthTiger]
        
        var lion = Lion()
        lion.age = 4
        lion.changeToAlphaMale()
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mufasa"
        lion.subSpecies = "West African"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subSpecies = "Barbary"
        myLions += [lion,lioness]
        
        var maleCub = LionCub()
        maleCub.age = 1
        maleCub.name = "Simba"
        maleCub.image = UIImage(named: "LionCub1.jpg")
        maleCub.subSpecies = "Masai"
        maleCub.isMale = true
        
        var femaleCub = LionCub()
        femaleCub.age = 1
        femaleCub.name = "Nala"
        femaleCub.image = UIImage(named: "LionCub2.jpeg")
        femaleCub.subSpecies = "Transvaal"
        myCubs += [maleCub, femaleCub]
        
        updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnBarNextPressed(sender: UIBarButtonItem) { // cycle forwards randomly through tigers/lions
        updateAnimal()
        updateView()
        btnPrevious.enabled = true // Enable user to view previous animal
    }

    @IBAction func btnBarPrevPressed(sender: UIBarButtonItem) { // cycle backwards through tigers/lions
        currentAnimal = prevAnimal
        updateView()
        btnPrevious.enabled = false // Disable previous button after pressed once. NOTE: only able to go back once.
    }
    
    func updateView(){ // Animate transition between tigers after button pressed
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            switch self.currentAnimal.species {
                case "Tiger":
                    let tiger = self.myTigers[self.currentAnimal.index]
                    self.myImageView.image = tiger.image
                    self.lblName.text = tiger.name
                    self.lblBreed.text = tiger.breed
                    self.lblAge.text = "\(tiger.age)"
                    self.lblFact.text = tiger.randomFact()
                case "Lion":
                    let lion = self.myLions[self.currentAnimal.index]
                    self.myImageView.image = lion.image
                    self.lblName.text = lion.name
                    self.lblBreed.text = lion.subSpecies
                    self.lblAge.text = "\(lion.age)"
                    self.lblFact.text = lion.randomFact()
                case "LionCub":
                    let cub = self.myCubs[self.currentAnimal.index]
                    self.myImageView.image = cub.image
                    self.lblName.text = cub.name
                    self.lblBreed.text = cub.subSpecies
                    self.lblAge.text = "\(cub.age)"
                    self.lblFact.text = cub.randomFact()
            default:
                println("updateView: Default Case is Running")
            }
            }, completion: { (finished: Bool) -> () in
                
            })
    }
    
    func updateAnimal(){ // grab a new animal
        switch currentAnimal {
        case ("Tiger", _):
            var randomIndex:Int
            do {
                randomIndex = Int(arc4random_uniform(UInt32(myLions.count)))
            } while randomIndex == prevLion.index // see that next lion is not repeat of last lion
            
            prevAnimal = currentAnimal
            prevTiger = currentAnimal // store previous tiger to avoid repetition
            currentAnimal = ("Lion", randomIndex)
        case ("Lion", _):
            var randomIndex:Int
            do {
                randomIndex = Int(arc4random_uniform(UInt32(myCubs.count)))
            } while randomIndex == prevCub.index // see that next lion is not repeat of last tiger
            
            prevAnimal = currentAnimal
            prevCub = currentAnimal // store previous lion to avoid repetition
            currentAnimal = ("LionCub", randomIndex)
        case ("LionCub", _):
            var randomIndex:Int
            do {
                randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            } while randomIndex == prevTiger.index // see that next lion is not repeat of last tiger
            
            prevAnimal = currentAnimal
            prevLion = currentAnimal // store previous lion to avoid repetition
            currentAnimal = ("Tiger", randomIndex)
        default:
            println("updateAnimal: Default Case is Running")
        }
    }
}

