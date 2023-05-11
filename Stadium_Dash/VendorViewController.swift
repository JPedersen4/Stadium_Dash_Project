//
//  VendorViewController.swift
//  Stadium_Dash
//
//  Created by Jens Pedersen on 5/10/23.
//

import UIKit

class VendorViewController: UIViewController {
    
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
    
    @IBOutlet weak var vendorList: UIButton!
    
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var vendorButtonMenu: UIMenu!
    @IBAction func checkoutButtonPressed(_ sender: UIButton) {
        if totalCost > 0{
            performSegue(withIdentifier: "CheckoutViewController", sender: totalCost)
        }
    }
    
    @IBAction func vendorButtonPressed(_ sender: Any) {
        if vendorButtonMenu.
    }
    @IBOutlet weak var nachoToYaVendor: UICommand!
    @IBOutlet weak var hotDawgzVendor: UICommand!
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
        chiliTotalLabel.text = "\(chiliDogTotal)"
        chicagoTotalLabel.text = "\(chicagoDogTotal)"
        nachoTotalLabel.text = "\(nachoTotal)"
        nachoChixTotalLabel.text = "\(nachoChixTotal)"
        nachoChiliTotalLabel.text = "\(nachoChiliTotal)"
        hotDogTotalLabel.text = "\(hotDogTotal)"
        
        totalCost = (chiliDogPrice * chiliDogTotal) + (chicagoDogPrice * chicagoDogTotal) + (hotDogTotal * hotDogPrice)
        totalCost += (nachoPrice * nachoTotal) + (nachoChixTotal * nachoChixPrice) + (nachoChiliTotal * nachoChiliPrice)
        totalCostLabel.text = "$\(totalCost).00"
    }
    
    override func viewDidLoad() {
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
