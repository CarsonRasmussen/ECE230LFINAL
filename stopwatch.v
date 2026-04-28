//StopWatch: Modulo-60 Counter
module stopwatch(
    input en, // enable 1 = count, 0 = pause
    input clk, //clock signal
    input rst, //reset
    output [5:0] state //6-bits to represent the highest number 59
);
    
    //output of full adders
    wire [5:0] DConnect;
    
    //dff inputs
    wire [5:0] NextState;
    
    //carry wires
    wire Connect1;
    wire Connect2;
    wire Connect3;
    wire Connect4;
    wire Connect5;
    
    //detect when counter is 59
    wire CountOut;
    assign CountOut = (state[5] & state[4] & state[3] & ~state[2] & state[1] & state[0]);
    
    //if en and 59 go to 0, if not increment; else hold current state
    assign NextState = en ? (CountOut ? 'b0 : DConnect) : state;

    //dff store state of each bit within the stopwatch
    dff dff1(
        .D(NextState[0]),
        .Clock(clk),
        .Reset(rst),
        .Q(state[0])
    );
    
    dff dff2(
        .D(NextState[1]),
        .Clock(clk),
        .Reset(rst),
        .Q(state[1])
    );

    dff dff3(
        .D(NextState[2]),
        .Clock(clk),
        .Reset(rst),
        .Q(state[2])
    );

    dff dff4(
        .D(NextState[3]),
        .Clock(clk),
        .Reset(rst),
        .Q(state[3])
    );
    
    dff dff5(
        .D(NextState[4]),
        .Clock(clk),
        .Reset(rst),
        .Q(state[4])
    );

    dff dff6(
        .D(NextState[5]),
        .Clock(clk),
        .Reset(rst),
        .Q(state[5])
    );
    
    full_adder adder1(
        .A(state[0]),
        .B(1'b1),
        .Cin(1'b0),
        .Cout(Connect1),
        .Y(DConnect[0])
    );
    
    //fulladders increment state + 1
    full_adder adder2(
        .A(state[1]),
        .B(1'b0),
        .Cin(Connect1),
        .Cout(Connect2),
        .Y(DConnect[1])
    );

    full_adder adder3(
        .A(state[2]),
        .B(1'b0),
        .Cin(Connect2),
        .Cout(Connect3),
        .Y(DConnect[2])
    );

    full_adder adder4(
        .A(state[3]),
        .B(1'b0),
        .Cin(Connect3),
        .Cout(Connect4),
        .Y(DConnect[3])
    );

    full_adder adder5(
        .A(state[4]),
        .B(1'b0),
        .Cin(Connect4),
        .Cout(Connect5),
        .Y(DConnect[4])
    );

     full_adder adder6(
        .A(state[5]),
        .B(1'b0),
        .Cin(Connect5),
        .Cout(),
        .Y(DConnect[5])
    );
   
endmodule




