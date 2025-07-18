module alu(input logic[31:0]a,
           input logic[31:0]b,
           input logic[2:0] alucontrol,
           output logic[31:0] result,
        
           output logic     zero);

always_comb begin
    case(alucontrol)
    3'b000: result = a&b;
    3'b001: result = a|b;
    3'b010: result = a+b;
    3'b110: result = a-b;
    3'b111: result = (a<b)?32'b1:32'b0;
    3'b100: result = ~(a|b);
    default:result = 32'b0;
    endcase
end

assign zero = (result==32'b0);
endmodule
