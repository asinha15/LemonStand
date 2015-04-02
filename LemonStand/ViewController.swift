//
//  ViewController.swift
//  LemonStand
//
//  Created by Arnab Sinha on 4/1/15.
//  Copyright (c) 2015 Arnab Sinha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelCapital: UILabel!
    
    @IBOutlet weak var currCountofLemons: UILabel!
    @IBOutlet weak var currentCountofIceCubes: UILabel!
    
    @IBOutlet weak var lemonsBought: UILabel!
    @IBOutlet weak var iceCubesBought: UILabel!
    
    @IBOutlet weak var lemonsMixed: UILabel!
    @IBOutlet weak var iceCubesMixed: UILabel!
    
    var capital = 10
    var lemonCount = 1
    var iceCubeCount = 1
    let lemonPrice = 2
    let iceCubePrice = 1
    var cntLemonsBought = 0
    var cntIceCubeBought = 0
    var mixLemonCnt = 0
    var mixIceCnt = 0
    
    
    @IBAction func btnBuyLemon(sender: UIButton) {
        if capital <= 1 {
            showAlertWithText(header: "Not Enough Capital to buy lemons", message: "Earn More Capital!!")
        }
        else {
        self.capital -=  lemonPrice
        cntLemonsBought += 1
        lemonCount += 1
        updateView()
        }
    }
    
    @IBAction func btnReverseBuyLemon(sender: UIButton) {
        self.capital +=  lemonPrice
        cntLemonsBought -= 1
        lemonCount -= 1
        updateView()
    }
    
    @IBAction func btnBuyIce(sender: UIButton) {
        if capital < 1 {
            showAlertWithText(header: "Not Enough Capital to buy lemons", message: "Earn More Capital!!")
        }
        else {
            self.capital -=  iceCubePrice
            cntIceCubeBought += 1
            iceCubeCount += 1
            updateView()
        }
    }
    
    @IBAction func btnReverseBuyIce(sender: UIButton) {
        self.capital +=  iceCubePrice
        cntIceCubeBought -= 1
        iceCubeCount -= 1
        updateView()
    }
    
    @IBAction func btnMixLemon(sender: UIButton) {
        mixLemonCnt++
        lemonCount--
        updateView()
    }
    
    @IBAction func btnUnmixLemon(sender: UIButton) {
        mixLemonCnt--
        lemonCount++
        updateView()
    }
    
    @IBAction func btnMixIce(sender: UIButton) {
        mixIceCnt++
        iceCubeCount--
        updateView()
    }
    
    @IBAction func btnUnmixIce(sender: UIButton) {
        mixIceCnt--
        iceCubeCount++
        updateView()
    }
    
    func updateView(){
        self.labelCapital.text = "\(capital)"
        self.lemonsBought.text = "\(cntLemonsBought)"
        self.currCountofLemons.text = "\(lemonCount)"
        self.iceCubesBought.text = "\(cntIceCubeBought)"
        self.currentCountofIceCubes.text = "\(iceCubeCount)"
        self.lemonsMixed.text = "\(mixLemonCnt)"
        self.iceCubesMixed.text = "\(mixIceCnt)"
        
    }
    
    func showAlertWithText (header : String = "Warning", message : String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cntLemonsBought = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

