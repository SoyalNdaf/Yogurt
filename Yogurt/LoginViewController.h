//
//  LoginViewController.h
//  Yogurt
//
//  Created by Soyal on 02/07/17.
//  Copyright © 2017 Soyal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController{
    NSString *emailID;
}
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *signInBtn;
- (IBAction)signInBtnPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *forgotPasswordBtn;
- (IBAction)forgotPasswordBtnPressed:(id)sender;

@end
