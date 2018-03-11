//
//  EventosCollectionVC.m
//  Trip2Bass
//
//  Created by alumno on 21/2/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "EventosCollectionVC.h"
#import "Eventos.h"
#import "EventosDataController.h"
#import "DetalleEventoViewController.h"

@interface EventosCollectionVC ()
@property (strong, nonatomic) IBOutlet UICollectionView *cv_misEventos;

@end

@implementation EventosCollectionVC

static NSString * const reuseIdentifier = @"Cell";

UILabel* tituloLabel;
UILabel* tipoLabel;
UILabel* areaLabel;
UILabel* fechaLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //ALERTA BIENVENIDA
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Bienvenido" message:[NSString stringWithFormat:@"%@", self.username]preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    //Inicializamos el dataController y le pasamos el nickname.
    self.dataController = [[EventosDataController alloc] initWhitNickname:self.username];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)awakeFromNib{
//    [super awakeFromNib];
//    self.dataController = [[EventosDataController alloc] initWhitNickname:self.username];
//}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"pasaDatosEvento"]) {
        
        DetalleEventoViewController *detalle = [segue destinationViewController];
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] lastObject];
        Eventos * evento = [self.dataController.masterEventosList objectAtIndex:indexPath.row];
        detalle.evento = evento;
    }
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataController countOfList];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //Creamos la celda a partir del identificador de celda de nuestra vista de Eventos.
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"eventoCell" forIndexPath:indexPath];
    //Nos creamos un evento a partir del evento que este en esa posicion de la lista.
    Eventos* eventoAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    //Añadimos la informacion del evento a los labels de la celda.
    tituloLabel = (UILabel*) [cell viewWithTag:1];
    tituloLabel.text = eventoAtIndex.titulo;
    
    tipoLabel = (UILabel*) [cell viewWithTag:2];
    tipoLabel.text = eventoAtIndex.tipo;
    
    areaLabel = (UILabel*) [cell viewWithTag:3];
    areaLabel.text = eventoAtIndex.area;
    
    fechaLabel = (UILabel*) [cell viewWithTag:4];
    fechaLabel.text = eventoAtIndex.fechaInicio;
    
    //foto de fondo
    UIImageView* fondo = [(UIImageView*) cell viewWithTag:5];
    UIImage *foto = [[UIImage alloc]init];
    foto = [UIImage imageNamed:eventoAtIndex.foto];
    [fondo setImage:foto];
    
    //border redondos
    [cell.layer setCornerRadius:10];
    cell.layer.masksToBounds = YES;
    
    //margen celdas
    self.cv_misEventos.contentInset = UIEdgeInsetsMake(15, 0, 0, 0);
    
    return cell;
}
/**
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"pasaDatosEvento"]) {
        DetalleEventoViewController* segundoView = [segue destinationViewController];
        segundoView.titulo = tituloLabel;
        
    }
}
*/


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
