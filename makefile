
# make me !
#
# pre-requires:
# sudo apt-get install mono mono-devel mono-complete
# nuget command-line must be installed/available on path
#
# test: make depends && make test-depends && make test
# build: make depends && make && make release

## configure

csc=mcs
bin=./malice

# configure asm depends if using alternate versions
ilrepack_bin=ILRepack.exe
json_asm=Newtonsoft.Json.dll
akka_asm=Akka.dll

# configure path for asm depends if using alternate versions
ilrepack_path=depends/ILRepack.2.0.2/tools
json_path=depends/Newtonsoft.Json.6.0.8/lib/net45
akka_path=depends/Akka.1.0.3/lib/net45

# references
refs=\
	/r:$(akka_asm)\
	/r:$(json_asm)\

# compilation units
cs_units=\
	classes/Malice.cs\
	actors/MalLoginActor.cs\

## build system

# make all !

all: $(bin)

$(bin): $(cs_units) $(akka_asm) $(json_asm)
	$(csc) $(refs) $(cs_units) /out:$(bin) /t:exe

$(akka_asm):
	@echo cp -rf $(akka_path)/$(akka_asm) ./$(akka_asm)
	@\cp -rf $(akka_path)/$(akka_asm) ./$(akka_asm)

$(json_asm):
	@echo cp -rf $(json_path)/$(json_asm) ./$(json_asm)
	@\cp -rf $(json_path)/$(json_asm) ./$(json_asm)

# make depends !

depends:
	nuget install newtonsoft.json -version 6.0.8 -o depends
	nuget install akka -version 1.0.3 -o depends
	nuget install ilrepack -version 2.0.2 -o depends

# make test-depends !

test-depends:
	nuget install akka.testkit -version 1.0.3 -o depends
	nuget install nunit.runners -version 2.6.4 -o depends
	nuget install akka.testkit.nunit -version 1.0.3 -o depends

# make release !

release:
	mkdir -p ./bin
	$(ilrepack_path)/$(ilrepack_bin) /target:exe /ndebug $(bin) \
		./$(akka_asm) ./$(json_asm) /out:./bin/$(bin) >> ./bin/release.log
