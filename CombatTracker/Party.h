#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Combatant;

@interface Party : NSManagedObject {
@private
}
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSSet *members;
@end

@interface Party (CoreDataGeneratedAccessors)

- (void)addMembersObject:(Combatant *)value;
- (void)removeMembersObject:(Combatant *)value;
- (void)addMembers:(NSSet *)values;
- (void)removeMembers:(NSSet *)values;

@end
