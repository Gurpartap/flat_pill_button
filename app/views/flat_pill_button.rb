class FlatPillButton < UIButton
  FlatPillButtonNormalLineWidth = 2.0

  def button
    FlatPillButton.buttonWithType(UIButtonTypeCustom)
  end

  def initWithFrame(frame)
    super
    self.setTitleColor(UIColor.blackColor, forState:UIControlStateNormal)
    self.setTitleColor(UIColor.whiteColor, forState:UIControlStateHighlighted)
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 8)
    self
  end

  def drawRect(rect)
    ctx = UIGraphicsGetCurrentContext()

    case self.state
    when UIControlStateHighlighted, UIControlStateSelected
      strokeColor = self.titleColorForState(UIControlStateNormal) ? self.titleColorForState(UIControlStateNormal).CGColor : UIColor.blackColor.CGColor
      fillColor   = self.titleColorForState(UIControlStateNormal) ? self.titleColorForState(UIControlStateNormal).CGColor : UIColor.blackColor.CGColor
    when UIControlStateDisabled
      strokeColor = self.titleColorForState(UIControlStateDisabled) ? self.titleColorForState(UIControlStateDisabled).CGColor : UIColor.blackColor.CGColor
      fillColor   = self.titleColorForState(UIControlStateDisabled) ? self.titleColorForState(UIControlStateDisabled).CGColor : UIColor.blackColor.CGColor
    else
      strokeColor = self.titleColorForState(UIControlStateNormal) ? self.titleColorForState(UIControlStateNormal).CGColor : UIColor.blackColor.CGColor
      fillColor   = UIColor.clearColor.CGColor
    end

    CGContextSetFillColorWithColor(ctx, fillColor)
    CGContextSetStrokeColorWithColor(ctx, strokeColor)
  
    CGContextSaveGState(ctx)
    
    lineWidth = self.thickness
  
    CGContextSetLineWidth(ctx, lineWidth)
  
    outlinePath = UIBezierPath.bezierPathWithRoundedRect(CGRectInset(self.bounds, lineWidth, lineWidth), cornerRadius:self.bounds.size.height/2)
 
    CGContextAddPath(ctx, outlinePath.CGPath)
    CGContextStrokePath(ctx)
  
    CGContextRestoreGState(ctx)
  
    if (self.highlighted?)
      CGContextSaveGState(ctx)
      fillPath = UIBezierPath.bezierPathWithRoundedRect(CGRectInset(self.bounds, lineWidth * 2.5, lineWidth * 2.5), cornerRadius:self.bounds.size.height/2)
    
      CGContextAddPath(ctx, fillPath.CGPath)
      CGContextFillPath(ctx)
    
      CGContextRestoreGState(ctx)
    end
  end

  def layoutSubviews
    super
    self.setNeedsDisplay
  end

  def highlighted=(highlighted)
    super
    self.setNeedsDisplay
  end

  def selected=(selected)
    super
    self.setNeedsDisplay
  end

  def enabled=(enabled)
    super
    self.setNeedsDisplay
  end

  def frame=(frame)
    super
    self.setNeedsDisplay
  end

  def thickness=(thickness)
    @thickness = thickness
    self.setNeedsDisplay
  end

  def thickness
    @thickness || FlatPillButtonNormalLineWidth
  end
end
