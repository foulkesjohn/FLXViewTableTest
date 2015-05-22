#import "TestCell.h"
#import <FLXView/FLXView.h>
#import <FLXView/UIView+Flex.h>

@interface TestCell()

@property (nonatomic, strong) FLXView *flexView;
@property (nonatomic, strong) UILabel *stringLabel;

@end

@implementation TestCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style
              reuseIdentifier:reuseIdentifier];
  if (self) {
    self.flexView = [[FLXView alloc] initWithFrame:self.bounds];
    self.flexView.direction = FLXDirectionColumn;

    self.stringLabel = [UILabel new];
    self.stringLabel.numberOfLines = 0;
    self.stringLabel.flx_margins = FLXMarginsMake(10, 10, 10, 10);
    
    FLXView *rowView = [FLXView new];
    rowView.flx_selfAlignment = FLXSelfAlignmentStretch;
    rowView.direction = FLXDirectionRow;
    rowView.justification = FLXJustificationCenter;
    rowView.padding = FLXPaddingMake(0, 0, 10, 0);
    
    UIView *viewOne = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    viewOne.backgroundColor = [UIColor redColor];
    viewOne.flx_margins = FLXMarginsMake(0, 10, 0, 10);

    UIView *viewTwo = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    viewTwo.backgroundColor = [UIColor blueColor];
    viewTwo.flx_margins = FLXMarginsMake(0, 10, 0, 10);
    
    UIView *viewThree = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    viewThree.backgroundColor = [UIColor greenColor];
    viewThree.flx_margins = FLXMarginsMake(0, 10, 0, 10);
    
    [rowView addSubview:viewOne];
    [rowView addSubview:viewTwo];
    [rowView addSubview:viewThree];
    
    [self.flexView addSubview:self.stringLabel];
    [self.flexView addSubview:rowView];
    
    [self.contentView addSubview:self.flexView];
  }
  return self;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  CGRect frame = self.flexView.frame;
  frame.size = [self.flexView sizeThatFits:CGSizeMake(self.bounds.size.width, CGFLOAT_MAX)];
  self.flexView.frame = frame;
}

- (void)setString:(NSString *)string
{
  if (_string != string) {
    _string = string;
    self.stringLabel.text = string;
  }
}

- (CGSize)sizeThatFits:(CGSize)size
{
  return [self.flexView sizeThatFits:size];
}

@end