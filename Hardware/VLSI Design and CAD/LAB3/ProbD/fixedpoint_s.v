module fixedpoint_s(int_in,result);

input signed [7:0] int_in;
output reg signed [7:0] result;

 // ---------------------- Write down Your design below  ---------------------- //
wire signed [7:0] multi;
wire signed [14:0] temp ;
reg [7:0] temp_2;
assign multi = 8'b10101001;
assign temp = multi*int_in;

always@(*) begin
    if (int_in[7] == 1'b0) begin //input positive 
        if(temp[5] == 1'b1) begin
            if(temp[0] == 1'b1 | temp[1] == 1'b1 | temp[2] == 1'b1 | temp[3] == 1'b1 | temp[4] == 1'b1 ) begin // rounding
                temp_2 = temp[13:6] + 8'b1;
            end
            else begin
                temp_2 = temp[13:6];
            end
        end
        else begin
            temp_2 = temp[13:6];
        end

        if(temp_2[7] == 1'b0) begin
            result = 8'b10000000;
        end
        else begin
            result = temp_2;
        end
    end

    else if (int_in[7] == 1'b1) begin //input negative
        if (temp[5] == 1'b1) begin
            temp_2 = temp[13:6] + 8'b1;
        end
        else begin
            temp_2 = temp[13:6];
        end

        if (temp_2[7] == 1'b1) begin
            result = 8'b01111111;
        end
        else begin
            result = temp_2;
        end
    end
end

endmodule
