#import "EncounterViewController.h"
#import "CombatantState.h"
#import "Combatant.h"

@interface EncounterViewController ()
- (CombatantState *)createCombatantWithName:(NSString *)name active:(BOOL)active;

- (void)refreshLocalData;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation EncounterViewController

@synthesize fetchedResultsController;
@synthesize managedObjectContext;
@synthesize tableView;
@synthesize activeCombatants;
@synthesize inActiveCombatants;

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    tableView.delegate = self;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.editing = YES;
    [self refreshLocalData];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)persistState {
    int i = 0;
    for (CombatantState *combatant in self.activeCombatants) {
        combatant.inInitiative = [NSNumber numberWithInt:1];
        combatant.initiativeOrder = [NSNumber numberWithInt:i++];
    }
    for (CombatantState *combatant in self.inActiveCombatants) {
        combatant.inInitiative = [NSNumber numberWithInt:0];
        combatant.initiativeOrder = [NSNumber numberWithInt:i++];
    }
    [self.managedObjectContext save:nil];
}

- (IBAction)addNewCombatant:(id)sender {
    CombatantState *newCombatantState = [self createCombatantWithName:@"New Guy" active:NO];
    [self.inActiveCombatants addObject:newCombatantState];
    [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:self.inActiveCombatants.count - 1 inSection:1]] withRowAnimation:UITableViewRowAnimationLeft];
    [self persistState];
}

- (IBAction)nextInitiative:(id)sender {
    if (self.activeCombatants.count == 0) {
        return;
    }
    CombatantState *firstGuy = [self.activeCombatants objectAtIndex:0];
    [self.activeCombatants removeObjectAtIndex:0];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
    [self.activeCombatants addObject:firstGuy];
    [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:self.activeCombatants.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
    [self persistState];
}

#pragma mark - Fetched results controller

- (CombatantState *)createCombatantWithName:(NSString *)name active:(BOOL)active {
    NSEntityDescription *combatantEntity = [NSEntityDescription entityForName:@"Combatant" inManagedObjectContext:managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"CombatantState" inManagedObjectContext:managedObjectContext];
    CombatantState *combatantState = [[[CombatantState alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext] autorelease];
    Combatant *combatant = [[Combatant alloc] initWithEntity:combatantEntity insertIntoManagedObjectContext:self.managedObjectContext];
    combatant.name = name;
    combatantState.combatant = [combatant autorelease];
    combatantState.inInitiative = [NSNumber numberWithBool:active];
    if (active) {
        combatantState.initiativeOrder = [NSNumber numberWithInt:[self tableView:self.tableView numberOfRowsInSection:1]];
    }
    else {
        combatantState.initiativeOrder = [NSNumber numberWithInt:[self tableView:self.tableView numberOfRowsInSection:0]];
    }
//    NSLog(@"combatantState in init = %@", combatantState.inInitiative);

    [self.managedObjectContext insertObject:combatantState];
//    [combatantState release];
    return combatantState;
}

- (void)initializeEncounter {
//    NSLog(@"creating new Encounter...");
    [self.activeCombatants addObject:[self createCombatantWithName:@"New" active:YES]];
    [self.activeCombatants addObject:[self createCombatantWithName:@"Another" active:NO]];
    [self persistState];
}

- (void)refreshLocalData {
    self.activeCombatants = [NSMutableArray array];
    self.inActiveCombatants = [NSMutableArray array];
    [self.fetchedResultsController performFetch:nil];
    NSArray *data = self.fetchedResultsController.sections;

    for (id <NSFetchedResultsSectionInfo> sectionInfo in data) {
        NSString *title = sectionInfo.name;
        if ([title isEqualToString:@"1"]) {
//            NSLog(@"assigning active combatants");
            self.activeCombatants = [NSMutableArray arrayWithArray:sectionInfo.objects];
        }
        else {
//            NSLog(@"assigning inactive combatants");
            self.inActiveCombatants = [NSMutableArray arrayWithArray:sectionInfo.objects];
        }
    }
//    NSLog(@"reloading data");
    [tableView reloadData];
}

- (NSFetchedResultsController *)fetchedResultsController {
    if (fetchedResultsController != nil) {
        return fetchedResultsController;
    }

    /*
     Set up the fetched results controller.
    */
    // Create the fetch request for the entity.
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"CombatantState" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    [fetchRequest setIncludesSubentities:YES];
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:200];

    // Edit the sort key as appropriate.
    NSSortDescriptor *activeSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"inInitiative" ascending:NO];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"initiativeOrder" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:activeSortDescriptor, sortDescriptor, nil];

    [fetchRequest setSortDescriptors:sortDescriptors];

    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext sectionNameKeyPath:@"inInitiative" cacheName:@"Root"];

    [aFetchedResultsController performFetch:nil];
    if ([[aFetchedResultsController sections] count] == 0) {
        [self initializeEncounter];
    }

    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;

    [aFetchedResultsController release];
    [fetchRequest release];
    [sortDescriptor release];
    [activeSortDescriptor release];
    [sortDescriptors release];

    [self refreshLocalData];

    return fetchedResultsController;
}


