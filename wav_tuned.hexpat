#pragma description RIFF/WAVE/PCM (.wav)

#pragma MIME audio/x-wav
#pragma MIME audio/wav

import std.mem;

struct RiffHeader {
    char ckID[4] [[comment("Container Signature"), name("RIFF Header Signature")]];
    u32 ckSize [[comment("Size of RIFF Header"), name("RIFF Chunk Size")]];
    char format[4] [[comment("RIFF format"), name("WAVE Header Signature")]];
};

struct WaveChunk {
    char chunkId[4];
    u32 chunkSize;
};

enum WaveFormatType: u16 {
    Unknown,
    PCM,
    MS_ADPCM,
    IEEEFloatingPoint,
    ALAW = 6,
    MULAW,
    IMA_ADPCM  = 0x11,
    GSM610     = 0x31,
    MPEG       = 0x50,
    MPEGLAYER3 = 0x55,
};

struct WaveFormat {
    WaveFormatType formatTag;
    u16 channels;
    u32 samplesPerSec [[comment("Sample Frequency")]];
    u32 avgBytesPerSec [[comment("BPS - Used to estimate buffer size")]];
    u16 blockAlign;
};

struct WaveFormatEx {
    u16 bitsPerSample;
    u16 extendedDataSize;
};

struct WaveFormatExDummy {
    u16 bitsPerSample;
    u16 extendedDataSize;
    u8 dummy[extendedDataSize];
};

struct WaveFormatPCM {
    u16 bitsPerSample;
};

struct WaveMSADPCMCoefSet {
    s16 coef1;
    s16 coef2;
};

struct WaveFormatMSADPCM: WaveFormatEx {
    u16 samplesPerBlock;
    u16 numCoef;
    WaveMSADPCMCoefSet coef[numCoef];
};

bitfield WaveMPEGLayer {
    Layer1: 1;
    Layer2: 1;
    Layer3: 1;
    padding: 13;
};

bitfield WaveMPEGMode {
    Stereo: 1;
    JointStereo: 1;
    DualChannel: 1;
    SingleChannel: 1;
    padding: 12;
};

bitfield WaveMPEGFlags {
    PrivateBit: 1;
    Copyright: 1;
    OriginalHome: 1;
    ProtectionBit: 1;
    IdMPEG1: 1;
    padding: 11;
};

struct WaveFormatIEEEFloatingPoint: WaveFormatPCM {

};

struct WaveFormatMPEG: WaveFormatEx {
    WaveMPEGLayer headLayersUsed;
    u32 headBitrate;
    WaveMPEGMode headMode;
    u16 headModeExt;
    u16 headEmphasis;
    WaveMPEGFlags headFlags;
    u32 PTSLow;
    u32 PTSHigh;
};

enum WaveFormatMPEGLayer3Flags: u32 {
    MPEGLAYER3_FLAG_PADDING_ISO,
    MPEGLAYER3_FLAG_PADDING_ON,
    MPEGLAYER3_FLAG_PADDING_OFF
};

struct WaveFormatMPEGLayer3: WaveFormatEx {
    u16 d;
    WaveFormatMPEGLayer3Flags flags;
    u16 blockSize;
    u16 framesPerBlock;
    u16 codecDelay;
};

struct WaveFact {
    u32 uncompressedSize;
};

enum SampleLookupType: u32 {
    TYPE_LOOP_FORWARD,
    TYPE_LOOP_ALTERNATE,
    TYPE_LOOP_BACKWARD,
};

struct SampleLookup {
    u32 id;
    SampleLookupType type;
    u32 start;
    u32 end;
    u32 fraction;
    u32 playCount;
};

struct WaveSample {
    u32 manufacturer;
    u32 product;
    u32 samplePeriod;
    u32 MIDIUnityNote;
    u32 MIDIPitchFraction;
    u32 SMPTEFormat;
    u32 SMPTEOffset;
    u32 numSampleLoops;
    u32 sampleLoopsSize;
    
    SampleLookup lookups[numSampleLoops];
};

struct WaveCuePoint {
    u32 indentifier;
    u32 position;
    char chunkID[4];
    u32 chunkStart;
    u32 blockStart;
    u32 sampleOffset;
};

struct WaveCue {
    u32 numCuePoints;
    WaveCuePoint cuePoints[numCuePoints];
};

struct WaveLabel {
    u32 id;
    char text[];
    u8 wave[sizeof(text) % 2];
};

using WaveNote = WaveLabel;

struct WaveListItem: WaveChunk {
    if(chunkId == "labl") {
        WaveLabel label;
    } else if(chunkId == "note") {
        WaveNote note;
    } else {
        u8 data[(chunkSize + 1) >> 1 << 1];
    }
};

u64 listEnd;

struct WaveList {
    char type[4];

    WaveListItem item[while($ < listEnd)];
};

u32 paddedChunkSize;

struct WavData {
    WaveChunk chunk;
    paddedChunkSize = (chunk.chunkSize + 1) >> 1 << 1;

    if(chunk.chunkId == "fmt ") {
        WaveFormat fmt;

        if(fmt.formatTag == WaveFormatType::PCM) {
            WaveFormatPCM pcmExtraData;
            u8 PCM[paddedChunkSize - sizeof(fmt) - sizeof(pcmExtraData)];
        } else if(fmt.formatTag == WaveFormatType::MS_ADPCM) {
            WaveFormatMSADPCM msAdpcmExtraData;
            u8 ADPCM[paddedChunkSize - sizeof(fmt) - sizeof(msAdpcmExtraData)];
        } else if(fmt.formatTag == WaveFormatType::MPEG) {
            WaveFormatMPEG mpegExtraData;
            u8 MPEG[paddedChunkSize - sizeof(fmt) - sizeof(mpegExtraData)];
        } else if(fmt.formatTag == WaveFormatType::MPEGLAYER3) {
            WaveFormatMPEGLayer3 mpegLayer3ExtraData;
            u8 layer3[paddedChunkSize - sizeof(fmt) - sizeof(mpegLayer3ExtraData)];
        } else if(fmt.formatTag == WaveFormatType::IEEEFloatingPoint) {
            WaveFormatIEEEFloatingPoint ieeFloatingPointExtraData;
            u8 fp_extra[paddedChunkSize - sizeof(fmt) - sizeof(ieeFloatingPointExtraData)];
        } else {
            WaveFormatExDummy unknown;
            padding[paddedChunkSize - sizeof(fmt) - sizeof(unknown)];
        }
        } else if(chunk.chunkId == "data") {
            u8 data[paddedChunkSize];
        } else if(chunk.chunkId == "fact") {
            WaveFact fact;
            u8 wave_fact[paddedChunkSize - sizeof(fact)];
        } else if(chunk.chunkId == "smpl") {
            WaveSample smpl;
            u8 wave_sample[paddedChunkSize - sizeof(smpl)];
        } else if(chunk.chunkId == "cue ") {
            WaveCue cue;
            u8 wave_cue[paddedChunkSize - sizeof(cue)];
        } else if(chunk.chunkId == "LIST") {
            listEnd = $ + chunk.chunkSize;
            WaveList wave_list;
        } else {
            u8 stub[chunk.chunkSize];
        }
};

RiffHeader header @ 0x00;
WavData data[while($ < header.ckSize + 8)] @ $;