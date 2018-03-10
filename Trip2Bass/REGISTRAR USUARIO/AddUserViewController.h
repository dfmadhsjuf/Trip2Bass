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
//datos personales
@property (weak, nonatomic) IBOutlet UITextField *tfNombre;
@property (weak, nonatomic) IBOutlet UITextField *tfApellidos;
@property (weak, nonatomic) IBOutlet UITextField *tfCiudad;
@property (weak, nonatomic) IBOutlet UITextField *tfTelefono;
@property (weak, nonatomic) IBOutlet UITextField *tfEmail;
@property (weak, nonatomic) IBOutlet UITextField *tfFecha;

//datos cuenta
@property (weak, nonatomic) IBOutlet UITextField *tfUsuario;
@property (weak, nonatomic) IBOutlet UITextField *tfPass;
@property (weak, nonatomic) IBOutlet UITextField *tfConfirmarPass;

//datos coche
@property (weak, nonatomic) IBOutlet UISwitch *swCoche;
@property (weak, nonatomic) IBOutlet UITextField *tfMarca;
@property (weak, nonatomic) IBOutlet UITextField *tfModelo;
@property (weak, nonatomic) IBOutlet UITextField *tfPlazas;
@property (weak, nonatomic) IBOutlet UITextField *tfCcolor;
@property (weak, nonatomic) IBOutlet UIButton *bRegistrarse;

//scroll
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

- (IBAction) pickImage:(id)sender;

@end
