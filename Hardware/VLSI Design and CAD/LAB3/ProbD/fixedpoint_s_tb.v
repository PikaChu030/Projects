/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Editor : JulianaLu ----------------------//
// ---------------------- Date : 2022.02    ---------------------- //
// ----------------------      test_tb      ---------------------- //
/////////////////////////////////////////////////////////////////////
`timescale 1ns/10ps

`ifdef syn
`include "/usr/cad/CBDK/SAED14_EDK_rvt/verilog/saed14nm_rvt.v"
`include "fixedpoint_s_syn.v"
`else
`include "fixedpoint_s.v"
`endif

module fixedpoint_tb;
  reg signed [7:0] int_in;
  wire signed [7:0] result;
  integer error;

  fixedpoint_s f0(.int_in(int_in), .result(result));

initial begin
  error=0;
  #5
  $display("-----------------------------------------------------------------------\n");
  if(result==8'b11010100)  $display("time", $time, "  output is correct\n");
  else begin
    $display("time", $time, "  output is Wrong .Your answer is %d , but Correct answer is -44. \n",result);
    error = error +1;
  end
  #10
  if(result==8'b10000000)  $display("time", $time, "  output is correct\n");
  else begin
    $display("time", $time, "  output is Wrong .Your answer is %d , but Correct answer is -128. \n",result);
    error = error +1;
  end
  #10
  if(result==8'b01111111)  $display("time", $time, "  output is correct\n");
  else begin
    $display("time", $time, "  output is Wrong .Your answer is %d , but Correct answer is 127. \n",result);
    error = error +1;
  end
  #10
  if(result==8'b01010010)  $display("time", $time, "  output is correct\n");
  else begin
    $display("time", $time, "  output is Wrong .Your answer is %d , but Correct answer is 82. \n",result);
    error = error +1;
  end
  #10
  if(result==8'b10111101)  $display("time", $time, "  output is correct\n");
  else begin
    $display("time", $time, "  output is Wrong .Your answer is %d , but Correct answer is -67. \n",result);
    error = error +1;
  end
  #10
  if(result==8'b00111111)  $display("time", $time, "  output is correct\n");
  else begin
    $display("time", $time, "  output is Wrong .Your answer is %d , but Correct answer is 63. \n",result);
    error = error +1;
  end
  #10
  $display("-----------------------------------------------------------------------\n");

  if(error==0)begin
        $display("    \\|/     ***********************************************     \\|/   ");
        $display("  |^^^^^^|  **                                           **  |^^^^^^| ");
        $display("  |  o o |  **                                           **  | o o  | ");
        $display("  |_ _v__|  **             Congratulations !!            **  |__v___| ");
        $display("   \\/||\\/   **               Test PASS  !!               **   \\/||\\/  ");
        $display("     ||     **                                           **     ||    ");
        $display("    /  \\    **                                           **    /  \\   ");
        $display("            ***********************************************           ");
  end
  else begin
        $display("    \\|/     ***********************************************     \\|/   ");
        $display("  |^^^^^^|  **                                           **  |^^^^^^| ");
        $display("  |  > < |  **                                           **  | > <  | ");
        $display("  |_ _^__|  **                  Oh no !!                 **  |__^___| ");
        $display("   \\/||\\/   **         There are some errors !!          **   \\/||\\/  ");
        $display("     ||     **                                           **     ||    ");
        $display("    /  \\    **                                           **    /  \\   ");
        $display("            ***********************************************           ");
  end
  $display("-----------------------------------------------------------------------\n");
end

initial begin
        int_in=8'd32;   // Declare Input patterns
  #10   int_in=8'd120;
  #10   int_in=8'd136;
  #10   int_in=8'd196;
  #10   int_in=8'd49;
  #10   int_in=8'd210;
  #20   $finish ;       // Stop simulate
end

initial begin           // Generate the waveform file
`ifdef FSDB
  $fsdbDumpfile("fixedpoint_s.fsdb") ;
  $fsdbDumpvars;
`endif
end

`ifdef syn
  initial $sdf_annotate("fixedpoint_s_syn.sdf", f0);
`endif

endmodule
