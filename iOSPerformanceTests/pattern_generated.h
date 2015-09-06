// automatically generated by the FlatBuffers compiler, do not modify

#ifndef FLATBUFFERS_GENERATED_PATTERN_H_
#define FLATBUFFERS_GENERATED_PATTERN_H_

#include "flatbuffers/flatbuffers.h"



struct anObject;
struct aGroup;
struct aHeader;
struct pattern;

struct anObject FLATBUFFERS_FINAL_CLASS : private flatbuffers::Table {
  float x() const { return GetField<float>(4, 0); }
  float rotation() const { return GetField<float>(6, 0); }
  float y() const { return GetField<float>(8, 0); }
  uint8_t flip_horizontal() const { return GetField<uint8_t>(10, 0); }
  uint8_t top() const { return GetField<uint8_t>(12, 0); }
  const flatbuffers::String *type() const { return GetPointer<const flatbuffers::String *>(14); }
  const flatbuffers::String *name() const { return GetPointer<const flatbuffers::String *>(16); }
  const flatbuffers::String *group() const { return GetPointer<const flatbuffers::String *>(18); }
  bool Verify(flatbuffers::Verifier &verifier) const {
    return VerifyTableStart(verifier) &&
           VerifyField<float>(verifier, 4 /* x */) &&
           VerifyField<float>(verifier, 6 /* rotation */) &&
           VerifyField<float>(verifier, 8 /* y */) &&
           VerifyField<uint8_t>(verifier, 10 /* flip_horizontal */) &&
           VerifyField<uint8_t>(verifier, 12 /* top */) &&
           VerifyField<flatbuffers::uoffset_t>(verifier, 14 /* type */) &&
           verifier.Verify(type()) &&
           VerifyField<flatbuffers::uoffset_t>(verifier, 16 /* name */) &&
           verifier.Verify(name()) &&
           VerifyField<flatbuffers::uoffset_t>(verifier, 18 /* group */) &&
           verifier.Verify(group()) &&
           verifier.EndTable();
  }
};

struct anObjectBuilder {
  flatbuffers::FlatBufferBuilder &fbb_;
  flatbuffers::uoffset_t start_;
  void add_x(float x) { fbb_.AddElement<float>(4, x, 0); }
  void add_rotation(float rotation) { fbb_.AddElement<float>(6, rotation, 0); }
  void add_y(float y) { fbb_.AddElement<float>(8, y, 0); }
  void add_flip_horizontal(uint8_t flip_horizontal) { fbb_.AddElement<uint8_t>(10, flip_horizontal, 0); }
  void add_top(uint8_t top) { fbb_.AddElement<uint8_t>(12, top, 0); }
  void add_type(flatbuffers::Offset<flatbuffers::String> type) { fbb_.AddOffset(14, type); }
  void add_name(flatbuffers::Offset<flatbuffers::String> name) { fbb_.AddOffset(16, name); }
  void add_group(flatbuffers::Offset<flatbuffers::String> group) { fbb_.AddOffset(18, group); }
  anObjectBuilder(flatbuffers::FlatBufferBuilder &_fbb) : fbb_(_fbb) { start_ = fbb_.StartTable(); }
  anObjectBuilder &operator=(const anObjectBuilder &);
  flatbuffers::Offset<anObject> Finish() {
    auto o = flatbuffers::Offset<anObject>(fbb_.EndTable(start_, 8));
    return o;
  }
};

inline flatbuffers::Offset<anObject> CreateanObject(flatbuffers::FlatBufferBuilder &_fbb,
   float x = 0,
   float rotation = 0,
   float y = 0,
   uint8_t flip_horizontal = 0,
   uint8_t top = 0,
   flatbuffers::Offset<flatbuffers::String> type = 0,
   flatbuffers::Offset<flatbuffers::String> name = 0,
   flatbuffers::Offset<flatbuffers::String> group = 0) {
  anObjectBuilder builder_(_fbb);
  builder_.add_group(group);
  builder_.add_name(name);
  builder_.add_type(type);
  builder_.add_y(y);
  builder_.add_rotation(rotation);
  builder_.add_x(x);
  builder_.add_top(top);
  builder_.add_flip_horizontal(flip_horizontal);
  return builder_.Finish();
}

struct aGroup FLATBUFFERS_FINAL_CLASS : private flatbuffers::Table {
  const flatbuffers::Vector<flatbuffers::Offset<anObject>> *objects() const { return GetPointer<const flatbuffers::Vector<flatbuffers::Offset<anObject>> *>(4); }
  const flatbuffers::String *name() const { return GetPointer<const flatbuffers::String *>(6); }
  bool Verify(flatbuffers::Verifier &verifier) const {
    return VerifyTableStart(verifier) &&
           VerifyField<flatbuffers::uoffset_t>(verifier, 4 /* objects */) &&
           verifier.Verify(objects()) &&
           verifier.VerifyVectorOfTables(objects()) &&
           VerifyField<flatbuffers::uoffset_t>(verifier, 6 /* name */) &&
           verifier.Verify(name()) &&
           verifier.EndTable();
  }
};

