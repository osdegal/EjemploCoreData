//
//  CoreDataViewController.m
//  EjemploCoreData
//
//  Created by Oscar Devis Gallego on 17/11/13.
//  Copyright (c) 2013 LEX. All rights reserved.
//

#import "CoreDataViewController.h"

@interface CoreDataViewController ()

@end

@implementation CoreDataViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buscarContactoPulsarBoton:(id)sender {
    
    //Creamos el delegado
     AppDelegate * appDelegate =[[UIApplication sharedApplication]delegate];
    
    //Creamos el Managed Object Context
    NSManagedObjectContext *contexto = [appDelegate managedObjectContext];

    //Creamos el entity description
    NSEntityDescription *entityDescription= [NSEntityDescription entityForName:@"Contactos" inManagedObjectContext:contexto];
    
    //Creamos el fecth request
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:entityDescription];
    
    //Creamos la consulta
    NSPredicate *consulta=[NSPredicate predicateWithFormat:@"nombre =%@",self.nombreTextField.text];
    [request setPredicate:consulta];
    
    //Realizamos la consulta
    NSError *error;
    NSArray *objectosDevueltos= [contexto executeFetchRequest:request error:&error];
    
    //Mostramos las coincidencias si ha habido
    NSManagedObject *resultado=nil;
    
    if (objectosDevueltos.count==0){
        self.estadoLabel.text=@"Valor no encontrado";
    }
    else{
        resultado=objectosDevueltos[0];
        
        self.direccionTextField.text=[resultado valueForKey:@"direccion"];
        self.telefonoTextField.text=[resultado valueForKey:@"telefono"];
        
        self.estadoLabel.text= [NSString stringWithFormat:@"%lu coincidencias encontradas", (unsigned long)[objectosDevueltos count]];
    
    }
    
}

- (IBAction)guardarContactoPulsarBoton:(id)sender {
    
    //Creamos el delegado
    AppDelegate * appDelegate =[[UIApplication sharedApplication]delegate];
    
    //Creamos el Managed Object Context
    NSManagedObjectContext *contexto = [appDelegate managedObjectContext];
    
    //Creamos el nuevo contacto
    NSManagedObject *nuevoContacto;
    nuevoContacto=[NSEntityDescription insertNewObjectForEntityForName:@"Contactos" inManagedObjectContext:contexto];
    
    //Le damos los valores de la vista
    [nuevoContacto setValue:self.nombreTextField.text forKey:@"nombre"];
    [nuevoContacto setValue:self.direccionTextField.text forKey:@"direccion"];
    [nuevoContacto setValue:self.telefonoTextField.text forKey:@"telefono"];
    
    //Limpiamos la vista
    self.nombreTextField.text=@"";
    self.direccionTextField.text=@"";
    self.telefonoTextField.text=@"";
    
    //Guardamos
    NSError *error;
    [contexto save:&error];
    
    //Informamos en la vista con la etiqueta estado
    self.estadoLabel.text=@"Contacto Guardado";
    
}
@end
