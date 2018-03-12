//
//  DetalleEventoViewController.m
//  Trip2Bass
//
//  Created by Alumno on 8/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "DetalleEventoViewController.h"
#import "Comentario.h"
#import "ComentariosCollectionVC.h"
#import "Eventos.h"
#import "MapsViewController.h"

@interface DetalleEventoViewController ()

@end

@implementation DetalleEventoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureView
{
    // Update the user interface for the detail item.
    Eventos *evento = self.evento;
    
    if (evento) {
        [self.titulo setText:evento.titulo];
        [self.inicio setText:evento.fechaInicio];
        [self.fin setText:evento.fechaFin];
        [self.tipo setText:evento.tipo];
        [self.area setText:evento.area];
        [self.organizador setText:evento.organizador];
        [self.accesibilidad setText:evento.parkingAccesibilidad];
        [self.terreno setText:evento.parkingTerreno];
        [self.parking setText:evento.parkingTamano];
        [self.indicaciones setText:evento.indicaciones];
        if ([self.tipo.text isEqualToString:@"Fiesta"]) {
            [self.fotoEvento setImage:[UIImage imageNamed:@"fondo_evento1"]];
            [self.labelContenidoEvento setText:@"MÚSICA"];
            [self.contenidoEvento setText:evento.musica];
        }else{
            [self.fotoEvento setImage:[UIImage imageNamed:@"fondo_evento2"]];
            [self.labelContenidoEvento setText:@"ACTIVIDADES"];
            [self.contenidoEvento setText:evento.descripcion];
        }
    }
    [self setEstilo];
}

-(void)setEstilo{
    NSArray* labels = [[NSArray alloc]initWithObjects:self.titulo, self.labelInicio, self.labelFin, self.labelArea, self.labelTipo, self.labelOrganizador, self.labelContenidoEvento, self.labelAcceso, self.labelParking, self.labelTerreno, self.labelUbicacion, self.labelIndicaciones, self.labelComentario, nil];
    for (int i = 0; i<[labels count]; i++) {
        UILabel* l = labels[i];
        l.layer.cornerRadius = 3;
        l.clipsToBounds = YES;
    }
    
}

- (IBAction)back:(UIStoryboard*)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)añadirComentario:(id)sender {
    //popup
    [self.popup.layer setCornerRadius:5];
    [self.view addSubview:self.popup];
    [self.popup setCenter:self.view.center];
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        // animate it to the identity transform (100% scale)
        self.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished){
        // if you want to do something once the animation finishes, put it here
    }];
}
//ENVIAR COMENTARIO EVENTO
- (IBAction)enviar:(id)sender {
    //codigo enviar comentario
    self.comentario = [[Comentario alloc]initWithUsuario:self.usuario.text tipo:self.tipoComentario.text contenido:self.contenidoComentario.text];
    //deshabilitamos scroll y boton
    [self.scroll setUserInteractionEnabled:YES];
    //cerramos popup
    [self.popup removeFromSuperview];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"muestraUbicacion"]){
        MapsViewController* mapadestino = [segue destinationViewController];
        mapadestino.coordenadasString = self.evento.ubicacion;
        
    }
    if ([segue.identifier isEqualToString:@"crearComentario"]){
        //Le pasamos a los comentarios el cod_evento del evento actual.
        Eventos *eventoCom = self.evento;
        ComentariosCollectionVC* comentarioCV = [segue destinationViewController];
        comentarioCV.codigoEvento = eventoCom.codEvento;
    }
}

@end
