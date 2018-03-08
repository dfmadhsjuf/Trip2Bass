//
//  AddUserViewController.h
//  Trip2Bass
//
//  Created by alumno on 22/2/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddUserViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *fotoPerfil;
@property (weak, nonatomic) IBOutlet UITextField *tfUsuaio;
@property (weak, nonatomic) IBOutlet UITextField *tfNombre;
@property (weak, nonatomic) IBOutlet UITextField *tfApellidos;
@property (weak, nonatomic) IBOutlet UITextField *tfCiudad;
@property (weak, nonatomic) IBOutlet UITextField *tfTelefono;
@property (weak, nonatomic) IBOutlet UITextField *tfEmail;
@property (weak, nonatomic) IBOutlet UITextField *fechaNacimiento;
@property (weak, nonatomic) IBOutlet UISwitch *swCoche;
@property (weak, nonatomic) IBOutlet UITextField *marca;
@property (weak, nonatomic) IBOutlet UITextField *modelo;
@property (weak, nonatomic) IBOutlet UITextField *plazas;
@property (weak, nonatomic) IBOutlet UITextField *color;
@property (weak, nonatomic) IBOutlet UIButton *bRegistrarse;


@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

- (IBAction) pickImage:(id)sender;

@end
