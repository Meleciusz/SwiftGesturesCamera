//
//  View2Controller.swift
//  lab3_s5
//
//  Created by Student on 19/12/2022.
//

import UIKit

class View2Controller: UIViewController {

    var swipeRecognizer1: UISwipeGestureRecognizer!
    var tapRecognizer2: UITapGestureRecognizer!
    var tapRecognizer: UITapGestureRecognizer!
    
    var timer = Timer()
    
    var num = 0
    
    required init(coder aDecoder: NSCoder) { super.init(coder: aDecoder)!
    swipeRecognizer1 = UISwipeGestureRecognizer(target:
    self, action: #selector(handleSwipes))
        
    tapRecognizer2 = UITapGestureRecognizer(target:
    self, action: #selector(handleTap2))
        
    tapRecognizer = UITapGestureRecognizer(target:
    self, action: #selector(handleTap))
     }
    
    
    
    override func viewDidLoad() {
        swipeRecognizer1.numberOfTouchesRequired = 1
        tapRecognizer2.numberOfTouchesRequired = 2
        view.addGestureRecognizer(swipeRecognizer1)
        view.addGestureRecognizer(tapRecognizer2)
        view.addGestureRecognizer(tapRecognizer)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var time: UILabel!
    
    
    @objc func handleSwipes(sender: UISwipeGestureRecognizer){
        num = 0
        time.text = String(num)
        
    }
    
    @objc func handleTap2(sender: UITapGestureRecognizer){
        timer.invalidate()
        
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(funkcja_obslugi), userInfo: nil, repeats: true)
        
    }

    @objc func funkcja_obslugi(){
        num += 1
        time.text = String(num)
    }
    
    
}
