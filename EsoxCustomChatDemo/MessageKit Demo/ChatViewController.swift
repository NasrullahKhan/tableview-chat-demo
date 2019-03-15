//
//  ChatViewController.swift
//  EsoxCustomChatDemo
//
//  Created by Nasrullah Khan  on 09/03/2019.
//  Copyright © 2019 Nasrullah Khan . All rights reserved.
//

import UIKit
import MessageKit
import MessageInputBar

class ChatViewController: MessagesViewController {

    var messages = [Message]()
    
    override func viewDidLoad() {
        
        messagesCollectionView = MessagesCollectionView(frame: .zero, collectionViewLayout: CustomMessagesFlowLayout())
        
        // outgoing text nib register
        let outgoingTextNib = UINib(nibName: "OutgoingTextCell", bundle: nil)
        messagesCollectionView.register(outgoingTextNib, forCellWithReuseIdentifier: "outgoingTextCellID")
        
        // outgoing photo nib register
        let outgoingPhotoNib = UINib(nibName: "OutgoingPhotoCell", bundle: nil)
        messagesCollectionView.register(outgoingPhotoNib, forCellWithReuseIdentifier: "outgoingPhotoCellID")

        // incoming text nib register
        let incomingTextNib = UINib(nibName: "IncomingTextCell", bundle: nil)
        messagesCollectionView.register(incomingTextNib, forCellWithReuseIdentifier: "incomingTextCellID")
        
        // incoming photo nib register
        let incomingPhotoNib = UINib(nibName: "IncomingPhotoCell", bundle: nil)
        messagesCollectionView.register(incomingPhotoNib, forCellWithReuseIdentifier: "incomingPhotoCellID")

        super.viewDidLoad()
        
        self.configureMessageCollectionView()
        self.configureMessageInputBar()
        self.loadMessages()
    }
    
    func configureMessageCollectionView() {
        self.messagesCollectionView.messagesDataSource = self
      //  self.messagesCollectionView.messageCellDelegate = self
        self.messagesCollectionView.messagesLayoutDelegate = self
        self.messagesCollectionView.messagesDisplayDelegate = self
        
        self.scrollsToBottomOnKeyboardBeginsEditing = true // default false
        self.maintainPositionOnKeyboardFrameChanged = true // default false
    }
    
    func configureMessageInputBar() {

        messageInputBar.isTranslucent = true
     //   messageInputBar.separatorLine.isHidden = false
        messageInputBar.inputTextView.tintColor = UIColor(red: 48/255, green: 165/255, blue: 255/255, alpha: 1)
        messageInputBar.inputTextView.backgroundColor = .white //UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        messageInputBar.inputTextView.placeholderTextColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        messageInputBar.inputTextView.textContainerInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 36)
        messageInputBar.inputTextView.placeholderLabelInsets = UIEdgeInsets(top: 8, left: 20, bottom: 8, right: 36)
        
        messageInputBar.inputTextView.layer.borderColor = UIColor(red: 56/255, green: 182/255, blue: 255/255, alpha: 1).cgColor
        messageInputBar.inputTextView.layer.borderWidth = 1.0
        messageInputBar.inputTextView.layer.cornerRadius = 19.0
        messageInputBar.inputTextView.layer.masksToBounds = true
        messageInputBar.inputTextView.scrollIndicatorInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        configureInputBarItems()
    }
    
    private func configureInputBarItems() {
    
        messageInputBar.setRightStackViewWidthConstant(to: 36, animated: false)

        messageInputBar.sendButton.contentEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        messageInputBar.sendButton.setSize(CGSize(width: 36, height: 36), animated: false)
        messageInputBar.sendButton.image = UIImage.init(named: "send")
        messageInputBar.sendButton.title = nil
        messageInputBar.textViewPadding.bottom = 8
        messageInputBar.setStackViewItems([], forStack: .bottom, animated: false)
        
    }
    
