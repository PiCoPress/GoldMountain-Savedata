import std.io;
import std.string;

// This pattern is for the game GoldMountain,
// which is developed by MPMaker

bool do_assert = true;

u8 EQ = 0;
u8 NE = 1;
u8 LT = 2;
u8 GT = 3;
u8 LE = 4;
u8 GE = 5;
str OPRS[6] = {"==", "!=", "<", ">", "<=", ">="};

fn assert(str s, auto a, u8 opr, auto b) {
    if(!do_assert) return;
    str msg = "[Assertion] " + s + ": '" + 
            std::string::to_string(a) + 
            "' " + OPRS[opr] + " " + 
            std::string::to_string(b);
    match(opr) {
        (EQ): if(a == b) return;
        (NE): if(a != b) return;
        (LT): if(a < b) return;
        (GT): if(a > b) return;
        (LE): if(a <= b) return;
        (GE): if(a >= b) return;
        (_): std::warning("???"); // ???
    }
    std::warning(msg);
};

enum ItemType: u32 {
    ITEM_EVENT_PASS         = 0x0B,
    ITEM_DAILY_PASS         = 0x0C,
    ITEM_INFINITY_KEY       = 0x0D,
    ITEM_TRIAL_PASS         = 0x0E,
    
    ITEM_STURDY_BOOTS       = 0x33,
    ITEM_ENHANCED_BOOTS     = 0x34,
    ITEM_WING_BOOTS         = 0x35,
    
    ITEM_PHILOSOPHER_STONE  = 0x65,
    ITEM_MIDAS_TOUCH        = 0x66,
    ITEM_MAGIC_LANTERN      = 0x67,
    ITEM_LIMIT_BREAK        = 0x68,
    ITEM_RUBBLE_REMOVAL     = 0x69,
    ITEM_MINERAL_RADAR      = 0x6A,
    ITEM_COMPASS            = 0x6B,
    ITEM_SOUL_MEDAL         = 0x6C,
    ITEM_SEASON_MEDAL       = 0x6D,
    ITEM_RUSH_ATTACK        = 0x6E,
    ITEM_STRIKE_GIANT       = 0x6F,
    ITEM_LUCKY_BLOW         = 0x70,
    ITEM_SHADOW_FRIEND      = 0x71,
    ITEM_MEM_OF_DREAMER     = 0x72,
    ITEM_TREASURE_MAP       = 0x73,
    ITEM_SECRET_KEY         = 0x74,
    ITEM_SPECIAL_ID_CARD    = 0x75,
    ITEM_AUTOMATIC_SAFE     = 0x76,
    ITEM_INSTANT_FREEZING   = 0x77,
    ITEM_STURDY_COAT        = 0x78,
    ITEM_MINE_BOMB          = 0x79,
    ITEM_ANALYSIS_HISTORY   = 0x7A,
    
    ITEM_SPEED_MEDAL        = 0xC9,
    ITEM_POWER_MEDAL        = 0xCA,
    ITEM_SKILL_MEDAL        = 0xCB,
    ITEM_LEGACY_SNOW_MEDAL  = 0xCC,
    ITEM_MUD_MEDAL          = 0xCD,
    ITEM_GOLD_MEDAL         = 0xCE,
    ITEM_DIAMOND_MEDAL      = 0xCF,
    ITEM_DARK_MEDAL         = 0xD0,
    ITEM_TRUE_POWER_MEDAL   = 0xD1,
    ITEM_FOREST_MEDAL       = 0xD2,
    ITEM_SEA_MEDAL          = 0xD3,
    ITEM_TRUE_SPEED_MEDAL   = 0xD4,
    ITEM_MAGMA_MEDAL        = 0xD5,
    ITEM_SPACE_MEDAL        = 0xD6,
    ITEM_RUIN_MEDAL         = 0xD7,
    ITEM_TODAYS_MEDAL       = 0xD8,
    ITEM_DESERT_MEDAL       = 0xD9,
    ITEM_ICE_MEDAL          = 0xDA,
    ITEM_TIME_MEDAL         = 0xDB,
    ITEM_MEDAL_OF_DONATION  = 0xDC,
    ITEM_POWER_MEDAL_2      = 0xDD,
    ITEM_TRUE_POWER_MEDAL_2 = 0xDE,
    ITEM_ENGRAVE_AWAKENING  = 0xDF,
    ITEM_ENGRAVING_MEDAL    = 0xE0,
    ITEM_ABYSS_MEDAL        = 0xE1,
    ITEM_DIMENSION_MEDAL    = 0xE2,
    ITEM_ELECTRONIC_MEDAL   = 0xE3,
    ITEM_BLACKLIST          = 0xE4,
    ITEM_SNOW_MEDAL         = 0xE5,
    
