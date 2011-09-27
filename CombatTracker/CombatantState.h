#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Combatant, Encounter;

@interface CombatantState : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * currentHp;
@property (nonatomic, retain) NSNumber * inInitiative;
@property (nonatomic, retain) Combatant *combatant;
@property (nonatomic, retain) Encounter *encounter;
@property (nonatomic, retain) NSNumber* initiativeOrder;

@end
