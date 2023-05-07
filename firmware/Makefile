default: all

subdirs   = btt_ebb_v1.1 \
            btt_octopus_v1.1 \
            btt_skr_e3_v3.0 \
   DISABLED-btt_skr_pico \
            mks_thr \
            mks_utc_v1.0


.PHONY: all
all:
	@for subdir in $(subdirs); do \
        if [ ! -d "$$subdir" ]; then \
            continue; \
        fi; \
	    if [ -t 1 ]; then \
	        printf "\033[33;1m-- $$subdir --\033[0m\n"; \
	    else \
	        echo "-- $$subdir --"; \
	    fi; \
	    $(MAKE) $(MAKEOPTS) -C $$subdir; \
	done

.PHONY: pristine
pristine:
	@for subdir in $(subdirs); do \
	    if [ -t 1 ]; then \
	        printf "\033[33;1m-- $$subdir --\033[0m\n"; \
	    else \
	        echo "-- $$subdir --"; \
	    fi; \
	    $(MAKE) $(MAKEOPTS) -C $$subdir pristine; \
	done

