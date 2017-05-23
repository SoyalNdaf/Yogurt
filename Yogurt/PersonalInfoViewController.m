//
//  PersonalInfoViewController.m
//  Yogurt
//
//  Created by Soyal on 21/05/17.
//  Copyright © 2017 Soyal. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "MFSideMenu.h"
@interface PersonalInfoViewController ()

@end

@implementation PersonalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [self inItUI];
}
-(void)inItUI{
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    self.titleLabel.layer.cornerRadius=self.titleLabel.frame.size.height/2;
    self.titleLabel.clipsToBounds=YES;
    self.sendButton.layer.cornerRadius=self.sendButton.frame.size.height/2;
    self.sendButton.clipsToBounds=YES;
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

- (IBAction)sendButtonPressed:(id)sender {
    
}

- (IBAction)openMenu:(id)sender {
    
    [self.menuContainerViewController setMenuState:MFSideMenuStateLeftMenuOpen];
    
}
- (IBAction)saveButtonPressed:(id)sender {
}
@end
