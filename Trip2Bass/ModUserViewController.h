//
//  ModUserViewController.h
//  Trip2Bass
//
//  Created by alumno on 22/2/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModUserViewController : UIViewController

//DATOS PERSONALES
@property (weak, nonatomic) IBOutlet UIImageView *fotoPerfil;
@property (weak, nonatomic) IBOutlet UIImageView *fotoPortada;
@property (weak, nonatomic) IBOutlet UITextField *tfUsuario;
@property (weak, nonatomic) IBOutlet UITextField *tfNombre;
@property (weak, nonatomic) IBOutlet UITextField *tfApellidos;
@property (weak, nonatomic) IBOutlet UITextField *tfCiudad;
@property (weak, nonatomic) IBOutlet UITextField *tfEmail;
@property (weak, nonatomic) IBOutlet UITextField *tfFechaNac;
@property (weak, nonatomic) IBOutlet UITextField *tfTelefono;

//INFO ADICIONAL
@property (weak, nonatomic) IBOutlet UISwitch *scCoche;
@property (weak, nonatomic) IBOutlet UITextField *tfMarca;
@property (weak, nonatomic) IBOutlet UITextField *tfModelo;
@property (weak, nonatomic) IBOutlet UITextField *tfColor;
@property (weak, nonatomic) IBOutlet UITextField *tfPlazas;

//BOTONES
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bEdit;
@property (weak, nonatomic) IBOutlet UIButton *bLogOut;
@property (weak, nonatomic) IBOutlet UIButton *bOrganizador;

//POPUP
@property (strong, nonatomic) IBOutlet UIView *popup;
@property (weak, nonatomic) IBOutlet UIButton *bEnviarSolicitud;

@end