    ITEM_LEVEL_BOOST_BOOK   = 0x12D,
    ITEM_REBIRTH_BOOST      = 0x12E,
    ITEM_REVIVAL_BOOK       = 0x12F,
    ITEM_CATALYST           = 0x130,
    
    ITEM_DIMENSION_PICKAXE      = 0x192,
    ITEM_DIMENSION_SHARD        = 0x193,
    ITEM_DIMENSION_SHARD_BUNDLE = 0x194,
    ITEM_DIMENSION_RECORD       = 0x195,
    ITEM_DIMENSION_HELMET       = 0x196,
    
    ITEM_COMPRESSION_MEDAL      = 0x1C4,
    
    
    
    COSTUME_DRILL   = 0x97,
    COSTUME_BIGHAND = 0x98,
    COSTUME_GOLDEN  = 0x99,
    COSTUME_HAMMER  = 0x9A,
    COSTUME_SNIPER  = 0x9B,
    COSTUME_SANTA   = 0x9C,
    COSTUME_SUMMER  = 0x9D,
    COSTUME_SHIELD  = 0x9E,
    COSTUME_NINJA   = 0x9F,
    COSTUME_PRISON  = 0xA0,
    COSTUME_VALEN   = 0xA1,
    COSTUME_GHOST   = 0xA2,
    COSTUME_SCIENCE = 0xA3,
};

enum CollectionType: u16 {
    ORE_STONE                       = 0x00,
    ORE_BRONZE                      = 0x01,
    ORE_IRON                        = 0x02,
    ORE_SILVER                      = 0x03,
    ORE_GOLD                        = 0x04,
    ORE_PLATINUM                    = 0x05,
    ORE_EMERALD                     = 0x06,
    ORE_SAPPHIRE                    = 0x07,
    ORE_RUBY                        = 0x08,
    ORE_DIAMOND                     = 0x09,
    ORE_PINK_DIAMOND                = 0x0A,
    ORE_MYTHRIL                     = 0x0B,
    ORE_ORICHALCUM                  = 0x0C,
    ORE_ADAMANTIUM                  = 0x0D,
    ORE_BLOODSTONE                  = 0x0E,
    ORE_DARK_MATTER                 = 0x0F,
    ORE_PYRITE                      = 0x10,
    ORE_LAPIS_LAZULI                = 0x11,
    ORE_FINE_STONE                  = 0x12,
    ORE_MARBLE                      = 0x13,
    ORE_TRACES_OF_ARTIFACT          = 0x14,
    ORE_EMERALD_SCARAB              = 0x15,
    ORE_SARCOPHAGUS                 = 0x16,
    ORE_GOLDEN_MUSHROOM             = 0x17,
    ORE_AMBER                       = 0x18,
    ORE_GOLDEN_APPLE_TREE           = 0x19,
    ORE_SPIRIT_STONE                = 0x1A,
    ORE_BLUE_ICE                    = 0x1B,
    ORE_CRYSTAL                     = 0x1C,
    ORE_YETIS_FOOTPRINT             = 0x1D,
    ORE_CORE_OF_WINTER              = 0x1E,
    ORE_CORAL_REEF                  = 0x1F,
    ORE_AQUAMARINE                  = 0x20,
    ORE_PEARL_SHELL                 = 0x21,
    ORE_BLACK_PEARL_SHELL           = 0x22,
    ORE_SULFUR                      = 0x23,
    ORE_OBSIDIAN                    = 0x24,
    ORE_FLAME_CRYSTAL               = 0x25,
    ORE_RED_SUNSTONE                = 0x26,
    ORE_STARDUST                    = 0x27,
    ORE_LITTLE_PLANET               = 0x28,
    ORE_LITTLE_SUN                  = 0x29,
    ORE_RAINBOW_STAR                = 0x2A,
    ORE_RUIN_BLOCK                  = 0x2B,
    ORE_RUIN_WALL                   = 0x2C,
    ORE_RUIN_PILLAR                 = 0x2D,
    ORE_RELIC_CHEST                 = 0x2E,
    ORE_INDICATOR_OF_TIME           = 0x2F,
    ORE_AKASHIC_RECORDS             = 0x30,
    ORE_BREAK_OF_DIMENSION          = 0x31,
    ORE_TIME_MACHINE                = 0x32,
    ORE_CLOUD                       = 0x33,
    ORE_NIMBUS                      = 0x34,
    ORE_TORNADO                     = 0x35,
    ORE_ANCIENT_EGG                 = 0x36,
    ORE_INFINITIUM                  = 0x37,
    ORE_ABYSS_STONE                 = 0x38,
    ORE_SOUL_TAR                    = 0x39,
    ORE_HELLFIRE                    = 0x3A,
    ORE_DEATH_FLOWER                = 0x3B,
    ORE_DIMENSIONLITE               = 0x3C,
    ORE_EXTRATERRESTRIAL_MATERIAL   = 0x3D,
    ORE_VISION_STONE                = 0x3E,
    ORE_SCRIPT                      = 0x3F,
    ORE_CRYPTOCURRENCY              = 0x40,
    ORE_TOP_SECRET                  = 0x41,
    
    
    
