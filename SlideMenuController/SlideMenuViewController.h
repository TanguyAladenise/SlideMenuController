//
//  SlideMenuViewController.h
//  SlideMenuController
//
//  Created by Tanguy Aladenise on 6/6/13.
//  Copyright (c) 2013 Tanguy Aladenise. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SlideMenuDelegate;

@interface SlideMenuViewController : UIViewController

@property (nonatomic, retain) id <SlideMenuDelegate> delegate;

- (void)addItemWithText:(NSString *)text;
- (void)addMenuTitleWithText:(NSString *)text;
- (UIButton *)getItemAtIndex:(int)index;

@end

@protocol SlideMenuDelegate <NSObject>

@optional
- (void)menuItemPressed:(UIButton *)item atIndex:(int)index;

@end
