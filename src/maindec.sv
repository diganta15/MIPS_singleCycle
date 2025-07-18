module maindec(input logic[5:0]op,
               output logic memtoreg,memwrite,
               output logic branch,alusrc,
               output logic regdst,regwrite,
               output logic jump,
               output logic[1:0] aluop);

logic[8:0] controls;

assign {regwrite,regdst,alusrc,branch,memwrite,memtoreg,jump,aluop} = controls;

always_comb begin
    case(op)
    6'b000000:controls=9'b110000010;
    6'b100011:controls=9'b101001000;
    6'b101011:controls=9'b001010000;
    6'b000100:controls=9'b000100001;
    6'b001000:controls=9'b101000000;
    6'b000010:controls=9'b000000100;
    default:  controls=9'bxxxxxxxxx;
    endcase
end

endmodule