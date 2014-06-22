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
        self.tableView.reloadData()
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
    return 1
  }

  override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int
  {
    return todoItems.count
  }
  
  override func tableView(tableView: UITableView?, cellForRowAtIndexPath : NSIndexPath!) -> UITableViewCell?
  {
    let cell  = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "ToDoCell")
    var task           = todoItems[cellForRowAtIndexPath.row]
    
    cell.text          = task.itemName
    cell.accessoryType = task.completed ? UITableViewCellAccessoryType.Checkmark : UITableViewCellAccessoryType.None
    
    return cell
  }
}
