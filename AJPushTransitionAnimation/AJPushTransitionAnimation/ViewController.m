//
//  ViewController.m
//  AJPushTransitionAnimation
//
//  Created by JBZ－IOS on 16/6/22.
//  Copyright © 2016年 DreamAJ. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "MainViewControllerAnimatedTransitioning.h"
#import "MainCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate>
{
    NSArray *_dataArr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _mainTableView.backgroundColor = [UIColor lightGrayColor];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    [_mainTableView registerClass:[MainCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_mainTableView];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}

#pragma mark - UINavigationControllerDelegate
-(id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{

    if ([toVC isKindOfClass:[SecondViewController class]]) {
        MainViewControllerAnimatedTransitioning *transition = [[MainViewControllerAnimatedTransitioning alloc] init];
        return transition;
    }else{
        return  nil;
    }

}

#pragma mark - TableViewDelegate && TableViewDataSource
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    SecondViewController *svc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:svc animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 5;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 168.0;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell) {
        cell = [[MainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
