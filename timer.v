//Timer: Mod-60 downcounter with synchronous load
module timer(
    input clk,
    input rst,
    input en,               //Enables or Disables clock
    input load,             //If load=1, load the counter with "load_value"
    input [5:0] load_value, //Value to load into counter register. Counter will then start counting from this value
    output [5:0] state     //6-bits to represent the highest number 59
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= 6'd0;  // makes the state = 0 in other words resets the timmer
    end
    else if (load) begin
        state <= load_value; // strores/sets the state to the load_value
    end
    else if (en) begin                 // if enabled the counter de-increments by 1 and stops when it hits 0.
        if (state != 6'd0)
            state <= state - 1; 
        else
            state <= 6'd0; // stay at 0
    end
    else begin
        state <= state; // hold when en is 0 and load is 0 it doesnt change. bascially pauses the timer.
    end
end



endmodule
