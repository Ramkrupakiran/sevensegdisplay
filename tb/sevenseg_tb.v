module seven_segment_display_tb;
  reg [3:0] bcd_in;
  wire [6:0] seg_out;

  seven_segment_display uut (
    .bcd_in(bcd_in),
    .seg_out(seg_out)
  );

  integer i;

  initial begin
    $dumpfile("seven_segment.vcd");
    $dumpvars(0, seven_segment_display_tb);
    $display("--------7segment display--------");
    $display("%Time\tBCD\tgfedcba");
    for (i = 0; i < 12; i = i + 1) begin
      bcd_in = i[3:0];
      #10;
      $display("%0t\t%d\t%b", $time, bcd_in, seg_out);
    end
    $finish;
  end
endmodule
