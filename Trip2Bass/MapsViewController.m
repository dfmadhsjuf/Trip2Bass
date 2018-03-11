//
//  MapsViewController.m
//  Trip2Bass
//
//  Created by Alumno on 10/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <GoogleMaps/GoogleMaps.h>
#import "MapsViewController.h"

@interface MapsViewController ()
@property GMSMapView *mapView ;
@property GMSMarker *marker;
@property (strong, nonatomic) IBOutlet GMSMapView *mimapa;

@end

@implementation MapsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //CREACION MAPA
    //creamos la camara con latitud y longitud de la ubicacion que queremos
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:39.4654028
                                                            longitude:-0.3428401
                                                                 zoom:17];
    //iniciamos el mapa con el centro en la camara definida arriba
    self.mimapa = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    //creamos marcador
    self.marker = [[GMSMarker alloc] init];
    self.marker.position = camera.target;
    self.marker.snippet = @"Hello World";
    [self.marker setAppearAnimation:kGMSMarkerAnimationPop];
    [self.marker setMap:self.mimapa];
    [self setView:self.mimapa];
    //single finger long press
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(getMapCoordinateFromTouch:)];
    [longPressGesture setNumberOfTouchesRequired:1];
    longPressGesture.delegate = self;
    [self.mimapa addGestureRecognizer:longPressGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getMapCoordinateFromTouch:(UILongPressGestureRecognizer *) gesture{
    if(gesture.state == UIGestureRecognizerStateBegan){
        CGPoint touchlocation = [gesture locationInView:self.mimapa];
        [self mapView:self.mimapa didLongPressAtCoordinate:CLLocationCoordinate2DMake(touchlocation.x, touchlocation.y)];
    }
}

/*
-(void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    NSLog(@"estas tap");
    [self.marker setPosition:coordinate];
}
*/

- (void)mapView:(GMSMapView *)mapView
didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate{
    NSLog(@"estas manteniendo pulssado");
}

-(void)mapView:(GMSMapView *)mapView didDragMarker:(GMSMarker *)marker{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
