//
//  SKTagButtonView.h
//  Pods
//
//  Created by Vincent on 19/8/15.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SKTag;

@interface SKTagButtonView : UIView

@property (weak,nonatomic) IBOutlet UILabel *titleLabel;
@property (weak,nonatomic) IBOutlet UIImageView *tagImg;
+ (instancetype)buttonWithTag:(SKTag *)tag;

@end
