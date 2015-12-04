//
//  ViewController.m
//  Demo1
//
//  Created by 余丽丽 on 15/11/24.
//  Copyright © 2015年 余丽丽. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UIView *alertView;
@property (nonatomic, strong)NSIndexPath *indexPath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];

    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%02ld",indexPath.row];

    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.indexPath = indexPath;
    [self moveAlertView];

}


-(void)moveAlertView{
    CGRect cellRect = [self.tableView rectForRowAtIndexPath:self.indexPath];
    CGRect cellToView = [self.tableView convertRect:cellRect toView:self.view];
    CGFloat W = cellRect.size.width - 20;
    CGFloat H = 100;
    CGFloat X = cellRect.origin.x + 10;

    
    CGFloat Y = cellToView.origin.y - 100;
    
    if (Y < 0) {
        
        Y = cellToView.origin.y + cellRect.size.height;
    }
    
    
    if (self.alertView.frame.origin.y == Y) {
        
        self.alertView.frame = CGRectMake(0, 0, 0, 0);
        
    }else{

        self.alertView.frame = CGRectMake(X, Y, W, H);
    }

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    [self moveAlertView];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 20)];
    view.backgroundColor = [UIColor greenColor];
    return view;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 200;
}

-(UIView *)alertView{
    if (!_alertView) {
        UIView *alerView = [[UIView alloc] init];
        alerView.backgroundColor = [UIColor cyanColor];
        [self.view addSubview:alerView];
        _alertView = alerView;
        
    }
    return _alertView;
}

@end
