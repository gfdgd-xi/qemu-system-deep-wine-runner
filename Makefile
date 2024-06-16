CPU_CORES=$(($(grep -c processor < /proc/cpuinfo)*2))

build:
	mkdir -p qemu-build
	cd qemu-build ; ../qemu/configure --target-list=x86_64-linux-user,aarch64-linux-user,loongarch64-linux-user,i386-linux-user,arm-linux-user,aarch64-softmmu,arm-softmmu,loongarch64-softmmu,x86_64-softmmu --enable-kvm --enable-slirp
	cd qemu-build ; make -j$(CPU_CORES)

clean:
	rm -rf qemu-build

install:
	cd qemu-build ; make install DESTDIR=$(DESTDIR)/opt/apps/deepin-wine-runner/VM/qemu-extra  -j$(CPU_CORES)