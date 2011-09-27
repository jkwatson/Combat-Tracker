#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CombatantState;

@interface Encounter : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *combatantsStates;
@end

@interface Encounter (CoreDataGeneratedAccessors)

- (void)addCombatantsStatesObject:(CombatantState *)value;
- (void)removeCombatantsStatesObject:(CombatantState *)value;
- (void)addCombatantsStates:(NSSet *)values;
- (void)removeCombatantsStates:(NSSet *)values;

@end
