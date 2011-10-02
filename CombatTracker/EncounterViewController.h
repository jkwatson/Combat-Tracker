#import <UIKit/UIKit.h>

@interface EncounterViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate> {
@private
}
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSMutableArray *activeCombatants;
@property (nonatomic, retain) NSMutableArray *inActiveCombatants;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) id cellNibCache;

@property(nonatomic, retain) UITextField *currentFirstResponder;

- (void)persistState;

- (IBAction) addNewCombatant:(id) sender;
- (IBAction) nextInitiative:(id) sender;

@end
