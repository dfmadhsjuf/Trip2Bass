//
//  ComentariosCollectionVC.m
//  Trip2Bass
//
//  Created by Alumno on 11/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "ComentariosCollectionVC.h"
#import "ComentariosDataController.h"
#import "Comentario.h"

@interface ComentariosCollectionVC ()
@property (strong, nonatomic) IBOutlet UICollectionView *cv_comentarios;

@end

@implementation ComentariosCollectionVC

static NSString * const reuseIdentifier = @"Cell";
UILabel* usuario;
UILabel* tipo;
UILabel* contenido;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    self.dataController = [[ComentariosDataController alloc] initWhitCodEvento:self.codigoEvento];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"comentarioCell" forIndexPath:indexPath];
    //Nos creamos un evento a partir del evento que este en esa posicion de la lista.
    Comentario* eventoAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    //Añadimos la informacion del evento a los labels de la celda.
    usuario = (UILabel*) [cell viewWithTag:1];
    usuario.text = eventoAtIndex.usuario;
    
    tipo = (UILabel*) [cell viewWithTag:2];
    tipo.text = eventoAtIndex.tipo;
    
    contenido = (UILabel*) [cell viewWithTag:3];
    contenido.text = eventoAtIndex.contenido;
    
    //Estilo de la celda
    cell.layer.cornerRadius = 5;
    
    NSArray* labels = [[NSArray alloc]initWithObjects:usuario, tipo, contenido, nil];
    for (int i=0; i<[labels count]; i++) {
        UILabel* lab = [labels objectAtIndex:i];
        [lab.layer setCornerRadius:5];
    }
    
    return cell;
}

-(void)addNuevoComentario:(Comentario*)nuevo{
    
    [self.dataController addComentario:nuevo];
}

- (void)refreshData
{
    [self.cv_comentarios reloadData];
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
