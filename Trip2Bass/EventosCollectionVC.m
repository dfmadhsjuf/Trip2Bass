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

@interface EventosCollectionVC ()

@end

@implementation EventosCollectionVC

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)awakeFromNib{
    [super awakeFromNib];
    self.dataController = [[EventosDataController alloc] init];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
    UILabel* tituloLabel = (UILabel*) [cell viewWithTag:1];
    tituloLabel.text = eventoAtIndex.nombre;
    
    UILabel* tipoLabel = (UILabel*) [cell viewWithTag:1];
    tipoLabel.text = eventoAtIndex.tipo;
    
    UILabel* areaLabel = (UILabel*) [cell viewWithTag:3];
    areaLabel.text = eventoAtIndex.area;
    
    UILabel* fechaLabel = (UILabel*) [cell viewWithTag:4];
    fechaLabel.text = eventoAtIndex.fecha;
    
    return cell;
}

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
