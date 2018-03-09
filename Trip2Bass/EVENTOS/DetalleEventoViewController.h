//
//  DetalleEventoViewController.h
//  Trip2Bass
//
//  Created by Alumno on 8/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalleEventoViewController : UIViewController
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
@property (weak, nonatomic) IBOutlet UIButton *bComentar;

@property (strong, nonatomic) IBOutlet UIView *popup;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@end
