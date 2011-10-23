#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Combatant, Encounter;

@interface CombatantState : NSManagedObject {
@private
}
@property (nonatomic, strong) NSNumber * currentHp;
@property (nonatomic, strong) NSNumber * inInitiative;
@property (nonatomic, strong) Combatant *combatant;
@property (nonatomic, strong) Encounter *encounter;
@property (nonatomic, strong) NSNumber* initiativeOrder;

@end
