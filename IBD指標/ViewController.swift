//
//  ViewController.swift
//  IBD指標
//
//  Created by 細川聖矢 on 2019/09/21.
//  Copyright © 2019 Seiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var pickerActivety : UIPickerView = UIPickerView()
    var activety = ["正常","軽度低下","中等度低下","重度低下"]
    
    var pickerAppetite : UIPickerView = UIPickerView()
    var appetite = ["正常","軽度低下","中等度低下","重度低下"]
    
    var pickerVommit : UIPickerView = UIPickerView()
    var vommit = ["なし","軽度(1回/週)","中等度(2~3回/週)","重度(3回以上/週)"]
    
    var pickerDiarrhea : UIPickerView = UIPickerView()
    var diarrhea = ["正常","軽度軟便","重度軟便","水溶性下痢"]
    
    var pickerFeces : UIPickerView = UIPickerView()
    var feces = ["なし","軽度増加(2~3回/週)あるいは粘血便","中等度増加(4~5回/週)","重度増加(5回以上/週)"]
    
    var pickerBodyWeight : UIPickerView = UIPickerView()
    var bodyweight = ["なし","軽度(5%以下)","中等度(5~10%以下)","重度(10%以上)"]
    
    var pickerAlb : UIPickerView = UIPickerView()
    var alb = ["2.0g/L以上","1.5~1.99g/L","1.2~1.49g/L","1.2g/L以下"]
    
    var pickerLeachate : UIPickerView = UIPickerView()
    var leachate = ["なし","軽度腹水あるいは抹消浮腫","中等度腹水と末梢浮腫","重度胸腹水と末梢浮腫"]
    
    var pickerItch : UIPickerView = UIPickerView()
    var itch = ["なし","時々","寝ているとき以外は頻繁","眠れないほど"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      var num:Int = pickerView.tag
        switch pickerView.tag{
        case 0:
            return activety.count
        case 1:
            return appetite.count
        case 2:
            return vommit.count
        case 3:
            return diarrhea.count
        case 4:
            return feces.count
        case 5:
            return bodyweight.count
        case 6:
            return alb.count
        case 7:
            return leachate.count
        case 8:
            return itch.count
       default:
           return 0}
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var num:Int = pickerView.tag
        switch num{
        case 0:
            return activety[row]
        case 1:
            return appetite[row]
        case 2:
            return vommit[row]
        case 3:
            return diarrhea[row]
        case 4:
            return feces[row]
        case 5:
            return bodyweight[row]
        case 6:
            return alb[row]
        case 7:
            return leachate[row]
        case 8:
            return itch[row]
        default:
            return ""}
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var num:Int = pickerView.tag
        switch num{
        case 0:
            activetyTextField.text = activety[row]
            activityValue = activety.firstIndex(of:"\(activety[row])")!
        case 1:
            appetiteTextField.text = appetite[row]
            appetiteValue = appetite.firstIndex(of:"\(appetite[row])")!
        case 2:
            VommitTextField.text = vommit[row]
            vommitValue = vommit.firstIndex(of:"\(vommit[row])")!
        case 3:
            diarrheaTextField.text = diarrhea[row]
            diarrheaValue = diarrhea.firstIndex(of:"\(diarrhea[row])")!
        case 4:
            fecesTextField.text = feces[row]
            fecesValue = feces.firstIndex(of:"\(feces[row])")!
        case 5:
            bodyWeightTextField.text = bodyweight[row]
            bodyWeightValue = bodyweight.firstIndex(of:"\(bodyweight[row])")!
        case 6:
            albTextField.text = alb[row]
            albValue = alb.firstIndex(of:"\(alb[row])")!
        case 7:
            leachateTextLabel.text = leachate[row]
            leachateValue = leachate.firstIndex(of:"\(leachate[row])")!
        case 8:
            itchTextField.text = itch[row]
            itchValue = itch.firstIndex(of:"\(itch[row])")!
        default:
            break}
    }
    
    
    
    
    @objc func donePressed() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Activety
        pickerActivety.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: pickerActivety.bounds.size.height)
        pickerActivety.tag = 0             // <<<<<<<<<<　追加
        pickerActivety.delegate   = self
        pickerActivety.dataSource = self
        
        let vi1 = UIView(frame: pickerActivety.bounds)
        vi1.backgroundColor = UIColor.white
        vi1.addSubview(pickerActivety)
        
        activetyTextField.inputView = vi1
        
        let toolBar1 = UIToolbar()
        toolBar1.barStyle = UIBarStyle.default
        toolBar1.isTranslucent = true
        toolBar1.tintColor = UIColor.black
        let doneButton1   = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector (ViewController.donePressed))
        
        let spaceButton1  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar1.setItems([spaceButton1, doneButton1], animated: false)
        toolBar1.isUserInteractionEnabled = true
        toolBar1.sizeToFit()
        activetyTextField.inputAccessoryView = toolBar1
        
        //Appetite
        pickerAppetite.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: pickerAppetite.bounds.size.height)
        pickerAppetite.tag = 1             // <<<<<<<<<<　追加
        pickerAppetite.delegate   = self
        pickerAppetite.dataSource = self
        
        let vi2 = UIView(frame: pickerAppetite.bounds)
        vi2.backgroundColor = UIColor.white
        vi2.addSubview(pickerAppetite)
        
        appetiteTextField.inputView = vi2
        
        let toolBar2 = UIToolbar()
        toolBar2.barStyle = UIBarStyle.default
        toolBar2.isTranslucent = true
        toolBar2.tintColor = UIColor.black
        let doneButton2   = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector (ViewController.donePressed))
        
        let spaceButton2  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar2.setItems([spaceButton2, doneButton2], animated: false)
        toolBar2.isUserInteractionEnabled = true
        toolBar2.sizeToFit()
        appetiteTextField.inputAccessoryView = toolBar2
        
        //vommit
        pickerVommit.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: pickerVommit.bounds.size.height)
        pickerVommit.tag = 2             // <<<<<<<<<<　追加
        pickerVommit.delegate   = self
        pickerVommit.dataSource = self
        
        let vi3 = UIView(frame: pickerVommit.bounds)
        vi3.backgroundColor = UIColor.white
        vi3.addSubview(pickerVommit)
        
        VommitTextField.inputView = vi3
        
        let toolBar3 = UIToolbar()
        toolBar3.barStyle = UIBarStyle.default
        toolBar3.isTranslucent = true
        toolBar3.tintColor = UIColor.black
        let doneButton3   = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector (ViewController.donePressed))
        
        let spaceButton3  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar3.setItems([spaceButton3, doneButton3], animated: false)
        toolBar3.isUserInteractionEnabled = true
        toolBar3.sizeToFit()
        VommitTextField.inputAccessoryView = toolBar3
        
        //diarrehea
        pickerDiarrhea.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: pickerDiarrhea.bounds.size.height)
        pickerDiarrhea.tag = 3             // <<<<<<<<<<　追加
        pickerDiarrhea.delegate   = self
        pickerDiarrhea.dataSource = self
        
        let vi4 = UIView(frame: pickerDiarrhea.bounds)
        vi4.backgroundColor = UIColor.white
        vi4.addSubview(pickerDiarrhea)
        
        diarrheaTextField.inputView = vi4
        
        let toolBar4 = UIToolbar()
        toolBar4.barStyle = UIBarStyle.default
        toolBar4.isTranslucent = true
        toolBar4.tintColor = UIColor.black
        let doneButton4 = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector (ViewController.donePressed))
        
        let spaceButton4 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar4.setItems([spaceButton4, doneButton4], animated: false)
        toolBar4.isUserInteractionEnabled = true
        toolBar4.sizeToFit()
        diarrheaTextField.inputAccessoryView = toolBar4
        
        //feces
        pickerFeces.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: pickerFeces.bounds.size.height)
        pickerFeces.tag = 4             // <<<<<<<<<<　追加
        pickerFeces.delegate   = self
        pickerFeces.dataSource = self
        
        let vi5 = UIView(frame: pickerFeces.bounds)
        vi5.backgroundColor = UIColor.white
        vi5.addSubview(pickerFeces)
        
        fecesTextField.inputView = vi5
        
        let toolBar5 = UIToolbar()
        toolBar5.barStyle = UIBarStyle.default
        toolBar5.isTranslucent = true
        toolBar5.tintColor = UIColor.black
        let doneButton5 = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector (ViewController.donePressed))
        
        let spaceButton5 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar5.setItems([spaceButton5, doneButton5], animated: false)
        toolBar5.isUserInteractionEnabled = true
        toolBar5.sizeToFit()
        fecesTextField.inputAccessoryView = toolBar5
        
        //bodyweght
        pickerBodyWeight.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: pickerBodyWeight.bounds.size.height)
        pickerBodyWeight.tag = 5             // <<<<<<<<<<　追加
        pickerBodyWeight.delegate   = self
        pickerBodyWeight.dataSource = self
        
        let vi6 = UIView(frame: pickerBodyWeight.bounds)
        vi6.backgroundColor = UIColor.white
        vi6.addSubview(pickerBodyWeight)
        
        bodyWeightTextField.inputView = vi6
        
        let toolBar6 = UIToolbar()
        toolBar6.barStyle = UIBarStyle.default
        toolBar6.isTranslucent = true
        toolBar6.tintColor = UIColor.black
        let doneButton6 = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector (ViewController.donePressed))
        
        let spaceButton6 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar6.setItems([spaceButton6, doneButton6], animated: false)
        toolBar6.isUserInteractionEnabled = true
        toolBar6.sizeToFit()
        bodyWeightTextField.inputAccessoryView = toolBar6
        
        //alb
        pickerAlb.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: pickerAlb.bounds.size.height)
        pickerAlb.tag = 6             // <<<<<<<<<<　追加
        pickerAlb.delegate   = self
        pickerAlb.dataSource = self
        
        let vi7 = UIView(frame: pickerAlb.bounds)
        vi7.backgroundColor = UIColor.white
        vi7.addSubview(pickerAlb)
        
        albTextField.inputView = vi7
        
        let toolBar7 = UIToolbar()
        toolBar7.barStyle = UIBarStyle.default
        toolBar7.isTranslucent = true
        toolBar7.tintColor = UIColor.black
        let doneButton7 = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector (ViewController.donePressed))
        
        let spaceButton7 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar7.setItems([spaceButton7, doneButton7], animated: false)
        toolBar7.isUserInteractionEnabled = true
        toolBar7.sizeToFit()
        albTextField.inputAccessoryView = toolBar7
        
        //leachate
        pickerLeachate.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: pickerLeachate.bounds.size.height)
        pickerLeachate.tag = 7             // <<<<<<<<<<　追加
        pickerLeachate.delegate   = self
        pickerLeachate.dataSource = self
        
        let vi8 = UIView(frame: pickerLeachate.bounds)
        vi8.backgroundColor = UIColor.white
        vi8.addSubview(pickerLeachate)
        
        leachateTextLabel.inputView = vi8
        
        let toolBar8 = UIToolbar()
        toolBar8.barStyle = UIBarStyle.default
        toolBar8.isTranslucent = true
        toolBar8.tintColor = UIColor.black
        let doneButton8 = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector (ViewController.donePressed))
        
        let spaceButton8 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar8.setItems([spaceButton8, doneButton8], animated: false)
        toolBar8.isUserInteractionEnabled = true
        toolBar8.sizeToFit()
        leachateTextLabel.inputAccessoryView = toolBar8
        
        //itch
        pickerItch.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: pickerItch.bounds.size.height)
        pickerItch.tag = 8             // <<<<<<<<<<　追加
        pickerItch.delegate   = self
        pickerItch.dataSource = self
        
        let vi9 = UIView(frame: pickerItch.bounds)
        vi9.backgroundColor = UIColor.white
        vi9.addSubview(pickerItch)
        
        itchTextField.inputView = vi9
        
        let toolBar9 = UIToolbar()
        toolBar9.barStyle = UIBarStyle.default
        toolBar9.isTranslucent = true
        toolBar9.tintColor = UIColor.black
        let doneButton9 = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector (ViewController.donePressed))
        
        let spaceButton9 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar9.setItems([spaceButton9, doneButton9], animated: false)
        toolBar9.isUserInteractionEnabled = true
        toolBar9.sizeToFit()
        itchTextField.inputAccessoryView = toolBar9
    }
    
    var calculateAnswer:Int = 0
    var activityValue = 0
    var appetiteValue = 0
    var vommitValue = 0
    var diarrheaValue = 0
    var fecesValue = 0
    var bodyWeightValue = 0
    var albValue = 0
    var leachateValue = 0
    var itchValue = 0

    @IBOutlet weak var activetyTextField: UITextField!
    @IBOutlet weak var appetiteTextField: UITextField!
    @IBOutlet weak var VommitTextField: UITextField!
    @IBOutlet weak var diarrheaTextField: UITextField!
    @IBOutlet weak var fecesTextField: UITextField!
    @IBOutlet weak var bodyWeightTextField: UITextField!
    @IBOutlet weak var albTextField: UITextField!
    @IBOutlet weak var leachateTextLabel: UITextField!
    @IBOutlet weak var itchTextField: UITextField!
    @IBAction func calculateButton(_ sender: Any) {
        calculateAnswer = activityValue + appetiteValue + vommitValue + diarrheaValue + fecesValue + bodyWeightValue + albValue + leachateValue + itchValue
        
        if (calculateAnswer <= 3){
            answerLabel.text = "\(String(calculateAnswer)):無症候性"
        } else if (calculateAnswer <= 5){
            answerLabel.text = "\(String(calculateAnswer)):軽度"
        } else if (calculateAnswer <= 8){
            answerLabel.text = "\(String(calculateAnswer)):中等度"
        }else if (calculateAnswer <= 11){
            answerLabel.text = "\(String(calculateAnswer)):重度"
        }else{
            answerLabel.text = "\(String(calculateAnswer)):極めて重度"
        }
        
        
    }
    
    @IBOutlet weak var answerLabel: UILabel!
    
    }



