//
//  OrderViewController.h
//  Yogurt
//
//  Created by Soyal on 10/07/17.
//  Copyright © 2017 Soyal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderViewController : UIViewController{
    
}
- (IBAction)selectProductButtonPressed:(id)sender;
- (IBAction)selectQuantityButtonPressed:(id)sender;
- (IBAction)addMoreProductButtonPressed:(id)sender;
- (IBAction)checkOutButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *quantityButton;


@end
