#pragma array_limit 999999

#include <std/mem.pat>
import * from wav_tuned as Wave;
import std.io;
import std.bit;
import std.mem;


struct Pointer<ref_t, addr_t> {
    ref_t *ptr: addr_t;
};

struct RawString {
    char str_value[];
};

struct Map<K, V> {
    K key;
    V value;
};

struct StringContainer {
    s32 value_len;
    char text[value_len];
    u8 align[4 - $ % 4];
};

struct PointerChunk<T, A> {
    s32 length;
    Pointer<T, A> ptrs[length];
} [[single_color]]; //[[color("7777cc")]];

struct List<T> {
    s32 length;
    T data[length];
} [[single_color]];

using rsptr = Pointer<RawString, s32>;
using PointerList = PointerChunk<s32, s32>;


struct AnonObj1 {
    s32;
    s32 *ptr1: s32;
    s32;
};

struct AnonObj2 {
    AnonObj1 a, b;
    s32;
    List<s32> ls;
    s32 anon1[4];
    //if(anon1[0] != -1) break;
    
    //s32 stub[while($ != )];
};

struct Object {
    s32 *ptr: s32;
    s32 stub1[11];
    //if(stub1[0] != -1) break;
    s32 stub2[9];
    PointerList pl;
    if(pl.length == 0) {
        u32 stub2_1[7];
        PointerList pl2;
        
    }
    //AnonObj2 stub3_1[3];
    s32 offset = std::mem::read_signed($ - 4, 4) - $ + 4;
    //std::print(offset);
    if(offset > 0 && offset < 65536) u8 stub3[offset];
    else break;
} [[single_color]];

struct AnonObj3 {
    u16 stub[11];
};

struct ShaderObj {
    Pointer<s32, s32> stub1;
    s32 stub2;
    Pointer<s32, s32> stub3[6] [[single_color]];
    s64 stub4;
    s32 count;
    Pointer<s32, s32> stub5[count] [[single_color]];
    
    s32 stub6;
    u8 stub7[48];
};


// ===================================================


// Patterns
struct Header {
    char code[4];
    s32 size;
};

struct GEN8 {
    Header header;
    u32 stub1;
    Pointer<RawString, s32> s1[3];
    u8 stub2[24];
    Pointer<RawString, s32> s2;
    u8 stub3[56];
    Pointer<RawString, s32> s3;
    u8 stub4[24];
    
    List<s32> ls;
    u8 stub5[64];
    u8 align[16 - $ % 16];
};

struct OPTN {
    Header header;
    u32 stub1[15];
    List<Map<rsptr, rsptr>> pl;
    u8 align[header.size - $ + addressof(header) + 8];
};

struct LANG {
    Header header;
    u8 stub[header.size];
};

struct EXTN {
    Header header;
    PointerList pl1;
    u64 stub1[6];
    
    PointerList pl2;
    u8 stub3[header.size - $ + addressof(header) + 8];
};

// Sound resource location?
struct SOND {
    Header header;
    PointerList pl;
    u8 stub[header.size - $ + addressof(header) + 8];
};

struct AGRP {
    Header header;
    PointerList pl;
    u8 stub[header.size - $ + addressof(header) + 8];
};

struct SPRT {
    Header header;
    PointerList pl;
    u8 stub[header.size - $ + addressof(header) + 8];
};

// Background resource location?
struct BGND {
    Header header;
    u8 stub[header.size];
};

struct PATH {
    Header header;
    u8 stub[header.size];
};

struct SCPT {
    Header header;
    PointerList pl;
    u8 stub[header.size - $ + addressof(header) + 8];
};

struct GLOB {
    Header header;
    List<s32> pl;
    u8 align[header.size - $ + addressof(header) + 8];
};

// Shader code location
struct SHDR {
    Header header;
    PointerList pl;
    ShaderObj so[7];
    u8 align[header.size - $ + addressof(header) + 8];
};

struct FONT {
    Header header;
    u8 stub[header.size];
};

