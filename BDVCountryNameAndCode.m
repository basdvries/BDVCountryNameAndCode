//
//  BDVCountryNameAndCode.m
//  BDVCountryNameAndCode
//
//  Created by Bas de Vries on 22-10-14.
//  Copyright (c) 2014 Bas de Vries. All rights reserved.
//

#import "BDVCountryNameAndCode.h"


@implementation BDVCountryNameAndCode{
    NSArray *BDVCountryNameAndCodePlist;
    NSMutableDictionary *dictDialingCodes;
    NSMutableArray *countryNames;
    NSMutableArray *prefixDialingCodes;
}

-(id)init{
    self = [super init];
    if(self){
        /*
        
        self.dictDialingCodes = [[NSDictionary alloc]initWithObjectsAndKeys:
                             @"+972", @"IL",
                             @"+93", @"AF",
                             @"+355", @"AL",
                             @"+213", @"DZ",
                             @"+1", @"AS",
                             @"+376", @"AD",
                             @"+244", @"AO",
                             @"+1", @"AI",
                             @"+1", @"AG",
                             @"+54", @"AR",
                             @"+374", @"AM",
                             @"+297", @"AW",
                             @"+61", @"AU",
                             @"+43", @"AT",
                             @"+994", @"AZ",
                             @"+1", @"BS",
                             @"+973", @"BH",
                             @"+880", @"BD",
                             @"+1", @"BB",
                             @"+375", @"BY",
                             @"+32", @"BE",
                             @"+501", @"BZ",
                             @"+229", @"BJ",
                             @"+1", @"BM",
                             @"+975", @"BT",
                             @"+387", @"BA",
                             @"+267", @"BW",
                             @"+55", @"BR",
                             @"+246", @"IO",
                             @"+359", @"BG",
                             @"+226", @"BF",
                             @"+257", @"BI",
                             @"+855", @"KH",
                             @"+237", @"CM",
                             @"+1", @"CA",
                             @"+238", @"CV",
                             @"+345", @"KY",
                             @"+236", @"CF",
                             @"+235", @"TD",
                             @"+56", @"CL",
                             @"+86", @"CN",
                             @"+61", @"CX",
                             @"+57", @"CO",
                             @"+269", @"KM",
                             @"+242", @"CG",
                             @"+682", @"CK",
                             @"+506", @"CR",
                             @"+385", @"HR",
                             @"+53", @"CU",
                             @"+537", @"CY",
                             @"+420", @"CZ",
                             @"+45", @"DK",
                             @"+253", @"DJ",
                             @"+1", @"DM",
                             @"+1", @"DO",
                             @"+593", @"EC",
                             @"+20", @"EG",
                             @"+503", @"SV",
                             @"+240", @"GQ",
                             @"+291", @"ER",
                             @"+372", @"EE",
                             @"+251", @"ET",
                             @"+298", @"FO",
                             @"+679", @"FJ",
                             @"+358", @"FI",
                             @"33", @"FR",
                             @"+594", @"GF",
                             @"+689", @"PF",
                             @"+241", @"GA",
                             @"+220", @"GM",
                             @"+995", @"GE",
                             @"+49", @"DE",
                             @"+233", @"GH",
                             @"+350", @"GI",
                             @"+30", @"GR",
                             @"+299", @"GL",
                             @"+1", @"GD",
                             @"+590", @"GP",
                             @"+1", @"GU",
                             @"+502", @"GT",
                             @"+224", @"GN",
                             @"+245", @"GW",
                             @"+595", @"GY",
                             @"+509", @"HT",
                             @"+504", @"HN",
                             @"+36", @"HU",
                             @"+354", @"IS",
                             @"+91", @"IN",
                             @"+62", @"ID",
                             @"+964", @"IQ",
                             @"+353", @"IE",
                             @"+972", @"IL",
                             @"+39", @"IT",
                             @"+1", @"JM",
                             @"+81", @"JP",
                             @"+962", @"JO",
                             @"+77", @"KZ",
                             @"+254", @"KE",
                             @"+686", @"KI",
                             @"+965", @"KW",
                             @"+996", @"KG",
                             @"+371", @"LV",
                             @"+961", @"LB",
                             @"+266", @"LS",
                             @"+231", @"LR",
                             @"+423", @"LI",
                             @"+370", @"LT",
                             @"+352", @"LU",
                             @"+261", @"MG",
                             @"+265", @"MW",
                             @"+60", @"MY",
                             @"+960", @"MV",
                             @"+223", @"ML",
                             @"+356", @"MT",
                             @"+692", @"MH",
                             @"+596", @"MQ",
                             @"+222", @"MR",
                             @"+230", @"MU",
                             @"+262", @"YT",
                             @"+52", @"MX",
                             @"+377", @"MC",
                             @"+976", @"MN",
                             @"+382", @"ME",
                             @"+1", @"MS",
                             @"+212", @"MA",
                             @"+95", @"MM",
                             @"+264", @"NA",
                             @"+674", @"NR",
                             @"+977", @"NP",
                             @"+31", @"NL",
                             @"+599", @"AN",
                             @"+687", @"NC",
                             @"+64", @"NZ",
                             @"+505", @"NI",
                             @"+227", @"NE",
                             @"+234", @"NG",
                             @"+683", @"NU",
                             @"+672", @"NF",
                             @"+1", @"MP",
                             @"+47", @"NO",
                             @"+968", @"OM",
                             @"+92", @"PK",
                             @"+680", @"PW",
                             @"+507", @"PA",
                             @"+675", @"PG",
                             @"+595", @"PY",
                             @"+51", @"PE",
                             @"+63", @"PH",
                             @"+48", @"PL",
                             @"+351", @"PT",
                             @"+1", @"PR",
                             @"+974", @"QA",
                             @"+40", @"RO",
                             @"+250", @"RW",
                             @"+685", @"WS",
                             @"+378", @"SM",
                             @"+966", @"SA",
                             @"+221", @"SN",
                             @"+381", @"RS",
                             @"+248", @"SC",
                             @"+232", @"SL",
                             @"+65", @"SG",
                             @"+421", @"SK",
                             @"+386", @"SI",
                             @"+677", @"SB",
                             @"+27", @"ZA",
                             @"+500", @"GS",
                             @"+34", @"ES",
                             @"+94", @"LK",
                             @"+249", @"SD",
                             @"+597", @"SR",
                             @"+268", @"SZ",
                             @"+46", @"SE",
                             @"+41", @"CH",
                             @"+992", @"TJ",
                             @"+66", @"TH",
                             @"+228", @"TG",
                             @"+690", @"TK",
                             @"+676", @"TO",
                             @"+1", @"TT",
                             @"+216", @"TN",
                             @"+90", @"TR",
                             @"+993", @"TM",
                             @"+1", @"TC",
                             @"+688", @"TV",
                             @"+256", @"UG",
                             @"+380", @"UA",
                             @"+971", @"AE",
                             @"+44", @"GB",
                             @"+1", @"US",
                             @"+598", @"UY",
                             @"+998", @"UZ",
                             @"+678", @"VU",
                             @"+681", @"WF",
                             @"+967", @"YE",
                             @"+260", @"ZM",
                             @"+263", @"ZW",
                             @"+591", @"BO",
                             @"+673", @"BN",
                             @"+61", @"CC",
                             @"+243", @"CD",
                             @"+225", @"CI",
                             @"+500", @"FK",
                             @"+44", @"GG",
                             @"+379", @"VA",
                             @"+852", @"HK",
                             @"+98", @"IR",
                             @"+44", @"IM",
                             @"+44", @"JE",
                             @"+850", @"KP",
                             @"+82", @"KR",
                             @"+856", @"LA",
                             @"+218", @"LY",
                             @"+853", @"MO",
                             @"+389", @"MK",
                             @"+691", @"FM",
                             @"+373", @"MD",
                             @"+258", @"MZ",
                             @"+970", @"PS",
                             @"+872", @"PN",
                             @"+262", @"RE",
                             @"+7", @"RU",
                             @"+590", @"BL",
                             @"+290", @"SH",
                             @"+1", @"KN",
                             @"+1", @"LC",
                             @"+590", @"MF",
                             @"+508", @"PM",
                             @"+1", @"VC",
                             @"+239", @"ST",
                             @"+252", @"SO",
                             @"+47", @"SJ",
                             @"+963",@"SY",
                             @"886", @"TW",
                             @"255", @"TZ",
                             @"670", @"TL",
                             @"58", @"VE",
                             @"84", @"VN",
                             @"+284", @"VG",
                             @"+340", @"VI",
                             @"+678",@"VU",
                             @"+681",@"WF",
                             @"+685",@"WS",
                             @"+967",@"YE",
                             @"+262",@"YT",
                             @"+27",@"ZA",
                             @"+260",@"ZM",
                             @"+263",@"ZW",
                             nil];
    
        self.countryNames = [[NSArray alloc] initWithObjects:@"Afghanistan", @"Albania",@"Algeria",@"American Samoa",@"Andorra",@"Angola",@"Anguilla",@"Antarctica",@"Antigua and Barbuda",@"Argentina",@"Armenia",@"Aruba",@"Australia",@"Austria",@"Azerbaijan",@"Bahamas",@"Bahrain",@"Bangladesh",@"Barbados",@"Belarus",@"Belgium",@"Belize",@"Benin",@"Bermuda",@"Bhutan",@"Bolivia",@"Bosnia and Herzegovina",@"Botswana"@"Brazil",@"British Virgin Islands",@"Brunei",@"Bulgaria",@"Burkina Faso",@"Burma (Myanmar)",@"Burundi",@"Cambodia",@"Cameroon",@"Canada",@"Cape Verde",@"Cayman Islands",@"Central African Republic",@"Chad",@"Chile",@"China",@"Christmas Island",@"Cocos (Keeling) Islands",@"Colombia",@"Comoros",@"Cook Islands",@"Costa Rica",@"Croatia",@"Cuba",@"Cyprus",@"Czech Republic",@"Democratic Republic of the Congo",@"Denmark",@"Djibouti",@"Dominica",@"Dominican Republic",@"Ecuador",@"Egypt",@"El Salvador",@"Equatorial Guinea",@"Eritrea",@"Estonia",@"Ethiopia",@"Falkland Islands",@"Faroe Islands",@"Fiji",@"Finland",@"France",@"French Polynesia",@"Gabon",@"Gambia",@"Gaza Strip",@"Georgia",@"Germany",@"Ghana",@"Gibraltar",@"Greece",@"Greenland",@"Grenada",@"Guam",@"Guatemala",@"Guinea",@"Guinea-Bissau",@"Guyana",@"Haiti",@"Holy See (Vatican City)",@"Honduras",@"Hong Kong",@"Hungary",@"Iceland",@"India",@"Indonesia",@"Iran",@"Iraq",@"Ireland",@"Isle of Man",@"Israel",@"Italy",@"Ivory Coast",@"Jamaica",@"Japan",@"Jordan",@"Kazakhstan",@"Kenya",@"Kiribati",@"Kosovo",@"Kuwait",@"Kyrgyzstan",@"Laos",@"Latvia",@"Lebanon",@"Lesotho",@"Liberia",@"Libya",@"Liechtenstein",@"Lithuania",@"Luxembourg",@"Macau",@"Macedonia",@"Madagascar",@"Malawi",@"Malaysia",@"Maldives",@"Mali",@"Malta",@"MarshallIslands",@"Mauritania",@"Mauritius",@"Mayotte",@"Mexico",@"Micronesia",@"Moldova",@"Monaco",@"Mongolia",@"Montenegro",@"Montserrat",@"Morocco",@"Mozambique",@"Namibia",@"Nauru",@"Nepal",@"Netherlands",@"Netherlands Antilles",@"New Caledonia",@"New Zealand",@"Nicaragua",@"Niger",@"Nigeria",@"Niue",@"Norfolk Island",@"North Korea ",@"Northern Mariana Islands",@"Norway",@"Oman",@"Pakistan",@"Palau",@"Panama",@"Papua New Guinea",@"Paraguay",@"Peru",@"Philippines",@"Pitcairn Islands",@"Poland",@"Portugal",@"Puerto Rico",@"Qatar",@"Republic of the Congo",@"Romania",@"Russia",@"Rwanda",@"Saint Barthelemy",@"Saint Helena",@"Saint Kitts and Nevis",@"Saint Lucia",@"Saint Martin",@"Saint Pierre and Miquelon",@"Saint Vincent and the Grenadines",@"Samoa",@"San Marino",@"Sao Tome and Principe",@"Saudi Arabia",@"Senegal",@"Serbia",@"Seychelles",@"Sierra Leone",@"Singapore",@"Slovakia",@"Slovenia",@"Solomon Islands",@"Somalia",@"South Africa",@"South Korea",@"Spain",@"Sri Lanka",@"Sudan",@"Suriname",@"Swaziland",@"Sweden",@"Switzerland",@"Syria",@"Taiwan",@"Tajikistan",@"Tanzania",@"Thailand",@"Timor-Leste",@"Togo",@"Tokelau",@"Tonga",@"Trinidad and Tobago",@"Tunisia",@"Turkey",@"Turkmenistan",@"Turks and Caicos Islands",@"Tuvalu",@"Uganda",@"Ukraine",@"United Arab Emirates",@"United Kingdom",@"United States",@"Uruguay",@"US Virgin Islands",@"Uzbekistan",@"Vanuatu",@"Venezuela",@"Vietnam",@"Wallis and Futuna",@"West Bank",@"Yemen",@"Zambia",@"Zimbabwe",nil];
        
            self.prefixDialingCodes = [[NSArray alloc] initWithObjects:@"+93",@"+335",@"+213",@"+1684",@"+376",@"+376",@"+244",@"+1264",@"+672",@"+1268",@"+54", @"+374",@"+297", @"+61",@"+43", @"+994",@"+1242",@"+973",@"+880",@"+1246"@"+375",@"+32",@"+501",@"+229",@"+1441",@"+975",@"+591",@"+387",@"+267"@"+55",@"+1284",@"+673",@"+359",@"+226",@"+95",@"+257",@"+855",@"+237",@"+1",@"+238",@"+1345",@"+236",@"+235",@"+56",@"+86",@"+61",@"+61",@"+57",@"+269",@"+682",@"+506",@"+385",@"+53",@"+357",@"+420",@"+243",@"+45",@"+253",@"+1767",@"+1809",@"+593",@"+20",@"+503",@"+240",@"+291",@"+372",@"+251",@"+500",@"+298",@"+679",@"+358",@"+33",@"+689",@"+241",@"+220",@"+970",@"+995",@"+49",@"+233",@"+350",@"+30",@"+299",@"+1473",@"+1671",@"+502",@"+224",@"+245",@"+592",@"+509",@"+39",@"+504",@"+852",@"+36",@"+354",@"+91",@"+62",@"+98",@"+964",@"+353",@"+44",@"+972",@"+39",@"+225",@"+1876",@"+81",@"+962",@"+7",@"+254",@"+686",@"+381",@"+965",@"+996",@"+856",@"+371",@"+961",@"+266",@"+231",@"+218",@"+423",@"+370",@"+352",@"+853",@"+389",@"+261",@"+265",@"+60",@"+960",@"+223",@"+356",@"+692",@"+222",@"+230",@"+262",@"+52",@"+691",@"+373",@"+377",@"+976",@"+382",@"+1664",@"+212",@"+258",@"+264",@"+674",@"+977",@"+31",@"+599",@"+687",@"+64",@"+505",@"+227",@"+234",@"+683",@"+672",@"+850",@"+1670",@"+47",@"+968",@"+92",@"+680",@"+507",@"+675",@"+595",@"+51",@"+63",@"+870",@"+48",@"+351",@"+1",@"+974",@"+242",@"+40",@"+7",@"+250",@"+590",@"+290",@"+1869",@"+1758",@"+1599",@"+508",@"+1784",@"+685",@"+378",@"+239",@"+966",@"+221",@"+381",@"+248",@"+232",@"+65",@"+421",@"+386",@"+677",@"+252",@"+27",@"+82",@"+34",@"+94",@"+249",@"+597",@"+268",@"+46",@"+41",@"+963",@"+886",@"+992",@"+255",@"+66",@"+670",@"+228",@"+690",@"+676",@"+1868",@"+216",@"+90",@"+993",@"+1649",@"+688",@"+256",@"+380",@"+971",@"+44",@"+1",@"+598",@"+1340",@"+998",@"+678",@"+58",@"+84",@"+681",@"970",@"+967",@"+260",@"+263", nil];
    }
    */
        
        NSString* path = [[NSBundle mainBundle] pathForResource:@"BDVCountryNameAndCode" ofType:@"plist"];
        
        BDVCountryNameAndCodePlist = [NSArray arrayWithContentsOfFile:path];
        
        countryNames = [[NSMutableArray alloc] init];
        prefixDialingCodes = [[NSMutableArray alloc] init];
        dictDialingCodes = [[NSMutableDictionary alloc] init];
        
        for (NSDictionary* obj in BDVCountryNameAndCodePlist) {
            [countryNames addObject:[obj objectForKey:@"name"]];
            [prefixDialingCodes addObject:[obj objectForKey:@"dial_code"]];
            [dictDialingCodes setObject:[obj objectForKey:@"dial_code"] forKey:[obj objectForKey:@"code"]];
        }
        
    }
    return self;
}

