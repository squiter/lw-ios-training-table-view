//
//  UINavigationController+StatusBarPatch.m
//  TableView
//
//  Created by Treinamento Mobile on 10/24/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import "UINavigationController+StatusBarPatch.h"

@implementation UINavigationController (StatusBarPatch)

-(UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}

@end
