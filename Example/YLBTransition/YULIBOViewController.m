//
//  YULIBOViewController.m
//  YLBTransition
//
//  Created by ProBobo on 10/09/2020.
//  Copyright (c) 2020 ProBobo. All rights reserved.
//

#import "YULIBOViewController.h"
#import "YULIBOSecondController.h"
#import <YLBTransition/YLBNavigationController.h>

@interface YULIBOViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray *array;

@end

@implementation YULIBOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    [[UIApplication sharedApplication].delegate window].rootViewController = [[YLBNavigationController alloc] initWithRootViewController:self];
    self.array = @[@"AnimateTypeDefault",@"AnimateTypeDiffNavi",@"AnimateTypeKuGou",@"AnimateTypeRound",@"AnimationOval"];
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(100, 100, 70, 200);
//    [btn setBackgroundImage:[UIImage imageNamed:@"111.png"] forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:btn];
//    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UITableView *tableView  = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.rowHeight     = 60;
    tableView.delegate      = self;
    tableView.dataSource    = self;
    [self.view addSubview:tableView];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)btnClick:(UIButton *)btn {
    YULIBOSecondController *vc = [[YULIBOSecondController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    YULIBOSecondController *vc = [[YULIBOSecondController alloc] init];
    YLBNavigationController *navi = (YLBNavigationController *)self.navigationController;
    navi.animationType = indexPath.row;
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

@end
