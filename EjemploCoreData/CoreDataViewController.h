//
//  CoreDataViewController.h
//  EjemploCoreData
//
//  Created by Oscar Devis Gallego on 17/11/13.
//  Copyright (c) 2013 LEX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface CoreDataViewController : UIViewController



@property (weak, nonatomic) IBOutlet UITextField *nombreTextField;
@property (weak, nonatomic) IBOutlet UITextField *direccionTextField;
@property (weak, nonatomic) IBOutlet UITextField *telefonoTextField;
@property (weak, nonatomic) IBOutlet UILabel *estadoLabel;


- (IBAction)buscarContactoPulsarBoton:(id)sender;
- (IBAction)guardarContactoPulsarBoton:(id)sender;

@end
