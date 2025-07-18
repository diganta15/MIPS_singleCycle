# Paths
SRC_DIR = src
MEM_DIR = mem
TB_DIR  = tb
OUT     = build
DUMP    = dump.vcd

# Files
SRCS = $(wildcard $(SRC_DIR)/*.sv) $(wildcard $(MEM_DIR)/*.sv)
TB   = $(TB_DIR)/tb_mips.sv

# Output binary
BIN = $(OUT)/sim.out

# Default target
all: run

# Create build directory if not exists
$(OUT):
	mkdir -p $(OUT)

# Compile
$(BIN): $(SRCS) $(TB) | $(OUT)
	iverilog -g2012 -o $(BIN) $(SRCS) $(TB)

# Run simulation
run: $(BIN)
	vvp $(BIN)

# Clean build artifacts
clean:
	rm -rf $(OUT) $(DUMP)

.PHONY: all run clean
