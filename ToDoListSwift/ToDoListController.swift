import UIKit

//@objc(ToDoListController)
class ToDoListController: UITableViewController
{
  var todoItems = ToDoItem[]()

  init(style: UITableViewStyle)
  {
    super.init(style: style)
  }
  
  init(coder aDecoder: NSCoder!)
  {
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    println ("Tableview Loaded")
   }
  
  @IBAction func unwindToList (segue: UIStoryboardSegue?)
  {
    if let controller = segue?.sourceViewController as? ViewController
    {
      if let toDo = controller.todo
      {
        println ("adding" + toDo.itemName + " to list")
        todoItems.append(toDo)
      }
    }
  }
  
  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }

  // #pragma mark - Table view data source

  override func numberOfSectionsInTableView(tableView: UITableView?) -> Int
  {
    return 0
  }

  override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int
  {
    return 0
  }
}
