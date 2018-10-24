//
//  ViewController.swift
//  UIView
//
//  Created by TuVA1.FSU1 on 10/7/18.
//  Copyright © 2018 Steve. All rights reserved.
//

import UIKit
// Let ViewController can act as valid Text Field delegate
class ViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    // Access value from interface object
    // Modified the interface
    // Reference Builder -> ViewController (thực chất đã được khởi tạo)
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var buttonImageView: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var containerView: UIView!
    
//    let checkbox: CheckBox = CheckBox.loadView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // handle text field user input through delegate callback
//        nameTextField.delegate = self
        
//        containerView.addSubview(checkbox)
        
        
    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        checkbox.frame = containerView.bounds
//    }

    // MARK: Actions
    @IBAction func setDefaultLabel(_ sender: UIButton) {
        mealNameLabel.text = "Default text"
    }

    @IBAction func imageTouched(_ sender: UITapGestureRecognizer) {
        print("Click to image and trigger  ")
    }
    
    @IBAction func selectedPhoto(_ sender: UIButton) {
        nameTextField.resignFirstResponder()
        // Khởi tạo image Picker Controller
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        // present Image Picker 
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    //MARK: UIImagePickerControllerDelegate
    // Các trigger được trả về và được lắng nghe tương ứng với các phương thức ở dưới
    // Nếu ko có các phuong thức này thì picture Picker vẫn hoạt động nhưng View Controller ko thực thi
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
//        imageView.image = selectedImage
        buttonImageView.setImage(selectedImage, for: .normal)
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
}

