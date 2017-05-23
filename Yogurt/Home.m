//
//  Home.m
//  Yogurt
//
//  Created by Soyal on 20/05/17.
//  Copyright © 2017 Soyal. All rights reserved.
//

#import "Home.h"
#import "MFSideMenu.h"
#import "SideMenuViewController.h"
#import "MFSideMenuContainerViewController.h"
@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [[self navigationController] setNavigationBarHidden:NO animated:NO];
     [self initUI];
    
}
-(void)initUI{
   [self setupMenuBarButtonItems];
}
#pragma mark - UIBarButtonItems

- (void)setupMenuBarButtonItems {
    
    self.navigationItem.leftBarButtonItem = [self leftMenuBarButtonItem];
    
}

- (UIBarButtonItem *)leftMenuBarButtonItem {
    return [[UIBarButtonItem alloc]
            initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStylePlain
            target:self
            action:@selector(leftSideMenuButtonPressed:)];
}

#pragma mark - UIBarButtonItem Callbacks


- (void)leftSideMenuButtonPressed:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
        [self setupMenuBarButtonItems];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
