//
//  ClaimViewController.h
//  Yogurt
//
//  Created by Soyal on 21/05/17.
//  Copyright © 2017 Soyal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClaimViewController : UIViewController{
    
}
@property (weak, nonatomic) IBOutlet UIButton *claimFirstTubButton;
@property (weak, nonatomic) IBOutlet UIButton *claimSecondTubButton;

- (IBAction)claimFirstTubButtonPressed:(id)sender;
- (IBAction)claimSecondTubButtonPressed:(id)sender;

@end
