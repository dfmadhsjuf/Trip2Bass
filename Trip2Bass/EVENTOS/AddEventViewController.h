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
@property (weak, nonatomic) IBOutlet UITextField *tfIndicaciones;

//BOTONES
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bCancel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bCreate;
@property (weak, nonatomic) IBOutlet UIButton *bInvitar;


//LABELS
@property (strong, nonatomic) IBOutlet UILabel *labelAcceso;
@property (strong, nonatomic) IBOutlet UILabel *labelCotenido;
@property (strong, nonatomic) IBOutlet UILabel *labelParking;
@property (strong, nonatomic) IBOutlet UILabel *labelTerreno;
@property (strong, nonatomic) IBOutlet UILabel *labelUbicacion;
@property (strong, nonatomic) IBOutlet UILabel *labelIndicaciones;


@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@end
