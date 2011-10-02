#import <UIKit/UIKit.h>
#import "MNEValueTrackingSlider.h"

@class CombatantState;
@class EncounterViewController;

@interface CombatantStateTableViewCell : UITableViewCell<SliderViewDelegate> {
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

@property (nonatomic, retain) IBOutlet UITextField *nameField;
@property (nonatomic, retain) IBOutlet UITextField *acField;
@property (nonatomic, retain) IBOutlet UITextField *fortField;
@property (nonatomic, retain) IBOutlet UITextField *reflexField;
@property (nonatomic, retain) IBOutlet UITextField *willField;
@property (retain, nonatomic) IBOutlet UITextField *hpField;
@property (retain, nonatomic) IBOutlet UITextField *maxHpField;

@property (nonatomic, retain) CombatantState *combatantState;
@property (nonatomic, retain) EncounterViewController *encounterViewController;
@property (nonatomic, retain) IBOutlet MNEValueTrackingSlider *hpSlider;


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
