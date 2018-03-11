//
//  DetalleEventoViewController.h
//  Trip2Bass
//
//  Created by Alumno on 8/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Comentario;
@class Eventos;

@interface DetalleEventoViewController : UIViewController

@property Eventos* evento;
//DATOS EVENTO
@property (weak, nonatomic) IBOutlet UIImageView *fotoEvento;
@property (weak, nonatomic) IBOutlet UILabel *titulo;
@property (weak, nonatomic) IBOutlet UILabel *area;
@property (weak, nonatomic) IBOutlet UILabel *inicio;
@property (weak, nonatomic) IBOutlet UILabel *tipo;
@property (weak, nonatomic) IBOutlet UILabel *organizador;
@property (weak, nonatomic) IBOutlet UILabel *fin;
@property (weak, nonatomic) IBOutlet UILabel *contenidoEvento;
@property (weak, nonatomic) IBOutlet UILabel *accesibilidad;
@property (weak, nonatomic) IBOutlet UILabel *terreno;
@property (weak, nonatomic) IBOutlet UILabel *parking;
@property (weak, nonatomic) IBOutlet UIButton *ubicacion;
@property (weak, nonatomic) IBOutlet UILabel *indicaciones;

//BOTONES
@property (weak, nonatomic) IBOutlet UIButton *bComentar;

//POPUP COMENTARIO
@property (strong, nonatomic) IBOutlet UIView *popup;
@property (strong, nonatomic) IBOutlet UITextField *usuario;
@property (strong, nonatomic) IBOutlet UITextField *tipoComentario;
@property (strong, nonatomic) IBOutlet UITextView *contenidoComentario;
@property Comentario* comentario;

//SCROLL
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;



@end
