//
//  ViewController.swift
//  Project2
//
//  Created by Peter on 2022/02/25.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var tried = 0
    var tapped = false
    var highestScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score", style: .plain, target: self, action: #selector(showScore))
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        highestScore = UserDefaults.standard.integer(forKey: "highestScore")
        askQuestion()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(scheduleLocal))
            
        registerNotification()
    }
    
    func registerNotification(){
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()

        center.requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in }
    }
    
    @objc func scheduleLocal(){
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        let content = UNMutableNotificationContent()
        content.title = "Flag Game"
        content.body = "Come Back and Play!"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request)
    }
    
    func askQuestion(action: UIAlertAction? = nil){
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = "\(countries[correctAnswer].uppercased()), Score: \(score)"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        tried += 1
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 3, options: []) {
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } completion: { _ in
            sender.transform = .identity
        }

        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
            
            let ac = UIAlertController(title: title, message: "Wrong! That's the flag of \(countries[sender.tag])", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            present(ac, animated: true)
        }
        
        if tried == 10 {
            if score > highestScore {
                highestScore = score
                save()
                let ac = UIAlertController(title: title, message: "Your new highest score is \(score).", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                present(ac, animated: true)
            } else {
                let ac = UIAlertController(title: title, message: "Your final score is \(score).", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                present(ac, animated: true)
            }
            
            tried = 0
            score = 0
        }
        askQuestion(action: nil)
        
    }
    
    @objc func showScore(){
        tapped = !tapped
        if tapped {
            navigationItem.rightBarButtonItem?.title = "\(score)"
        } else {
            navigationItem.rightBarButtonItem?.title = "Score"
        }
    }
    
    func save(){
        UserDefaults.standard.set(highestScore, forKey: "highestScore")
    }
    
}

