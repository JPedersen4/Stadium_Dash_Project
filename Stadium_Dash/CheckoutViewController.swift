//
//  CheckoutViewController.swift
//  Stadium_Dash
//
//  Created by Jens Pedersen on 5/10/23.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    @IBOutlet weak var savedPaymentStack: UIStackView!
    @IBAction func swithButtonPressed(_ sender: Any) {
        if savedPaymentSwitch.isOn == true{
            ccvTextField.isEnabled = false
            expirationTextField.isEnabled = false
            cardTextField.isEnabled = false
        }
        else{
            ccvTextField.isEnabled = true
            expirationTextField.isEnabled = true
            cardTextField.isEnabled = true
        }
    }
    @IBOutlet weak var nachoChiliQuantityLabel: UILabel!
    @IBOutlet weak var nachoQuantityLabel: UILabel!
    @IBOutlet weak var nachoChixQuantityLabel: UILabel!
    @IBOutlet weak var savedPaymentSwitch: UISwitch!
    @IBOutlet weak var chicDogQuantityLabel: UILabel!
    @IBOutlet weak var ccvTextField: UITextField!
    @IBOutlet weak var hotDogQuantityLabel: UILabel!
    @IBOutlet weak var chiliDogQuantityLabel: UILabel!
    @IBOutlet weak var expirationTextField: UITextField!
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var cardTextField: UITextField!
    @IBOutlet weak var orderMessageLabel: UILabel!
    @IBOutlet weak var chiliNachoStackView: UIStackView!
    @IBOutlet weak var chickenNachoStackView: UIStackView!
    @IBOutlet weak var nachoStackView: UIStackView!
    @IBOutlet weak var chicagoDogStackView: UIStackView!
    @IBOutlet weak var chiliDogStackView: UIStackView!
    @IBOutlet weak var hotDogStackView: UIStackView!
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        if savedPaymentSwitch.isOn == true{
            countOrder = 1
            orderMessageLabel.text = "Payment accepted, order for \(user.userName) will be delivered shortly!"
            updateUI()
        }
        if cardTextField.isEnabled == true{
            if (cardTextField.text?.isEmpty == false && expirationTextField.text?.isEmpty == false && ccvTextField.text?.isEmpty == false){
                countOrder = 1
                orderMessageLabel.text = "Payment accepted, order for \(user.userName) will be delivered shortly!"
                updateUI()
            }
        }
    }
    @IBOutlet weak var submitOrderButton: UIButton!
    var totalCost: CurrentOrder
    var user: Users
    var countOrder: Int = 0
    
    init?(coder: NSCoder, totalCost: CurrentOrder, user: Users) {
        self.user = user
        self.totalCost = totalCost
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        savedPaymentSwitch.isOn = false
        hotDogQuantityLabel.text = "\(totalCost.hotDog)"
        chiliDogQuantityLabel.text = "\(totalCost.chiliDog)"
        chicDogQuantityLabel.text = "\(totalCost.chicDog)"
        nachoQuantityLabel.text = "\(totalCost.nacho)"
        nachoChiliQuantityLabel.text = "\(totalCost.nachoChili)"
        nachoChixQuantityLabel.text = "\(totalCost.nachoChix)"
        totalCostLabel.text = "$\(totalCost.total).00"
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        if user.userName == "Guest" {
            savedPaymentStack.isHidden = true
        }
        if totalCost.nacho <= 0{
            nachoStackView.isHidden = true
        }
        if totalCost.nachoChix <= 0{
            chickenNachoStackView.isHidden = true
        }
        if totalCost.nachoChili <= 0{
            chiliNachoStackView.isHidden = true
        }
        if totalCost.hotDog <= 0{
            hotDogStackView.isHidden = true
        }
        if totalCost.chiliDog <= 0{
            chiliDogStackView.isHidden = true
        }
        if totalCost.chicDog <= 0{
            chicagoDogStackView.isHidden = true
        }
        if countOrder > -1{
            if countOrder == 0{
                orderMessageLabel.isHidden = true
            }
            else{
                orderMessageLabel.isHidden = false
            }
        }
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