    BOSS_MUD_GOLEM          = 0X64,
    BOSS_GOBLIN_KING        = 0x65,
    BOSS_HUGE_SLIME         = 0x66,
    BOSS_GOLDEN_WARRIOR     = 0x67,
    BOSS_GEAR_GIANT         = 0x68,
    BOSS_KRAKEN             = 0x69,
    BOSS_ANCIENT_GOD        = 0x6A,
    BOSS_DIAMOND_SPIRIT     = 0x6B,
    BOSS_SPECTER_OF_TREE    = 0x6C,
    BOSS_GHOST_OF_OBLIVION  = 0x6D,
    BOSS_DARK_DRAGON        = 0x6E,
    BOSS_MIRAGE_TURRET      = 0x6F,
    BOSS_ABYSS_WATCHER      = 0x70,
    BOSS_WYVERN_TWINS       = 0x71,
    BOSS_DRAGON_LORD        = 0x72,
    BOSS_GUARDIAN_OF_FOREST = 0x73,
    BOSS_CENTAUR            = 0x74,
    BOSS_YETI               = 0x75,
    BOSS_SHARK_SWARM        = 0x76,
    BOSS_PIRATE_SKULL       = 0x77,
    BOSS_RED_DEMON          = 0x78,
    BOSS_FLAME_SPIRIT       = 0x79,
    BOSS_CHAOS              = 0x7A,
    BOSS_PROVIDENCE         = 0x7B,
    BOSS_RUIN_SENTINEL      = 0x7C,
    BOSS_UNSEALED_DESTROYER = 0x7D,
    BOSS_TIME_REAPER        = 0x7E,
    BOSS_MINER              = 0x7F,
    BOSS_GILDED_GOBLIN      = 0x80,
};

enum StickControlType: u8 {
    FIXED,
    FLOAT,
    DYNAMIC,
};

enum NumberEffectType: u8 {
    DEFAULT,
    SHORTENED,
    SIMPLIFIED,
    PREFIX,
};

enum MineType: u16 {
    DESERT      = 0x01,
    FOREST      = 0x02,
    ICE         = 0x03,
    SEA         = 0x04,
    MAGMA       = 0x05,
    SPACE       = 0x06,
    RUIN        = 0x07,
    TIME        = 0x08,
    HEAVEN      = 0x09,
    INFINITY    = 0x0A, // and temple of engrave
    ABYSS       = 0x0B,
    DIMENSION   = 0x0C,
    ELECTRONIC  = 0x0D,
    
    TRIAL_OF_POWER_HARD     = 0x64,
    TRIAL_OF_POWER_HARD_II  = 0x65,
};

