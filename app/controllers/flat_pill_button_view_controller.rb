class FlatPillButtonViewController < UITableViewController
  FlatButtonCellReuseID = "FlatButtonCell"

  def initWithStyle(style)
    super
    # self.tableView.registerClass(FlatPillButtonCell.class, forCellReuserIdentifier:FlatButtonCellReuseID)
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone
    self
  end

  def viewDidAppear(animated)
    super
    self.tableView.flashScrollIndicators
  end

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tableView, numberOfRowsInSection:section)
    40
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    40
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(FlatButtonCellReuseID) || begin
      FlatPillButtonCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:FlatButtonCellReuseID)
    end
    cell.selectionStyle = UITableViewCellSelectionStyleNone
    cell
  end

  def tableView(tableView, willSelectRowAtIndexPath:indexPath)
    nil
  end
end
