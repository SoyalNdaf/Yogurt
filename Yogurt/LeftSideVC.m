//
//  LeftSideVC.m
//  PHYNARTUFO
//
//  Created by Dipak on 21/01/17.
//  Copyright © 2017 Dipak. All rights reserved.
//

#import "LeftSideVC.h"
#import "LeftMenuCell.h"
#import "MFSideMenu.h"
@interface LeftSideVC ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray * arrayMenu;
  
    NSMutableArray * arrUFOID;
    NSMutableArray * arrUFOTOKEN;
    NSDictionary * dictJson;
 
    }
@property (weak, nonatomic) IBOutlet UIButton *btnProfileImage;

@property (strong, nonatomic) IBOutlet UITableView *tblViewDrawer;
@property (strong, nonatomic) IBOutlet UILabel *lblUserName;
@property (strong, nonatomic) IBOutlet UILabel *lblUFOID;
@property (strong, nonatomic) IBOutlet UIButton *imgViewLoginUser;
@property (strong, nonatomic) IBOutlet UIButton *btnUFO2;
@property (strong, nonatomic) IBOutlet UIButton *btnUFO1;


@end

@implementation LeftSideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //NSLog(@"viewDidLoad Printed Now");
    
    
        arrayMenu = [[NSMutableArray alloc]initWithObjects:
                 @"Dashboard",
                /// @"Modes",
                  @"My Account",
                 @"Referrals",
                 @"Shop",
                 @"Statics",nil];
    
  }
- (IBAction)btnProfileimgAction:(id)sender
{
   }
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
  
    self.profilePicture.image=chosenImage;
   // [self.imgViewLoginUser setImage:chosenImage forState:UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
 
}

#pragma mark - UITableViewDelegate Delegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arrayMenu count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cell";
    LeftMenuCell *cell = (LeftMenuCell*)[_tblViewDrawer dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[LeftMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    cell.lblMainMenu.text = [arrayMenu objectAtIndex:indexPath.row];
       return cell;
}


-(void)viewDidLayoutSubviews
{
    
    
    self.profilePicture.layer.cornerRadius = self.profilePicture.frame.size.height/2;
    self.profilePicture.clipsToBounds =  YES;

}

#pragma mark -
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"cell";
    LeftMenuCell *cell = (LeftMenuCell*)[_tblViewDrawer dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[LeftMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    cell.lblMainMenu.textColor = [UIColor redColor];
    //change the image
  
   
    
      [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    
    [_tblViewDrawer setContentOffset:CGPointZero animated:YES];
}


/**
 Notifier Method Call From Login

 @param note Note Object is used for received dictionary
 */
- (void)showMainMenu:(NSNotification *)note {
   }





@end