struct aGroupBuilder {
  flatbuffers::FlatBufferBuilder &fbb_;
  flatbuffers::uoffset_t start_;
  void add_objects(flatbuffers::Offset<flatbuffers::Vector<flatbuffers::Offset<anObject>>> objects) { fbb_.AddOffset(4, objects); }
  void add_name(flatbuffers::Offset<flatbuffers::String> name) { fbb_.AddOffset(6, name); }
  aGroupBuilder(flatbuffers::FlatBufferBuilder &_fbb) : fbb_(_fbb) { start_ = fbb_.StartTable(); }
  aGroupBuilder &operator=(const aGroupBuilder &);
  flatbuffers::Offset<aGroup> Finish() {
    auto o = flatbuffers::Offset<aGroup>(fbb_.EndTable(start_, 2));
    return o;
  }
};

inline flatbuffers::Offset<aGroup> CreateaGroup(flatbuffers::FlatBufferBuilder &_fbb,
   flatbuffers::Offset<flatbuffers::Vector<flatbuffers::Offset<anObject>>> objects = 0,
   flatbuffers::Offset<flatbuffers::String> name = 0) {
  aGroupBuilder builder_(_fbb);
  builder_.add_name(name);
  builder_.add_objects(objects);
  return builder_.Finish();
}

struct aHeader FLATBUFFERS_FINAL_CLASS : private flatbuffers::Table {
  int32_t width() const { return GetField<int32_t>(4, 0); }
  int32_t height() const { return GetField<int32_t>(6, 0); }
  const flatbuffers::String *data() const { return GetPointer<const flatbuffers::String *>(8); }
  bool Verify(flatbuffers::Verifier &verifier) const {
    return VerifyTableStart(verifier) &&
           VerifyField<int32_t>(verifier, 4 /* width */) &&
           VerifyField<int32_t>(verifier, 6 /* height */) &&
           VerifyField<flatbuffers::uoffset_t>(verifier, 8 /* data */) &&
           verifier.Verify(data()) &&
           verifier.EndTable();
  }
};

struct aHeaderBuilder {
  flatbuffers::FlatBufferBuilder &fbb_;
  flatbuffers::uoffset_t start_;
  void add_width(int32_t width) { fbb_.AddElement<int32_t>(4, width, 0); }
  void add_height(int32_t height) { fbb_.AddElement<int32_t>(6, height, 0); }
  void add_data(flatbuffers::Offset<flatbuffers::String> data) { fbb_.AddOffset(8, data); }
  aHeaderBuilder(flatbuffers::FlatBufferBuilder &_fbb) : fbb_(_fbb) { start_ = fbb_.StartTable(); }
  aHeaderBuilder &operator=(const aHeaderBuilder &);
  flatbuffers::Offset<aHeader> Finish() {
    auto o = flatbuffers::Offset<aHeader>(fbb_.EndTable(start_, 3));
    return o;
  }
};

inline flatbuffers::Offset<aHeader> CreateaHeader(flatbuffers::FlatBufferBuilder &_fbb,
   int32_t width = 0,
   int32_t height = 0,
   flatbuffers::Offset<flatbuffers::String> data = 0) {
  aHeaderBuilder builder_(_fbb);
  builder_.add_data(data);
  builder_.add_height(height);
  builder_.add_width(width);
  return builder_.Finish();
}

struct pattern FLATBUFFERS_FINAL_CLASS : private flatbuffers::Table {
  const flatbuffers::Vector<flatbuffers::Offset<aGroup>> *groups() const { return GetPointer<const flatbuffers::Vector<flatbuffers::Offset<aGroup>> *>(4); }
  const aHeader *header() const { return GetPointer<const aHeader *>(6); }
  bool Verify(flatbuffers::Verifier &verifier) const {
    return VerifyTableStart(verifier) &&
           VerifyField<flatbuffers::uoffset_t>(verifier, 4 /* groups */) &&
           verifier.Verify(groups()) &&
           verifier.VerifyVectorOfTables(groups()) &&
           VerifyField<flatbuffers::uoffset_t>(verifier, 6 /* header */) &&
           verifier.VerifyTable(header()) &&
           verifier.EndTable();
  }
};

struct patternBuilder {
  flatbuffers::FlatBufferBuilder &fbb_;
  flatbuffers::uoffset_t start_;
  void add_groups(flatbuffers::Offset<flatbuffers::Vector<flatbuffers::Offset<aGroup>>> groups) { fbb_.AddOffset(4, groups); }
  void add_header(flatbuffers::Offset<aHeader> header) { fbb_.AddOffset(6, header); }
  patternBuilder(flatbuffers::FlatBufferBuilder &_fbb) : fbb_(_fbb) { start_ = fbb_.StartTable(); }
  patternBuilder &operator=(const patternBuilder &);
  flatbuffers::Offset<pattern> Finish() {
    auto o = flatbuffers::Offset<pattern>(fbb_.EndTable(start_, 2));
    return o;
  }
};

inline flatbuffers::Offset<pattern> Createpattern(flatbuffers::FlatBufferBuilder &_fbb,
   flatbuffers::Offset<flatbuffers::Vector<flatbuffers::Offset<aGroup>>> groups = 0,
   flatbuffers::Offset<aHeader> header = 0) {
  patternBuilder builder_(_fbb);
  builder_.add_header(header);
  builder_.add_groups(groups);
  return builder_.Finish();
}

inline const pattern *Getpattern(const void *buf) { return flatbuffers::GetRoot<pattern>(buf); }

inline bool VerifypatternBuffer(flatbuffers::Verifier &verifier) { return verifier.VerifyBuffer<pattern>(); }

inline void FinishpatternBuffer(flatbuffers::FlatBufferBuilder &fbb, flatbuffers::Offset<pattern> root) { fbb.Finish(root); }


#endif  // FLATBUFFERS_GENERATED_PATTERN_H_
