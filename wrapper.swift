import UIKit

var greeting = "Hello World"


@propertyWrapper
struct EmailValidator {
    
    var value:String
    
    var wrappedValue: String{
        get{
            print("email-getter")
            return isValidEmail() ? value : ""
        }set{
            print("email-setter called")
            value = newValue
        }
    }
    
    func isValidEmail() -> Bool {
        let emailRegex = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
        return emailPredicate.evaluate(with: value)
     }
    
}

@propertyWrapper
struct Uppercase{
    
    var value:String
    
    var wrappedValue: String {
        get{
            print("name-getter called")
            return value.uppercased()
        }set{
            print("name-setter called")
            value = newValue
        }
    }
    

    
}

struct Employee {
    
    @Uppercase var name:String
    @EmailValidator var email:String
    
    
    func performAction() -> Bool {
        if !name.isEmpty{
            print("validation sucess \(name) : \(email) ")
            return true
        }else{
            print("validation failure \(name) : \(email)")
            return false
        }
    }
    
}

var obj = Employee(name: Uppercase(value: ""), email: EmailValidator(value: ""))
