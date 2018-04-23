

#import <UIKit/UIKit.h>

@interface YAPNewCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ImageCell;
@property (weak, nonatomic) IBOutlet UILabel *TitlteLabel;
@property (weak, nonatomic) IBOutlet UILabel *OverViewCell;
@property (weak, nonatomic) IBOutlet UILabel *LabelLike;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *Indicator;
@property (weak, nonatomic) IBOutlet UILabel *DislikeLabel;
- (IBAction)LikeBtn:(id)sender;
- (IBAction)DislikeBtb:(id)sender;


@end
