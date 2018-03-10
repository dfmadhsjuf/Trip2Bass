//
//  LoginViewController.m
//  Trip2Bass
//
//  Created by Alumno on 22/2/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "LoginViewController.h"
#import "EventosCollectionVC.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //diseño boton Sign IN
    //[self.bSignIn.layer setBorderColor:[[UIColor blackColor] CGColor]];
    //[self.bSignIn.layer setBorderWidth:1.5];
    [self.bSignIn.layer setCornerRadius:15];
    
    //diseño boton Sign UP
    [self.bSignUp.layer setCornerRadius:15];
    
    //esconder teclado en username
    [self.tfUsername becomeFirstResponder];
    [self.tfUsername resignFirstResponder] ;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"loguea"]) {
        
        UITabBarController *tabBarController = segue.destinationViewController;
        UINavigationController *navigationController = (UINavigationController *)[[tabBarController viewControllers] objectAtIndex:0];
        EventosCollectionVC *controller = (EventosCollectionVC *)[[navigationController viewControllers] objectAtIndex:0];
        
        controller.username = self.tfUsername.text;
        
    }
}


@end
