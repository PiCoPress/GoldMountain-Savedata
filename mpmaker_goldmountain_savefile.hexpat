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
    DAILY_TICKET    = 0x0C,
    ETERNAL_KEY     = 0x0D,
    TRIAL_TICKET    = 0x0E,
    
    NEW_BOOTS       = 0x33,
    ENHANCED_BOOTS  = 0x34,
    DASH_BOOTS      = 0x35,
    
    WISE_STONE      = 0x65,
    MIDAS_TOUCH     = 0x66,
    BRIGHT_MINE     = 0x67,
    UNLIMITED       = 0x68,
    RUBBLE_FREE     = 0x69,
    MINERAL_RADAR   = 0x6A,
    COMPASS         = 0x6B,
    TOKEN_OF_SOUL   = 0x6C,
    RUSH_ATTACK     = 0x6E,
    GIANT_SMITE     = 0x6F,
    LUCKY_STRIKE    = 0x70,
    SHADOW_FRIEND   = 0x71,
    DREAMERSS       = 0x72,
    TREASURE        = 0x73,
    SECRET_KET      = 0x74,
    SPECIAL_ID      = 0x75,
    AUTO_VAULT      = 0x76,
    HARDENED_ARMOR  = 0x78,
    MINE_TNT        = 0x79,
    ANALYSIS        = 0x7A,
    
    AWAKENING       = 0xDF,
    TOKEN_OF_SEAL   = 0xE0,
    
    LEVEL_BOOST     = 0x12D,
    REBIRTH_BOOST   = 0x12E,
    REVIVAL         = 0x12F,
    
    CRYSTAL         = 0x130,
    
    DIM_PICKAXE     = 0x192,
    DIM_DEBRIS      = 0x193,
    DIM_HISTORY     = 0x195,
    DIM_HALMET      = 0x196,
    
    MAX_LVL_TOKEN   = 0x1C4,
    
    
    
    COSTUME_DRILL   = 0x97,
    COSTUME_BIGHAND = 0x98,
    COSTUME_GOLD    = 0x99,
    COSTUME_HAMMER  = 0x9A,
    COSTUME_BOW     = 0x9B,
    COSTUME_SANTA   = 0x9C,
    COSTUME_BEACH   = 0x9D,
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
    STATIC,
    CLICKED,
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

enum CatalogType: u16 {
     
};

struct Achievements {
    CatalogType catalog_type;
    s64 data;
};

struct Segment4 {
    s16 ach_count;
    Achievements ach[ach_count];
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