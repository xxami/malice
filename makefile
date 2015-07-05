
# make me !

# depends:
# nuget install akka
# nuget install ilrepack (for make release)  

csc=mcs
ilrepack=ilrepack

bin=./malice

# configure akka asm depends
akka_asm=Akka.dll
json_asm=Newtonsoft.Json.dll
akka_path=Akka.1.0.3/lib/net45
json_path=Newtonsoft.Json.6.0.8/lib/net45

refs=\
	/r:$(akka_asm)\
	/r:$(json_asm)\

classes=\
	malice.cs\

# make all !

all: $(bin)

$(bin): $(classes) $(akka_asm) $(json_asm)
	$(csc) $(refs) $(classes) /out:$(bin) /t:exe

$(akka_asm):
	@echo cp -rf $(akka_path)/$(akka_asm) ./$(akka_asm)
	@\cp -rf $(akka_path)/$(akka_asm) ./$(akka_asm)

$(json_asm):
	@echo cp -rf $(json_path)/$(json_asm) ./$(json_asm)
	@\cp -rf $(json_path)/$(json_asm) ./$(json_asm)

# make release !

release:
	mkdir -p ./bin
	$(ilrepack) /target:exe /ndebug $(bin) ./$(akka_asm) ./$(json_asm) \
		/out:./bin/$(bin) >> ./bin/release.log
