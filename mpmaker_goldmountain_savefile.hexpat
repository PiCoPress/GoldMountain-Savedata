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
    ITEM_RUSH_ATTACK        = 0x6E,
    ITEM_STRIKE_GIANT       = 0x6F,
    ITEM_LUCKY_BLOW         = 0x70,
    ITEM_SHADOW_FRIEND      = 0x71,
    ITEM_MEM_OF_DREAMER     = 0x72,
    ITEM_TREASURE_MAP       = 0x73,
    ITEM_SECRET_KEY         = 0x74,
    ITEM_SPECIAL_ID_CARD    = 0x75,
    ITEM_AUTOMATIC_SAFE     = 0x76,
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
    
    ITEM_DIMENSION_PICKAXE  = 0x192,
    ITEM_DIMENSION_DEBRIS   = 0x193,
    ITEM_DIMENSION_RECORD   = 0x195,
    ITEM_DIMENSION_HELMET   = 0x196,
    
    ITEM_COMPRESSION_MEDAL  = 0x1C4,
    
    
    
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
    ORE_STONE = 0x0,
    ORE_BRONZE,
    ORE_IRON,
    ORE_SILVER,
    ORE_GOLD,
    ORE_PLATINUM,
    ORE_EMERALD,
    ORE_SAPPHIRE,
    ORE_RUBY,
    ORE_DIAMOND,
    ORE_PINK_DIAMOND,
    ORE_MYTHRIL,
    ORE_ORICHALCUM,
    ORE_ADAMANTIUM,
    ORE_BLOODSTONE,
    ORE_DARK_MATTER,
    ORE_PYRITE,
    ORE_LAPIS_LAZULI,
    ORE_FINE_STONE,
    ORE_MARBLE,
    ORE_TRACES_OF_ARTIFACT,
    ORE_EMERALD_SCARAB,
    ORE_SARCOPHAGUS,
    ORE_GOLDEN_MUSHROOM,
    ORE_AMBER,
    ORE_GOLDEN_APPlE_TREE,
    ORE_SPIRIT_STONE,
    ORE_BLUE_ICE,
    ORE_CRYSTAL,
    ORE_YETIS_FOOTPRINT,
    ORE_CORE_OF_WINTER,
    ORE_CORAL_REEF,
    ORE_AQUAMARINE,
    ORE_PEARL_SHELL,
    ORE_BLACK_PEARL_SHELL,
    ORE_SULFUR,
    ORE_OBSIDIAN,
    ORE_FLAME_CRYSTAL,
    ORE_RED_SUNSTONE,
    ORE_STARDUST,
    ORE_LITTLE_PLANET,
    ORE_LITTLE_SUN,
    ORE_RAINBOW_STAR,
    ORE_RUIN_BLOCK,
    ORE_RUIN_WALL,
    ORE_RUIN_PILLAR,
    ORE_RELIC_CHEST,
    ORE_INDICATOR_OF_TIME,
    ORE_AKASHIC_RECORDS,
    ORE_BREAK_OF_DIMENSION,
    ORE_TIME_MACHINE,
    ORE_CLOUD,
    ORE_NIMBUS,
    ORE_TORNADO,
    ORE_ANCHIENT_EGG,
    ORE_INFINITIUM,
    ORE_ABYSS_STONE,
    ORE_SOUL_TAR,
    ORE_HELLFIRE,
    ORE_DEATH_FLOWER,
    ORE_DIMENSONLITE,
    ORE_EXTRATERRESTRIAL_MATERIAL,
    ORE_VISION_STONE,
    ORE_SCRIPT,
    ORE_CRYPTOCURRENCY,
    ORE_TOP_SECRET,
    
    
    
    BOSS_MUD_GOLEM = 0X64,
    BOSS_GOBLIN_KING,
    BOSS_HUGE_SLIME,
    BOSS_GOLDEN_WARRIOR,
    BOSS_GEAR_GIANT,
    BOSS_KRAKEN,
    BOSS_ANCIENT_GOD,
    BOSS_DIAMOND_SPIRIT,
    BOSS_SPECTER_OF_TREE,
    BOSS_GHOST_OF_OBLIVION,
    BOSS_DARK_DRAGON,
    BOSS_MIRAGE_TURRET,
    BOSS_ABYSS_WATCHER,
    BOSS_WYVERN_TWINS,
    BOSS_DRAGON_LORD,
    BOSS_GUARDIAN_OF_FOREST,
    BOSS_CENTAUR,
    BOSS_YETI,
    BOSS_SHARK_SWARM,
    BOSS_PIRATE_SKULL,
    BOSS_RED_DEMON,
    BOSS_FLAME_SPIRIT,
    BOSS_CHAOS,
    BOSS_PROVIDENCE,
    BOSS_RUN_SENTINEL,
    BOSS_UNSEALED_DESTROYER,
    BOSS_TIME_REAPER,
    BOSS_MINER,
    BOSS_GILDED_GOBLIN,
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
    BONUS_LEVEL_5P          = 0x03E9,
    INCREASE_MOVE_SPEED     = 0x03EA,
    BOSS_DAMAGE_10P         = 0x03EC,
    INCREASE_RARE_ORE_RATE  = 0x03EE,
    
};

struct Level {
    s16 level_len;
    
    s32 power;
    s32 speed;
    s32 value;
    
    s32 rebirth_count;
};

struct Assets {
    s32 money_len; // 16-bit array
    s16 money[money_len];
    
    s32 soulmoney_len; // 16-bit array
    s16 soulmoney[soulmoney_len]; // Raw hex value != In-game display value (non 1:1 mapping)
    
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
    s32 element_count;
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
    u32 magic;
    if(magic != 0x5354CA83) return;
    
    Segment1 seg1; assert("segment1 size mismatch", seg1.seg1_size, EQ, sizeof(seg1) - 4);
    Segment2 seg2; assert("segment2 size mismatch", seg2.seg2_size, EQ, sizeof(seg2) - 6);
    Segment3 seg3;
    Segment4 seg4; assert("segment4 size mismatch", seg4.seg4_size, EQ, sizeof(seg4) - 6);
    char XX_foot[2]; assert("XX", "XX", EQ, XX_foot);
};

Data data @ 0x00;
std::print(sizeof(data));