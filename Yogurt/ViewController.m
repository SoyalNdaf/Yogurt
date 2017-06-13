//
//  ViewController.m
//  Yogurt
//
//  Created by Soyal on 18/05/17.
//  Copyright © 2017 Soyal. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import "UIImageView+AFNetworking.h"
#import "Home.h"
#import "ClaimViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   }
-(void)viewWillAppear:(BOOL)animated{
    
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    
    
    
    
     [self addScrollView];
     [self addFacebookLoginBtn];
     //[self addShareBtn];
    

}

-(void)addFacebookLoginBtn{
    if ([FBSDKAccessToken currentAccessToken]) {
        // User is logged in, do work such as go to next view controller.
        NSLog(@"User is logged in");
        [self getFacebookProfileInfo];
        
        
        
    }else{
        NSLog(@"User is log out");
    }
    

    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 -100, self.view.frame.size.height - 80, 200, 40)];
    loginButton.delegate = self;
    loginButton.readPermissions =@[@"public_profile", @"email", @"user_friends"];
    [self.view addSubview:loginButton];
}
- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error{
    
    if ([FBSDKAccessToken currentAccessToken]) {
        // User is logged in, do work such as go to next view controller.
        NSLog(@"User is logged in");
        [self getFacebookProfileInfo];
        
        
        
    }else{
        NSLog(@"User is log out");
    }
}
- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    
}
-(void)addShareBtn{
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentURL = [NSURL
                          URLWithString:@"https://www.facebook.com/FacebookDevelopers"];
    content.quote = @"iOS Development";
    FBSDKShareButton *shareButton = [[FBSDKShareButton alloc] init];
    shareButton.shareContent = content;
    shareButton.center = self.view.center;
    [self.view addSubview:shareButton];
    
}
-(void)addScrollView{

    [self.scrView setBackgroundColor:[UIColor colorWithRed:0/255.0 green:186/255.0 blue:46/255.0 alpha:1.0]];
    self.scrView.pagingEnabled = YES;
    self.scrView.delegate=self;
    [self.scrView setContentSize:CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height-20)];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
    [imageView1 setImage:[UIImage imageNamed:@"welcome"]];
    
    [self.scrView addSubview:imageView1];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    [imageView2 setImage:[UIImage imageNamed:@"welcome"]];
    
    [self.scrView addSubview:imageView2];
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*2, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    [imageView3 setImage:[UIImage imageNamed:@"welcome"]];
    
    [self.scrView addSubview:imageView3];
    
    [self.scrView insertSubview:self.pageController atIndex:4];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSLog(@"scrView.contentOffset.x = %f",self.scrView.contentOffset.x);
    NSLog(@"self.view.frame.size.width = %f",self.view.frame.size.width);
    
    if (self.scrView.contentOffset.x==0) {
        self.pageController.currentPage=0;
    }else if((self.scrView.contentOffset.x/self.view.frame.size.width)==1){
    self.pageController.currentPage=1;
    }else if((self.scrView.contentOffset.x/self.view.frame.size.width)==2){
        self.pageController.currentPage=2;
    }

    
}
-(void)getFacebookProfileInfo{

    
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me"
                                       parameters:@{@"fields": @"picture, email, name,id"}]
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
         if (!error) {
             NSString *pictureURL = [NSString stringWithFormat:@"%@",[result objectForKey:@"picture"]];
             
             NSLog(@"Email is :%@", [result objectForKey:@"email"]);
             NSLog(@"First name : %@",[result objectForKey:@"name"]);
             NSLog(@"pictureURL : %@",pictureURL);
             NSLog(@"User id : %@",[result objectForKey:@"id"]);
             
             [self navigateToClaimScreen];
             
//             NSString *pictureURLLarge =  [NSString stringWithFormat:@"https://graph.facebook.com/\%@/picture?type=large",[result objectForKey:@"id"]] ;
             
//             [_profileImageView setImageWithURL:[NSURL URLWithString:pictureURLLarge] placeholderImage:[UIImage imageNamed:@"placeHolder"]];
             
         }
         else{
             NSLog(@"error : %@", [error localizedDescription]);
         }
     }];
    
}
-(void)navigateToClaimScreen{
    
    ClaimViewController *claimVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ClaimViewController"];

    [self.navigationController pushViewController:claimVC animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
