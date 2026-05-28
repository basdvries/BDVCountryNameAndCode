//
//  BDVCountryNameAndCodeTests.m
//  BDVCountryNameAndCode
//
//  Unit tests for BDVCountryNameAndCode methods.
//

#import "BDVCountryNameAndCode.h"

static int totalTests = 0;
static int passedTests = 0;
static int failedTests = 0;

static void assertCondition(BOOL condition, const char *testName) {
    totalTests++;
    if (condition) {
        passedTests++;
        printf("  PASS: %s\n", testName);
    } else {
        failedTests++;
        printf("  FAIL: %s\n", testName);
    }
}

#pragma mark - getCountrySuffixForPrefix tests

static void testGetCountrySuffixForPrefix_uniqueCode(BDVCountryNameAndCode *sut) {
    printf("\n--- getCountrySuffixForPrefix: unique dial code ---\n");

    // Afghanistan has dial_code 93 (stored as NSNumber)
    // The method takes NSString, so passing an NSNumber is required for plist integer values
    NSArray *result = [sut getCountrySuffixForPrefix:@93];
    assertCondition(result != nil, "result is not nil for Afghanistan dial code 93");
    assertCondition([result count] == 1, "exactly one country for dial code 93");
    assertCondition([result containsObject:@"AF"], "AF returned for dial code 93");
}

static void testGetCountrySuffixForPrefix_sharedCode(BDVCountryNameAndCode *sut) {
    printf("\n--- getCountrySuffixForPrefix: shared dial code ---\n");

    // dial_code 44 is shared by GB, GG, IM, JE (all stored as NSNumber)
    NSArray *result = [sut getCountrySuffixForPrefix:@44];
    assertCondition(result != nil, "result is not nil for dial code 44");
    assertCondition([result count] == 4, "four countries share dial code 44");
    assertCondition([result containsObject:@"GB"], "GB in results for dial code 44");
    assertCondition([result containsObject:@"GG"], "GG in results for dial code 44");
    assertCondition([result containsObject:@"IM"], "IM in results for dial code 44");
    assertCondition([result containsObject:@"JE"], "JE in results for dial code 44");
}

static void testGetCountrySuffixForPrefix_stringDialCode(BDVCountryNameAndCode *sut) {
    printf("\n--- getCountrySuffixForPrefix: string dial code ---\n");

    // AmericanSamoa has dial_code "+1 684" (stored as NSString)
    NSArray *result = [sut getCountrySuffixForPrefix:@"+1 684"];
    assertCondition(result != nil, "result is not nil for +1 684");
    assertCondition([result count] == 1, "one country for +1 684");
    assertCondition([result containsObject:@"AS"], "AS returned for +1 684");
}

static void testGetCountrySuffixForPrefix_noMatch(BDVCountryNameAndCode *sut) {
    printf("\n--- getCountrySuffixForPrefix: no matching prefix ---\n");

    NSArray *result = [sut getCountrySuffixForPrefix:@"+99999"];
    assertCondition([result count] == 0, "empty/nil result for non-existent prefix +99999");
}

static void testGetCountrySuffixForPrefix_nilPrefix(BDVCountryNameAndCode *sut) {
    printf("\n--- getCountrySuffixForPrefix: nil prefix ---\n");

    NSArray *result = [sut getCountrySuffixForPrefix:nil];
    assertCondition(result != nil || result == nil, "does not crash with nil prefix");
}

static void testGetCountrySuffixForPrefix_multipleSharedCodes(BDVCountryNameAndCode *sut) {
    printf("\n--- getCountrySuffixForPrefix: additional shared codes ---\n");

    // dial_code 61 is shared by AU, CX, CC
    NSArray *result61 = [sut getCountrySuffixForPrefix:@61];
    assertCondition(result61 != nil, "result not nil for dial code 61");
    assertCondition([result61 count] == 3, "three countries share dial code 61");
    assertCondition([result61 containsObject:@"AU"], "AU in results for dial code 61");
    assertCondition([result61 containsObject:@"CX"], "CX in results for dial code 61");
    assertCondition([result61 containsObject:@"CC"], "CC in results for dial code 61");

    // dial_code 1 is shared by CA, US
    NSArray *result1 = [sut getCountrySuffixForPrefix:@1];
    assertCondition(result1 != nil, "result not nil for dial code 1");
    assertCondition([result1 count] == 2, "two countries share dial code 1");
    assertCondition([result1 containsObject:@"US"], "US in results for dial code 1");
    assertCondition([result1 containsObject:@"CA"], "CA in results for dial code 1");

    // dial_code 47 is shared by NO, SJ
    NSArray *result47 = [sut getCountrySuffixForPrefix:@47];
    assertCondition(result47 != nil, "result not nil for dial code 47");
    assertCondition([result47 count] == 2, "two countries share dial code 47");
    assertCondition([result47 containsObject:@"NO"], "NO in results for dial code 47");
    assertCondition([result47 containsObject:@"SJ"], "SJ in results for dial code 47");
}

#pragma mark - prefixForCountryCode tests

