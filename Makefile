DRIVER := pmbus pmbus_core adm1275 lm25066 ltc2978 max16064 max34440 max8688 ucd9000 ucd9200 zl6100 max20751

SRC := $(shell pwd)

obj-m	:= $(patsubst %,%.o,$(DRIVER))
obj-ko	:= $(patsubst %,%.ko,$(DRIVER))

.PHONY: all install modules modules_install clean

all:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)

modules_install:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install

clean:
	@$(MAKE) -C $(KERNEL_SRC) M=$(SRC) clean

