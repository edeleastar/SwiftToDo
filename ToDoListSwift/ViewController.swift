import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{
  @IBOutlet var toDoItem: UITextField
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    toDoItem.delegate = self
  }
  
  func textFieldShouldReturn(textField: UITextField!) -> Bool
  {
    println(toDoItem.text)
    return true
  }
  
  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }
}

