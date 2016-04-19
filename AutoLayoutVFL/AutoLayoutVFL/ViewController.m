//
//  ViewController.m
//  AutoLayoutVFL
//
//  Created by  江苏 on 16/4/19.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView* blueView=[[UIView alloc]init];
    blueView.backgroundColor=[UIColor blueColor];
    //取消Autoresizing
    blueView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:blueView];
    
    UIView* redView=[[UIView alloc]init];
    redView.backgroundColor=[UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:redView];
    
    //通过VFL设置约束
    NSNumber* margin=@20;
    NSDictionary* metrics=NSDictionaryOfVariableBindings(margin);
    NSDictionary* views=NSDictionaryOfVariableBindings(blueView,redView);
    NSString* VFL=@"H:|-margin-[blueView]-margin-[redView(==blueView)]-margin-|";
    NSArray* Hcon=[NSLayoutConstraint constraintsWithVisualFormat:VFL options: NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom metrics:metrics views:views];
    [self.view addConstraints:Hcon];
    
    NSString* VFL2=@"V:|-margin-[blueView(40)]";
    NSArray* Vcon=[NSLayoutConstraint constraintsWithVisualFormat:VFL2 options:kNilOptions metrics:metrics views:views];
    [self.view addConstraints:Vcon];
    
}



@end
