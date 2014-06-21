import UIKit

class ToDoListController: UITableViewController
{
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
