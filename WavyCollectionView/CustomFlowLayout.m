//
//  CustomFlowLayout.m
//  WavyCollectionView
//
//  Created by Frank Chen on 2019-05-16.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "CustomFlowLayout.h"

@implementation CustomFlowLayout

- (void)prepareLayout {
  self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
  self.itemSize = CGSizeMake(100, 50);
  // Set minimum interitem spacing to be huge to force all items to be on their own line
  self.minimumInteritemSpacing = CGFLOAT_MAX;
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    self = [super init];
  }
  return self;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
  NSArray<UICollectionViewLayoutAttributes *> *superAttrs = [super layoutAttributesForElementsInRect:rect];
  
  // Need to copy attrs from super to avoid cached frame mismatch
  NSMutableArray<UICollectionViewLayoutAttributes *> *newAttrs = [[NSMutableArray alloc] init];
  
  for (UICollectionViewLayoutAttributes* attr in superAttrs) {
    [newAttrs addObject:attr];
  }
  
  
  for (UICollectionViewLayoutAttributes* attr in newAttrs){
    if (attr.representedElementKind == UICollectionElementCategoryCell) {
      CGRect frame = attr.frame;
      CGFloat y = arc4random_uniform(self.collectionView.frame.size.height);
      frame.origin.y = y;
      attr.frame = frame;
    }
  }
  
  return newAttrs;
}


// TODO: fill me in!
@end
