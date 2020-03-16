//
//  LACollectionViewCell.h
//  demo
//
//  Created by xuzhiyong on 2020/3/16.
//  Copyright © 2020 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LAModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL isMore;


@end

@interface LACollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) LAModel *model;

+ (NSString*)reuseIdentifier;
+ (UINib *)nib;
@end

NS_ASSUME_NONNULL_END
