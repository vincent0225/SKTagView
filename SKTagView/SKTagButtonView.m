//
//  SKTagButtonView.m
//  Pods
//
//  Created by Vincent on 19/8/15.
//
//

#import "SKTagButtonView.h"
#import "SKTag.h"

@implementation SKTagButtonView



//+ (instancetype)buttonWithTag:(SKTag *)tag
//{
//    SKTagButtonView *view = [[[NSBundle mainBundle] loadNibNamed:@"SKTagButtonView" owner:self options:nil] objectAtIndex:0];
//    
//    if (tag.attributedText) {
//        view.titleLabel.attributedText = tag.attributedText;
//    } else {
//        view.titleLabel.text = tag.text;
//        view.titleLabel.textColor = tag.textColor;
//        view.titleLabel.font = tag.font ?: [UIFont systemFontOfSize:tag.fontSize];
//    }
//    view.backgroundColor = tag.bgColor;
//    view.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
//    
//    
//    if (tag.borderColor)
//    {
//        view.layer.borderColor = tag.borderColor.CGColor;
//    }
//    
//    if (tag.borderWidth)
//    {
//        view.layer.borderWidth = tag.borderWidth;
//    }
//    
//    view.userInteractionEnabled = tag.enable;
//    view.layer.cornerRadius = tag.cornerRadius;
//    view.layer.masksToBounds = YES;
//    view.backgroundColor = [UIColor redColor];
//    
//    return view;
//}

-(CGSize)intrinsicContentSize{
    return CGSizeMake(200,100);
}
@end
