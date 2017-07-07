//
//  PersonalInfoViewController.m
//  Yogurt
//
//  Created by Soyal on 21/05/17.
//  Copyright © 2017 Soyal. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "MFSideMenu.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"
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
    [self parseCreateOrderApi];
}

- (IBAction)openMenu:(id)sender {
    
    [self.menuContainerViewController setMenuState:MFSideMenuStateLeftMenuOpen];
    
}
- (IBAction)saveButtonPressed:(id)sender {
    [self parseUpdateProfileApi];
}

-(void)parseUpdateProfileApi{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    
//http://allahkaybanday.com/yogurt360/backend/API/userprofile/updateProfile
//    
//input:
//    {
//        "username": "sat",
//        "firstname": "sat",
//        "lastname": "sat",
//        "email": "satish@xamut.com",
//        "ppic": "",
//        "account_id": "11"
//    }
    
    
    
    NSString *str = @"http://allahkaybanday.com/yogurt360/backend/API/userprofile/updateProfile";
    
    NSDictionary *params = @{@"username" :@"sat",@"firstname" :self.firstNameTF.text,@"lastname" :self.lastNameTF.text,@"email" :[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"EMAIL_ID"]],@"ppic" :@"",@"account_id" :[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"USER_ID"]]};
    
    
    [manager POST:str parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         if ([[responseObject valueForKey:@"status"]boolValue])
         {


             
         }else{
             
         }
         
         NSLog(@"JSON: %@", responseObject);
     }
          failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
     }];
    
}

-(void)parseCreateOrderApi{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
//    http://allahkaybanday.com/yogurt360/backend/API/userorders/create
//    
//    {
//        "order_product": "mobile",
//        "user_id": "11",
//        "orderusername": "onkarghule",
//        "order_registered_address": "Nashik",
//        "order_delivery_address1": "Nashik",
//        "order_delivery_address2": "Nashik",
//        "order_delivery_city": "Nashik",
//        "order_delivery_country": "india",
//        "order_delivery_pincode": "422003",
//        "order_purchase_date": "01-07-2017",
//        "order_delivery_date": "01-07-2017",
//        "order_amount": "502",
//        "order_status": "Dispatched",
//        "order_payment_mode" : "CASH"
//    }
    
    
    
    NSString *str = @"http://allahkaybanday.com/yogurt360/backend/API/userorders/create";
    
    NSDictionary *params = @{@"order_product" :@"mobile",
                             @"user_id" :[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"USER_ID"]],
                             @"orderusername":[[NSUserDefaults standardUserDefaults] valueForKey:@"USER_NAME"],
                             @"order_registered_address":self.addressTF.text,
                             @"order_delivery_address1":@"",
                             @"order_delivery_address2":@"",
                             @"order_delivery_city":self.cityTF.text,
                             @"order_delivery_country":self.countryTF.text,
                             @"order_delivery_pincode":@"422003",
                             @"order_purchase_date": @"01-07-2017",
                             @"order_delivery_date": @"01-07-2017",
                             @"order_amount": @"502",
                             @"order_status": @"Dispatched",
                             @"order_payment_mode" : @"CASH"
                             };
    
    
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

         }
         
         NSLog(@"JSON: %@", responseObject);
     }
          failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
     }];
    
}


@end
