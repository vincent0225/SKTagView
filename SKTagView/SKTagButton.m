//
// Created by Shaokang Zhao on 15/1/12.
// Copyright (c) 2015 Shaokang Zhao. All rights reserved.
//

#import "SKTagButton.h"
#import "SKTag.h"

@implementation SKTagButton

+ (instancetype)buttonWithTag:(SKTag *)tag
{
	SKTagButton *btn = [super buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
	if (tag.attributedText) {
		[btn setAttributedTitle:tag.attributedText forState:UIControlStateNormal];
	} else {
		[btn setTitle:tag.text forState:UIControlStateNormal];
		[btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		btn.titleLabel.font = tag.font ?: [UIFont systemFontOfSize:tag.fontSize];
	}
   
    
    
	btn.backgroundColor = [UIColor whiteColor];
	btn.contentEdgeInsets = tag.padding;
	btn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
	
    if (tag.bgImg)
    {
        [btn setBackgroundImage:tag.bgImg forState:UIControlStateNormal];
    }
    
    if (tag.borderColor)
    {
        btn.layer.borderColor = tag.borderColor.CGColor;
    }
    
    if (tag.borderWidth)
    {
        btn.layer.borderWidth = tag.borderWidth;
    }
    
    btn.userInteractionEnabled = tag.enable;
    
    btn.layer.cornerRadius = 20;
    btn.layer.masksToBounds = YES;
    
    return btn;
}

- (void)swapImageText
{
    self.transform = CGAffineTransformScale(self.transform, -1.0f, 1.0f);
    self.titleLabel.transform = CGAffineTransformScale(self.titleLabel.transform, -1.0f, 1.0f);
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, -1.0f, 1.0f);

}



@end
