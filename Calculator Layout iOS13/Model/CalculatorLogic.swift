
import Foundation

struct CalculatorLogic{
    
    private var number:Double?
    
    private var intermidatealCalculation:(n1:Double, calMethod:String)?
    
    
    mutating func setNum(_ number:Double){
        self.number = number
    }
    
    
    mutating func calculatorparameter(symbol:String)-> Double? {
        if let n = number{
            if symbol == "+/-" {
                return n * -1
            }
            else if symbol == "AC"{
                return 0
            }
            else if symbol == "%"{
                return n * 0.01
            }else if symbol == "="{
                return performCalculation(n2:n)
            }else{
                intermidatealCalculation = (n1:n,calMethod:symbol)
            }
            
        }
        return nil
    }
    
    private func performCalculation(n2:Double) -> Double?{
        
        if let n1 = intermidatealCalculation?.n1,
            let operation = intermidatealCalculation?.calMethod{
            if operation == "+"{
                return n1 + n2
            }
            else if operation == "-"{
                return n1 - n2
            }
            else if operation == "×"{
                return n1 * n2
            }else{
                return n1 / n2
            }
        }
        return nil
    }
    
}
