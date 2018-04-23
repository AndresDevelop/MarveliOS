
#import "YAPMoviedB.h"

@implementation YAPMoviedB
@synthesize image = _image;




//Over here we're going to set up our constructor

+(id)withTitle:(NSString *) aTitle
      overView:(NSString *) aOverview
         image:(UIImage *) aImage
      imageUrl:(NSString *) aImageUrl
   voteAverege:(NSNumber *) aVote;
{
    
    
    return [[self alloc]initWithTitle:aTitle
                             overView:aOverview
                                image:aImage
                             imageUrl:aImageUrl
                          voteAverege:aVote];


}



// Okay, Below this chunck of code we are going to implementation our desigend initializer

-(id) initWithTitle: (NSString *) aTitle
           overView: (NSString *)aOverView
              image:(UIImage *) aImage
           imageUrl:(NSString * ) aImageUrl
        voteAverege:(NSNumber *) aVote{
    

    
    if(self = [super init]){
    
    //We're going to assign the parameters to instance variables
        _title = aTitle;
        _overView = aOverView;
        _image = aImage;
        _imageUrl = aImageUrl;
        _voteAverege = aVote;
    
    
    }
    
    
    return  self;
    
}

-(UIImage *) image{
    
    


    //We're going to create a queue
    
    dispatch_queue_t JsonParse = dispatch_queue_create("parse", 0);
    
    
    //We're going to send one methond wich one wants to do it in 2 plane
    
    
    dispatch_async(JsonParse, ^{
        
        
        
        NSString *baseUrl = @"https://image.tmdb.org/t/p/w500";
        NSString *pathImage = self.imageUrl;
        
        NSURL *urlImage = [NSURL URLWithString:[baseUrl stringByAppendingString: pathImage]];
        _image = [UIImage  imageWithData:[NSData dataWithContentsOfURL:urlImage]];
        
        
        
        
    });
    
    // Interaction with User Interface - Main thread
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.CellCustom.Indicator stopAnimating];
        self.CellCustom.Indicator.hidden = YES;
    });
    
    
     return _image;

    
}



-(id) initWithDictionary:(NSDictionary *)aDict{
    
    
    return[self initWithTitle:[aDict objectForKey:@"title"]
                     overView:[aDict objectForKey:@"overview"]
                        image:nil
                     imageUrl:[aDict objectForKey:@"poster_path"]
                  voteAverege:[aDict objectForKey:@"vote_average"] ];
}




@end
