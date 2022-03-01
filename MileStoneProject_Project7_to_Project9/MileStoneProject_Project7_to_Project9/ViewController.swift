//
//  ViewController.swift
//  MileStoneProject_Project7_to_Project9
//
//  Created by Peter on 2022/03/02.
//

import UIKit

class ViewController: UIViewController {
    
    var hangManStrings = [String]()
    var alphabets = [String]()
    var lifeLeft: UILabel!
    var current: UITextField!
    var alphabetButtons = [UIButton]()
    var life = 7 {
        didSet {
            lifeLeft.text = "Life: \(life)"
        }
    }
    var answer: String!
    

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        lifeLeft = UILabel()
        lifeLeft.translatesAutoresizingMaskIntoConstraints = false
        lifeLeft.text = "Life: \(life)"
        lifeLeft.textAlignment = .right
        view.addSubview(lifeLeft)
        
        
        current = UITextField()
        current.translatesAutoresizingMaskIntoConstraints = false
        current.placeholder = "?????"
        current.textAlignment = .center
        current.isUserInteractionEnabled = false
        current.font = UIFont.systemFont(ofSize: 44)
        view.addSubview(current)
        
        let buttonsView = UIView()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsView)
        
        NSLayoutConstraint.activate([
            lifeLeft.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            lifeLeft.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            current.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            current.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            
            buttonsView.widthAnchor.constraint(equalToConstant: 300),
            buttonsView.heightAnchor.constraint(equalToConstant: 360),
            buttonsView.topAnchor.constraint(equalTo: current.bottomAnchor, constant: 20),
            buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let width = 60
        let height = 60
        
        for row in 0..<6 {
            for col in 0..<5 {
                if row == 5 {
                    let range = 1...5
                    if range.contains(col) {
                        continue
                    }
                }
                let alphabetButton = UIButton(type: .system)
                alphabetButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
                alphabetButton.setTitle("A", for: .normal)
                alphabetButton.addTarget(self, action: #selector(alphaTapped), for: .touchUpInside)
                
                let frame = CGRect(x: col * width, y: row * height, width: width, height: height)
                alphabetButton.frame = frame
                
                buttonsView.addSubview(alphabetButton)
                alphabetButtons.append(alphabetButton)
            }
        }
        
        
        loadText()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func alphaTapped(_ sender: UIButton){
        guard let buttonTitle = sender.titleLabel?.text else { return }
        
        if !answer.contains(buttonTitle){
            life -= 1
            if life == 0 {
                gameOver()
            }
            return
        }
        
        if (checkCurrent(char: buttonTitle)){
            sender.isHidden = true
            checkSuccess()
        } else {
            print("not contain")
        }
        
    }
    
    func gameOver(){
        let vc = UIAlertController(title: "GAME OVER", message: "HANGED MAN!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        vc.addAction(action)
        
        present(vc, animated: true) { [weak self] in
            guard let self = self else { return }
            self.life = 7
            self.current.placeholder = String(repeating: "?", count: self.answer.count)
            for button in self.alphabetButtons {
                button.isHidden = false
            }
        }
    }
    
    func checkSuccess(){
        guard let text = current.placeholder else { return }
        print("checkSuccess")
        print(text)
        if !text.contains("?"){
            let vc = UIAlertController(title: "GAME WIN", message: "SAVE A MAN!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Confirm", style: .default, handler: nil)
            vc.addAction(action)
            present(vc, animated: true)
        }
    }
    
    func checkCurrent(char: String) -> Bool{

        let character = [Character](answer)
        var temp = [Character](self.current.placeholder!)
        for (index, c) in character.enumerated() {
            if c == Character(char) {
                temp[index] = c
            }
        }
        self.current.placeholder = String(temp)
        return true
    }
    
    func loadText(){
        DispatchQueue.global(qos: .userInteractive).async {
            if let file = Bundle.main.url(forResource: "words", withExtension: "txt") {
                if let contents = try? String(contentsOf: file){
                    
                    let lines = contents.components(separatedBy: "\n")
                    
                    self.hangManStrings = lines[0].components(separatedBy: ": ")[1].uppercased().components(separatedBy: ",")
                    self.alphabets = lines[1].components(separatedBy: ": ")[1].uppercased().components(separatedBy: ",")
                    self.answer = self.hangManStrings[0]
                    
                    DispatchQueue.main.async {
                        self.current.placeholder = String(repeating: "?", count: self.hangManStrings[0].count)
                    }
                    
                    for (index, button) in self.alphabetButtons.enumerated() {
                        DispatchQueue.main.async {
                            button.setTitle(self.alphabets[index], for: .normal)
                        }
                    }
                }
            }
        }
    }

}

