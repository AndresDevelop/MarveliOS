

#import <UIKit/UIKit.h>
#import "YAPMoviedB.h"
#import "YAPTableViewController.h"

@interface YapMovesViewController : UIViewController


//Brillant, so What we need now is to create one class's instancie beacuse we need to synchronize our controller with our model

@property(strong, nonatomic) YAPMoviedB *model;


// We're going to create our initializer , The view controller has its own init but we are going to use ours , beacuse  is better, let's do it!!!!

-(id) initWithModel:( YAPMoviedB *) aModel;
@property (weak, nonatomic) IBOutlet UILabel *TitleLable;
@property (weak, nonatomic) IBOutlet UILabel *VoteLabel;
@property (strong, nonatomic) IBOutlet UILabel *OverViewLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageMovie;

@end
