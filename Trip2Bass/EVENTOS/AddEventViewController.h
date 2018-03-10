//
//  AddEventViewController.h
//  Trip2Bass
//
//  Created by alumno on 2/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEventViewController : UIViewController
//PROPIEDADES EVENTO NUEVO

@property (weak, nonatomic) IBOutlet UIImageView *iFotoEvento;
@property (weak, nonatomic) IBOutlet UITextField *tfTituloEvento;
@property (weak, nonatomic) IBOutlet UITextField *tfOrganizador;
@property (weak, nonatomic) IBOutlet UITextField *tfAreaEvento;
@property (weak, nonatomic) IBOutlet UITextField *tfFechaInicioEvento;
@property (weak, nonatomic) IBOutlet UITextField *tfFechaFinEvento;
@property (weak, nonatomic) IBOutlet UISegmentedControl *ScTipoEvento;
@property (weak, nonatomic) IBOutlet UITextView *tfContenidoEvento;
@property (weak, nonatomic) IBOutlet UITextField *tfAcceso;
@property (weak, nonatomic) IBOutlet UITextField *tfParking;
@property (weak, nonatomic) IBOutlet UITextField *tfTerreno;
@property (weak, nonatomic) IBOutlet UIButton *bUbicacion;
@property (weak, nonatomic) IBOutlet UITextView *lIndicaciones;

//BOTONES
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bCancel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bCreate;
@property (weak, nonatomic) IBOutlet UIButton *bInvitar;


//POPUP INVITAR
@property (strong, nonatomic) IBOutlet UIView *popup;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@end
