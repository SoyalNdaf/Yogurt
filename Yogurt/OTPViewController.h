//
//  OTPViewController.h
//  Yogurt
//
//  Created by Soyal on 21/05/17.
//  Copyright © 2017 Soyal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking/AFNetworking.h"
#import "JTProgressHUD.h"
@interface OTPViewController : UIViewController{
    
}
@property (weak, nonatomic) IBOutlet UITextField *enterOtpTF;
- (IBAction)verifyOtpButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *verifyOtpButton;

@end
