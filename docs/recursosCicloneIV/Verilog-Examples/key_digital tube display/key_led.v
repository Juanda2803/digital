
module key_led(clk_50M,key,duan_ma,wei_ma);

input clk_50M;         //????50M?? ?17????
input [3:0] key;       //key1 key2 key3 key4????????
output [3:0] wei_ma;   //??????
output [7:0] duan_ma;  //??????ABCDEFGH

wire [3:0] key;
reg [7:0] duan_ma;
reg [3:0] wei_ma;
reg [3:0] key_temp;    //????????

always @ (posedge clk_50M )
begin
key_temp<=key;                   //??????????
case ( key_temp )
4'b1110:duan_ma<=8'b1111_1001;    //??//KEY1?????1
4'b1101:duan_ma<=8'b1010_0100;    //??//KEY2?????2
4'b1011:duan_ma<=8'b1011_0000;    //??//KEY3?????3
4'b0111:duan_ma<=8'b1001_1001;    //??//KEY4?????4
endcase
end


always @ ( posedge clk_50M )
begin
case( key_temp )           //????
4'b0111:wei_ma<=4'b0111;   //??KEY4?4??????
4'b1011:wei_ma<=4'b1011;   //??KEY3?3??????
4'b1101:wei_ma<=4'b1101;   //??KEY2?2??????
4'b1110:wei_ma<=4'b1110;   //??KEY1?1??????
endcase
end
endmodule


