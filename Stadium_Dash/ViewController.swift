//
//  ViewController.swift
//  Stadium_Dash
//
//  Created by Jens Pedersen on 4/26/23.

import UIKit

class ViewController: UIViewController {
    
    var user: Users = Users(userName: "", passWord: "")
    
    @IBSegueAction func login(_ coder: NSCoder) -> StadiumViewController? {
        return StadiumViewController(coder: coder, currentUser: user)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        switch sender {
        case loginBtn:
            if (userNameInputText.text == "JensP" && passwordInputText.text == "Gnome123"){
                user.userName = "JensP"
                user.passWord = "Gnome123"
                performSegue(withIdentifier: "login", sender: nil)
            }
        case guestBtn:
            user.userName = "Guest"
            user.passWord = "Guest"
            performSegue(withIdentifier: "login", sender: nil)
        default:
            break
        }

    }
    @IBOutlet weak var guestBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordInputText: UITextField!
    @IBOutlet weak var userNameInputText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

