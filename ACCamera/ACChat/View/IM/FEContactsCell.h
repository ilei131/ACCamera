//
//  FEContactsCell.h
//  acrophone
//
//  Created by admin on 16/7/25.
//  Copyright © 2016年 hbfec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMAUser.h"

@protocol FEContactsCellDelegate <NSObject>

- (void)chatAction:(NSIndexPath *)indexPath;
- (void)phoneAction:(NSIndexPath *)indexPath;

@end
@interface FEContactsCell : UITableViewCell

@property (nonatomic, strong) IMAUser *contact;
@property (nonatomic, copy) NSString *highlightText;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, weak) id<FEContactsCellDelegate> delegate;

@end

