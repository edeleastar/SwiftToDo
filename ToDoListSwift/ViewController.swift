import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{
  @IBOutlet var toDoItem : UITextField
  @IBOutlet var cancel   : UIButton
  @IBOutlet var done     : UIButton
  var todo               : ToDoItem?
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)
  {
    if let button = sender as? NSObject
    {
      todo = button == done ? ToDoItem(itemName:toDoItem.text): nil
      println(todo?.itemName)
    }
  }
  
  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }
}

