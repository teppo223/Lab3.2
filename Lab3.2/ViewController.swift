//
//  ViewController.swift
//  Lab3.2
//
//  Created by Tero Honkala on 10/09/2019.
//  Copyright © 2019 Tero Honkala. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController {

    @IBOutlet weak var EtextBrowser: UITextField!
    @IBOutlet weak var EtextEmail: UITextField!
    @IBOutlet weak var EtextCall: UITextField!
    @IBAction func OpenBrowser(_ sender: Any) {
        UIApplication.shared.open(NSURL(string: EtextBrowser.text!)! as URL)
    }
    @IBAction func SendEmail(_ sender: Any) {
        if MFMailComposeViewController.canSendMail(){
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = (self as! MFMailComposeViewControllerDelegate)
            mail.setToRecipients([EtextEmail.text!])
            mail.setMessageBody("Testi123", isHTML: true)
            
            present(mail, animated: true)
        }else {
            
        }
    }
    @IBAction func OpenCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = (self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate)
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    @IBAction func CreateCall(_ sender: Any) {
        guard let number = NSURL(string: "tel://" + EtextCall.text!) else { return }
        UIApplication.shared.open(number as URL)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?){
        controller.dismiss(animated: true)
    }

    @IBOutlet weak var URL: UITextField!
    
}

