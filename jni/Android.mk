# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
TOP_PATH := $(call my-dir)/..

#include $(CLEAR_VARS)

# Build hiredis
include $(CLEAR_VARS)
LOCAL_PATH := $(TOP_PATH)/deps/hiredis
LOCAL_MODULE := hiredis
LOCAL_LDLIBS := -llog -ldl
LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_SRC_FILES := hiredis.c read.c async.c net.c sds.c
include $(BUILD_SHARED_LIBRARY)

# Build lua
include $(CLEAR_VARS)
LOCAL_PATH := $(TOP_PATH)/deps/lua/src
LOCAL_MODULE := lua
LOCAL_LDLIBS := -llog -ldl
LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_SRC_FILES := lapi.c lcode.c ldebug.c ldo.c ldump.c lfunc.c lgc.c llex.c lmem.c lobject.c lopcodes.c lparser.c lstate.c lstring.c ltable.c ltm.c lundump.c lvm.c lzio.c strbuf.c lauxlib.c lbaselib.c ldblib.c liolib.c lmathlib.c loslib.c ltablib.c lstrlib.c loadlib.c linit.c lua_cjson.c lua_struct.c lua_cmsgpack.c lua_bit.c fpconv.c
include $(BUILD_SHARED_LIBRARY)

# Build linenoise
include $(CLEAR_VARS)
LOCAL_PATH := $(TOP_PATH)/deps/linenoise
LOCAL_MODULE := linenoise
LOCAL_LDLIBS := -llog -ldl
LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_SRC_FILES := linenoise.c
include $(BUILD_SHARED_LIBRARY)

# Build redis-server
include $(CLEAR_VARS)
LOCAL_PATH := $(TOP_PATH)/src
LOCAL_SHARED_LIBRARIES := hiredis lua linenoise
LOCAL_MODULE := redis-server
LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_CFLAGS += -O2 -I$(TOP_PATH)/deps/hiredis -I$(TOP_PATH)/deps/linenoise -I$(TOP_PATH)/deps/lua/src -I$(TOP_PATH)/deps/jemalloc/include -D__ANDROID__
LOCAL_SRC_FILES := adlist.c quicklist.c ae.c anet.c dict.c server.c sds.c zmalloc.c lzf_c.c lzf_d.c pqsort.c zipmap.c sha1.c ziplist.c release.c networking.c util.c object.c db.c replication.c rdb.c t_string.c t_list.c t_set.c t_zset.c t_hash.c config.c aof.c pubsub.c multi.c debug.c sort.c intset.c syncio.c cluster.c crc16.c endianconv.c slowlog.c scripting.c bio.c rio.c rand.c memtest.c crc64.c bitops.c sentinel.c notify.c setproctitle.c blocked.c hyperloglog.c latency.c sparkline.c redis-check-rdb.c redis-check-aof.c geo.c lazyfree.c module.c evict.c expire.c geohash.c geohash_helper.c childinfo.c defrag.c siphash.c rax.c t_stream.c listpack.c
include $(BUILD_EXECUTABLE)

# Build redis-cli
include $(CLEAR_VARS)
LOCAL_PATH := $(TOP_PATH)/src
LOCAL_SHARED_LIBRARIES := hiredis lua linenoise
LOCAL_MODULE := redis-cli
LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_CFLAGS += -O2 -I$(TOP_PATH)/deps/hiredis -I$(TOP_PATH)/deps/linenoise -I$(TOP_PATH)/deps/lua/src -I$(TOP_PATH)/deps/jemalloc/include -D__ANDROID__
LOCAL_SRC_FILES := anet.c adlist.c redis-cli.c zmalloc.c release.c ae.c crc64.c
include $(BUILD_EXECUTABLE)