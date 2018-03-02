//
//  AddEventViewController.m
//  Trip2Bass
//
//  Created by alumno on 2/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "AddEventViewController.h"

@interface AddEventViewController ()

@end

@implementation AddEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

//ACCION BOTON ENVIAR
- (IBAction)invitar:(id)sender {
    //popup
    [self.popup.layer setCornerRadius:5];
    [self.view addSubview:self.popup];
    [self.popup setCenter:self.view.center];
}

//ACCION BOTON ENVIAR POPUP
- (IBAction)enviarInvitaciones:(id)sender {
    
    //habilitamos scroll y boton
    [self.scroll setUserInteractionEnabled:YES];
    [self.bCreate setEnabled:YES];
    [self.bCancel setEnabled:YES];
    //eliminamos el popup
    [self.popup removeFromSuperview];
}
- (IBAction)seleccionarUsuario:(id)sender {
    
}

- (IBAction)cancel:(UIStoryboard*)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)createUser:(UIStoryboard*)sender {
    //code for create user
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end