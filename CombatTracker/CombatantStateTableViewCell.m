#import "CombatantStateTableViewCell.h"

@implementation CombatantStateTableViewCell
@synthesize nameField;
@synthesize acField;
@synthesize fortField;
@synthesize reflexField;
@synthesize willField;

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
    [super dealloc];
}
@end
