//
//  LoginViewController.m
//  Yogurt
//
//  Created by Soyal on 02/07/17.
//  Copyright © 2017 Soyal. All rights reserved.
//

#import "LoginViewController.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"
#import "ClaimViewController.h"
#import "JTProgressHUD.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)parseLoginApi{
    
    [JTProgressHUD show];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    NSString *str = @"http://allahkaybanday.com/yogurt360/backend/API/usersignin/process";
    
    NSDictionary *params = @ {@"email" :self.emailTF.text, @"password" :self.passwordTF.text };
    
    
    [manager POST:str parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
          [JTProgressHUD hide];
         if ([[responseObject valueForKey:@"status"]boolValue])
         {
             // need to get from api
             [[NSUserDefaults standardUserDefaults] setObject:[responseObject valueForKey:@"user_id"] forKey:@"USER_ID"];
             [[NSUserDefaults standardUserDefaults] setObject:[responseObject valueForKey:@"user_name"] forKey:@"USER_NAME"];
             [[NSUserDefaults standardUserDefaults] setObject:self.emailTF.text forKey:@"EMAIL_ID"];
             [[NSUserDefaults standardUserDefaults]synchronize];
             
             
             NSLog(@"%@ %@ %@",[[NSUserDefaults standardUserDefaults] valueForKey:@"USER_ID"],[[NSUserDefaults standardUserDefaults] valueForKey:@"USER_NAME"],[[NSUserDefaults standardUserDefaults] valueForKey:@"EMAIL_ID"]);
             [self navigateToClaimScreen];
         
         }else{
             
         }
             
         NSLog(@"JSON: %@", responseObject);
     }
          failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         [JTProgressHUD hide];
         
         NSLog(@"Error: %@", error);
     }];
    
}

- (IBAction)signInBtnPressed:(id)sender {
    
    if ([self validateEmailWithString:self.emailTF.text]||[self.passwordTF.text length]>3) {
      [self parseLoginApi];
    }else{
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Email Not Valid"
                                     message:@""
                                     preferredStyle:UIAlertControllerStyleAlert];
        

        
        UIAlertAction* noButton = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
                                       //Handle no, thanks button
                                   }];
        
        [alert addAction:noButton];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}
- (IBAction)forgotPasswordBtnPressed:(id)sender {
    [self showForgetPasswordPopup];
}
-(void)showForgetPasswordPopup{
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"FORGET PASSWORD"
                                          message:@"Enter your Email ID"
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = @"Email Id";
         [textField addTarget:self
                       action:@selector(alertTextFieldDidChange:)
             forControlEvents:UIControlEventEditingChanged];
     }];
    
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"Ok"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   UITextField *login = alertController.textFields.firstObject;
                                   emailID = login.text;
                                   [self parseForgotPasswordApi];
                                   
                               }];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       
                                   }];
    
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    okAction.enabled =NO;
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}
- (void)alertTextFieldDidChange:(UITextField *)sender
{
    UIAlertController *alertController = (UIAlertController *)self.presentedViewController;
    if (alertController)
    {
        UITextField *login = alertController.textFields.firstObject;
        UIAlertAction *okAction = alertController.actions.lastObject;
        if ([self validateEmailWithString:login.text]) {
            okAction.enabled = YES;
        }else{
            okAction.enabled = NO;
        }
    }
}

- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
-(BOOL)isValidPassword:(NSString *)checkString{
    NSString *stricterFilterString = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    return [passwordTest evaluateWithObject:checkString];
}
-(void)parseForgotPasswordApi{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSString *str = @"http://allahkaybanday.com/yogurt360/backend/API/usersignin/validateEmail";
    
    NSDictionary *params = @ {@"email" :emailID};
    
    
    [manager POST:str parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         if ([[responseObject valueForKey:@"status"]boolValue])
         {
             UIAlertController * alert = [UIAlertController
                                          alertControllerWithTitle:[responseObject valueForKey:@"message"]
                                          message:@""
                                          preferredStyle:UIAlertControllerStyleAlert];
             
             
             
             UIAlertAction* noButton = [UIAlertAction
                                        actionWithTitle:@"OK"
                                        style:UIAlertActionStyleDefault
                                        handler:^(UIAlertAction * action) {
                                            //Handle no, thanks button
                                        }];
             
             [alert addAction:noButton];
             
             [self presentViewController:alert animated:YES completion:nil];
             
         }else{
             
         }
         
         NSLog(@"JSON: %@", responseObject);
     }
          failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
     }];
    
}
-(void)navigateToClaimScreen{
    
    ClaimViewController *claimVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ClaimViewController"];
    
    [self.navigationController pushViewController:claimVC animated:NO];
}

@end
