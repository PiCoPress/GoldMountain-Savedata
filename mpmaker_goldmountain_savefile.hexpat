import std.io;
import std.string;

// This pattern is for the game GoldMountain,
// which is developed by MPMaker

struct Header {
    u32 magic;
    if(magic != 0x5354CA83) return;
    u32 seg1_size;
    //u16 *seg2_ptr: u8 @ seg1_size + 0x8;
};

struct Level {
    s16 level_len;
    
    s32 power;
    s32 speed;
    s32 value;
    
    s32 stub1;
};

struct Money {
    s32 money_len;
    s16 money[money_len];
};

struct Stub2 {
    s32 stub2_1;
    s32 stub2_2;
    if(stub2_1 == 2) u16 equipped_costume;
    u8 stub2_3[10];
};

struct Stub3 {
    u64 stub3_1;
    u8 stub3_2[23];
    
    s64 stub3_3;
    s16 stub3_4;
    s64 stub3_5;
};

enum ChunkType: u8 {
    
};

struct Chunk {
    ChunkType idx;
    s16 data;
};

struct ChunkList {
    s16 chunk_size;
    Chunk ct1[chunk_size];
};

struct Stub4 {
    s16 stub4_len;
    s16 stub4_data[stub4_len];
};

struct Segment1 {
    Level level;
    Money money;
    
    Stub2 stub2;
    Stub3 stub3;
    
    ChunkList clt1;
    Stub4 stub4;
    u8 barrier; // 0xFF
};

enum ItemType: u32 {
    ITEM_DAILY_PASS         = 0x0C,
    ITEM_INFINITY_KEY       = 0x0D,
    ITEM_TRIAL_PASS         = 0x0E,
    
    ITEM_STuRDY_BOOTS       = 0x33,
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
    
    ITEM_ENGRAVE_AWAKENING  = 0xDF,
    ITEM_ENGRAVING_MEDAL    = 0xE0,
    
    ITEM_LEVEL_BOOST_BOOK   = 0x12D,
    ITEM_REBIRTH_BOOST      = 0x12E,
    ITEM_REVIVAL_BOOK       = 0x12F,
    
    ITEM_CATALYST           = 0x130,
    
    ITEM_DIMENSION_PICKAXE  = 0x192,
    ITEM_DIMENSION_DEBRIS   = 0x193,
    ITEM_DIMENSION_RECORD   = 0x195,
    ITEM_DIMENSION_HALMET   = 0x196,
    
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

struct Items {
    ItemType itemtype;
    u32 amount;
    bool enabled;
};

struct Segment2 {
    char vi[2]; // = "VI"
    u32 seg2_size;
    //u32 *seg3_ptr: u8 @ seg2_size + $;
    u16 stub5_1;
    s32 element_count;
    Items items[element_count];
};

struct Settings {
    u8 stub7_1;
    u8 volume_background;
    u8 stub7_2;
    u8 volume_effect;
    bool stub7_3[3];
    bool balance_upgrade;
    bool keep_screen_on;
    bool auto_upgrade;
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

struct Metadata {
    char validity[33];
    char account_id[8];
    
    char device[8]; // = device
    char stub[8]; // _____}_@
    char session_id[33];
    
    bool disabled_stick_control;
    StickControlType stick_control_type;
    
    bool number_effect;
    NumberEffectType num_effect_type;
};

struct Segment3 {
    char Gsi[3];
    s32 stub6_1;
    Settings settings;
    Metadata metadata;
    s64 stub6_2;
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
    BOSS_DARK_GRAGON,
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

struct Collections {
    CollectionType collection_type;
    s64 data;
};

struct Segment4 {
    s16 collection_count;
    Collections collection[collection_count];
};

struct Body {
    Segment1 seg1;
    Segment2 seg2;
    Segment3 seg3;
    Segment4 seg4;
    char XX_foot[2]; // XX
};

Header header @ 0x0;
Body body @ 0x08;

fn assert(str s, auto a, auto b) {
    if(a != b) 
        std::warning("[" + s + "] '" + 
            std::string::to_string(a) + "' != " + 
            std::string::to_string(b));
};

// Validate file structure
assert("BARRIER", 255, body.seg1.barrier);
assert("VI", "VI", body.seg2.vi);
assert("DEVICE", "device\0\0", body.seg3.metadata.device);
assert("XX", "XX", body.XX_foot);

std::print(sizeof(body));