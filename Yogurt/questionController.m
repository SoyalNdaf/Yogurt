//
//  questionController.m
//  Yogurt
//
//  Created by Ketan on 09/07/17.
//  Copyright © 2017 Soyal. All rights reserved.
//

#import "questionController.h"
#import <CZPicker/CZPicker.h>
@interface questionController ()
@property NSArray *members;
@end

@implementation questionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.members = @[@"1", @"2", @"3",@"4", @"5", @"6",@"7", @"8", @"9"];

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

- (IBAction)memberSelectionClicked:(id)sender {
    
    CZPickerView *picker = [[CZPickerView alloc] initWithHeaderTitle:@"members" cancelButtonTitle:@"Cancel" confirmButtonTitle:@"Confirm"];
    picker.delegate = self;
    picker.dataSource = self;
    picker.needFooterView = YES;
    [picker show];

}

/* comment out this method to allow
 CZPickerView:titleForRow: to work.
 */
- (NSAttributedString *)czpickerView:(CZPickerView *)pickerView
               attributedTitleForRow:(NSInteger)row{
    
    NSAttributedString *att = [[NSAttributedString alloc]
                               initWithString:self.members[row]
                               attributes:@{
                                            NSFontAttributeName:[UIFont fontWithName:@"Avenir-Light" size:18.0]
                                            }];
    return att;
}

- (NSString *)czpickerView:(CZPickerView *)pickerView
               titleForRow:(NSInteger)row{
    return self.members[row];
}


- (NSInteger)numberOfRowsInPickerView:(CZPickerView *)pickerView {
    return self.members.count;
}

- (void)czpickerView:(CZPickerView *)pickerView didConfirmWithItemAtRow:(NSInteger)row {
    NSLog(@"%@ is chosen!", self.members[row]);
    [self.memberButton setTitle:[NSString stringWithFormat:@"%@",self.members[row]] forState:UIControlStateNormal];
    
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)czpickerView:(CZPickerView *)pickerView didConfirmWithItemsAtRows:(NSArray *)rows {
    for (NSNumber *n in rows) {
        NSInteger row = [n integerValue];
        NSLog(@"%@ is chosen!", self.members[row]);
    }
    
  
}

- (void)czpickerViewDidClickCancelButton:(CZPickerView *)pickerView {
    [self.navigationController setNavigationBarHidden:YES];
    NSLog(@"Canceled.");
}

- (void)czpickerViewWillDisplay:(CZPickerView *)pickerView {
    NSLog(@"Picker will display.");
}

- (void)czpickerViewDidDisplay:(CZPickerView *)pickerView {
    NSLog(@"Picker did display.");
}

- (void)czpickerViewWillDismiss:(CZPickerView *)pickerView {
    NSLog(@"Picker will dismiss.");
}

- (void)czpickerViewDidDismiss:(CZPickerView *)pickerView {
    NSLog(@"Picker did dismiss.");
}

@end
