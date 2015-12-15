#include <iostream>
#include <string>
#include "HelloWorld.h"

using namespace std;

JNIEXPORT void JNICALL Java_HelloWorld_println
(JNIEnv *env, jobject o, jstring s) {

  const char *msg = env->GetStringUTFChars(s, 0);
  cout << msg << endl;
  env->ReleaseStringUTFChars(s, msg);
}

JNIEXPORT jint JNICALL Java_HelloWorld_getInt
(JNIEnv *env, jobject o) {

  int value;
  cin >> value;
  return value;
}

JNIEXPORT jstring JNICALL Java_HelloWorld_toString
(JNIEnv *env, jobject o, jint value) {

  string s = to_string((int)value);
  jstring ret = env->NewStringUTF(s.c_str());
  return ret;
}
