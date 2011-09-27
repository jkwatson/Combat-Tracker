//
//  Combatant.h
//  CombatTracker
//
//  Created by John Watson on 9/25/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Combatant : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * armorClass;
@property (nonatomic, retain) NSString * details;
@property (nonatomic, retain) NSNumber * fortitude;
@property (nonatomic, retain) NSNumber * maxHp;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * reflex;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSNumber * will;
@property (nonatomic, retain) NSSet *encounterState;
@property (nonatomic, retain) NSManagedObject *party;
@end

@interface Combatant (CoreDataGeneratedAccessors)

- (void)addEncounterStateObject:(NSManagedObject *)value;
- (void)removeEncounterStateObject:(NSManagedObject *)value;
- (void)addEncounterState:(NSSet *)values;
- (void)removeEncounterState:(NSSet *)values;

@end
