//
//  YAPMoviedB.h
//  MoviedB
//
//  Created by Yebrail andres Pacheco jaime on 23/11/17.
//  Copyright © 2017 Yebrail Andres Pacheco jaime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YAPNewCellTableViewCell.h"

@interface YAPMoviedB : NSObject

// Okay, We're going to create a chunk of code below this coments which is allow us to create our model's properties

@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) NSString *overView;
@property(strong, nonatomic) UIImage *image;
@property(strong, nonatomic) NSString *imageUrl;
@property(strong, nonatomic) NSNumber *voteAverege;




@property(strong, nonatomic ) YAPNewCellTableViewCell *CellCustom;


//We're going to create our constructor and this chunk of code is going to creat "Alloc and init" for us
+(id)withTitle:(NSString *) aTitle
      overView:(NSString *) aOverview
         image:(UIImage *) aImage
      imageUrl:(NSString *) aImageUrl
   voteAverege:(NSNumber *) aVote;




//Perfect, so what we've got so far is our properties and now what we need is to create our designed initializer wich is going to initialize our variables(get and set)
-(id) initWithTitle: (NSString *) aTitle
           overView: (NSString *)aOverView
              image:(UIImage *) aImage
           imageUrl:(NSString *) aImageUrl
        voteAverege:(NSNumber *) aVote;


// Inicializador a partir de diccionario JSON
-(id) initWithDictionary:(NSDictionary *)aDict;

@end
