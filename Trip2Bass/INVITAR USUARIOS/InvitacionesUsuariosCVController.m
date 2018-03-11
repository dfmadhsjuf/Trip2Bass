//
//  InvitacionesUsuariosCVController.m
//  Trip2Bass
//
//  Created by Alumno on 11/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "InvitacionesUsuariosCVController.h"
#import "InvitarUsuariosDataController.h"
#import "Usuarios.h"

@interface InvitacionesUsuariosCVController ()
@property (strong, nonatomic) IBOutlet UICollectionView *cv_usuarios;
@end

@implementation InvitacionesUsuariosCVController

static NSString * const reuseIdentifier = @"Cell";
UILabel* nicknameUsuario;
UILabel* nombreUsuario;
UIImageView* fotoUsuario;

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
    self.dataController = [[InvitarUsuariosDataController alloc] init];
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
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return [self.dataController countOfList];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    //Creamos la celda a partir del identificador de celda de nuestra vista de Eventos.
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"usuarioCell" forIndexPath:indexPath];
    //Nos creamos un evento a partir del evento que este en esa posicion de la lista.
    Usuarios* eventoAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    //Añadimos la informacion del evento a los labels de la celda.
    nicknameUsuario = (UILabel*) [cell viewWithTag:1];
    nicknameUsuario.text = eventoAtIndex.nombreUsuario;
    
    nombreUsuario = (UILabel*) [cell viewWithTag:2];
    nombreUsuario.text = eventoAtIndex.nombreCompletoUsuario;
    
    fotoUsuario = (UIImageView*) [cell viewWithTag:3];
    [fotoUsuario setImage:[UIImage imageNamed:@"perfil1"]];
    
    //hacer foto redonda
    fotoUsuario.layer.cornerRadius = fotoUsuario.frame.size.width /2;
    
    
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
