//
//  ViewController.swift
//  SystemViewController
//
//  Created by Burak on 8.03.2025.
//

import MessageUI
import SafariServices
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate, MFMailComposeViewControllerDelegate
{

    // MARK: - UI Elements
    @IBOutlet weak var imageView: UIImageView!

    // MARK: - Properties

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Functions
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey:
            Any]
    ) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            return
        }
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Actions
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        guard let image = imageView.image else { return }
        let activityController = UIActivityViewController(
            activityItems: [image], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    @IBAction func safariButtonTapped(_ sender: UIButton) {
        if let url = URL(string: "https://google.com") {
            // import SafariServices
            let safariControllar = SFSafariViewController(url: url)
            present(safariControllar, animated: true, completion: nil)
        }
    }

    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        // UIImagePickerControllerDelegate, UINavigationControllerDelegate
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self

        let alertController = UIAlertController(
            title: "Which one do you want to choose?",
            message: "Camera or Library", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) {
            alert in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }
        let libraryAction = UIAlertAction(title: "Library", style: .default) {
            alert in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(
            title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cameraAction)
        alertController.addAction(libraryAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func emailButtonTapped(_ sender: UIButton) {
        // import MessageUI
        guard MFMailComposeViewController.canSendMail() else { return }
        let mailComposeController = MFMailComposeViewController()
        // MFMailComposeViewControllerDelegate
        mailComposeController.mailComposeDelegate = self
        mailComposeController.setToRecipients(["burakkyildiz@icloud.com"])
        mailComposeController.setSubject( "Test Mail" )
        mailComposeController.setMessageBody( "Hello, this is a test email!", isHTML: false )
    }
}
