//
//  InformacionCollectionViewCollectionViewController.h
//  Trip2Bass
//
//  Created by alumno on 7/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InformacionDataController.h"

@interface InformacionCollectionViewCollectionViewController : UICollectionViewController  <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) InformacionDataController* dataController;

@end
