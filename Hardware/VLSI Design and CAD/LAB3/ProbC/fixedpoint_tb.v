/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Editor : JulianaLu ----------------------//
// ---------------------- Date : 2022.02    ---------------------- //
// ----------------------      test_tb      ---------------------- //
/////////////////////////////////////////////////////////////////////
`timescale 1ns/10ps

`ifdef syn
`include "/usr/cad/CBDK/SAED14_EDK_rvt/verilog/saed14nm_rvt.v"
`include "fixedpoint_syn.v"
`else
`include "fixedpoint.v"
`endif

module fixedpoint_tb;
  reg [7:0] int_in;
  wire [7:0] result;
  integer error;

  fixedpoint f0(.int_in(int_in), .result(result));

initial $monitor($time, " int_in=%d , result=%d ", int_in, result);
initial begin
  error=0;
  #5
  $display("-----------------------------------------------------------------------\n");
  if(result==8'b00010110)  $display("time", $time, "  output is correct\n");
  else begin
    $display("time", $time, "  output is Wrong .Your answer is %d , but Correct answer is 22. \n",result);
    error = error +1;
  end
  #10
  if(result==8'b00100110)  $display("time", $time, "  output is correct\n");
  else begin
    $display("time", $time, "  output is Wrong .Your answer is %d , but Correct answer is 38. \n",result);
    error = error +1;
  end
  #10
  if(result==8'b00000111)  $display("time", $time, "  output is correct\n");
  else begin
    $display("time", $time, "  output is Wrong .Your answer is %d , but Correct answer is 7. \n",result);
    error = error +1;
  end
  #10
  if(result==8'b00000110)  $display("time", $time, "  output is correct\n");
  else begin
    $display("time", $time, "  output is Wrong .Your answer is %d , but Correct answer is 6. \n",result);
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
  #10   int_in=8'd55;
  #10   int_in=8'd10;
  #10   int_in=8'd9;
  #20   $finish ;       // Stop simulate
end

initial begin           // Generate the waveform file
`ifdef FSDB
  $fsdbDumpfile("fixedpoint.fsdb") ;
  $fsdbDumpvars;
`endif
end

`ifdef syn
  initial $sdf_annotate("fixedpoint_syn.sdf", f0);
`endif

endmodule
