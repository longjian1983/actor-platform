//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/viewmodel/UserVM.java
//

#include "IOSObjectArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/MainThreadProvider.h"
#include "im/actor/model/entity/Avatar.h"
#include "im/actor/model/entity/ContactRecord.h"
#include "im/actor/model/entity/Sex.h"
#include "im/actor/model/entity/User.h"
#include "im/actor/model/modules/Contacts.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/mvvm/MVVMEngine.h"
#include "im/actor/model/mvvm/ModelChangedListener.h"
#include "im/actor/model/mvvm/ValueModel.h"
#include "im/actor/model/viewmodel/UserPhone.h"
#include "im/actor/model/viewmodel/UserPresence.h"
#include "im/actor/model/viewmodel/UserVM.h"
#include "java/lang/Boolean.h"
#include "java/lang/Long.h"
#include "java/util/ArrayList.h"
#include "java/util/List.h"

__attribute__((unused)) static JavaUtilArrayList *AMUserVM_buildPhonesWithJavaUtilList_(AMUserVM *self, id<JavaUtilList> records);
__attribute__((unused)) static void AMUserVM_notifyChange(AMUserVM *self);

@interface AMUserVM () {
 @public
  jint id__;
  jlong hash__;
  AMValueModel *name_;
  AMValueModel *avatar_;
  AMSexEnum *sex_;
  AMValueModel *isContact__;
  AMValueModel *presence_;
  JavaUtilArrayList *listeners_;
  AMValueModel *phones_;
}

- (JavaUtilArrayList *)buildPhonesWithJavaUtilList:(id<JavaUtilList>)records;

- (void)notifyChange;
@end

J2OBJC_FIELD_SETTER(AMUserVM, name_, AMValueModel *)
J2OBJC_FIELD_SETTER(AMUserVM, avatar_, AMValueModel *)
J2OBJC_FIELD_SETTER(AMUserVM, sex_, AMSexEnum *)
J2OBJC_FIELD_SETTER(AMUserVM, isContact__, AMValueModel *)
J2OBJC_FIELD_SETTER(AMUserVM, presence_, AMValueModel *)
J2OBJC_FIELD_SETTER(AMUserVM, listeners_, JavaUtilArrayList *)
J2OBJC_FIELD_SETTER(AMUserVM, phones_, AMValueModel *)

@interface AMUserVM_$1 () {
 @public
  AMUserVM *this$0_;
}
@end

J2OBJC_FIELD_SETTER(AMUserVM_$1, this$0_, AMUserVM *)

@implementation AMUserVM

- (instancetype)initWithAMUser:(AMUser *)user
withImActorModelModulesModules:(ImActorModelModulesModules *)modules {
  if (self = [super initWithId:user]) {
    listeners_ = [[JavaUtilArrayList alloc] init];
    id__ = [((AMUser *) nil_chk(user)) getUid];
    hash__ = [user getAccessHash];
    sex_ = [user getSex];
    name_ = [[AMValueModel alloc] initWithNSString:JreStrcat("$I$", @"user.", id__, @".name") withId:[user getName]];
    avatar_ = [[AMValueModel alloc] initWithNSString:JreStrcat("$I$", @"user.", id__, @".avatar") withId:[user getAvatar]];
    isContact__ = [[AMValueModel alloc] initWithNSString:JreStrcat("$I$", @"user.", id__, @".contact") withId:JavaLangBoolean_valueOfWithBoolean_([((ImActorModelModulesContacts *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules)) getContactsModule])) isUserContactWithInt:id__])];
    presence_ = [[AMValueModel alloc] initWithNSString:JreStrcat("$I$", @"user.", id__, @".presence") withId:[[AMUserPresence alloc] initWithAMUserPresence_StateEnum:AMUserPresence_StateEnum_get_UNKNOWN()]];
    phones_ = [[AMValueModel alloc] initWithNSString:JreStrcat("$I$", @"user.", id__, @".phones") withId:AMUserVM_buildPhonesWithJavaUtilList_(self, [user getRecords])];
  }
  return self;
}

