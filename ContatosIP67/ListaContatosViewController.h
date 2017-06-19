//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios5994 on 04/06/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormularioContatoViewController.h"
#import "ContatoDao.h"
#import "GerenciadorDeAcoes.h"
#import <MapKit/MapKit.h>
@interface ListaContatosViewController : UITableViewController<FormularioContatoViewControllerDelegate,UIActionSheetDelegate>

@property ContatoDao *dao;
@property Contato *contatoSelecionado;
@property NSInteger linhaDestacada;


@property (readonly) GerenciadorDeAcoes* gerenciador;

@end
