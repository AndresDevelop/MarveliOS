

#import <Foundation/Foundation.h>
#import "YAPMoviedB.h"

@interface YAPMoviesdB : NSObject

@property(nonatomic, readonly) NSInteger *countMovies;

@property(nonatomic , strong) NSString *urlMovie;


- (YAPMoviedB *)redWineAtIndex:(NSUInteger)index;
- (YAPMoviedB *)MoviesAtIndex:(NSUInteger)index;




@property (strong, nonatomic) NSMutableArray *MovieTitle;
@property (strong, nonatomic) NSMutableArray *title;




//Perfect, so what we've got so far is our properties and now what we need is to create our designed initializer wich is going to initialize our variables(get and set)

-(id)initWithUrlMovie:(NSString *)aUrlMovie;


@end
