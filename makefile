
# make me !
# depends: nuget install akka

csc=mcs
bin=./malice

# configure akka depend
akka_asm='Akka.1.0.3/lib/net45/Akka.dll'

refs=\
	/r:$(akka_asm)\

classes=\
	malice.cs\

all: $(bin)

$(bin): $(classes)
	$(csc) $(refs) $(classes) /out:$(bin) /t:exe
	@echo cp -rf $(akka_asm) ./Akka.dll
	@\cp -rf $(akka_asm) ./Akka.dll
