//
//  StadiumViewController.swift
//  Stadium_Dash
//
//  Created by Jens Pedersen on 5/10/23.
//

import UIKit

class StadiumViewController: UIViewController {
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var backButton: UIBarButtonItem!
    var currentUser: Users
    @IBSegueAction func goToOrder(_ coder: NSCoder) -> VendorViewController? {
        return VendorViewController(coder, currentUser: currentUser)
    }
    
    init?(coder: NSCoder, currentUser: Users) {
        self.currentUser = currentUser
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "VendorViewController", sender: nil)
    }
    @IBAction func switchButtonPressed(_ sender: UISwitch) {
        switch sender{
        case wrigleySwitch:
            if wrigleySwitch.isOn{
                greatSwitch.isEnabled = false
                submitBtn.isEnabled = true
            } else {
                greatSwitch.isEnabled = true
                submitBtn.isEnabled = false
            }
        case greatSwitch:
            if greatSwitch.isOn{
                wrigleySwitch.isEnabled = false
                submitBtn.isEnabled = true
            } else {
                wrigleySwitch.isEnabled = true
                submitBtn.isEnabled = false
            }
        default:
            break
        }
    }
    @IBOutlet weak var greatSwitch: UISwitch!
    @IBOutlet weak var wrigleySwitch: UISwitch!
    @IBOutlet weak var submitBtn: UIButton!

    override func viewDidLoad() {
        submitBtn.isEnabled = false
        greatSwitch.isOn = false
        wrigleySwitch.isOn = false
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
