//
//  ViewController.swift
//  BMICalculator
//
//  Created by cho on 1/3/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var heightTextField: UITextField!
    
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var weightTextField: UITextField!
    
    @IBOutlet var randomLabel: UILabel!
    @IBOutlet var resultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextField(heightTextField, text: "cm단위로 입력해주세요")
        setTextField(weightTextField, text: "kg단위로 입력해주세요")
        
        setLabel(heightLabel, text: "키가 어떻게 되시나요?")
        setLabel(weightLabel, text: "몸무게는 어떻게 되시나요?")
        
        
        setMainUI()
        setResultButton(resultButton)
        
        
    }
    
    func setMainUI() {
        imageView.image = .image
        
        mainLabel.text = "BMI Calculator"
        mainLabel.font = .boldSystemFont(ofSize: 30)
        
        subLabel.text = "당신의 BMI 지수를\n알려드릴게요."
        subLabel.numberOfLines = 2
        subLabel.textAlignment = .left
        subLabel.font = .systemFont(ofSize: 14)
        
        randomLabel.text = "랜덤으로 BMI 계산하기"
        randomLabel.textAlignment = .right
        randomLabel.textColor = .systemRed
        randomLabel.font = .systemFont(ofSize: 13)
        randomLabel.isUserInteractionEnabled = true
        
    }
    
   
    func setCalculate(height: Int, weight: Int) -> String {
        
        let heightDigitM: Double = Double(height) * 0.01
        let input = Double(weight) / (heightDigitM * heightDigitM)
        var result = ""
                
        switch input {
        case ...18.4:
            result = "저체중"
        case 18.5...22.9:
            result = "정상"
        case 23...24.9:
            result = "과체중"
        case 25...29.9:
            result = "경도비만"
        case 30...:
            result = "고도비만"
        default:
            print("오류발생")
        }
        
        return result
        
    }

    func setTextField(_ textField: UITextField, text: String) {
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = text
    }

    func setLabel(_ label: UILabel, text: String) {
        label.text = text
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
    }
    
    func setResultButton(_ button: UIButton) {
        button.setTitle("결과 확인", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 14
        
        
    }
    
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {

        
        guard let height = Int(heightTextField.text!) else {
            print("키에서 오류")
            return
        }
        guard let weight = Int(weightTextField.text!) else {
            print("몸무게에서 오류")
            return
        }
        
        print(height, weight)
        
        let alert = UIAlertController(title: "BMI 결과값", message: "당신의 BMI는 \(setCalculate(height: height, weight: weight))입니다!!", preferredStyle: .alert)
        
        let warning = UIAlertController(title: "다시 입력해주세요", message: "키는 50~300, 몸무게는 30~300사이의 '숫자'만 입력해주세요", preferredStyle: .alert)
        
        let button1 = UIAlertAction(title: "확인", style: .default)
        let button2 = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(button1)
        alert.addAction(button2)
        
        warning.addAction(button1)
        warning.addAction(button2)
        
        if height >= 50 && height <= 300 && weight >= 30 && weight <= 300 {
            present(alert, animated: true)
        } else {
            present(warning, animated: true)
        }
        
    }
    
    
    @IBAction func heightInputTextField(_ sender: UITextField) {
        
        //문자 입력했을 때, 오류 처리
        //공백이 빈칸 처리,,
        //범위가 이상한 경우 처리
        
        let input = Int(sender.text!)
        sender.placeholder = "cm단위로 입력해주세요"
        heightLabel.text = "키가 어떻게 되시나요?"
        
        guard let height = input else {
            sender.text = ""
            heightLabel.text = "다시입력해주세요"
            return
        }
        
        
        sender.text = String(height)
    }
    
    
    @IBAction func weightInputTextField(_ sender: UITextField) {
        //문자 입력했을 때, 오류 처리
        //공백이나 빈칸 처리,,
        //범위가 이상한 경우 처리
        
        let input = Int(sender.text!)
        sender.placeholder = "kg단위로 입력해주세요"
        weightLabel.text = "몸무게는 어떻게 되시나요?"
        
        guard let weight = input else {
            sender.text = ""
            weightLabel.text = "다시입력해주세요"
            return
        }
        sender.text = String(weight)
    }
    
 
    @IBAction func randomBMI(_ sender: UITapGestureRecognizer) {
        heightTextField.text = String(Int.random(in: 50...300))
        weightTextField.text = String(Int.random(in: 30...300))
    }
    
    
    @IBAction func keyboardDismiss(_ sender: UITextField) {
    }
    
    @IBAction func keyboardDismissTwo(_ sender: UITextField) {
    }
    
    
}

