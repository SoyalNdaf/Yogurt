//
//  ViewController.h
//  Yogurt
//
//  Created by Soyal on 18/05/17.
//  Copyright © 2017 Soyal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@interface ViewController : UIViewController<UIScrollViewDelegate,FBSDKLoginButtonDelegate>{
    UIButton *loginButtonForAPI;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;

@end

