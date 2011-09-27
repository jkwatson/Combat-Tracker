#import <UIKit/UIKit.h>

@interface CombatantStateTableViewCell : UITableViewCell {
    UITextField *nameField;
    UITextField *acField;
    UITextField *fortField;
    UITextField *reflexField;
    UITextField *willField;
}

@property (nonatomic, retain) IBOutlet UITextField *nameField;
@property (nonatomic, retain) IBOutlet UITextField *acField;
@property (nonatomic, retain) IBOutlet UITextField *fortField;
@property (nonatomic, retain) IBOutlet UITextField *reflexField;
@property (nonatomic, retain) IBOutlet UITextField *willField;

@end
