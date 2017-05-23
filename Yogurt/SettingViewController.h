//
//  SettingViewController.h
//  Yogurt
//
//  Created by Soyal on 21/05/17.
//  Copyright © 2017 Soyal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController{

}
@property (weak, nonatomic) IBOutlet UIButton *notificationButton;
- (IBAction)notificationButtonPressed:(id)sender;

- (IBAction)settingOptionButtonFirstPressed:(id)sender;
- (IBAction)showInAppPurchaseButtonPressed:(id)sender;
- (IBAction)settingOptionButtonSecondPressed:(id)sender;


@end
