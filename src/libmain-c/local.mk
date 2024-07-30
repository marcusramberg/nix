libraries += libmainc

libmainc_NAME = libnixmainc

libmainc_DIR := $(d)

libmainc_SOURCES := \
  $(wildcard $(d)/*.cc) \

# Not just for this library itself, but also for downstream libraries using this library

INCLUDE_libmainc := -I $(d)
libmainc_CXXFLAGS += $(INCLUDE_libutil) $(INCLUDE_libutilc) \
                     $(INCLUDE_libstore) $(INCLUDE_libstorec) \
                     $(INCLUDE_libmain) $(INCLUDE_libmainc)

libmainc_LIBS = libutil libutilc libstore libstorec libmain

libmainc_LDFLAGS += $(THREAD_LDFLAGS)

$(eval $(call install-file-in, $(d)/nix-main-c.pc, $(libdir)/pkgconfig, 0644))

libmainc_FORCE_INSTALL := 1

