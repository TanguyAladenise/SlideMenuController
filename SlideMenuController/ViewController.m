//
//  ViewController.m
//  SlideMenuController
//
//  Created by Tanguy Aladenise on 6/6/13.
//  Copyright (c) 2013 Tanguy Aladenise. All rights reserved.
//

#import "ViewController.h"
#import "SlideMenuViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)intMenuButtonPressed:(id)sender {
    SlideMenuViewController *menu = [[SlideMenuViewController alloc] init];
    
    [menu addMenuTitleWithText:@"Changer la photo de couverture"];
    
    [menu addItemWithText:@"Test"];
    [menu addItemWithText:@"Test 2"];
    [menu addItemWithText:@"Test 3"];
    [menu addItemWithText:@"Test 4"];
    [menu addItemWithText:@"Test 5"];


    // add and show the menu
    [self.view addSubview:menu.view];
    [self addChildViewController:menu];
}
@end
