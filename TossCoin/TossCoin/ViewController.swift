//
//  ViewController.swift
//  TossCoin
//
//  Created by Alkit Gupta on 09/08/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var selectACoinLabel: UILabel!
    @IBOutlet weak var firstCoinImage: UIImageView!
    @IBOutlet weak var secondCoinImage: UIImageView!
    @IBOutlet weak var resultCoinImage: UIImageView!
    
    var userSelection = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    


    @IBAction func firstCoinSelectAction(_ sender: Any) {
        userSelection = 0
        selectACoinLabel.text = "  You're selected Head\nClick Toss "
    }
   
    
    
    @IBAction func secondCoinSelectAction(_ sender: Any) {
        userSelection = 1
        selectACoinLabel.text = "  You're selected Tail\nClick Toss"
        
    }
    
    
    @IBAction func tossButton(_ sender: Any) {
        let result = Int.random(in: 0...1)
        let animationDuration: TimeInterval = 1.0
        let resultDelay: TimeInterval = animationDuration
        let outcomeDelay: TimeInterval = animationDuration + 2.0

        // Apply perspective for 3D effect
        var perspective = CATransform3DIdentity
        perspective.m34 = -1.0 / 500.0
        resultCoinImage.layer.transform = perspective

        // Create and apply vertical flip animation
        let flip = CABasicAnimation(keyPath: "transform.rotation.x")
        flip.fromValue = 0
        flip.toValue = Double.pi * 2
        flip.duration = animationDuration
        flip.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        resultCoinImage.layer.add(flip, forKey: "coinFlipVertical")

        // Update coin result after animation
        DispatchQueue.main.asyncAfter(deadline: .now() + resultDelay) {
            let coinText = result == 1 ? "Head" : "Tail"
            let coinImageName = result == 1 ? "head.png" : "tail.png"
            self.selectACoinLabel.text = coinText
            self.resultCoinImage.image = UIImage(named: coinImageName)
        }

        // Show win/loss outcome
        DispatchQueue.main.asyncAfter(deadline: .now() + outcomeDelay) {
            let outcomeText = result == self.userSelection ? "You Won !!!" : "You Lost !!!"
            self.selectACoinLabel.text = outcomeText
        }
    }

    
}