static void testPrefixForCountryCode(BDVCountryNameAndCode *sut) {
    printf("\n--- prefixForCountryCode ---\n");

    // Known entries (integer dial codes stored as NSNumber)
    id prefix = [sut prefixForCountryCode:@"US"];
    assertCondition(prefix != nil, "US has a prefix");
    assertCondition([prefix isEqual:@1], "US prefix is 1");

    prefix = [sut prefixForCountryCode:@"DE"];
    assertCondition(prefix != nil, "DE has a prefix");
    assertCondition([prefix isEqual:@49], "DE prefix is 49");

    prefix = [sut prefixForCountryCode:@"JP"];
    assertCondition(prefix != nil, "JP has a prefix");
    assertCondition([prefix isEqual:@81], "JP prefix is 81");

    // Case insensitivity (uppercaseString is applied)
    prefix = [sut prefixForCountryCode:@"us"];
    assertCondition(prefix != nil, "lowercase 'us' resolves to a prefix");
    assertCondition([prefix isEqual:@1], "lowercase 'us' prefix is 1");

    // Non-existent country code
    prefix = [sut prefixForCountryCode:@"ZZ"];
    assertCondition(prefix == nil, "ZZ returns nil");
}

#pragma mark - countryNameAtIndex tests

static void testCountryNameAtIndex(BDVCountryNameAndCode *sut) {
    printf("\n--- countryNameAtIndex ---\n");

    // First entry in plist is Israel
    NSString *name = [sut countryNameAtIndex:0];
    assertCondition(name != nil, "index 0 returns a name");
    assertCondition([name isEqualToString:@"Israel"], "index 0 is Israel");

    // Second entry is Afghanistan
    name = [sut countryNameAtIndex:1];
    assertCondition(name != nil, "index 1 returns a name");
    assertCondition([name isEqualToString:@"Afghanistan"], "index 1 is Afghanistan");

    // Out-of-bounds returns nil
    NSArray *allNames = [sut allCountryNames];
    name = [sut countryNameAtIndex:[allNames count]];
    assertCondition(name == nil, "out-of-bounds index returns nil");
}

#pragma mark - allCountryNames / allPrefixDialingCodes tests

static void testAllCountryNames(BDVCountryNameAndCode *sut) {
    printf("\n--- allCountryNames ---\n");

    NSArray *names = [sut allCountryNames];
    assertCondition(names != nil, "allCountryNames is not nil");
    assertCondition([names count] == 242, "242 country names loaded from plist");
    assertCondition([names containsObject:@"Israel"], "contains Israel");
    assertCondition([names containsObject:@"Germany"], "contains Germany");
    assertCondition([names containsObject:@"Japan"], "contains Japan");
}

static void testAllPrefixDialingCodes(BDVCountryNameAndCode *sut) {
    printf("\n--- allPrefixDialingCodes ---\n");

    NSArray *codes = [sut allPrefixDialingCodes];
    assertCondition(codes != nil, "allPrefixDialingCodes is not nil");
    assertCondition([codes count] == 242, "242 dialing codes loaded from plist");
}

#pragma mark - initWithPlistPath tests

static void testInitWithInvalidPath(void) {
    printf("\n--- initWithPlistPath: invalid path ---\n");

    BDVCountryNameAndCode *sut = [[BDVCountryNameAndCode alloc] initWithPlistPath:@"/nonexistent/path.plist"];
    assertCondition(sut != nil, "init does not return nil for invalid path");
    NSArray *names = [sut allCountryNames];
    assertCondition([names count] == 0, "no country names loaded for invalid plist path");
    NSArray *result = [sut getCountrySuffixForPrefix:@1];
    assertCondition([result count] == 0, "no results from getCountrySuffixForPrefix with empty data");
}

static void testInitWithNilPath(void) {
    printf("\n--- initWithPlistPath: nil path ---\n");

    BDVCountryNameAndCode *sut = [[BDVCountryNameAndCode alloc] initWithPlistPath:nil];
    assertCondition(sut != nil, "init does not return nil for nil path");
    NSArray *names = [sut allCountryNames];
    assertCondition([names count] == 0, "no country names loaded for nil plist path");
}

#pragma mark - Test runner

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        if (argc < 2) {
            printf("Usage: %s <path-to-BDVCountryNameAndCode.plist>\n", argv[0]);
            return 1;
        }

        NSString *plistPath = [NSString stringWithUTF8String:argv[1]];
        printf("Loading plist from: %s\n", argv[1]);

        BDVCountryNameAndCode *sut = [[BDVCountryNameAndCode alloc] initWithPlistPath:plistPath];
        if (!sut) {
            printf("FATAL: Failed to initialize BDVCountryNameAndCode\n");
            return 1;
        }

        printf("=== BDVCountryNameAndCode Unit Tests ===\n");

        // getCountrySuffixForPrefix tests (primary focus)
        testGetCountrySuffixForPrefix_uniqueCode(sut);
        testGetCountrySuffixForPrefix_sharedCode(sut);
        testGetCountrySuffixForPrefix_stringDialCode(sut);
        testGetCountrySuffixForPrefix_noMatch(sut);
        testGetCountrySuffixForPrefix_nilPrefix(sut);
        testGetCountrySuffixForPrefix_multipleSharedCodes(sut);

        // prefixForCountryCode tests
        testPrefixForCountryCode(sut);

        // countryNameAtIndex tests
        testCountryNameAtIndex(sut);

        // allCountryNames / allPrefixDialingCodes tests
        testAllCountryNames(sut);
        testAllPrefixDialingCodes(sut);

        // Edge case: invalid/nil init paths
        testInitWithInvalidPath();
        testInitWithNilPath();

        printf("\n=== Results: %d/%d passed, %d failed ===\n",
               passedTests, totalTests, failedTests);

        return failedTests > 0 ? 1 : 0;
    }
}
