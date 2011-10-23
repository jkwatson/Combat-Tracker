#import <UIKit/UIKit.h>
#import "MNEValueTrackingSlider.h"

@class CombatantState;
@class EncounterViewController;

@interface CombatantStateTableViewCell : UITableViewCell<SliderViewDelegate, UITextFieldDelegate> {
    UITextField *nameField;
    UITextField *acField;
    UITextField *fortField;
    UITextField *reflexField;
    UITextField *willField;
    UITextField *nameFieldChanged;
    CombatantState *combatantState;
    EncounterViewController *encounterViewController;
    MNEValueTrackingSlider *hpSlider;
}

@property (nonatomic, strong) IBOutlet UITextField *nameField;
@property (nonatomic, strong) IBOutlet UITextField *acField;
@property (nonatomic, strong) IBOutlet UITextField *fortField;
@property (nonatomic, strong) IBOutlet UITextField *reflexField;
@property (nonatomic, strong) IBOutlet UITextField *willField;
@property (strong, nonatomic) IBOutlet UITextField *hpField;
@property (strong, nonatomic) IBOutlet UITextField *maxHpField;

@property (nonatomic, strong) CombatantState *combatantState;
@property (nonatomic, strong) EncounterViewController *encounterViewController;
@property (nonatomic, strong) IBOutlet MNEValueTrackingSlider *hpSlider;


- (IBAction)nameFieldChanged:(id)sender;
- (IBAction)acFieldChanged:(id)sender;
- (IBAction)fortitudeFieldChanged:(id)sender;
- (IBAction)reflexFieldChanged:(id)sender;
- (IBAction)willFieldChanged:(id)sender;
- (IBAction)maxHpChanged:(id)sender;
- (IBAction)hpChanged:(id)sender;
- (IBAction)hpSliderValueChanged:(id)sender;

- (void) setHpBackgroundColor;


@end
