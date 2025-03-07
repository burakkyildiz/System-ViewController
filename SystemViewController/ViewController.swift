//
//  ViewController.swift
//  SystemViewController
//
//  Created by Burak on 8.03.2025.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    // MARK: - UI Elements
    @IBOutlet weak var imageView: UIImageView!
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Functions
    
    // MARK: - Actions

    @IBAction func shareButtonTapped(_ sender: UIButton) {
        guard let image = imageView.image else { return }
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    @IBAction func safariButtonTapped(_ sender: UIButton) {
        if let url = URL(string: "https://google.com"){
            // import SafariServices
            let safariControllar = SFSafariViewController(url: url)
            present(safariControllar, animated: true, completion: nil)
        }
    }
    
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func emailButtonTapped(_ sender: UIButton) {
    }
    
}

