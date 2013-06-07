//
//  SlideMenuViewController.m
//  SlideMenuController
//
//  Created by Tanguy Aladenise on 6/6/13.
//  Copyright (c) 2013 Tanguy Aladenise. All rights reserved.
//

#import "SlideMenuViewController.h"

@interface SlideMenuViewController ()
{
    int padding;
    int marginBetweenItems;
    int buttonHeight;
    NSMutableArray *menuItems;
    UILabel *menuTitle;
    UIView *menuItemsWrapper;
}

@end

@implementation SlideMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self initializeViewController];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
        [self initializeViewController];
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        // Custom initialization
        [self initializeViewController];
    }
    return self;
}

- (void)initializeViewController
{
    self.view.frame = [UIScreen mainScreen].bounds;
    // customization of the view
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    // init var with defaultvalues
    padding = 15;
    marginBetweenItems = 10;
    buttonHeight = 48;
    
    // make sure the array is existing otherwise instanciate it
    if (!menuItems) {
        menuItems = [[NSMutableArray alloc] init];
    }
    
    if (!menuItemsWrapper) {
        menuItemsWrapper = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, [self menuWrapperHeight])];
        // default menu wrapper color
        menuItemsWrapper.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:menuItemsWrapper];
    }

}

#pragma mark menu customization methods

- (void)addMenuTitleWithText:(NSString *)text
{
    menuTitle = nil;
    menuTitle = [[UILabel alloc] initWithFrame:CGRectMake(
                                                          padding ,
                                                          padding,
                                                          self.view.frame.size.width - (padding *2),
                                                          buttonHeight)];
    menuTitle.text = text;
    menuTitle.textColor = [UIColor blackColor];
    menuTitle.textAlignment = NSTextAlignmentCenter;
    [menuItemsWrapper addSubview:menuTitle];
}

// add a new item to our menu
- (void)addItemWithText:(NSString *)text
{
    
    UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
    // set item title
    [item setTitle:text forState:UIControlStateNormal];
    // set frame of button
    item.frame = CGRectMake(
                            padding ,
                            padding + ([menuItems count] * (buttonHeight + marginBetweenItems)) + (menuTitle.frame.size.height + marginBetweenItems),
                            self.view.frame.size.width - (padding *2),
                            buttonHeight);
    
    // default butotn color
    item.backgroundColor = [UIColor colorWithRed:83/255.0 green:190/255.0 blue:197/255.0 alpha:1];
    // add event pressed listener
    [item addTarget:self action:@selector(itemPressed:) forControlEvents:UIControlEventTouchUpInside];

    
    // add the item to the collection of items for future manipulation
    [menuItems addObject:item];
    // adpat size of wrapper
    menuItemsWrapper.frame = CGRectMake(0, 0, self.view.frame.size.width, [self menuWrapperHeight]);
    // add the button to the wrapper
    [menuItemsWrapper addSubview:item];
    
}

#pragma mark menu item methods
- (void)itemPressed:(id)sender
{
    UIButton *buttonPressed = (UIButton *)sender;
    NSLog(@"button index %d", [menuItems indexOfObject:buttonPressed]);
    
    // trigger optional delegate methods
    if ([self.delegate respondsToSelector:@selector(menuItemPressed:atIndex:)]) {
        [self.delegate menuItemPressed:buttonPressed atIndex:[menuItems indexOfObject:buttonPressed]];
    }
}

// return a button at specifi index for custom manipulation
- (UIButton *)getItemAtIndex:(int)index
{
    return [menuItems objectAtIndex:index];
}

#pragma mark closing menu

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    // detect touch outside the menu
    if (touch.view == self.view) {
        [self collapseMenu];
    }
}

- (void)collapseMenu
{
    // menu appears from bottom
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        menuItemsWrapper.frame = CGRectMake(0, self.view.frame.size.height, menuItemsWrapper.frame.size.width, menuItemsWrapper.frame.size.height);
        
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
}

#pragma mark Appearance methods

- (void)viewWillAppear:(BOOL)animated
{
    // by default the menu appears from bottom
    // so init the menu wrapper outside the view and at the bottom
    menuItemsWrapper.frame = CGRectMake(0, self.view.frame.size.height, menuItemsWrapper.frame.size.width, menuItemsWrapper.frame.size.height);
}

- (void)viewDidAppear:(BOOL)animated
{
    // menu appears from bottom
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        menuItemsWrapper.frame = CGRectMake(0, self.view.frame.size.height - menuItemsWrapper.frame.size.height, menuItemsWrapper.frame.size.width, menuItemsWrapper.frame.size.height);

    } completion:nil];
}

# pragma mark Caluclation methods

- (float)menuWrapperHeight
{
    return ([menuItems count] * ( buttonHeight + marginBetweenItems )) + menuTitle.frame.size.height + (padding * 2);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"DEALLOC SLIDE PANEL MENU");
}

@end
