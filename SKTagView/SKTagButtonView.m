//
//  SKTagButtonView.m
//  Pods
//
//  Created by Vincent on 19/8/15.
//
//

#import "SKTagButtonView.h"
#import "SKTag.h"
#import "Masonry.h"


@implementation SKTagButtonView


+ (instancetype)buttonWithTag:(SKTag *)tag
{
    SKTagButtonView *btn = [[SKTagButtonView alloc]init];
    UILabel *label = [[UILabel alloc]init];
    UILabel *plusLabel = [[UILabel alloc]init];
    
    [btn addSubview:label];
    [btn addSubview:plusLabel];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btn.mas_left).with.offset(0);
        make.centerY.equalTo(btn);
    }];
    [plusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(btn.mas_right).with.offset(0);
        make.centerY.equalTo(btn);
    }];
    
    if (tag.attributedText) {
        label.attributedText = tag.attributedText;
    } else {
        label.font = tag.font ?:[UIFont systemFontOfSize:tag.fontSize];
        label.text = tag.text;
    }
    
    btn.backgroundColor = [UIColor whiteColor];
    
    
    if (tag.borderColor)
    {
        btn.layer.borderColor = tag.borderColor.CGColor;
    }
    
    if (tag.borderWidth)
    {
        btn.layer.borderWidth = tag.borderWidth;
    }
    
    btn.userInteractionEnabled = tag.enable;
    
    btn.layer.cornerRadius = tag.cornerRadius;
    btn.layer.masksToBounds = YES;
    
    return btn;
}
@end
