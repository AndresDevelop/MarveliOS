//
//  YAPTableViewController.h
//  MoviedB
//
//  Created by Yebrail andres Pacheco jaime on 23/11/17.
//  Copyright © 2017 Yebrail Andres Pacheco jaime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YAPMoviedB.h"
#import "YAPMoviesdB.h"
#import "YAPNewCellTableViewCell.h"
#import "YapMovesViewController.h"

@interface YAPTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating>


@property(strong, nonatomic) YAPMoviedB *model;
@property(strong , nonatomic) YAPMoviesdB *modelMovies;


@property(strong, nonatomic) NSArray *jsonFilered;




// We're going to create our initializer but remember TableViewController has its own initializer so what we are going to do it's create a new one wichi is allow us to do more things



-(id)initWithModelMovies:(YAPMoviesdB *)aModel
                   style:(UITableViewStyle ) aStyle;


@end