// It seems to have too many options
enum DimensionOptions: u16 {
    EXTRA_VALUE_STONE_200P              = 0x0000,
    EXTRA_VALUE_BRONZE_200P             = 0x0001,
    EXTRA_VALUE_IRON_200P               = 0x0002,
    EXTRA_VALUE_SILVER_200P             = 0x0003,
    EXTRA_VALUE_GOLD_200P               = 0x0004,
    EXTRA_VALUE_EMERALD_200P            = 0x0005,
    EXTRA_VALUE_SAPPHIRE_200P           = 0x0006,
    EXTRA_VALUE_RUBY_200P               = 0x0007,
    EXTRA_VALUE_DIAMOND_200P            = 0x0008,
    EXTRA_VALUE_PINK_DIAMOND_200P       = 0x0009,
    EXTRA_VALUE_MYTHRIL_200P            = 0x000A,
    EXTRA_VALUE_ORICHALCUM_200P         = 0x000B,
    EXTRA_VALUE_ADAMANTIUM_200P         = 0x000C,
    EXTRA_VALUE_BLOODSTONE_200P         = 0x000D,
    EXTRA_VALUE_DARK_MATTER_200P        = 0x000E,
    EXTRA_VALUE_GOLDEN_MUSHROOM_100P    = 0x000F,
    EXTRA_VALUE_GOLDEN_APPLE_TREE_100P  = 0x0010,
    EXTRA_VALUE_AMBER_100P              = 0x0011,
    EXTRA_VALUE_SPIRIT_STONE_100P       = 0x0012,
    EXTRA_VALUE_PLATINUM_100P           = 0x0013,
    EXTRA_VALUE_CORAL_REEF_100P         = 0x0014,
    EXTRA_VALUE_AQUAMARINE_100P         = 0x0015,
    EXTRA_VALUE_PEARL_SHELL_100P        = 0x0016,
    EXTRA_VALUE_BLACK_PEARL_SHELL_100P  = 0x0017,
    EXTRA_VALUE_SULFUR_100P             = 0x0018,
    EXTRA_VALUE_OBSIDIAN_100P           = 0x0019,
    EXTRA_VALUE_FLAME_CRYSTAL_100P      = 0x001A,
    EXTRA_VALUE_RED_SUN_STONE_100P      = 0x001B,
    EXTRA_VALUE_STARDUST_100P           = 0x001C,
    EXTRA_VALUE_LITTLE_PLANET_100P      = 0x001D,
    EXTRA_VALUE_LITTLE_SUN_100P         = 0x001E,
    EXTRA_VALUE_RAINBOW_STAR_100P       = 0x001F,
    EXTRA_VALUE_RUIN_BLOCK_50P          = 0x0020,
    EXTRA_VALUE_RUIN_WALL_50P           = 0x0021,
    EXTRA_VALUE_RUIN_PILLAR_50P         = 0x0022,
    EXTRA_VALUE_RELIC_CHEST_50P         = 0x0023,
    EXTRA_VALUE_FINE_STONE_50P          = 0x0024,
    EXTRA_VALUE_MARBLE_50P              = 0x0025,
    EXTRA_VALUE_TRACE_OF_ARTIFACT_50P   = 0x0026,
    EXTRA_VALUE_ENERALD_SCARAB_50P      = 0x0027,
    EXTRA_VALUE_SARCOPHAGUS_50P         = 0x0028,
    EXTRA_VALUE_BLUE_ICE_50P            = 0x0029,
    EXTRA_VALUE_CRYSTAL_50P             = 0x002A,
    EXTRA_VALUE_YETI_FOOTPRINT_50P      = 0x002B,
    EXTRA_VALUE_WINTER_CORE_50P         = 0x002C,
    EXTRA_VALUE_TIME_INDICATOR_50P      = 0x002D,
    EXTRA_VALUE_AKASHIC_RECORD_50P      = 0x002E,
    EXTRA_VALUE_BREAK_OF_DIMENSION_50P  = 0x002F,
    EXTRA_VALUE_TIME_MACHINE_50P        = 0x0030,
    EXTRA_VALUE_CLOUD_50P               = 0x0031,
    EXTRA_VALUE_NIMBUS_50P              = 0x0032,
    EXTRA_VALUE_TORNADO_50P             = 0x0033,
    EXTRA_VALUE_ANCIENT_EGG_50P         = 0x0034,
    EXTRA_VALUE_INFINITIUM_10P          = 0x0035,
    EXTRA_VALUE_PYRITE_200P             = 0x0036,
    EXTRA_VALUE_LAPIS_LAZULI_200P       = 0x0037,
    EXTRA_VALUE_ABYSS_STONE_50P         = 0x0038,
    EXTRA_VALUE_SOUL_TAR_50P            = 0x0039,
    EXTRA_VALUE_HELLFIRE_50P            = 0x003A,
    EXTRA_VALUE_DEATH_FLOWER_50P        = 0x003B,
    EXTRA_VALUE_DIMENSIONLITE_20P       = 0x003C,
    EXTRA_VALUE_ALIEN_MATERIAL_20P      = 0x003D,
    EXTRA_VALUE_VISION_STONE_20P        = 0x003E,
    EXTRA_VALUE_SCRIPT_20P              = 0x003F,
    EXTRA_VALUE_CRYPTOCURRENCY_20P      = 0x0040,
    EXTRA_VALUE_TOP_SECRET_20P          = 0x0041,
    