    func loadMessages() {
        for i in 1...15 {
            switch i {
            case 1:
                let message = Message.init(text: "Hello Hi Nasrullah \(i)", sender: Sender.init(id: "kami", displayName: "Kamran Ali"), messageId: String(i), date: Date())
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
                let message = Message.init(text: "Hello Hi Kamran \(i), 1234 1234", sender: Sender.init(id: "nasrullah", displayName: "Nasrullah Khan"), messageId: String(i), date: Date())
                self.messages.append(message)
            }
            
        }
        self.messagesCollectionView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            self.messagesCollectionView.scrollToBottom(animated: true)
        }
        
    }
    
    // MARK: - UICollectionViewDataSource
    
    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let messagesDataSource = messagesCollectionView.messagesDataSource else {
            fatalError("Ouch. nil data source for messages")
        }
        
        //        guard !isSectionReservedForTypingBubble(indexPath.section) else {
        //            return super.collectionView(collectionView, cellForItemAt: indexPath)
        //        }
        
        let message = messagesDataSource.messageForItem(at: indexPath, in: messagesCollectionView)
        
        if isFromCurrentSender(message: message) {
            switch message.kind {
            case .text(let text):
                let cell = messagesCollectionView.dequeueReusableCell(withReuseIdentifier: "outgoingTextCellID", for: indexPath) as! OutgoingTextCell
                cell.messageText.text = text
                cell.name.text = message.sender.displayName
                return cell
            case .photo(let media):
                let cell = messagesCollectionView.dequeueReusableCell(withReuseIdentifier: "outgoingPhotoCellID", for: indexPath) as! OutgoingPhotoCell
                cell.photo.image = media.image
                cell.name.text = message.sender.displayName
                return cell
            default:
                break
            }
            return super.collectionView(collectionView, cellForItemAt: indexPath)
        }else {
            switch message.kind {
            case .text(let text):
                let cell = messagesCollectionView.dequeueReusableCell(withReuseIdentifier: "incomingTextCellID", for: indexPath) as! IncomingTextCell
                cell.messageText.text = text
                cell.name.text = message.sender.displayName
                return cell
            case .photo(let media):
                let cell = messagesCollectionView.dequeueReusableCell(withReuseIdentifier: "incomingPhotoCellID", for: indexPath) as! IncomingPhotoCell
                cell.photo.image = media.image
                cell.name.text = message.sender.displayName
                return cell
            default:
                break
            }
            return super.collectionView(collectionView, cellForItemAt: indexPath)
        }
        
        
    }
}

// MARK: - MessagesDataSource
extension ChatViewController: MessagesDataSource {
   
    func currentSender() -> Sender {
        return Sender.init(id: "nasrullah", displayName: "Nasrullah Khan")
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return self.messages.count
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return self.messages[indexPath.section]
    }
    
    func cellTopLabelAttributedText(for message: MessageType,
                                    at indexPath: IndexPath) -> NSAttributedString? {
        
        let name = message.sender.displayName
        return NSAttributedString(
            string: name,
            attributes: [
                .font: UIFont.preferredFont(forTextStyle: .caption1),
                .foregroundColor: UIColor(white: 0.3, alpha: 1)
            ]
        )
    }
    
}



// MARK: - MessagesLayoutDelegate
extension ChatViewController: MessagesLayoutDelegate {
    
    func avatarSize(for message: MessageType, at indexPath: IndexPath,
                    in messagesCollectionView: MessagesCollectionView) -> CGSize {
        return .zero
    }
    
    func footerViewSize(for message: MessageType, at indexPath: IndexPath,
                        in messagesCollectionView: MessagesCollectionView) -> CGSize {
        return CGSize(width: 0, height: 8)
    }
    
//    func heightForLocation(message: MessageType, at indexPath: IndexPath,
//                           with maxWidth: CGFloat, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
//        return 0
//    }
//
}

// MARK: - MessagesDisplayDelegate

extension ChatViewController: MessagesDisplayDelegate {
    
    // MARK: - Text Messages
    
    func textColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? .white : .darkText
    }
    
    func detectorAttributes(for detector: DetectorType, and message: MessageType, at indexPath: IndexPath) -> [NSAttributedString.Key: Any] {
        return MessageLabel.defaultAttributes
    }
    
    func enabledDetectors(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> [DetectorType] {
        return [.url, .address, .phoneNumber, .date, .transitInformation]
    }
    
    // MARK: - All Messages
    
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? UIColor(red: 69/255, green: 193/255, blue: 89/255, alpha: 1) : UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
    }
    
}
