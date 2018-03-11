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

@interface DetalleEventoViewController ()

@end

@implementation DetalleEventoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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

/**
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"crearComentario"]&& self.comentario != nil) {
            ComentariosCollectionVC* cv_comentarios = segue.destinationViewController;
        
            [cv_comentarios addNuevoComentario:self.comentario];
            [cv_comentarios refreshData];
        
    }
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
