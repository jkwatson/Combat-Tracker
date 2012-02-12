#import <UIKit/UIKit.h>

@interface EncounterViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate> {
@private
}
@property(nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property(nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property(nonatomic, strong) NSMutableArray *activeCombatants;
@property(nonatomic, strong) NSMutableArray *inActiveCombatants;
@property(nonatomic, strong) IBOutlet UITableView *tableView;
@property(nonatomic, strong) IBOutlet UIToolbar *toolBar;
@property(nonatomic, strong) UINib *cellNibCache;
@property(nonatomic, strong) IBOutlet UIBarButtonItem *doneButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *addCombatantButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *nextInitiativeButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *flexibleSpace;

@property(nonatomic, strong) UITextField *currentFirstResponder;
- (IBAction)doneButtonPressed:(id)sender;

- (void)persistState;

- (IBAction)addNewCombatant:(id)sender;

- (IBAction)nextInitiative:(id)sender;

- (IBAction)textFieldReturn:(id)sender;

@end
