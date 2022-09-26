//
//  ViewController.swift
//  StoryBoard
//
//  Created by user226757 on 9/26/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ButtonOutlet: UIButton!
    
    @IBOutlet weak var TextFielOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }
    
    @IBOutlet weak var buttonMostrarTexto: UIButton!
   
   
    @IBAction func buttonClicked(_ sender: Any) {
        print(TextFielOutlet.text)
    }
    

}

