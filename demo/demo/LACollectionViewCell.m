//
//  LACollectionViewCell.m
//  demo
//
//  Created by xuzhiyong on 2020/3/16.
//  Copyright © 2020 xxx. All rights reserved.
//

#import "LACollectionViewCell.h"

@implementation LAModel
@end



@interface LACollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *lbl;

@end

@implementation LACollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(LAModel *)model {
    _model = model;
    self.lbl.text = model.title;
}



#pragma mark - Public Method
+ (NSString*)reuseIdentifier{
    return NSStringFromClass([self class]);
}
+ (UINib *)nib{
    NSString *xibName = NSStringFromClass([self class]);
    return [UINib nibWithNibName:xibName bundle:[NSBundle mainBundle]];
}
@end
