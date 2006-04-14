# $Id$
# Should be included at the end of each node.mk file.

# Process this node.
SOURCES_FULL+=$(sort \
	$(addprefix $(CURDIR),$(addsuffix .cpp, \
		$(MOC_SRC_HDR) $(SRC_HDR) $(SRC_ONLY) \
	)))
HEADERS_FULL+=$(sort \
	$(addprefix $(CURDIR),$(addsuffix .h, \
		$(MOC_SRC_HDR) $(HDR_ONLY) \
	)))
MOC_HDR_FULL+=$(sort \
	$(addprefix $(CURDIR),$(addsuffix .h, \
		$(MOC_SRC_HDR) \
	)))
DIST_FULL+=$(sort \
	$(addprefix $(CURDIR),$(DIST) node.mk) \
	)

# Process subnodes.
ifneq ($(SUBDIRS),)
SUBDIRS:=$(addsuffix /,$(SUBDIRS))
SUBDIRSTACK:=$(SUBDIRS) $(SUBDIRSTACK)
include $(addprefix $(CURDIR),$(addsuffix node.mk,$(SUBDIRS)))
endif

# Pop current directory off directory stack.
CURDIR:=$(firstword $(DIRSTACK))
DIRSTACK:=$(wordlist 2,$(words $(DIRSTACK)),$(DIRSTACK))
