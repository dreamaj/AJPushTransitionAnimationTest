//
//  MainCell.m
//  AJPushTransitionAnimation
//
//  Created by JBZ－IOS on 16/6/23.
//  Copyright © 2016年 DreamAJ. All rights reserved.
//

#import "MainCell.h"

@implementation MainCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _mainImageView = [[UIImageView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 294/2)/2, 168/4, 294/2, 168/2)];
        _mainImageView.image = [UIImage imageNamed:@"redBag"];
        [self addSubview:_mainImageView];
        
    }
    return self;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
