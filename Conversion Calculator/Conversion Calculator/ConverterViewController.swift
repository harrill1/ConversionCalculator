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
    
    @IBAction func converterSelect(_ sender: UIButton) {
        let alert = UIAlertController(title: "choose converter", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: converters[0].label, style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
            self.inputDisplay.text = self.converters[0].inputUnit
            self.outputDisplay.text = self.converters[0].outputUnit
        }))
        alert.addAction(UIAlertAction(title: converters[1].label, style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
            self.inputDisplay.text = self.converters[1].inputUnit
            self.outputDisplay.text = self.converters[1].outputUnit
        }))
        alert.addAction(UIAlertAction(title: converters[2].label, style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
            self.inputDisplay.text = self.converters[2].inputUnit
            self.outputDisplay.text = self.converters[2].outputUnit
        }))
        alert.addAction(UIAlertAction(title: converters[3].label, style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
            self.inputDisplay.text = self.converters[3].inputUnit
            self.outputDisplay.text = self.converters[3].outputUnit
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    let converters = [Converter(label:"fahrenheit to celcius", inputUnit:"°F", outputUnit:"°C"),
                      Converter(label:"celcius to fahrenheit", inputUnit:"°C", outputUnit:"°F"),
                      Converter(label:"miles to kilometers", inputUnit:"mi", outputUnit:"km"),
                      Converter(label:"kilometers to miles", inputUnit:"km", outputUnit:"mi")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
