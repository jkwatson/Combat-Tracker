#import <UIKit/UIKit.h>

@interface EncounterViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate> {
@private
}
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSMutableArray *activeCombatants;
@property (nonatomic, strong) NSMutableArray *inActiveCombatants;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UINib* cellNibCache;

@property(nonatomic, strong) UITextField *currentFirstResponder;

- (void)persistState;

- (IBAction) addNewCombatant:(id) sender;
- (IBAction) nextInitiative:(id) sender;

@end
