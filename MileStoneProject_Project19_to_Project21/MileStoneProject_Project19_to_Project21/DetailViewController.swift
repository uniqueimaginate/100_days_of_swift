//
//  DetailViewController.swift
//  MileStoneProject_Project19_to_Project21
//
//  Created by Peter on 2022/03/18.
//

import UIKit

protocol DetailViewDelegate: AnyObject {
    func makeNote(note: Note)
    func editNote(note: Note)
}

enum EditMode {
    case make
    case edit
}

class DetailViewController: UIViewController {

    weak var delegate: DetailViewDelegate?
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    
    var noteTitle: String?
    var noteContent: String?
    var mode: EditMode?
    var uuid: String?
    var dateString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch mode {
        case .make:
            let makeButton = UIBarButtonItem(title: "생성", style: .plain, target: self, action: #selector(finishMake))
            let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
            navigationItem.rightBarButtonItems = [makeButton, shareButton]
        case .edit:
            let editButton = UIBarButtonItem(title: "생성", style: .plain, target: self, action: #selector(finishEdit))
            let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
            navigationItem.rightBarButtonItems = [editButton, shareButton]
        default:
            print("nothing")
        }
        
        title = "글쓰기"
        navigationItem.largeTitleDisplayMode = .never
        
        if noteTitle != nil {
            textField.text = noteTitle
        }
        
        if noteContent != nil {
            textView.text = noteContent
        }
    }
    
    @objc func finishMake(){
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: date)
        let note = Note(uuid: UUID().uuidString, title: textField.text ?? "제목", content: textView.text, date: dateString)
        self.delegate?.makeNote(note: note)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func finishEdit(){
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: date)
        let note = Note(uuid: uuid!, title: textField.text ?? "제목", content: textView.text, date: dateString)
        self.delegate?.editNote(note: note)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func share(){
        var notte: Note?
        switch mode {
        case .make:
            notte = Note(uuid: UUID().uuidString, title: textField.text ?? "제목", content: textView.text, date: getDateString())
        case .edit:
            notte = Note(uuid: uuid!, title: textField.text ?? "제목", content: textView.text, date: self.dateString ?? "no date")
        default:
            print("nothing")
        }
        let noteString = notte!.title + notte!.content + notte!.date
        
        let vc = UIActivityViewController(activityItems: [noteString], applicationActivities: [])
        present(vc, animated: true)
    }
    
    func getDateString() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