-(NSString *)prefixForCurrentLocale {
    NSString *countryLocale = [[[NSLocale currentLocale]
                              objectForKey:NSLocaleCountryCode] uppercaseString];
    
    NSString *prefix = [dictDialingCodes objectForKey:countryLocale];
    
    return prefix;
}

-(NSString *)countryNameForCurrentLocale {
    NSInteger indexOfPrefixAtCountryNamesArray = [prefixDialingCodes indexOfObject:
                                                  [self prefixForCurrentLocale]];
    
    NSString *countryName = [countryNames objectAtIndex:indexOfPrefixAtCountryNamesArray];
    
    return countryName;
}

-(UIImage *)countryFlagForCurrentLocale {
    
    NSString *imageName = [NSString stringWithFormat:@"%@.png",[[NSLocale currentLocale] displayNameForKey:NSLocaleCountryCode value:[[NSLocale currentLocale] objectForKey:NSLocaleCountryCode]]];
    
    imageName = [imageName stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    
    UIImage *image = [UIImage imageNamed:imageName];
    
    if (imageName) {
        return image;
    }
    
    return [UIImage new];
}

-(NSArray *)getCountrySuffixForPrefix:(NSString *)prefix{
    return [dictDialingCodes allKeysForObject:prefix];
}

@end
