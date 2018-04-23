

#import "YAPNewCellTableViewCell.h"

@implementation YAPNewCellTableViewCell
int Count =0;
int count2 = 0;
NSString * idLast;



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


    
    
}



- (IBAction)LikeBtn:(id)sender {
    
    if (sender != idLast) {
        Count=0;
    }
    idLast = sender;

    
    Count+= 1;
  _LabelLike.text = [NSString stringWithFormat:@"%d", Count];
    
    
}

- (IBAction)DislikeBtb:(id)sender { 
    
   
    if (sender != idLast) {
        count2=0;
    }
    idLast = sender;
    count2+= 1;
    _DislikeLabel.text = [NSString stringWithFormat:@"%d", count2];
}
@end
