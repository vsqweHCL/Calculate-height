//
//  MoreViewController.h
//  demo
//
//  Created by xuzhiyong on 2020/3/16.
//  Copyright © 2020 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MoreVcDelegate <NSObject>

- (void)addData;

@end

@interface MoreViewController : UIViewController

@property (nonatomic, weak) id<MoreVcDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
