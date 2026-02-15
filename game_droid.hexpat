#include <std/mem.pat>
import * from wav as Wave;
import std.io;

struct Header {
    char code[4];
    s32 size;
};

struct GEN8 {
    Header header;
    u8 stub[header.size];
};

struct OPTN {
    Header header;
    u8 stub[header.size];
};

struct LANG {
    Header header;
    u8 stub[header.size];
};

struct EXTN {
    Header header;
    u8 stub[header.size];
};

struct SOND {
    Header header;
    u8 stub[header.size];
};

struct AGRP {
    Header header;
    u8 stub[header.size];
};

struct SPRT {
    Header header;
    u8 stub[header.size];
};

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
    u8 stub[header.size];
};

struct GLOB {
    Header header;
    u8 stub[header.size];
};

struct SHDR {
    Header header;
    u8 stub[header.size];
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
    u8 stub[header.size];
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
    u8 stub[header.size];
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
    u8 stub[header.size];
};

struct TGIN {
    Header header;
    u8 stub[header.size];
};

struct FEAT {
    Header header;
    u8 stub[header.size];
};

struct STRG {
    Header header;
    u8 stub[header.size];
};

struct TXTR {
    Header header;
    u8 stub[header.size];
};

struct Ac {
    u8 pad[$ % 4];
    u32 size;
    char wav[size];
};


struct AUDO {
    Header header;
    s32 count;
    s32 ptr[count];
    Ac ac[count];
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
    STRG strg;
    TXTR txtr;
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