#pragma mark - Fetched results controller delegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
//    NSLog(@"%s", _cmd);

//    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
//    NSLog(@"%s", _cmd);

//    switch(type) {
//        case NSFetchedResultsChangeInsert:
//            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
//            break;
//
//        case NSFetchedResultsChangeDelete:
//            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
//            break;
//    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
//    NSLog(@"%s", _cmd);

//    switch (type) {

//        case NSFetchedResultsChangeInsert:
//            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
//            break;

//        case NSFetchedResultsChangeDelete:
//            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//            break;
//
//        case NSFetchedResultsChangeUpdate:
//            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
//            break;
//
//        case NSFetchedResultsChangeMove:
//            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]withRowAnimation:UITableViewRowAnimationFade];
//            break;
//    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
//    NSLog(@"%s", _cmd);

//    [self.tableView endUpdates];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    NSLog(@"%s : %li", _cmd, section);

    if (section == 0) {
        return @"Active Combatants";
    }
    else {
        return @"Inactive";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog(@"%s: %li", _cmd, section);

    if (section == 0) {
        NSUInteger result = self.activeCombatants.count;
//        NSLog(@"result = %lu", result);
        return result;
    }
    else {
        NSUInteger result = self.inActiveCombatants.count;
//        NSLog(@"result = %lu", result);
        return result;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell...
    [self configureCell:cell atIndexPath:indexPath];

    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"%s : %@", _cmd, indexPath);

    CombatantState *combatantState;
    if (indexPath.section == 0) {
        combatantState = [self.activeCombatants objectAtIndex:indexPath.row];
    }
    else {
        combatantState = [self.inActiveCombatants objectAtIndex:indexPath.row];
    }
    cell.textLabel.text = combatantState.combatant.name;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        CombatantState *deletedGuy;
        if (indexPath.section == 0) {
            deletedGuy = [self.activeCombatants objectAtIndex:indexPath.row];
            [self.activeCombatants removeObjectAtIndex:indexPath.row];
        }
        else {
            deletedGuy = [self.inActiveCombatants objectAtIndex:indexPath.row];
            [self.inActiveCombatants removeObjectAtIndex:indexPath.row];
        }
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.managedObjectContext deleteObject:deletedGuy];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    [self persistState];
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    NSLog(@"%s %@ %@", _cmd, fromIndexPath, toIndexPath);
    CombatantState *combatantState;
    NSUInteger fromSection = fromIndexPath.section;
    NSUInteger fromRow = fromIndexPath.row;
    NSUInteger toSection = toIndexPath.section;
    NSUInteger toRow = toIndexPath.row;

    if (fromSection == 0) {
        combatantState = [self.activeCombatants objectAtIndex:fromIndexPath.row];
        [self.activeCombatants removeObjectAtIndex:fromIndexPath.row];
    }
    else {
        combatantState = [self.inActiveCombatants objectAtIndex:fromIndexPath.row];
        [self.inActiveCombatants removeObjectAtIndex:fromIndexPath.row];
    }

    if (toSection == 0) {
        [self.activeCombatants insertObject:combatantState atIndex:toIndexPath.row];
    }
    else {
        [self.inActiveCombatants insertObject:combatantState atIndex:toIndexPath.row];
    }

    [self persistState];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

- (void)dealloc {
    [fetchedResultsController release];
    [managedObjectContext release];
    [tableView release];
    [activeCombatants release];
    [inActiveCombatants release];
    [super dealloc];
}

@end