    EXTRA_900_LEVEL                 = 0x03E8,
    EXTRA_5P_LEVEL                  = 0x03E9,
    INCREASE_MOVE_SPEED             = 0x03EA,
    EXTRA_HP_50P                    = 0x03EB,
    BOSS_DAMAGE_10P                 = 0x03EC,
    EXTRA_TIME_LIMIT_20P            = 0x03ED,
    INCREASE_RARE_ORE_RATE          = 0x03EE,
    MIDAS_TOUCH_GAIN_PER_LEVEL_8    = 0x03EF,
    MIDAS_TOUCH_EXTRA_999000        = 0x03F0,
    BOSS_DAMAGE_2P_5SEC             = 0x03F1,
    MITIGATE_GHOST_COSTUME_DEGRADED = 0x03F2,
};

struct Level {
    s16 level_len;
    
    s32 power;
    s32 speed;
    s32 value;
    
    s32 rebirth_count;
};

struct Assets {
    /*
        Money and SoulMoney are concatenated string
            of decimal-converted shorts.
            
        Therefore, each array value must be in 0~9999.
        
        .... weird
    */
    s32 money_len;
    s16 money[money_len];
    
    s32 soulmoney_len;
    s16 soulmoney[soulmoney_len];
    
    ItemType equipped_costume;
};

struct Stub3 {
    u64 stub3_1;
    u64 stub3_2;
    u32 stub3_3;
    u8 stub3_4[12];
    s8 stub3_5; // will cause error when not zero
    assert("stub3_5 is not zero", 0, EQ, stub3_5);
    
    s32 buff_time; // 60 buff_time = 1 seconds
    
    s16 stub3_6;
    s32 stub3_7;
    s16 stub3_8;
    s16 stub3_9;
    s16 stub3_10;
    s32 skill_used;
    s32 stub3_11;
};

struct SealingStoneData {
    MineType mine_type;
    bool weakened;
};

struct DimensionToolsData {
    s16 size;
    DimensionOptions pickaxe[size / 2];
    DimensionOptions record[size / 2];
};

struct Segment1 {
    char TS[2]; assert("TS", "TS", EQ, TS);
    u32 seg1_size;
    Level level;
    Assets assets;
    
    Stub3 stub3;
    
    // not a solid state drive
    s16 ssd_len;
    SealingStoneData ssd[ssd_len];
    
    DimensionToolsData dimdata;
    u8 locked_pickaxe_option; // 0xFF = unlocked
};

struct Items {
    ItemType itemtype;
    u32 amount;
    bool enabled;
};

struct Segment2 {
    char vi[2]; assert("VI Section", "VI", EQ, vi);
    s32 seg2_size;
    //u32 *seg3_ptr: u8 @ seg2_size + $;
    s16 stub5_1; assert("overflow will crash the game", 0, LE, stub5_1);
    s32 element_count; assert("too many items", 87, GE, element_count);
    Items items[element_count];
};

struct Settings {
    u8 stub7_1;
    u8 bgm_volume; assert("BGM Volume", 100, GE, bgm_volume);
    u8 stub7_2;
    u8 se_volume; assert("SE Volume", 100, GE, se_volume);
    bool stub7_3[3];
    bool balance_upgrade;
    bool keep_screen_on;
    bool auto_upgrade;
};

struct Metadata {
    char validity[33];
    char account_id[8];
    
    char device[8]; assert("Device", "device\0\0", EQ, device);
    char stub[8]; // _______@
    char session_id[33];
    
    bool disabled_stick_control;
    StickControlType stick_control_type;
    
    bool number_effect;
    NumberEffectType num_effect_type;
};

struct Segment3 {
    char GSi[3]; assert("GSi", "GSi", EQ, GSi);
    s32 stub6_1;
    Settings settings;
    Metadata metadata;
};

struct Collections {
    CollectionType collection_type;
    s64 data;
};

struct Segment4 {
    char LC[2]; assert("LC", "LC", EQ, LC);
    s32 seg4_size;
    s16 stub8; assert("overflow will crash the game", 0, LE, stub8);
    s16 collection_count;
    Collections collection[collection_count];
};

struct Data {
    u16 magic;
    if(magic != 0xCA83) return;
    
    Segment1 seg1; assert("segment1 size mismatch", seg1.seg1_size, EQ, sizeof(seg1) - 6);
    Segment2 seg2; assert("segment2 size mismatch", seg2.seg2_size, EQ, sizeof(seg2) - 6);
    Segment3 seg3;
    Segment4 seg4; assert("segment4 size mismatch", seg4.seg4_size, EQ, sizeof(seg4) - 6);
    char XX_foot[2]; assert("XX", "XX", EQ, XX_foot);
};

Data data @ 0x00;
std::print(sizeof(data));