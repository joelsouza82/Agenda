//
//  ViewController.h
//  ContatosIP67
//
//  Created by ios5994 on 28/05/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"
#import "ContatoDao.h"
#import <CoreLocation/CoreLocation.h>

@protocol FormularioContatoViewControllerDelegate <NSObject>

-(void) contatoAtualizado:(Contato *) contato;
-(void) contatoAdicionado:(Contato *) contato;

@end

@interface FormularioContatoViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property(nonatomic,weak) IBOutlet UIActivityIndicatorView *loding;
@property IBOutlet UIActivityIndicatorView* rodinha;
@property (weak) IBOutlet UITextField *nome;
@property (weak) IBOutlet UITextField *telefone;
@property (weak) IBOutlet UITextField *email;
@property (weak) IBOutlet UITextField *endereco;
@property (weak) IBOutlet UITextField *site;
@property ContatoDao *contatoDao;
@property (strong) Contato *contato;
@property IBOutlet UIButton* botaoFoto;

@property (weak) id<FormularioContatoViewControllerDelegate> delegate;

-(IBAction)selecionaFoto:(id)sender;

-(IBAction)calculaCoordenadas:(id)sender;

@property IBOutlet UITextField* latitude;
@property IBOutlet UITextField* longitude;

@end