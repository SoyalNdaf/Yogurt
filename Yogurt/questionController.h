//
//  questionController.h
//  Yogurt
//
//  Created by Ketan on 09/07/17.
//  Copyright © 2017 Soyal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CZPicker/CZPicker.h>
@interface questionController : UIViewController<CZPickerViewDelegate,CZPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *memberButton;

- (IBAction)memberSelectionClicked:(id)sender;

@end
