import UIKit

//@objc(ToDoListController)
class ToDoListController: UITableViewController
{
  var todoItems = [ToDoItem(itemName:"Buy Milk",    completed:false),
                   ToDoItem(itemName:"Buy eggs",    completed:true),
                   ToDoItem(itemName:"Learn Swift", completed:true),
                   ToDoItem(itemName:"Read a book", completed:false)]
  
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
    navigationItem.leftBarButtonItem = self.editButtonItem()
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
  
  override func tableView(tableView: UITableView!, didSelectRowAtIndexPath : NSIndexPath!)
  {
    tableView.deselectRowAtIndexPath(didSelectRowAtIndexPath, animated: false)
    var task = self.todoItems[didSelectRowAtIndexPath.row] as ToDoItem
    task.completed = !task.completed
    tableView.reloadRowsAtIndexPaths([didSelectRowAtIndexPath], withRowAnimation: UITableViewRowAnimation.None)
  }
  
  override func tableView(tableView: UITableView?, commitEditingStyle: UITableViewCellEditingStyle, forRowAtIndexPath: NSIndexPath?)
  {
    if commitEditingStyle == .Delete
    {
      if let index = forRowAtIndexPath?.row
      {
        todoItems.removeAtIndex(index)
        tableView?.deleteRowsAtIndexPaths([forRowAtIndexPath!], withRowAnimation: .Fade)
      }
    }
    else if commitEditingStyle == .Insert
    {
    }
  }
  
  override func tableView(tableView: UITableView?, moveRowAtIndexPath : NSIndexPath?, toIndexPath: NSIndexPath?)
  {
  }
  
  override func tableView(tableView: UITableView?, canMoveRowAtIndexPath : NSIndexPath?) -> Bool
  {
    return true
  }
}
