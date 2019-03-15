//
//  TableChatViewController.swift
//  EsoxCustomChatDemo
//
//  Created by Nasrullah Khan  on 14/03/2019.
//  Copyright © 2019 Nasrullah Khan . All rights reserved.
//

import UIKit
import MessageKit

class TableChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTxtView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var inputBarBgView: UIView!
    @IBOutlet weak var inputBarHeightConstraint: NSLayoutConstraint!
    
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.keyboardDismissMode = .onDrag
        
        // outgoing text nib register
        self.tableView.register(UINib(nibName: "OutgoingTextTVC", bundle: nil), forCellReuseIdentifier: "OutgoingTextTVCID")
        
        // outgoing photo nib register
        self.tableView.register(UINib(nibName: "OutgoingPhotoTVC", bundle: nil), forCellReuseIdentifier: "OutgoingPhotoTVCID")
        
        // incoming text nib register
        self.tableView.register(UINib(nibName: "IncomingTextTVC", bundle: nil), forCellReuseIdentifier: "IncomingTextTVCID")

        // incoming photo nib register
        self.tableView.register(UINib(nibName: "IncomingPhotoTVC", bundle: nil), forCellReuseIdentifier: "IncomingPhotoTVCID")

        self.tableView.estimatedRowHeight = 60
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        self.loadMessages()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.configureInpurBar()
    }
    
    @IBAction func attachBtnClicked(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func sendBtnClicked(_ sender: UIButton) {
        print(#function)
        self.messageTxtView.resignFirstResponder()
    }
    
    func configureInpurBar() {
        
        // add shadow at input bar top
        self.inputBarBgView.layer.masksToBounds = false
        self.inputBarBgView.layer.shadowColor = UIColor.black.cgColor
        self.inputBarBgView.layer.shadowOpacity = 0.2
        self.inputBarBgView.layer.shadowOffset = CGSize(width: 0, height: -2)
        self.inputBarBgView.layer.shadowRadius = 1
    }
    
    func loadMessages() {
        for i in 1...15 {
            switch i {
            case 1:
                let message = Message.init(text: "Hello Hi Kamran \(i), Hello Hi Kamran \(i), Hello Hi Kamran \(i), Hello Hi Kamran \(i), Hello Hi Kamran \(i), Hello Hi Kamran \(i),Hello Hi Kamran \(i), Hello Hi Kamran \(i)", sender: Sender.init(id: "kami", displayName: "Kamran Ali"), messageId: String(i), date: Date())
                self.messages.append(message)
            case 2:
                let message = Message.init(text: "Hello Hi Nasrullah \(i)", sender: Sender.init(id: "kami", displayName: "Kamran Ali"), messageId: String(i), date: Date())
                self.messages.append(message)
            case 3:
                let message = Message.init(text: "Hello Hi Kamran \(i), Hello Hi Kamran \(i), Hello Hi Kamran \(i)", sender: Sender.init(id: "nasrullah", displayName: "Nasrullah Khan"), messageId: String(i), date: Date())
                self.messages.append(message)
            case 4:
                let message = Message.init(text: "Hello Hi Kamran \(i), 1234 1234", sender: Sender.init(id: "nasrullah", displayName: "Nasrullah Khan"), messageId: String(i), date: Date())
                self.messages.append(message)
            case 5:
                let message = Message.init(text: "Hello Hi Kamran \(i), Hello Hi Kamran \(i), Hello Hi Kamran \(i), Hello Hi Kamran \(i), Hello Hi Kamran \(i), Hello Hi Kamran \(i),Hello Hi Kamran \(i), Hello Hi Kamran \(i)", sender: Sender.init(id: "kami", displayName: "Kamran Ali"), messageId: String(i), date: Date())
                self.messages.append(message)
            case 6:
                let message = Message.init(image: UIImage.init(named: "malaysia")!, sender: Sender.init(id: "kami", displayName: "Kamran Ali"), messageId: String(i), date: Date())
                self.messages.append(message)
            case 7:
                let message = Message.init(text: "Hello Hi Kamran \(i), 1234 1234", sender: Sender.init(id: "nasrullah", displayName: "Nasrullah Khan"), messageId: String(i), date: Date())
                self.messages.append(message)
            case 8:
                let message = Message.init(image: UIImage.init(named: "malaysia")!, sender: Sender.init(id: "nasrullah", displayName: "Nasrullah Khan"), messageId: String(i), date: Date())
                self.messages.append(message)
            default:
                let message = Message.init(text: "Hello Hi Kamran \(i), Hello Hi Kamran \(i), Hello Hi Kamran \(i), Hello Hi Kamran \(i), Hello Hi Kamran \(i), Hello Hi Kamran \(i),Hello Hi Kamran \(i), Hello Hi Kamran \(i)", sender: Sender.init(id: "kami", displayName: "Kamran Ali"), messageId: String(i), date: Date())
                self.messages.append(message)
            }
            
        }
        self.tableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            self.tableView.scrollToRow(at: IndexPath.init(row: self.messages.count - 1, section: 0), at: .bottom, animated: false)
        }
    }

}

extension TableChatViewController: UITableViewDataSource, UITableViewDelegate {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView.isDragging {
            cell.transform = CGAffineTransform.init(scaleX: 0.75, y: 0.75)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = self.messages[indexPath.row]
        switch indexPath.row {
        case 1...5:
            switch message.kind {
            case .text(let text):
                let cell = tableView.dequeueReusableCell(withIdentifier: "OutgoingTextTVCID", for: indexPath) as! OutgoingTextTVC
                cell.messageText.text = text
                return cell
            case .photo(let item):
                let cell = tableView.dequeueReusableCell(withIdentifier: "OutgoingPhotoTVCID", for: indexPath) as! OutgoingPhotoTVC
                cell.photo.image = item.image
                return cell
            default:
                break
            }
            
        default:
            switch message.kind {
            case .text(let text):
                let cell = tableView.dequeueReusableCell(withIdentifier: "IncomingTextTVCID", for: indexPath) as! IncomingTextTVC
                cell.messageText.text = text
                return cell
            case .photo(let item):
                let cell = tableView.dequeueReusableCell(withIdentifier: "IncomingPhotoTVCID", for: indexPath) as! IncomingPhotoTVC
                cell.photo.image = item.image
                return cell
            default:
                break
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch self.messages[indexPath.row].kind {
        case .photo:
            return self.view.frame.size.width * 0.45
        default:
            return UITableView.automaticDimension
        }
        
    }
}

extension TableChatViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {

    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.setUpTextviewHeight()
    }
    
    func setUpTextviewHeight(){
        let minheight:CGFloat = 60
        let maxheight:CGFloat = 180
        
        let height:CGFloat = self.messageTxtView.contentSize.height + 20 + 6
        
        if height >= minheight{
            if height >= maxheight{
                self.inputBarHeightConstraint.constant = maxheight
            }else{
                self.inputBarHeightConstraint.constant = height
            }
        }else{
            self.inputBarHeightConstraint.constant = minheight
        }
        view.setNeedsLayout()
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
    }

}
