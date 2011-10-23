#import <UIKit/UIKit.h>

@class DetailViewController;
@class Combatant;

#import <CoreData/CoreData.h>

@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) IBOutlet DetailViewController *detailViewController;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

- (void)insertNewObject:(id)sender;

- (void)saveCombatant:(Combatant *)combatant;


@end
