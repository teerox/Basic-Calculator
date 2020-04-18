
import UIKit

class ViewController: UIViewController {
    
    private var calculate = CalculatorLogic()
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var isFinishedTyping:Bool = true
    
    var displayValue:Double {
        get{
            guard let num = Double(displayLabel.text!) else{
                fatalError("Cant Convert")
            }
            return num
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTyping = true
        calculate.setNum(displayValue)
        if let calMethod = sender.currentTitle{
            
            
            
            if let result = calculate.calculatorparameter(symbol: calMethod ) {
                displayValue = result
            }
            
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle{
            if isFinishedTyping{
                displayLabel.text = numValue
                isFinishedTyping = false
            }else{
                
                if numValue == "." {
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("Error Displayed")
                    }
                    
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    
                    if !isInt{
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
            
            
        }
        
    }
    
    
}

