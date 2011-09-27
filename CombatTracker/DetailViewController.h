#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@class RootViewController;
@class Combatant;

@interface DetailViewController : UIViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate>

@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;

@property (nonatomic, retain) Combatant *combatant;

@property (nonatomic, retain) IBOutlet UITextField *combatantNameField;

@property (nonatomic, assign) IBOutlet RootViewController *rootViewController;

- (IBAction)insertNewObject:(id)sender;

- (IBAction)nameEditingComplete:(id) sender;

@end
