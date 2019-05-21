//
//  ViewController.m
//  WavyCollectionView
//
//  Created by Frank Chen on 2019-05-16.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionViewCell.h"
#import "CustomFlowLayout.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView* collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCollectionView];
}

-(void)setupCollectionView{
    CustomFlowLayout* layout = [[CustomFlowLayout alloc]init];
    UICollectionView* collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.translatesAutoresizingMaskIntoConstraints = 0;
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"customCell"];
    
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    [NSLayoutConstraint activateConstraints:@[
                                              [collectionView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:0],
                                               [collectionView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:0],
                                               [collectionView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0],
                                               [collectionView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0],
                                              ]];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomCollectionViewCell* cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
    return cell;
}

@end

