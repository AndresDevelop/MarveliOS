
#import "YapMovesViewController.h"

@interface YapMovesViewController ()

@end

@implementation YapMovesViewController


-(id) initWithModel:( YAPMoviedB *) aModel{


    if (self = [super initWithNibName:nil bundle:nil]) {
        
        // Over there as usual We're going to assign the parameters to instance variables
        
        _model=aModel;
        
        
        
    }
    
    return self;


}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


-(void) viewWillAppear:(BOOL)animated{


    [super viewWillAppear:animated];
    
    
    
 
    
    
    self.TitleLable.text = self.model.title;
    self.OverViewLabel.text = self.model.overView;
    self.imageMovie.image = self.model.image;
    self.VoteLabel.text = [self.model.voteAverege stringValue];
  
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
