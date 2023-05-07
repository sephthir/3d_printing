
# convenience for printing: fancy if it's a tty, otherwise escape sequences get
# filtered out so we don't pollute plaintext with garbage
define ansiesc
if [ -t 1 ]; then \
    printf "$(2)\n" $(3) 1>&$(1); \
else \
    printf "$(2)\n" $(3) | sed $$'s/\033\\[[^m]*m//g' 1>&$(1); \
fi
endef

# shorthand for stdout
define ansiout
$(call ansiesc,1,$(1),$(2))
endef

# shorthand for stderr
define ansierr
$(call ansiesc,2,$(1),$(2))
endef

