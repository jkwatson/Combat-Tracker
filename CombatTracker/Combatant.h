#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Combatant : NSManagedObject {
@private
}
@property (nonatomic, strong) NSNumber * armorClass;
@property (nonatomic, strong) NSString * details;
@property (nonatomic, strong) NSNumber * fortitude;
@property (nonatomic, strong) NSNumber * maxHp;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSNumber * reflex;
@property (nonatomic, strong) NSString * type;
@property (nonatomic, strong) NSNumber * will;
@property (nonatomic, strong) NSSet *encounterState;
@property (nonatomic, strong) NSManagedObject *party;
@end

@interface Combatant (CoreDataGeneratedAccessors)

- (void)addEncounterStateObject:(NSManagedObject *)value;
- (void)removeEncounterStateObject:(NSManagedObject *)value;
- (void)addEncounterState:(NSSet *)values;
- (void)removeEncounterState:(NSSet *)values;

@end
