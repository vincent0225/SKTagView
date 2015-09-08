//
//  ViewController.m
//  WrapViewWithAutolayout
//
//  Created by shiweifu on 12/9/14.
//  Copyright (c) 2014 shiweifu. All rights reserved.
//

#import "ViewController.h"
#import "SKTagView.h"
#import <Masonry/Masonry.h>
#import <HexColors/HexColor.h>
#import "UIView+Autolayout.h"

@interface ViewController ()
@property (strong, nonatomic) SKTagView *tagView;
@property (nonatomic, strong) NSArray *colorPool;
@property (weak, nonatomic) IBOutlet UIScrollView *tagContainerView;
@property (weak, nonatomic) IBOutlet UITextField *index;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.colorPool = @[@"#7ecef4", @"#84ccc9", @"#88abda",@"#7dc1dd",@"#b6b8de"];
    self.tagView = ({
        SKTagView *view = [SKTagView new];
        view.backgroundColor = UIColor.whiteColor;
        view.padding    = UIEdgeInsetsMake(12, 12, 12, 12);
        view.insets    = 15;
        view.lineSpace = 10;
        __weak SKTagView *weakView = view;
        view.didClickTagAtIndex = ^(NSUInteger index){
            //Remove tag
            [weakView removeTagAtIndex:index];
        };
        view;
    });
    self.tagView.backgroundColor = [UIColor purpleColor];
    [self.tagContainerView addSubViewWithAutolayout:self.tagView];
    
    [self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        UIView *superView = self.view;
        make.width.equalTo(superView.mas_width).with.offset(0);
        //        make.centerY.equalTo(superView.mas_centerY).with.offset(0);
        //        make.leading.equalTo(superView.mas_leading).with.offset(0);
        //        make.trailing.equalTo(superView.mas_trailing);
    }];
    NSLog(@"view will appear");
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupTagView];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"view did appear");
    
}

- (void)setupTagView
{
    //Add Tags
//    [@[@"Python", @"Javascript", @"Python", @"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"Python", @"Javascript", @"Python", @"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"Python", @"Javascript", @"Python", @"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"Python", @"Javascript", @"Python", @"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"HTML"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
//     {
//         SKTag *tag = [SKTag tagWithText:obj];
//         tag.textColor = [UIColor whiteColor];
//         NSArray *array = @[@15,@23,@28];
//         
//         tag.fontSize = ((NSNumber*)array[idx % 3]).floatValue;
//         //tag.font = [UIFont fontWithName:@"Courier" size:15];
//         tag.padding = UIEdgeInsetsMake(7, 12.5, 7, 12.5);
//         tag.bgColor = [UIColor colorWithHexString:self.colorPool[idx % self.colorPool.count]];
//         tag.cornerRadius = 5;
//         NSLog(@"in block");
//         [self.tagView addTag:tag];
//         [self.tagView commit];
//     }];
//    NSLog(@"out block");
//    
    
    NSArray *array = @[@"Python", @"Javascript", @"Python", @"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"Python", @"Javascript", @"Python", @"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"Python", @"Javascript", @"Python", @"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"Python", @"Javascript", @"Python", @"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"HTML",@"HTML"];
    
    for (int i = 0; i<array.count; i++) {
        
        SKTag *tag = [SKTag tagWithText:array[i]];
        tag.textColor = [UIColor whiteColor];
        NSArray *array = @[@15,@23,@28];
        
        tag.fontSize = ((NSNumber*)array[i % 3]).floatValue;
        //tag.font = [UIFont fontWithName:@"Courier" size:15];
        tag.padding = UIEdgeInsetsMake(7, 12.5, 7, 12.5);
        tag.bgColor = [UIColor colorWithHexString:self.colorPool[i % self.colorPool.count]];
        tag.cornerRadius = 5;
        NSLog(@"in block");
        [self.tagView addTag:tag];
    }
    [self.tagView commit];
}

#pragma mark - User interactions
- (IBAction)onAdd:(id)sender
{
    SKTag *tag = [SKTag tagWithText:@"New Lang"];
    tag.textColor = [UIColor whiteColor];
    tag.fontSize = self.index.text.floatValue;
    tag.padding = UIEdgeInsetsMake(13.5, 12.5, 13.5, 12.5);
    tag.bgColor = [UIColor colorWithHexString:self.colorPool[arc4random() % self.colorPool.count]];
    tag.cornerRadius = 5;
    
    [self.tagView addTag:tag];
    [self.tagView commit];
}

- (IBAction)onInsert:(id)sender
{
    SKTag *tag = [SKTag tagWithText:[NSString stringWithFormat:@"Insert(%ld)",(long)self.index.text.integerValue]];
    tag.textColor = [UIColor whiteColor];
    tag.fontSize = 15;
    tag.padding = UIEdgeInsetsMake(13.5, 12.5, 13.5, 12.5);
    tag.bgColor = [UIColor colorWithHexString:self.colorPool[arc4random() % self.colorPool.count]];
    tag.cornerRadius = 5;
    
    [self.tagView insertTag:tag atIndex:self.index.text.integerValue];
}

- (IBAction)onRemove:(id)sender
{
    [self.tagView removeTagAtIndex:self.index.text.integerValue];
}

- (IBAction)onRemoveAll:(id)sender
{
    [self.tagView removeAllTags];
}

- (IBAction)onTapBg:(id)sender
{
    [self.view endEditing:YES];
}

@end
