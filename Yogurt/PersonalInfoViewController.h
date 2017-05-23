//
//  PersonalInfoViewController.h
//  Yogurt
//
//  Created by Soyal on 21/05/17.
//  Copyright © 2017 Soyal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface PersonalInfoViewController : UIViewController{
    
}
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
- (IBAction)saveButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTF;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTF;
@property (weak, nonatomic) IBOutlet UITextField *addressTF;
@property (weak, nonatomic) IBOutlet UITextField *cityTF;
@property (weak, nonatomic) IBOutlet UITextField *stateTF;
@property (weak, nonatomic) IBOutlet UITextField *countryTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
- (IBAction)sendButtonPressed:(id)sender;

- (IBAction)openMenu:(id)sender;
@end
