class FlatPillButtonCell < UITableViewCell
  attr_accessor :buttonOne, :buttonTwo

  def initWithStyle(style, reuseIdentifier:reuseIdentifier)
    super
    self.buttonOne = FlatPillButton.alloc.init
    font = UIFont.fontWithName("Avenir-Black", size:18.0)

    self.buttonOne.setTitle("Button 1 Super Long", forState:UIControlStateNormal)
    self.buttonOne.setTitleColor(UIColor.lightGrayColor, forState:UIControlStateDisabled)
    self.buttonOne.titleLabel.font = font

    self.buttonTwo = FlatPillButton.alloc.init
    self.buttonTwo.setTitle("Button 2", forState:UIControlStateNormal)
    self.buttonTwo.setTitleColor(UIColor.lightGrayColor, forState:UIControlStateDisabled)
    self.buttonTwo.titleLabel.font = font

    self.randomizeIt

    self.contentView.addSubview(self.buttonOne)
    self.contentView.addSubview(self.buttonTwo)
    self
  end

  def layoutSubviews
    super
    buttonWidth = self.frame.size.width/2 - 3.0 * 4
    self.buttonOne.frame = CGRectMake(4, 2, buttonWidth, self.contentView.frame.size.height - 2)
    self.buttonTwo.frame = CGRectMake(CGRectGetMaxX(self.buttonOne.frame) + 4, 2, buttonWidth, self.contentView.frame.size.height - 2)
  end

  def prepareForReuse
    self.randomizeIt
  end

  def randomizeIt
    self.buttonOne.setTitleColor(UIColor.colorWithHue(rand(999999999) % 256 / 256.0, saturation:1.0, brightness:1.0, alpha:1.0), forState:UIControlStateNormal)
    self.buttonTwo.setTitleColor(UIColor.colorWithHue(rand(999999999) % 256 / 256.0, saturation:1.0, brightness:1.0, alpha:1.0), forState:UIControlStateNormal)

    self.buttonOne.enabled = [true, true, true, false].sample
    self.buttonTwo.enabled = [true, true, true, false].sample
    self.buttonOne.highlighted = [true, false, false, false].sample
    self.buttonTwo.highlighted = [true, false, false, false].sample
    self.buttonTwo.thickness = [1, 2, 3].sample
    self.buttonOne.thickness = [1, 2, 3].sample
  end
end
