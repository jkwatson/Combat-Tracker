#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CombatantState;

@interface Encounter : NSManagedObject {
@private
}
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSSet *combatantsStates;
@end

@interface Encounter (CoreDataGeneratedAccessors)

- (void)addCombatantsStatesObject:(CombatantState *)value;
- (void)removeCombatantsStatesObject:(CombatantState *)value;
- (void)addCombatantsStates:(NSSet *)values;
- (void)removeCombatantsStates:(NSSet *)values;

@end
