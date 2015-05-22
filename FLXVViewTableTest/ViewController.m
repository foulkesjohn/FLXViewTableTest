#import "ViewController.h"
#import "TestCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *words;

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.words = @[ @"This is a string",
                  @"This is a another string that is slightly longer than the last string",
                  @"This is a really long string This is a really long string This is a really long string This is a really long string This is a really long string This is a really long stringThis is a really long string This is a really long string This is a really long string"];
  
  [self.tableView registerClass:[TestCell class] forCellReuseIdentifier:@"test"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.words.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  TestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test"
                                                   forIndexPath:indexPath];
  cell.string = self.words[indexPath.row];
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  TestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test"];
  cell.string = self.words[indexPath.row];
  CGSize size = [cell sizeThatFits:CGSizeMake(self.view.bounds.size.width, CGFLOAT_MAX)];
  return size.height;
}

@end