struct TMLN {
    Header header;
    u8 stub[header.size];
};

struct OBJT {
    Header header;
    PointerList pl;
    Object obj[pl.length];
    u8 stub[header.size - $ + addressof(header) + 8];
};

struct FEDS {
    Header header;
    u8 stub[header.size];
};

struct ACRV {
    Header header;
    u8 stub[header.size];
};

struct SEQN {
    Header header;
    u8 stub[header.size];
};

struct TAGS {
    Header header;
    u8 stub[header.size];
};

struct ROOM {
    Header header;
    PointerList pl;
    u8 stub[header.size - $ + addressof(header) + 8];
};

struct UILR {
    Header header;
    u8 stub[header.size];
};

struct DAFL {
    Header header;
    u8 stub[header.size];
};

struct EMBI {
    Header header;
    u8 stub[header.size];
};

struct PSEM {
    Header header;
    u8 stub[header.size];
};

struct PSYS {
    Header header;
    u8 stub[header.size];
};

struct TPAG {
    Header header;
    PointerList pl;
    AnonObj3 stub1[pl.length] [[single_color]];
    u8 align[header.size - $ + addressof(header) + 8];
};

struct TGIN {
    Header header;
    u8 stub[header.size];
};

struct FEAT {
    Header header;
    PointerChunk<RawString, s32> pl;
};

// String
struct STRG {
    Header header;
    PointerChunk<StringContainer, s32> pl;
    StringContainer sc[pl.length];
    u8 align[header.size - $ + addressof(header) + 8];
};

bitfield bzip2 {
    u16 magic;
    u8 version;
    u8 h_k_blocksize;
    
    u48 compressed_magic;
    u32 crc;
    randomized: 1;
    origPtr: 24;
    huffman_used_map: 16;
    huffman_used_bitmaps: std::bit::popcount(huffman_used_map) * 16;
    hufman_groups: 3;
    
    selectors_used: 15;
    selector_list: 0;
    start_huffman_length: 5;
    delta_bit_length: 0;
    
    contents: 0;
    
    eos_magic: 48;
    crc_end: 32;
    pad: 0;
};

// Texture
struct TXTR {
    Header header;
    PointerList pl;
    s32 stub1[6];
    s32 zoq_ptr;
    s64 stub2;
    s32 foiq_size;
    s32 stub3[3];
    s32 fioq_ptr;
    s32 stub4[13];
    s32 stub5[3];
    u8 bz2[header.size-132];
};

struct Ac {
    u8 pad[$ % 4];
    u32 size;
    //Wave wav;
    u8 stub[size];
};

// Audio
struct AUDO {
    Header header;
    PointerList pl;
    Ac ac[pl.length];
};

struct Form {
    GEN8 gen8;
    OPTN optn;
    LANG lang;
    EXTN extn;
    SOND sond;
    AGRP agrp;
    SPRT sprt;
    BGND bgnd;
    PATH path;
    SCPT scpt;
    GLOB glob;
    SHDR shdr;
    FONT font;
    TMLN tmln;
    OBJT objt;
    FEDS feds;
    ACRV acrv;
    SEQN seqn;
    TAGS tags;
    ROOM room;
    UILR uilr;
    DAFL dafl;
    EMBI embi;
    PSEM psem;
    PSYS psys;
    TPAG tpag;
    TGIN tgin;
    FEAT feat;
    STRG strg; //break;
    TXTR txtr; break;
    AUDO audo;
};

struct Data {
    char FORM_start[4];
    s32 form_size;
    Form form;
};

import std.file;
import std.string;

Data data @ 0x00;
/*
u8 arr[4] = {1, 2, 3, 0};
//std::print(std::string::to_string(arr));
for(u32 i = 0, i < data.form.audo.count, i += 1) {
    std::file::Handle file = std::file::open("~/wav/" + std::string::to_string(i) + ".wav",
        std::file::Mode::Create);
        
    std::file::write(file, data.form.audo.ac[i].wav);
    std::file::close(file);
}
*/