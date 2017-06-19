//
//  ContatosNoMapaViewController.h
//  ContatosIP67
//
//  Created by ios5994 on 18/06/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ContatoDao.h"

@interface ContatosNoMapaViewController : UIViewController

@property (nonatomic,weak) IBOutlet MKMapView *mapa;
@property (nonatomic,weak) NSMutableArray *contatos;
@property CLLocationManager* manager;
@property ContatoDao *dao;

@end
