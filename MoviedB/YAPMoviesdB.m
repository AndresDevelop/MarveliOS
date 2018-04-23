
#import "YAPMoviesdB.h"

@interface YAPMoviesdB ()




@end

@implementation YAPMoviesdB

NSDictionary *JSONObjects;

-(id)initWithUrlMovie:(NSString *)aUrlMovie{


        if(self =[super init])
        {
        
        
            _urlMovie=aUrlMovie;
            [self LoadPage];
        }
    
    return self;
}







-(void)LoadPage{


    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlMovie]];
    NSURLResponse *response=[[NSURLResponse alloc]init ];
    NSError *error;
    NSData *data =[NSURLConnection sendSynchronousRequest:request
                                        returningResponse:&response
                                                    error:&error];
    
    
    if (data != nil) {
        JSONObjects =[NSJSONSerialization  JSONObjectWithData:data
                                                      options:kNilOptions
                                                        error:&error];
        
        int limite = (int) [[JSONObjects objectForKey:@"results"] count];
        self.MovieTitle = [[NSMutableArray alloc] initWithCapacity:limite];
        self.title = [[NSMutableArray alloc] initWithCapacity:limite];

        
   





        for (int i = 0 ; i < limite; i++) {
            NSDictionary *movies = [[ JSONObjects objectForKey:@"results"] objectAtIndex:i];
            YAPMoviedB *model = [[YAPMoviedB alloc] initWithDictionary:movies];
             _title = [JSONObjects objectForKey:@"results"];
            [self.MovieTitle addObject:model];
            NSLog(@"%@",_title);
            
        
        
        }
        
        
        

        
        
    }


}





- (YAPMoviedB *)redWineAtIndex:(NSUInteger)index
{
    return [self.MovieTitle objectAtIndex:index];
}




@end
