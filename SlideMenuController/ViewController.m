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
    
    // for the time being you should respect logical order when intializing the menu
    // title
    // items from top to bottom
    // cancel button
    // title & cancel button are optional
    // sorry for the inconvenience, I will make the view controller better as soon as possible
    SlideMenuViewController *menu = [[SlideMenuViewController alloc] init];
    
    [menu addMenuTitleWithText:@"Changer la photo de couverture"];
    
    [menu addItemWithText:@"Retirer la photo actuelle"];
    [menu addItemWithText:@"Importer depuis Facebook"];
    [menu addItemWithText:@"Importer depuis Twitter"];
    [menu addItemWithText:@"Choisir dans votre galerie"];
    [menu addItemWithText:@"Choisir dans votre pellicule"];

    [menu addCancelButtonWithText:@"ANNULER"];

    // add and show the menu
    [self.view addSubview:menu.view];
    [self addChildViewController:menu];
}
@end
