//
//  AppDelegate.m
//  MoviedB
//
//  Created by Yebrail andres Pacheco jaime on 23/11/17.
//  Copyright © 2017 Yebrail Andres Pacheco jaime. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
       //Lovely, We're going to set up our model  and we're going to use our constructor  wich is going to  do alloc and init for us
    

    
    
    YAPMoviesdB *PopularMovies = [[YAPMoviesdB alloc] initWithUrlMovie:@"https://api.themoviedb.org/3/movie/popular?api_key=d030b2940775fe5941f53c8ea5c56e83&language=en-US&page=1"];
    
    YAPMoviesdB *TopRatedMovies = [[YAPMoviesdB alloc] initWithUrlMovie:@"https://api.themoviedb.org/3/movie/top_rated?api_key=d030b2940775fe5941f53c8ea5c56e83&language=en-US&page=1"];
    
    YAPMoviesdB *UpcomingMovies = [[YAPMoviesdB alloc] initWithUrlMovie:@"https://api.themoviedb.org/3/movie/upcoming?api_key=d030b2940775fe5941f53c8ea5c56e83&language=en-US&page=1"];
    
    
    // This our controller
    
    
    YAPTableViewController *tablePopular = [[YAPTableViewController alloc] initWithModelMovies:PopularMovies style:UITableViewStylePlain];
    
    YAPTableViewController *tableTopRated = [[YAPTableViewController alloc] initWithModelMovies:TopRatedMovies style:UITableViewStylePlain];
    
       YAPTableViewController *tableUpcoming = [[YAPTableViewController alloc] initWithModelMovies:UpcomingMovies style:UITableViewStylePlain];
    //We create our Tab Bar Controller
    
    UITabBarController *tapBar = [[UITabBarController alloc]init];
    tapBar.viewControllers =@[tablePopular, tableTopRated, tableUpcoming];
    
    //This or navigation
    
    UINavigationController *AppNav = [[UINavigationController alloc] initWithRootViewController:tapBar];
    
    // Over there we're going to assign our controller which one we've created before and we're going to tell to the app is the main controller
    
    self.window.rootViewController=AppNav;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
