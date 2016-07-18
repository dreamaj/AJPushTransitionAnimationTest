//
//  SecondViewController.m
//  AJPushTransitionAnimation
//
//  Created by JBZ－IOS on 16/6/23.
//  Copyright © 2016年 DreamAJ. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondViewControllerAnimatedTransitioning.h"
#import "ViewController.h"

@interface SecondViewController ()<UINavigationControllerDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 168)];
    _headImageView.image = [UIImage imageNamed:@"redBag"];
    [self.view addSubview:_headImageView];
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(0, CGRectGetMaxY(_headImageView.frame) + 5, [UIScreen mainScreen].bounds.size.width, 100);
    label1.text = @"法制晚报讯（记者 温如军）今日下午，中纪委网站刊登回复网友“如何认定处理“对抗组织审查行为”时表示，审查时做出合理辩解或由于畏惧谈话时拒不交待，事后交代不属于“对抗组织审查”。中纪委表示，对党忠诚老实，是党章对党员的基本要求，也是党员的基本义务。（法制晚报微信公号ID：fzwb_52165216）近年来，部分党员干部在实施违纪行为后，特别是其违纪行为开始被组织调查后，往往实施对抗组织审查行为。干扰巡视等行为属于对抗组织审查中纪委称，实践中出现较多的是，被审查人在与其存在权钱交易关系的人员接受组织调查后，通过转移赃款赃物、订立攻守同盟、组织相关涉案人外逃、打探案情等方式，企图逃避组织调查。根据2016年《中国共产党纪律处分条例》（以下简称新《条例》）第五十七条之规定，此类行为应认定为违反政治纪律行为，根据情节轻重给予警告直至开除党籍处分。";
    label1.font = [UIFont systemFontOfSize:14];
    label1.textColor = [UIColor blackColor];
    label1.numberOfLines = 0;
    label1.alpha = 0;
    [self.view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.frame = CGRectMake(0, CGRectGetMaxY(label1.frame) + 5, [UIScreen mainScreen].bounds.size.width, 100);
    label2.text = @"法制晚报讯（记者 温如军）今日下午，中纪委网站刊登回复网友“如何认定处理“对抗组织审查行为”时表示，审查时做出合理辩解或由于畏惧谈话时拒不交待，事后交代不属于“对抗组织审查”。中纪委表示，对党忠诚老实，是党章对党员的基本要求，也是党员的基本义务。（法制晚报微信公号ID：fzwb_52165216）近年来，部分党员干部在实施违纪行为后，特别是其违纪行为开始被组织调查后，往往实施对抗组织审查行为。干扰巡视等行为属于对抗组织审查中纪委称，实践中出现较多的是，被审查人在与其存在权钱交易关系的人员接受组织调查后，通过转移赃款赃物、订立攻守同盟、组织相关涉案人外逃、打探案情等方式，企图逃避组织调查。根据2016年《中国共产党纪律处分条例》（以下简称新《条例》）第五十七条之规定，此类行为应认定为违反政治纪律行为，根据情节轻重给予警告直至开除党籍处分。";
    label2.font = [UIFont systemFontOfSize:14];
    label2.textColor = [UIColor blackColor];
    label2.numberOfLines = 0;
    label2.alpha = 0;
    [self.view addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] init];
    label3.frame = CGRectMake(0, CGRectGetMaxY(label2.frame) + 5, [UIScreen mainScreen].bounds.size.width, 100);
    label3.text = @"法制晚报讯（记者 温如军）今日下午，中纪委网站刊登回复网友“如何认定处理“对抗组织审查行为”时表示，审查时做出合理辩解或由于畏惧谈话时拒不交待，事后交代不属于“对抗组织审查”。中纪委表示，对党忠诚老实，是党章对党员的基本要求，也是党员的基本义务。（法制晚报微信公号ID：fzwb_52165216）近年来，部分党员干部在实施违纪行为后，特别是其违纪行为开始被组织调查后，往往实施对抗组织审查行为。干扰巡视等行为属于对抗组织审查中纪委称，实践中出现较多的是，被审查人在与其存在权钱交易关系的人员接受组织调查后，通过转移赃款赃物、订立攻守同盟、组织相关涉案人外逃、打探案情等方式，企图逃避组织调查。根据2016年《中国共产党纪律处分条例》（以下简称新《条例》）第五十七条之规定，此类行为应认定为违反政治纪律行为，根据情节轻重给予警告直至开除党籍处分。";
    label3.font = [UIFont systemFontOfSize:14];
    label3.textColor = [UIColor blackColor];
    label3.numberOfLines = 0;
    label3.alpha = 0;
    [self.view addSubview:label3];
    

    
    
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (int i = 0; i < 3; i++)
    {
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);   //i=10的时候开始等待
        dispatch_group_async(group, queue, ^{
            NSLog(@"%i",i);
            if (i == 0) {
                [UIView animateWithDuration:1.0 animations:^{
                    label1.alpha = 1;
                }];
            }else if ( i == 1){
                [UIView animateWithDuration:2.0 animations:^{
                    label2.alpha = 1;
                }];
            }else{
                [UIView animateWithDuration:3.0 animations:^{
                    label3.alpha = 1;
                }];
            
            }

            dispatch_semaphore_signal(semaphore);   //执行完以后通知信号量计数+1
        });
    }
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
 
    
    
    
    
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{

    if ([toVC isKindOfClass:[ViewController class]] ) {
        SecondViewControllerAnimatedTransitioning *transition = [[SecondViewControllerAnimatedTransitioning alloc] init];
        return transition;
    }else{
    
        return nil;
    
    }

}


-(void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
