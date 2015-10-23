//
//  ViewController.m
//  TableView
//
//  Created by Treinamento Mobile on 10/23/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import "ViewController.h"
#import "City.h"
#import "CityCellTableViewCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setupInitialValues];
}

- (void)setupInitialValues {

    self.data = [NSMutableArray arrayWithArray: @[
                  [[City alloc] initWithName:@"Belo Horizonte" imageName:@"city1"],
                  [[City alloc] initWithName:@"São Paulo" imageName:@"city2"],
                  [[City alloc] initWithName:@"Rio de Janeiro" imageName:@"city3"],
                  [[City alloc] initWithName:@"Porto Alegre" imageName:@"city4"],
                  [[City alloc] initWithName:@"Salvador" imageName:@"city5"],
                  [[City alloc] initWithName:@"Brasilia" imageName:@"city6"]
                ]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CityCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"
                                                            forIndexPath:indexPath];
    
    City *city = self.data[indexPath.row];
    cell.nameLabel.text = city.name;
    cell.backgroundImageView.image = [UIImage imageNamed:city.imageName];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    City *city = self.data[indexPath.row];	
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Cidade"
                                                                             message:city.name
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView
        commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
        forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.data removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath]
                              withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

@end
