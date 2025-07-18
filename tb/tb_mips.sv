module testbench();

    logic clk;
    logic reset;
    logic [31:0] writedata, dataadr;
    logic        memwrite;

    // Instantiate the DUT
    top dut(clk, reset, writedata, dataadr, memwrite);

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset logic
    initial begin
        reset = 1;
        #22;
        reset = 0;
    end

    // Dump waveform
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench);
    end

    // Result checking
    always @(negedge clk) begin
        if (memwrite) begin
            $display("[%0t] MEMWRITE addr: %0d data: %0d", $time, dataadr, writedata);
            if (dataadr === 84 && writedata === 7) begin
                $display("Simulation succeeded ");
                $finish;
            end
            else if (dataadr !== 80) begin
                $display("Simulation failed ");
                $finish;
            end
        end
    end

endmodule
