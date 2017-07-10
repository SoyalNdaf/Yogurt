//
//  OrderViewController.m
//  Yogurt
//
//  Created by Soyal on 10/07/17.
//  Copyright © 2017 Soyal. All rights reserved.
//

#import "OrderViewController.h"
#import <CZPicker/CZPicker.h>
#import "PersonalInfoViewController.h"
@interface OrderViewController ()
@property NSArray *quntity;
@property NSString *selectedQuantity;
@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.quntity = @[@"1", @"2", @"3",@"4", @"5", @"6",@"7", @"8", @"9",@"10"];
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

- (IBAction)selectProductButtonPressed:(id)sender {
    [self alertForNoProductAvilable];
}

- (IBAction)selectQuantityButtonPressed:(id)sender {
    CZPickerView *picker = [[CZPickerView alloc] initWithHeaderTitle:@"quntity" cancelButtonTitle:@"Cancel" confirmButtonTitle:@"Confirm"];
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
                               initWithString:self.quntity[row]
                               attributes:@{
                                            NSFontAttributeName:[UIFont fontWithName:@"Avenir-Light" size:18.0]
                                            }];
    return att;
}

- (NSString *)czpickerView:(CZPickerView *)pickerView
               titleForRow:(NSInteger)row{
    return self.quntity[row];
}


- (NSInteger)numberOfRowsInPickerView:(CZPickerView *)pickerView {
    return self.quntity.count;
}

- (void)czpickerView:(CZPickerView *)pickerView didConfirmWithItemAtRow:(NSInteger)row {
    NSLog(@"%@ is chosen!", self.quntity[row]);
    
    
    [self.quantityButton setTitle:[NSString stringWithFormat:@"%@ Unit",self.quntity[row]] forState:UIControlStateNormal];
    
    self.selectedQuantity = self.quntity[row];
    
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)czpickerView:(CZPickerView *)pickerView didConfirmWithItemsAtRows:(NSArray *)rows {
    for (NSNumber *n in rows) {
        NSInteger row = [n integerValue];
        NSLog(@"%@ is chosen!", self.quntity[row]);
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
- (IBAction)addMoreProductButtonPressed:(id)sender {
    [self alertForNoProductAvilable];
}

- (IBAction)checkOutButtonPressed:(id)sender {
    PersonalInfoViewController *personalVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PersonalInfoViewController"];
    
    personalVC.selectedQuantity = self.selectedQuantity;
    [self.navigationController pushViewController:personalVC animated:NO];
}

-(void)alertForNoProductAvilable{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Only One Product Avilable Right Now"
                                 message:@""
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   //Handle no, thanks button
                               }];
    
    [alert addAction:okButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
