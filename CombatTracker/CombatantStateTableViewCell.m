#import "CombatantStateTableViewCell.h"
#import "CombatantState.h"
#import "Combatant.h"
#import "EncounterViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation CombatantStateTableViewCell
@synthesize nameField;
@synthesize acField;
@synthesize fortField;
@synthesize reflexField;
@synthesize willField;
@synthesize hpField;
@synthesize maxHpField;
@synthesize combatantState;
@synthesize encounterViewController;
@synthesize hpSlider;


- (void) setHpSlider:(MNEValueTrackingSlider *)slider {
    hpSlider = [slider retain];
    hpSlider.sliderViewDelegate = self;
}

- (void) setHpField:(UITextField *)field {
    hpField = field;
    hpField.layer.cornerRadius=8.0f;
    hpField.layer.masksToBounds=YES;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}

- (void)dealloc {
    [nameField release];
    [acField release];
    [fortField release];
    [reflexField release];
    [willField release];
    [nameFieldChanged release];
    [combatantState release];
    [encounterViewController release];
    [hpField release];
    [maxHpField release];
    [hpSlider release];
    [super dealloc];
}

- (IBAction)nameFieldChanged:(id)sender {
    self.combatantState.combatant.name = nameField.text;
    [encounterViewController persistState];
}

- (IBAction)acFieldChanged:(id)sender {
    self.combatantState.combatant.armorClass = [NSNumber numberWithInt:acField.text.integerValue];
    [encounterViewController persistState];
}

- (IBAction)fortitudeFieldChanged:(id)sender {
    self.combatantState.combatant.fortitude = [NSNumber numberWithInt:fortField.text.integerValue];
    [encounterViewController persistState];
}

- (IBAction)reflexFieldChanged:(id)sender {
    self.combatantState.combatant.reflex = [NSNumber numberWithInt:reflexField.text.integerValue];
    [encounterViewController persistState];
}

- (IBAction)willFieldChanged:(id)sender {
    self.combatantState.combatant.will = [NSNumber numberWithInt:willField.text.integerValue];
    [encounterViewController persistState];
}


- (IBAction)maxHpChanged:(id)sender {
    int maxHp = maxHpField.text.integerValue;
    self.combatantState.combatant.maxHp = [NSNumber numberWithInt: maxHp];
    [encounterViewController persistState];
    self.hpSlider.maximumValue = maxHp;
}

- (void) setHpBackgroundColor {
    NSInteger currentHp = self.combatantState.currentHp.intValue;
    NSInteger maxHp = self.combatantState.combatant.maxHp.intValue;
    NSInteger bloodiedValue = maxHp / 2;
    if (currentHp <= bloodiedValue) {
        self.hpField.backgroundColor = [UIColor redColor];
        self.hpField.textColor = [UIColor blackColor];
    }
    else {
        self.hpField.backgroundColor = [UIColor whiteColor];       
        self.hpField.textColor = [UIColor blackColor];
    }
}

- (IBAction)hpChanged:(id)sender {
    self.combatantState.currentHp = [NSNumber numberWithInt:hpField.text.integerValue];
    self.hpSlider.value = self.combatantState.currentHp.intValue;
    [self setHpBackgroundColor];
    [encounterViewController persistState];
}

- (IBAction)hpSliderValueChanged:(id)sender {
    int hp = self.hpSlider.value;
    self.combatantState.currentHp = [NSNumber numberWithInt:hp];
    self.hpField.text = [[NSNumber numberWithInt:hp] stringValue];
    [self setHpBackgroundColor];
    [encounterViewController persistState];    
}

- (NSInteger) sliderValueToBeDisplayed: (NSInteger) currentSliderValue {
    return currentSliderValue - self.combatantState.currentHp.intValue;
}


@end
