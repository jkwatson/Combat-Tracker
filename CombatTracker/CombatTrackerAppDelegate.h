#import <UIKit/UIKit.h>

@class RootViewController;

@class DetailViewController;

@interface CombatTrackerAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, strong) IBOutlet UIWindow *window;

@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@property (nonatomic, strong) IBOutlet UISplitViewController *splitViewController;

@property (nonatomic, strong) IBOutlet RootViewController *rootViewController;

@property (nonatomic, strong) IBOutlet DetailViewController *detailViewController;

@end
