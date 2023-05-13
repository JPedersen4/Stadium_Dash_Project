//
//  VendorViewController.swift
//  Stadium_Dash
//
//  Created by Jens Pedersen on 5/10/23.
//

import UIKit

class VendorViewController: UIViewController {
    
    var currentUser: Users
    
    init?(_ coder: NSCoder, currentUser: Users) {
        self.currentUser = currentUser
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var order: CurrentOrder = CurrentOrder(total: 0, chiliDog: 0, chicDog: 0, hotDog: 0, nacho: 0, nachoChili: 0, nachoChix: 0)
    


    
    var chiliDogTotal: Int = 0
    var chiliDogPrice: Int = 3
    var hotDogTotal: Int = 0
    var hotDogPrice: Int = 2
    var chicagoDogTotal: Int = 0
    var chicagoDogPrice: Int = 4
    //Totals for wanted dogs and prices
    
    var nachoTotal: Int = 0
    var nachoPrice: Int = 2
    var nachoChixTotal: Int = 0
    var nachoChixPrice: Int = 4
    var nachoChiliTotal: Int = 0
    var nachoChiliPrice: Int = 3
    //Totals for wanted nachos (totals meaning count) and prices
    
    var totalCost: Int = 0
    //total cost for the bill, applied to the UI

    @IBOutlet weak var checkoutButton: UIButton!
    
    @IBAction func vendorSwitchPressed(_ sender: UISwitch) {
        switch sender{
        case hotDawgzSwitch:
            if hotDawgzSwitch.isOn{
                nachoStackView.isHidden = true
                hotDawgStackView.isHidden = false
                nachoSwitch.isEnabled = false
                updateUI()
            }
            else{
                hotDawgStackView.isHidden = true
                nachoSwitch.isEnabled = true
                updateUI()
            }
        case nachoSwitch:
            if nachoSwitch.isOn{
                hotDawgStackView.isHidden = true
                nachoStackView.isHidden = false
                hotDawgzSwitch.isEnabled = false
                updateUI()
            }
            else{
                nachoStackView.isHidden = true
                hotDawgzSwitch.isEnabled = true
                updateUI()
            }
        default:
            break
        }
    }
    @IBOutlet weak var nachoSwitch: UISwitch!
    @IBOutlet weak var hotDawgzSwitch: UISwitch!
    @IBOutlet weak var vendorList: UIButton!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBSegueAction func checkout(_ coder: NSCoder) -> CheckoutViewController? {
        return CheckoutViewController(coder: coder, totalCost: order, user: currentUser)
    }
    @IBOutlet weak var nachoStackView: UIStackView!
    @IBAction func checkoutButtonPressed(_ sender: UIButton) {
        if totalCost > 0{
            performSegue(withIdentifier: "CheckoutViewController", sender: nil)
        }
    }
    

    @IBOutlet weak var hotDawgStackView: UIStackView!
    @IBOutlet weak var hotDogTotalLabel: UILabel!
    @IBOutlet weak var hotDogDeleteBtn: UIButton!
    @IBOutlet weak var hotDogAddBtn: UIButton!
    @IBOutlet weak var chicagoDeleteBtn: UIButton!
    @IBOutlet weak var chiliDogLabel: UILabel!
    @IBOutlet weak var chicagoDogLabel: UILabel!
    @IBOutlet weak var hotDogLabel: UILabel!
    @IBOutlet weak var chicagoAddBtn: UIButton!
    @IBOutlet weak var chiliDeleteBtn: UIButton!
    @IBOutlet weak var chiliAddBtn: UIButton!
    @IBOutlet weak var chiliTotalLabel: UILabel!
    @IBOutlet weak var chicagoTotalLabel: UILabel!
    
    @IBAction func vendorButtonPressed(_ sender: UIButton) {
        switch sender{
        case hotDogAddBtn:
            hotDogTotal += 1
            updateUI()
        case hotDogDeleteBtn:
            if hotDogTotal > 0 {
                hotDogTotal -= 1
                updateUI()
            }
        case chiliAddBtn:
            chiliDogTotal += 1
            updateUI()
        case chiliDeleteBtn:
            if chiliDogTotal > 0 {
                chiliDogTotal -= 1
                updateUI()
            }
        case chicagoAddBtn:
            chicagoDogTotal += 1
            updateUI()
        case chicagoDeleteBtn:
            if chicagoDogTotal > 0 {
                chicagoDogTotal -= 1
                updateUI()
            }
        case nachoAddBtn:
            nachoTotal += 1
            updateUI()
        case nachoDeleteBtn:
            if nachoTotal > 0 {
                nachoTotal -= 1
                updateUI()
            }
        case nachoChixAddBtn:
            nachoChixTotal += 1
            updateUI()
        case nachoChixDeleteBtn:
            if nachoChixTotal > 0 {
                nachoChixTotal -= 1
                updateUI()
            }
        case nachoChiliAddBtn:
            nachoChiliTotal += 1
            updateUI()
        case nachoChiliDeleteBtn:
            if nachoChiliTotal > 0 {
                nachoChiliTotal -= 1
                updateUI()
            }
        default:
            break
        }
    }
    
    @IBOutlet weak var nachoChiliTotalLabel: UILabel!
    @IBOutlet weak var nachoChiliDeleteBtn: UIButton!
    @IBOutlet weak var nachoChiliAddBtn: UIButton!
    @IBOutlet weak var nachoChiliLabel: UILabel!
    @IBOutlet weak var nachoChixTotalLabel: UILabel!
    @IBOutlet weak var nachoChixDeleteBtn: UIButton!
    @IBOutlet weak var nachoChixAddBtn: UIButton!
    @IBOutlet weak var nachoChixLabel: UILabel!
    @IBOutlet weak var nachoTotalLabel: UILabel!
    @IBOutlet weak var nachoDeleteBtn: UIButton!
    @IBOutlet weak var nachoAddBtn: UIButton!
    @IBOutlet weak var nachoLabel: UILabel!
    
    func updateUI() {
        if nachoStackView.isHidden == true {
            if hotDawgStackView.isHidden == false {
                chicagoTotalLabel.text = "\(chicagoDogTotal)"
                chiliTotalLabel.text = "\(chiliDogTotal)"
                hotDogTotalLabel.text = "\(hotDogTotal)"
            }
        } else {
            nachoTotalLabel.text = "\(nachoTotal)"
            nachoChixTotalLabel.text = "\(nachoChixTotal)"
            nachoChiliTotalLabel.text = "\(nachoChiliTotal)"
        }
        
        totalCost = (chiliDogPrice * chiliDogTotal) + (chicagoDogPrice * chicagoDogTotal) + (hotDogTotal * hotDogPrice)
        totalCost += (nachoPrice * nachoTotal) + (nachoChixTotal * nachoChixPrice) + (nachoChiliTotal * nachoChiliPrice)
        totalCostLabel.text = "$\(totalCost).00"
        order.total = totalCost
        order.chicDog = chicagoDogTotal
        order.chiliDog = chiliDogTotal
        order.hotDog = hotDogTotal
        order.nacho = nachoTotal
        order.nachoChix = nachoChixTotal
        order.nachoChili = nachoChiliTotal
    }
    
    override func viewDidLoad() {
        nachoStackView.isHidden = true
        hotDawgStackView.isHidden = true
        hotDawgzSwitch.isOn = false
        nachoSwitch.isOn = false
        super.viewDidLoad()
        updateUI()
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