- (void)updateValuesWithId:(AMUser *)rawObj {
  jboolean isChanged = NO;
  isChanged |= [((AMValueModel *) nil_chk(name_)) changeWithId:[((AMUser *) nil_chk(rawObj)) getName]];
  isChanged |= [((AMValueModel *) nil_chk(avatar_)) changeWithId:[rawObj getAvatar]];
  isChanged |= [((AMValueModel *) nil_chk(phones_)) changeWithId:AMUserVM_buildPhonesWithJavaUtilList_(self, [rawObj getRecords])];
  if (isChanged) {
    AMUserVM_notifyChange(self);
  }
}

- (jint)getId {
  return id__;
}

- (jlong)getHash {
  return hash__;
}

- (AMValueModel *)getName {
  return name_;
}

- (AMValueModel *)getAvatar {
  return avatar_;
}

- (AMSexEnum *)getSex {
  return sex_;
}

- (AMValueModel *)isContact {
  return isContact__;
}

- (AMValueModel *)getPresence {
  return presence_;
}

- (AMValueModel *)getPhones {
  return phones_;
}

- (JavaUtilArrayList *)buildPhonesWithJavaUtilList:(id<JavaUtilList>)records {
  return AMUserVM_buildPhonesWithJavaUtilList_(self, records);
}

- (void)subscribeWithAMModelChangedListener:(id<AMModelChangedListener>)listener {
  if ([((JavaUtilArrayList *) nil_chk(listeners_)) containsWithId:listener]) {
    return;
  }
  [listeners_ addWithId:listener];
  [((id<AMModelChangedListener>) nil_chk(listener)) onChangedWithId:self];
}

- (void)unsubscribeWithAMModelChangedListener:(id<AMModelChangedListener>)listener {
  [((JavaUtilArrayList *) nil_chk(listeners_)) removeWithId:listener];
}

- (void)notifyChange {
  AMUserVM_notifyChange(self);
}

- (void)copyAllFieldsTo:(AMUserVM *)other {
  [super copyAllFieldsTo:other];
  other->id__ = id__;
  other->hash__ = hash__;
  other->name_ = name_;
  other->avatar_ = avatar_;
  other->sex_ = sex_;
  other->isContact__ = isContact__;
  other->presence_ = presence_;
  other->listeners_ = listeners_;
  other->phones_ = phones_;
}

@end

JavaUtilArrayList *AMUserVM_buildPhonesWithJavaUtilList_(AMUserVM *self, id<JavaUtilList> records) {
  JavaUtilArrayList *res = [[JavaUtilArrayList alloc] init];
  for (AMContactRecord * __strong r in nil_chk(records)) {
    if ([((AMContactRecord *) nil_chk(r)) getRecordType] == AMContactRecord_get_TYPE_PHONE_()) {
      [res addWithId:[[AMUserPhone alloc] initWithLong:JavaLangLong_parseLongWithNSString_([r getRecordData]) withNSString:[r getRecordTitle]]];
    }
  }
  return res;
}

void AMUserVM_notifyChange(AMUserVM *self) {
  [((id<AMMainThreadProvider>) nil_chk(AMMVVMEngine_getMainThreadProvider())) runOnUiThreadWithJavaLangRunnable:[[AMUserVM_$1 alloc] initWithAMUserVM:self]];
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMUserVM)

@implementation AMUserVM_$1

- (void)run {
  {
    IOSObjectArray *a__ = [((JavaUtilArrayList *) nil_chk(this$0_->listeners_)) toArrayWithNSObjectArray:[IOSObjectArray newArrayWithLength:0 type:AMModelChangedListener_class_()]];
    id<AMModelChangedListener> const *b__ = ((IOSObjectArray *) nil_chk(a__))->buffer_;
    id<AMModelChangedListener> const *e__ = b__ + a__->size_;
    while (b__ < e__) {
      id<AMModelChangedListener> l = *b__++;
      [((id<AMModelChangedListener>) nil_chk(l)) onChangedWithId:this$0_];
    }
  }
}

- (instancetype)initWithAMUserVM:(AMUserVM *)outer$ {
  this$0_ = outer$;
  return [super init];
}

- (void)copyAllFieldsTo:(AMUserVM_$1 *)other {
  [super copyAllFieldsTo:other];
  other->this$0_ = this$0_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMUserVM_$1)
