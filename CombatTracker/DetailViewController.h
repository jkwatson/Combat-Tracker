#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@class RootViewController;
@class Combatant;

@interface DetailViewController : UIViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate>

@property (nonatomic, strong) IBOutlet UIToolbar *toolbar;

@property (nonatomic, strong) Combatant *combatant;

@property (nonatomic, strong) IBOutlet UITextField *combatantNameField;

@property (nonatomic, unsafe_unretained) IBOutlet RootViewController *rootViewController;

- (IBAction)insertNewObject:(id)sender;

- (IBAction)nameEditingComplete:(id) sender;

@end
