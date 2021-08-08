//
//  ViewController.swift
//  P2
//
//  Created by Erni Iun on 2021/08/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var totalQ = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["us", "uk", "france"]
        
        btn1.layer.borderWidth = 1
        btn2.layer.borderWidth = 1
        btn3.layer.borderWidth = 1
        
        btn1.layer.borderColor = UIColor.lightGray.cgColor
        btn2.layer.borderColor = UIColor.lightGray.cgColor
        btn3.layer.borderColor = UIColor(red: 0.1, green: 1.0, blue: 0.1, alpha: 1.0).cgColor
    
        askQ(action: nil)
    }
    
    func askQ(action: UIAlertAction!) {
        countries.shuffle()
        
        btn1.setImage(UIImage(named: countries[0]), for: .normal)
        btn2.setImage(UIImage(named: countries[1]), for: .normal)
        btn3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = "\(countries[correctAnswer].uppercased()). Score: \(score) "
    }
    
    func startNewGame(action: UIAlertAction!) {
        score = 0
        totalQ = 0
        
        askQ(action: nil)
    }
    
    @IBAction func btnTapped(_ sender: UIButton) {
        var title: String
        totalQ += 1
        
        if sender.tag == correctAnswer {
            title = "Correct!"
            score += 1
        } else {
            title = "Wrong! That's the flag of \(countries[sender.tag].uppercased())."
            score -= 1
        }
        
        if totalQ < 10 {
            let ac = UIAlertController(title: title, message: "Your score: \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQ))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Final", message: "Your final score: \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Start new game", style: .default, handler: startNewGame))
            present(ac, animated: true)
        }
     
        
    }
}

