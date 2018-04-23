

#import "YAPTableViewController.h"

@interface YAPTableViewController ()
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, readonly) NSArray *searchResults;

@property(nonatomic , strong) NSMutableArray *MoviesTitles;

@property (nonatomic, strong) NSMutableArray *nombres;



@end

@implementation YAPTableViewController
UITableViewCell *cell;
NSDictionary * JSONObjects2;
NSDictionary *Filtred;







//Okay, so What we have to do now it's to implement our init how? as usual. remember this init is a little bit dif beacuse we're working with a TableView
-(id)initWithModelMovies:(YAPMoviesdB *)aModel
                   style:(UITableViewStyle ) aStyle{



    if(self = [super initWithStyle:aStyle]){
    
        _modelMovies = aModel;
        self.title = @"TopRated";
    }


    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [[self.tabBarController.tabBar.items objectAtIndex:0 ] setTitle:@"Popular"];
    [[self.tabBarController.tabBar.items objectAtIndex:1 ] setTitle:@"TopRated"];
    [[self.tabBarController.tabBar.items objectAtIndex:2 ] setTitle:@"UpComing"];
    self.nombres = [NSMutableArray arrayWithArray:@[@"Miguel",@"Erik",@"Pedro",@"Victor",@"Juanpe",@"Javi",@"Sendoa" ,@"Miguel",@"Erik",@"Pedro",@"Victor",@"Juanpe",@"Javi",@"Sendoa",@"Miguel",@"Erik",@"Pedro",@"Victor",@"Juanpe",@"Javi",@"Sendoa"]];

   

    if(self.tabBarController.selectedIndex == 2){
    
        NSLog(@"%s", "Hola");
    }
    
    
}

-(void) viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    self.navigationController.topViewController.title= @"MoviedB";
    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
    if (!_searchController.searchBar.superview) {
        self.tableView.tableHeaderView = self.searchController.searchBar;
    }
    if (!self.searchController.active && self.searchController.searchBar.text.length == 0) {
        self.tableView.contentOffset = CGPointMake(0, CGRectGetHeight(self.searchController.searchBar.frame));
    }
    

}


- (UISearchController *)searchController {
    if (!_searchController) {
        _searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
        _searchController.searchResultsUpdater = self;
        _searchController.dimsBackgroundDuringPresentation = NO;
        _searchController.searchBar.delegate = self;
        [_searchController.searchBar sizeToFit];
    }
    return _searchController;
}



- (NSArray *)searchResults{
    NSString *searchString = self.searchController.searchBar.text;
    NSString *key =@"title";
    if (searchString.length > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@" ,key, searchString];
        return [self.modelMovies.title filteredArrayUsingPredicate:predicate ];

    }
    else {
        return self.modelMovies.title;
    }
    return @[];

}



        





- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (self.searchController.isActive) {
        self.searchController.active = NO;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.searchController.isActive && self.searchController.searchBar.text.length > 0) {
        return self.searchResults.count;
    }
    else {
        return 20;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier=@"AppCell";
    
    YAPNewCellTableViewCell *newCell = (YAPNewCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    
    if (newCell == nil) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"YAPNewCellTableViewCell" owner:self options:nil];
        newCell = (YAPNewCellTableViewCell *)[nib objectAtIndex:0];
    }
    
    

    YAPMoviedB *wine = [self wineForIndexPath:indexPath];
    
    
  
    
    UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 5)];
    separatorLineView.backgroundColor = [UIColor whiteColor];
    [newCell.contentView addSubview:separatorLineView];
   
    if (self.searchController.isActive && (![self.searchController.searchBar.text isEqualToString:@""])) {
        Filtred = [self.searchResults objectAtIndex:indexPath.row];
        _jsonFilered = [self.searchResults objectAtIndex:indexPath.row];
        newCell.TitlteLabel.text= [Filtred objectForKey:@"title"];
        newCell.OverViewCell.text = [Filtred objectForKey:@"overview"];
        
    }
    else {
        
        newCell.TitlteLabel.text= wine.title;
        newCell.ImageCell.image=wine.image;
        newCell.OverViewCell.text= wine.overView;

        
    }

    
   
    
    
    return newCell;
    
}


- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    [self.tableView reloadData];
}



- (YAPMoviedB *)wineForIndexPath:(NSIndexPath *)indexPath
{
    // Averiguamos de qué vino se trata
    YAPMoviedB *wine = nil;
    
        wine = [self.modelMovies redWineAtIndex:indexPath.row];
//    NSLog(@"%ld", (long)indexPath.row);

    
    return wine;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 157;
}
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
