//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Hayden on 7/13/18.
//  Copyright © 2018 Harrill, Hayden. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    @IBOutlet weak var outputDisplay: UITextField!
    
    @IBOutlet weak var inputDisplay: UITextField!
    
    
    var currentConverter: Converter = Converter(label:"fahrenheit to celcius", inputUnit:" °F", outputUnit:" °C")

    var inputValue: Double = 0
    var inputInt: Int = 0
    var outputValue: Double = 0
    var isDecimal: Bool = false
    var decimalLength: Double = 0
    var zeroPushed: Int = 0
    
    
    func calculateOutput(_ input: Double) -> Double {
        switch currentConverter.label {
            case converters[0].label:
                return fahrenheitToCelcius(inputValue)
            case converters[1].label:
                return celciusToFahrenheit(inputValue)
            case converters[2].label:
                return milesToKilometers(inputValue)
            case converters[3].label:
                return kilometersToMiles(input)
            default:
                return input
        }
    }
    
    func setText() {
        if (isDecimal){
            inputDisplay.text = "\(inputValue) \(currentConverter.inputUnit)"
            outputValue = calculateOutput(inputValue)
            outputDisplay.text = "\(outputValue) \(currentConverter.outputUnit)"
        }else {
            inputInt = Int(inputValue)
            inputDisplay.text = "\(inputInt) \(currentConverter.inputUnit)"
            outputValue = calculateOutput(inputValue)
            outputDisplay.text = "\(outputValue) \(currentConverter.outputUnit)"
        }
    }
    
    func fahrenheitToCelcius(_ input: Double) -> Double {
        return (input * 5/9) - 32
    }
    
    func celciusToFahrenheit(_ input: Double) -> Double {
        return (input * 9/5) + 32
    }
    
    func milesToKilometers(_ input: Double) -> Double {
        return input * 1.609344
    }
    
    func kilometersToMiles(_ input: Double) -> Double {
        return input / 1.609344
    }
    
    
    @IBAction func converterSelect(_ sender: UIButton) {
        let alert = UIAlertController(title: "choose converter", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: converters[0].label, style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
            self.inputDisplay.text = "\(self.inputValue) \(self.converters[0].inputUnit)"
            self.outputDisplay.text = "\(self.fahrenheitToCelcius(self.inputValue)) \(self.converters[0].outputUnit)"
            self.currentConverter = self.converters[0]
        }))
        alert.addAction(UIAlertAction(title: converters[1].label, style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
            self.inputDisplay.text = "\(self.inputValue) \(self.converters[1].inputUnit)"
            self.outputDisplay.text = "\(self.celciusToFahrenheit(self.inputValue)) \(self.converters[1].outputUnit)"
            self.currentConverter = self.converters[1]

        }))
        alert.addAction(UIAlertAction(title: converters[2].label, style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
            self.inputDisplay.text = "\(self.inputValue) \(self.converters[2].inputUnit)"
            self.outputDisplay.text = "\(self.milesToKilometers(self.inputValue)) \(self.converters[2].outputUnit)"
            self.currentConverter = self.converters[2]

        }))
        alert.addAction(UIAlertAction(title: converters[3].label, style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
            self.inputDisplay.text = "\(self.inputValue) \(self.converters[3].inputUnit)"
            self.outputDisplay.text = "\(self.kilometersToMiles(self.inputValue)) \(self.converters[3].outputUnit)"
            self.currentConverter = self.converters[3]

        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        inputValue = 0
        inputDisplay.text = "\(currentConverter.inputUnit)"
        outputDisplay.text = "\(currentConverter.outputUnit)"
        isDecimal = false
    }
    
    @IBAction func negativeButton(_ sender: UIButton) {
        if (isDecimal){
            inputValue = -inputValue
            inputDisplay.text = "\(inputValue) \(currentConverter.inputUnit)"
            outputValue = calculateOutput(inputValue)
            outputDisplay.text = "\(outputValue) \(currentConverter.outputUnit)"
        } else {
            inputValue = -inputValue
            setText()
        }
    }
    
    @IBAction func decimalButton(_ sender: UIButton) {
        if (!(isDecimal)){
            inputDisplay.text = "\(inputInt). \(currentConverter.inputUnit)"
            outputValue = calculateOutput(inputValue)
            outputDisplay.text = "\(outputValue) \(currentConverter.outputUnit)"
            isDecimal = true
        }
    }
    
    @IBAction func zeroButton(_ sender: UIButton) {
        if (isDecimal){
            decimalLength = Double(inputValue.description.count - inputInt.description.count + zeroPushed)
            inputDisplay.text = "\(inputValue)0 \(currentConverter.inputUnit)"
            outputValue = calculateOutput(inputValue)
            outputDisplay.text = "\(outputValue) \(currentConverter.outputUnit)"
            zeroPushed += 1
        } else {
            inputValue = (inputValue * 10)
            setText()
        }
        
    }
    
    @IBAction func oneButton(_ sender: UIButton) {
        if (isDecimal){
            if (inputValue == Double(inputInt)) {
                inputValue += 0.1
                setText()
                zeroPushed = 0
            } else {
                decimalLength = Double(inputValue.description.count - inputInt.description.count + zeroPushed)
                inputValue += (1 / pow(10, decimalLength))
                setText()
                zeroPushed = 0
            }
        } else {
            inputValue = (inputValue * 10) + 1
            setText()
        }
    }
    
    @IBAction func twoButton(_ sender: UIButton) {
        if (isDecimal){
            if (inputValue == Double(inputInt) && zeroPushed == 0) {
                inputValue += 0.2
                setText()
                zeroPushed = 0
            } else {
                decimalLength = Double(inputValue.description.count - inputInt.description.count + zeroPushed)
                inputValue += (2 / pow(10, decimalLength))
                setText()
                zeroPushed = 0
            }
        } else {
            inputValue = (inputValue * 10) + 2
            setText()
        }
    }
    
    @IBAction func threeButton(_ sender: UIButton) {
        if (isDecimal){
            if (inputValue == Double(inputInt)) {
                inputValue += 0.3
                setText()
                zeroPushed = 0
            } else {
                decimalLength = Double(inputValue.description.count - inputInt.description.count + zeroPushed)
                inputValue += (3 / pow(10, decimalLength))
                setText()
                zeroPushed = 0
            }
        } else {
            inputValue = (inputValue * 10) + 3
            setText()
        }
    }
    
    @IBAction func fourButton(_ sender: UIButton) {
        if (isDecimal){
            if (inputValue == Double(inputInt)) {
                inputValue += 0.4
                setText()
                zeroPushed = 0
            } else {
                decimalLength = Double(inputValue.description.count - inputInt.description.count + zeroPushed)
                inputValue += (4 / pow(10, decimalLength))
                setText()
                zeroPushed = 0
            }
        } else {
            inputValue = (inputValue * 10) + 4
            setText()

        }
    }
    
    @IBAction func fiveButton(_ sender: UIButton) {
        if (isDecimal){
            if (inputValue == Double(inputInt)) {
                inputValue += 0.5
                setText()
                zeroPushed = 0
            } else {
                decimalLength = Double(inputValue.description.count - inputInt.description.count + zeroPushed)
                inputValue += (5 / pow(10, decimalLength))
                setText()
                zeroPushed = 0
            }
        } else {
            inputValue = (inputValue * 10) + 5
            setText()

        }
    }
    
    @IBAction func sixButton(_ sender: UIButton) {
        if (isDecimal){
            if (inputValue == Double(inputInt)) {
                inputValue += 0.6
                setText()
                zeroPushed = 0
            } else {
                decimalLength = Double(inputValue.description.count - inputInt.description.count + zeroPushed)
                inputValue += (6 / pow(10, decimalLength))
                setText()
                zeroPushed = 0
            }
        } else {
            inputValue = (inputValue * 10) + 6
            setText()
        }
    }
    
    @IBAction func sevenButton(_ sender: UIButton) {
        if (isDecimal){
            if (inputValue == Double(inputInt)) {
                inputValue += 0.7
                setText()
                zeroPushed = 0
            } else {
                decimalLength = Double(inputValue.description.count - inputInt.description.count + zeroPushed)
                inputValue += (7 / pow(10, decimalLength))
                setText()
                zeroPushed = 0
            }
        } else {
            inputValue = (inputValue * 10) + 7
            setText()
        }
    }
    
    @IBAction func eightButton(_ sender: UIButton) {
        if (isDecimal){
            if (inputValue == Double(inputInt)) {
                inputValue += 0.8
                setText()
                zeroPushed = 0
            } else {
                decimalLength = Double(inputValue.description.count - inputInt.description.count + zeroPushed)
                inputValue += (8 / pow(10, decimalLength))
                setText()
                zeroPushed = 0
            }
        } else {
            inputValue = (inputValue * 10) + 8
            setText()
        }
    }
    
    @IBAction func nineButton(_ sender: UIButton) {
        if (isDecimal){
            if (inputValue == Double(inputInt)) {
                inputValue += 0.9
                setText()
                zeroPushed = 0
            } else {
                decimalLength = Double(inputValue.description.count - inputInt.description.count + zeroPushed)
                inputValue += (9 / pow(10, decimalLength))
                setText()
                zeroPushed = 0
            }
        } else {
            inputValue = (inputValue * 10) + 9
            setText()
        }
    }
    
    
    
    
    let converters = [Converter(label:"fahrenheit to celcius", inputUnit:" °F", outputUnit:" °C"),
                      Converter(label:"celcius to fahrenheit", inputUnit:" °C", outputUnit:" °F"),
                      Converter(label:"miles to kilometers", inputUnit:" mi", outputUnit:" km"),
                      Converter(label:"kilometers to miles", inputUnit:" km", outputUnit:" mi")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentConverter = converters[0]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
