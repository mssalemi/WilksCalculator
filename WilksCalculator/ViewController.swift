//
//  ViewController.swift
//  WilksCalculator
//
//  Created by Mehdi Salemi on 2/5/16.
//  Copyright © 2016 MxMd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Wilk Score
    @IBOutlet weak var wilkScoreLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var weightLabel: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var weightType: UISegmentedControl!
    var attempts : [Int]!
    
    //Squat Objects
    @IBOutlet weak var squat1: UISwitch!
    @IBOutlet weak var squat2: UISwitch!
    @IBOutlet weak var squat3: UISwitch!
    
    @IBOutlet weak var squat1Weight: UITextField!
    @IBOutlet weak var squat2Weight: UITextField!
    @IBOutlet weak var squat3Weight: UITextField!
    
    @IBAction func squatSwitch1(sender: UISwitch) {
        attempts[0] = 1
        squat2.on = false
        squat3.on = false
        wilks()
    }
    @IBAction func squatSwitch2(sender: UISwitch) {
        attempts[0] = 2
        squat1.on = false
        squat3.on = false
        wilks()
    }
    @IBAction func squatSwitch3(sender: UISwitch) {
        attempts[0] = 3
        squat1.on = false
        squat2.on = false
        wilks()
    }
    
    // Bench Objects
    @IBOutlet weak var bench1: UISwitch!
    @IBOutlet weak var bench2: UISwitch!
    @IBOutlet weak var bench3: UISwitch!
    
    @IBOutlet weak var bench1Weight: UITextField!
    @IBOutlet weak var bench2Weight: UITextField!
    @IBOutlet weak var bench3Weight: UITextField!
    
    @IBAction func benchSwitch1(sender: UISwitch) {
        attempts[1] = 1
        bench2.on = false
        bench3.on = false
        wilks()
    }
    @IBAction func benchSwitch2(sender: UISwitch) {
        attempts[1] = 2
        bench1.on = false
        bench3.on = false
        wilks()
    }
    
    @IBAction func benchSwitch3(sender: UISwitch) {
        attempts[1] = 1
        bench1.on = false
        bench2.on = false
        wilks()
    }
    
    
    //Deadlift Objects
    @IBOutlet weak var deadlift1: UISwitch!
    @IBOutlet weak var deadlift2: UISwitch!
    @IBOutlet weak var deadlift3: UISwitch!
    
    @IBOutlet weak var deadlift1Weight: UITextField!
    @IBOutlet weak var deadlift2Weight: UITextField!
    @IBOutlet weak var deadlift3Weight: UITextField!
    
    @IBAction func deadliftSwitch1(sender: UISwitch) {
        attempts[2] = 1
        deadlift2.on = false
        deadlift3.on = false
        wilks()
    }
    @IBAction func deadliftSwitch2(sender: UISwitch) {
        attempts[2] = 2
        deadlift1.on = false
        deadlift3.on = false
        wilks()
    }
    @IBAction func deadliftSwitch3(sender: UISwitch) {
        attempts[2] = 3
        deadlift1.on = false
        deadlift2.on = false
        wilks()
    }
    
    // Other Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        attempts = [0,0,0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func wilks()  {
        var wilks : Double = 0.0
        var total : Double = 0.0
        var squat: Double = 0.0
        var bench: Double = 0.0
        var deadlift: Double = 0.0
        var  weight: Double = (weightLabel.text! as NSString).doubleValue
        
        switch attempts[0] {
        case 1:
            squat = (squat1Weight.text! as NSString).doubleValue
            print(squat)
        case 2:
            squat = (squat2Weight.text! as NSString).doubleValue
            print(squat)
        case 3:
            squat = (squat3Weight.text! as NSString).doubleValue
            print(squat)
        default:
            squat = 0
            print("Error")
        }
        
        switch attempts[1] {
        case 1:
            bench = (bench1Weight.text! as NSString).doubleValue
        case 2:
            bench = (bench2Weight.text! as NSString).doubleValue
        case 3:
            bench = (bench3Weight.text! as NSString).doubleValue
        default:
            bench = 0
            print("Error")
        }
        
        switch attempts[2]{
        case 1:
            deadlift = (deadlift1Weight.text! as NSString).doubleValue
        case 2:
            deadlift = (deadlift2Weight.text! as NSString).doubleValue
        case 3:
            deadlift = (deadlift3Weight.text! as NSString).doubleValue
        default:
            deadlift = 0
            print("Error")
        }
        
        total = squat+bench+deadlift
 
        if weightType.selectedSegmentIndex == 0 {
            print("KG")
        } else {
            print("lb")
        }
        
        if gender.selectedSegmentIndex == 0 {
            print("Male")
        } else {
            print("Female")
        }
        
        var a: Double = 0
        var b: Double = 0
        var c: Double = 0
        var d: Double = 0
        var e: Double = 0
        var f: Double = 0
        //Wilk Co-efficient Numbers
        switch gender.selectedSegmentIndex {
        case 0:
            a = -216.0475144
            b = 16.2606339
            c = -0.002388645
            d = -0.00113732
            e = 7.01863E-06
            f = -1.291E-08
        case 1:
            a = 594.31747775582
            b = -27.23842536447
            c = 0.82112226871
            d = -0.00930733913
            e = 0.00004731582
            f = -0.00000009054
        default:
            print("Error on Wilks Co-Eff")
        }
        switch weightType.selectedSegmentIndex {
        case 0:
            totalLabel.text = "\(total)"
            print("KG Weight = \(weight)")
        case 1:
            totalLabel.text = "\(total)"
            weight = weight / 2.2
            total = total / 2.2
            print("KG Weight = \(weight)")
            print("KG Total = \(total)")
        default:
            print("Error Here")
        }
        
        print("squat = \(squat)")
        print("bench = \(bench)")
        print("deadlift = \(deadlift)")
        print("total = \(total)")
        wilks = 500.00 / ( a + (b*weight) + (c*weight*weight) + (d*weight*weight*weight) + (e*weight*weight*weight*weight) + (f*weight*weight*weight*weight*weight))
        
        let wilkscore = wilks*total
        print(wilkscore)
        
        wilkScoreLabel.text = "\(wilkscore)"
    }
    
    //
    
    


}

