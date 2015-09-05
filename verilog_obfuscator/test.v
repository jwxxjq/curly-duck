`timescale 1ns/10ps
module u_jp2k_3(
                arrange_out0,
				arrange_out1,
				arrange_out2,
				arrange_out3,
				arrange_out4,
				arrange_out5,
				arrange_out6,
				arrange_out7,
				arrange_out8,
				arrange_out9,
				vld_num,
				flush,
				flush_mq2,
				pass_judge_1,
				pass_judge_2,
				pass_judge_3,
				pass_judge_4,
				bit1_add_vld,
				bit2_add_vld,
				bit3_add_vld,
				bit4_add_vld,
				stop_d,
                pass_error_start,
				pass_judge_1_d,
				pass_judge_2_d,
				pass_judge_3_d,
				pass_judge_4_d,
				clear0,
				halt,
				code_over_flag,
				bpc_start_flag,
				last_stripe_vld,
				stripe_over_flag,
				level_flag,
				stop_flag,
				band,
				stall_vld,
				data1_state,
				data2_state,
				data3_state,
				data4_state,
				clk_bpc,  
				clk_dwt,
				rst,
				rst_syn);
	
output [7:0] arrange_out0;
output [7:0] arrange_out1;
output [7:0] arrange_out2;
output [7:0] arrange_out3;
output [7:0] arrange_out4;
output [7:0] arrange_out5;
output [7:0] arrange_out6;
output [7:0] arrange_out7;
output [7:0] arrange_out8;
output [7:0] arrange_out9;
output [3:0] vld_num;
output flush;
output flush_mq2;
output[2:0] pass_judge_1;
output[2:0] pass_judge_2;
output[2:0] pass_judge_3;
output[2:0] pass_judge_4;
output stop_d;
output bit1_add_vld;
output bit2_add_vld;
output bit3_add_vld;
output bit4_add_vld;

output pass_error_start;					
output[2:0] pass_judge_1_d;
output[2:0] pass_judge_2_d;
output[2:0] pass_judge_3_d;
output[2:0] pass_judge_4_d;
output clear0;


input stall_vld;
input [1:0] band;
input [3:0] data1_state;
input [3:0] data2_state;
input [3:0] data3_state;
input [3:0] data4_state;
input clk_bpc;
input clk_dwt;
input rst;
input rst_syn;
input code_over_flag;
input bpc_start_flag;
input last_stripe_vld;
input stripe_over_flag;
input [2:0]level_flag;
input stop_flag;
input halt;

reg r1;
always@(posedge clk_dwt or negedge rst)
	begin
		if(!rst)
			r1<=0;
		else if(rst_syn)
			r1<=0;
		else 	
			r1<=clk_bpc;
	end
wire w1=((r1==1'b0)&&(clk_bpc==1'b1))?1'b1:1'b0;
reg[1:0] r2;
reg[1:0] r2_n;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		r2 <= 2'b0;
	end
	else if(rst_syn)begin
		r2 <= 2'b0;
	end
	else if(w1==1'b1)begin
		r2 <= r2_n;
	end
 end 

reg [5:0] r3;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		r3 <= 6'b0;
	end
	else if(rst_syn)begin
		r3 <= 6'b0;
	end	
	else if(w1==1'b1)begin
		if((r2!=2'b00)&&(stall_vld==1'b0)) begin
			r3 <= r3 + 1'b1;
		end
	end
end  
  
reg [3:0] r4;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		r4 <= 4'b0;
	end
	else if(rst_syn)begin
		r4 <= 4'b0;
	end
	else if(w1==1'b1)begin
		if(r2 == 2'b01) begin
			r4 <= r4 + 1;
		end
		else begin
			r4 <= 4'b0;
		end
	end
end  
always@(*) begin
  r2_n = r2;
  case(r2)
    2'b00: begin
      if(bpc_start_flag == 1'b1) begin
        r2_n = 2'b01; 
      end
    end 
    2'b01: begin
      if(r4 == 4'b1110) begin
        r2_n = 2'b10;    
      end
    end
    2'b10: begin
      if(code_over_flag == 1'b1) begin
        r2_n = 2'b00;
      end
    end
    default: begin
      r2_n = r2;
    end
  endcase
end

wire w2;
assign w2 = (r2 == 2'b10);
	 
reg [2:0] r6;
reg [2:0] r5;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		r6 <= 3'b0;
		r5 <= 3'b0;
	end
	else if(rst_syn)begin
		r6 <= 3'b0;
		r5 <= 3'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
			r6 <= level_flag;
			r5 <= r6;
		end
	end
end
reg r7;
reg r71;
reg r7_reg;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		r7 <= 1'b0;
		r71 <= 1'b0;
		r7_reg <= 1'b0;
	end
	else if(rst_syn)begin
		r7 <= 1'b0;
		r71 <= 1'b0;
		r7_reg <= 1'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
			r7 <= last_stripe_vld;     
			r7_reg <= r7;
			r71 <= r7_reg;
		end
	end
end
reg r8;
reg r9;
reg r11;
reg r10;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		r8<=1'b0;
		r11 <= 1'b0;
		r10 <= 1'b0;
		r9 <= 1'b0;
	end
	else if(rst_syn)begin
		r8<=1'b0;
		r11 <= 1'b0;
		r10 <= 1'b0;
		r9 <= 1'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
			r8<=stripe_over_flag;
			r11 <= r8;
			r10 <= r11;
			r9 <= r10;
		end
	end
end
wire w3;
assign w3=((r10==1'b1)&&(r11==1'b0));
wire w4;
assign w4=((r9==1'b1)&&(r10==1'b0));


	reg [5:0] win_a2;
	reg [5:0] win_a3;
	reg [5:0] win_a4;
	reg [5:0] win_a5;
	
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    win_a2 <= 6'b0;
		win_a3 <= 6'b0;
		win_a4 <= 6'b0;
		win_a5 <= 6'b0;
	end
	else if(rst_syn)begin
		win_a2 <= 6'b0;
	    win_a3 <= 6'b0;
	    win_a4 <= 6'b0;
	    win_a5 <= 6'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
		    win_a2 <= {data1_state,1'b0,1'b0};  
			win_a3 <= {data2_state,1'b0,1'b0};
			win_a4 <= {data3_state,1'b0,1'b0};
			win_a5 <= {data4_state,1'b0,1'b0};
		end
	end
end	
	reg [5:0] win_b2;            
	reg [5:0] win_b3;
	reg [5:0] win_b4;
	reg [5:0] win_b5;
	
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    win_b2 <= 6'b0;
		win_b3 <= 6'b0;
		win_b4 <= 6'b0;
		win_b5 <= 6'b0;
	end
	else if(rst_syn)begin
		win_b2 <= 6'b0;
	    win_b3 <= 6'b0;
	    win_b4 <= 6'b0;
	    win_b5 <= 6'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
		    win_b2 <= win_a2;
			win_b3 <= win_a3;
			win_b4 <= win_a4;
			win_b5 <= win_a5;
		end
	end
end	
	reg [5:0] win_c2;       
	reg [5:0] win_c3;
	reg [5:0] win_c4;
	reg [5:0] win_c5;
	
	reg [5:0] win_c2_n;
	reg [5:0] win_c3_n;
	reg [5:0] win_c4_n;
	reg [5:0] win_c5_n;
	
	reg [64:0] ls;
	
	reg win_a1;
	reg win_b1;
	reg win_c1;
	
	always@(*) begin
	    case(r5) 
		    3'b000: begin
			    win_a1 = ls[62];
				win_b1 = ls[63];
				win_c1 = ls[64];
			end
			3'b001: begin
			    win_a1 = ls[30];
				win_b1 = ls[31];
				win_c1 = ls[32];
			end
			3'b010: begin
			    win_a1 = ls[14];
				win_b1 = ls[15];
				win_c1 = ls[16];
			end
			3'b011: begin
			    win_a1 = ls[6];
				win_b1 = ls[7];
				win_c1 = ls[8];
			end
			3'b100: begin
			    win_a1 = ls[2];
				win_b1 = ls[3];
				win_c1 = ls[4];
			end
			default: begin
			  win_a1 = 0;
			  win_b1 = 0;
			  win_c1 = 0;
			end
		endcase
	end
	
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    ls <= 65'b0;
	end
	else if(rst_syn)begin
		ls <= 65'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b1) begin
		    ls <= ls;
		end
		else if(r71 == 1'b1) begin
		    ls <= {ls[63:0],1'b0};
		end
		else begin
		    ls <= {ls[63:0],win_c5_n[1]};   
		end
	end
end	
	
	reg r12;
    reg r13;
	
	
	reg r14;   
	reg r15;
	reg r16;
	reg r17;
	always@(*) begin
	    if((w3 == 1'b1)||((r12==1'b1)&&(r13==1'b0))) begin    
		    r14 = (win_b2[2] == 1'b0)? (win_b1||win_c1||win_c2[1]||win_c3[1]||win_b3[2]):1'b0;
		end
		else if(w4 == 1'b1) begin                                  
		    r14 = (win_b2[2] == 1'b0)? (win_a1||win_b1||win_a2[2]||win_a3[2]||win_b3[2]):1'b0;
		end
		else begin  
		    r14 = (win_b2[2] == 1'b0)? (win_a1||win_b1||win_c1||win_a2[2]||win_a3[2]||win_b3[2]||win_c2[1]||win_c3[1]||win_b3[2]):1'b0;
		end
	end
	
	always@(*) begin
	    if((w3 == 1'b1)||((r12==1'b1)&&(r13==1'b0))) begin
		    r15 = (win_b3[2] == 1'b0)? ((win_b2[2]^(r14&&win_b2[4]))||win_c2[1]||win_c3[1]||win_c4[1]||win_b4[2]):1'b0;    
		end
		else if(w4 == 1'b1) begin
		    r15 = (win_b3[2] == 1'b0)? ((win_b2[2]^(r14&&win_b2[4]))||win_a2[2]||win_a3[2]||win_a4[2]||win_b4[2]):1'b0;
		end
		else begin
		    r15 = (win_b3[2] == 1'b0)? (win_a2[2]||win_a3[2]||win_a4[2]||(win_b2[2]^(r14&&win_b2[4]))||win_b4[2]||win_c2[1]||win_c3[1]||win_c4[1]):1'b0;
		end                                                   
	end
	
	always@(*) begin
	    if((w3 == 1'b1)||((r12==1'b1)&&(r13==1'b0))) begin
		    r16 = (win_b4[2] == 1'b0)? ((win_b3[2]^(r15&&win_b3[4]))||win_c3[1]||win_c4[1]||win_c5[1]||win_b5[2]):1'b0;
		end
		else if(w4 == 1'b1) begin
		    r16 = (win_b4[2] == 1'b0)? ((win_b3[2]^(r15&&win_b3[4]))||win_a3[2]||win_a4[2]||win_a5[2]||win_b5[2]):1'b0;
		end
		else begin
		    r16 = (win_b4[2] == 1'b0)? (win_a3[2]||win_a4[2]||win_a5[2]||(win_b3[2]^(r15&&win_b3[4]))||win_b5[2]||win_c3[1]||win_c4[1]||win_c5[1]):1'b0;
		end
	end
	
	always@(*) begin
	    if((w3 == 1'b1)||((r12==1'b1)&&(r13==1'b0)))begin
		    r17 = (win_b5[2] == 1'b0)? ((win_b4[2]^(r16&&win_b4[4]))||win_c4[1]||win_c5[1]):1'b0;
		end
		else if(w4 == 1'b1) begin
		    r17 = (win_b5[2] == 1'b0)? ((win_b4[2]^(r16&&win_b4[4]))||win_a4[2]||win_a5[2]):1'b0;
		end
		else begin
		    r17 = (win_b5[2] == 1'b0)? (win_a4[2]||win_a5[2]||(win_b4[2]^(r16&&win_b4[4]))||win_c4[1]||win_c5[1]):1'b0;
		end
	end
	
	always@(*) begin
	    win_c2_n = {win_b2[5:2],(win_b2[2]^(r14&&win_b2[4])),win_b2[0]};
		win_c3_n = {win_b3[5:2],(win_b3[2]^(r15&&win_b3[4])),win_b3[0]};
		win_c4_n = {win_b4[5:2],(win_b4[2]^(r16&&win_b4[4])),win_b4[0]};
		win_c5_n = {win_b5[5:2],(win_b5[2]^(r17&&win_b5[4])),win_b5[0]};
	end

always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    win_c2 <= 6'b0;
		win_c3 <= 6'b0;
		win_c4 <= 6'b0;
		win_c5 <= 6'b0;
	end
	else if(rst_syn)begin
		win_c2 <= 6'b0;
	    win_c3 <= 6'b0;
	    win_c4 <= 6'b0;
	    win_c5 <= 6'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
		    win_c2 <= win_c2_n;
			win_c3 <= win_c3_n;
			win_c4 <= win_c4_n;
			win_c5 <= win_c5_n;
		end
	end
end
	
		
	reg [2:0] r62;
	reg [2:0] r63;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    r62 <= 3'b0;
		r63 <= 3'b0;
	end
	else if(rst_syn)begin
	    r62 <= 3'b0;	
		r63 <= 3'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
		    r62 <= r5;
			r63 <= r62;
		end
	end
end	
	reg r9_reg;
	reg r112;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    r112 <= 1'b0;
	    r9_reg <= 1'b0;
	end
	else if(rst_syn)begin
		r112 <= 1'b0;
	    r9_reg <= 1'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
		    r112 <= r9;
		    r9_reg <= r112;
		end
	end
end	
	wire w31;
	assign w31=((r112==1'b1)&&(r9_reg==1'b0));
	
	wire w41;
	assign w41=((r9_reg==1'b1)&&(r112==1'b0));
	
	reg r72;
	reg r73;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    r72 <= 1'b0;
		r73 <= 1'b0;
	end
	else if(rst_syn)begin
		r72 <= 1'b0;
	    r73 <= 1'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
		    r72 <= r71;
			r73 <= r72;
		end
	end
end	
	reg [5:0] win_d2;
	reg [5:0] win_d3;
	reg [5:0] win_d4;
	reg [5:0] win_d5;
	
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    win_d2 <= 6'b0;
		win_d3 <= 6'b0;
		win_d4 <= 6'b0;
		win_d5 <= 6'b0;
	end
	else if(rst_syn)begin
		win_d2 <= 6'b0;
	    win_d3 <= 6'b0;
	    win_d4 <= 6'b0;
	    win_d5 <= 6'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
		    win_d2 <= win_c2;
			win_d3 <= win_c3;
			win_d4 <= win_c4;
			win_d5 <= win_c5;
		end
	end
end	
	reg [5:0] win_e2;
	reg [5:0] win_e3;
	reg [5:0] win_e4;
	reg [5:0] win_e5;
	
	reg [5:0] win_e2_n;
	reg [5:0] win_e3_n;
	reg [5:0] win_e4_n;
	reg [5:0] win_e5_n;
	
	reg [64:0] lp;
	
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    lp <= 65'b0;
	end
	else if(rst_syn)begin
		lp <= 65'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b1) begin
		    lp <= lp;
		end
		else if(r73 == 1'b1) begin
		    lp <= {lp[63:0],1'b0};
		end
		else begin
		    lp <= {lp[63:0],(win_d5[1]||win_d5[4])};        
		end
	end
end	
	reg r18;
	reg win_d1;
	reg win_e1;
	
	always@(*) begin
	    case(r63)
		    3'b000: begin
			    r18 = lp[62];           
			    win_d1 = lp[63];
				win_e1 = lp[64];
			end
			3'b001: begin
			    r18 = lp[30];
			    win_d1 = lp[31];
				win_e1 = lp[32];
			end
			3'b010: begin
			    r18 = lp[14];
			    win_d1 = lp[15];
				win_e1 = lp[16];
			end
            3'b011: begin
			    r18 = lp[6];
			    win_d1 = lp[7];
				win_e1 = lp[8];
			end	
			3'b100: begin
			    r18 = lp[2];
			    win_d1 = lp[3];
				win_e1 = lp[4];
			end	
			default: begin
			    r18 = 1'b0;  
			    win_d1 = 1'b0;
				win_e1 = 1'b0;
			end
		endcase
	end
	
	always@(*) begin
	    win_e2_n = {win_d2[5:1],(win_d2[1]||win_d2[4])};  
		win_e3_n = {win_d3[5:1],(win_d3[1]||win_d3[4])};
		win_e4_n = {win_d4[5:1],(win_d4[1]||win_d4[4])};
		win_e5_n = {win_d5[5:1],(win_d5[1]||win_d5[4])};
	end
	
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    win_e2 <= 6'b0;
		win_e3 <= 6'b0;
		win_e4 <= 6'b0;
		win_e5 <= 6'b0;
	end
	else if(rst_syn)begin
		win_e2 <= 6'b0;
		win_e3 <= 6'b0;
	    win_e4 <= 6'b0;
	    win_e5 <= 6'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
		    win_e2 <= win_e2_n;
			win_e3 <= win_e3_n;
			win_e4 <= win_e4_n;
			win_e5 <= win_e5_n;
		end
	end
end
	wire bit1_add_vld;
	wire bit2_add_vld;
	wire bit3_add_vld;
	wire bit4_add_vld;
	
	assign bit1_add_vld= win_e2[4];
	assign bit2_add_vld= win_e3[4];
	assign bit3_add_vld= win_e4[4];
	assign bit4_add_vld= win_e5[4];
	
	
	reg r19;
	reg r20;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    r19 <= 1'b0;
		r20 <= 1'b0;
	end
	else if(rst_syn)begin
		r19 <= 1'b0;
	    r20 <= 1'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
		    r19 <= win_a1;
			r20 <= r19;  
		end
	end
end	
	reg r21;
	reg r22;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    r21 <= 1'b0;
		r22 <= 1'b0;
	end
	else if(rst_syn)begin
		r21 <= 1'b0;
	    r22 <= 1'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
		    r21 <= win_b1;
			r22 <= r21;    
		end
	end
end	
	reg r23;
	reg r24;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    r23 <= 1'b0;
		r24 <= 1'b0;
	end
	else if(rst_syn)begin
		r23 <= 1'b0;
	    r24 <= 1'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
		    r23 <= win_c1;
			r24 <= r23;   
		end
	end
end	

reg r25;
reg r26;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		r25 <= 1'b0;
		r26 <= 1'b0;
	end
	else if(rst_syn)begin
		r25 <= 1'b0;
		r26 <= 1'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
			r25 <= r14;
			r26 <= r25;  
		end
	end
end
reg r27;
reg r28;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		r27 <= 1'b0;
		r28 <= 1'b0;
	end
	else if(rst_syn)begin
		r27 <= 1'b0;
		r28 <= 1'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
			r27 <= r15;
			r28 <= r27;
		end
	end
end
reg r29;
reg r30;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		r29 <= 1'b0;
		r30 <= 1'b0;
	end
	else if(rst_syn)begin
		r29 <= 1'b0;
		r30 <= 1'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
			r29 <= r16;
			r30 <= r29;
		end
	end
end
reg r31;
reg r32;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		r31 <= 1'b0;
		r32 <= 1'b0;
	end
	else if(rst_syn)begin
		r31 <= 1'b0;
		r32 <= 1'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
			r31 <= r17;
			r32 <= r31;
		end
	end
end
reg [63:0] r33;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		r33 <= 64'b0;
	end
	else if(rst_syn)begin
		r33 <= 64'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b1) begin
			r33 <= r33;
		end
		else if(r73 == 1'b1) begin
			r33 <= {r33[62:0],1'b0};
		end
		else begin
			r33 <= {r33[62:0],win_d5[5]}; 
		end
	end
end
reg r34;

always@(*) begin
    case(r63)
	    3'b000: begin
			r34 = r33[63];
		end
		3'b001: begin
			r34 = r33[31];
		end
		3'b010: begin
			r34 = r33[15];
		end
		3'b011: begin
			r34 = r33[7];
		end
		3'b100: begin
			r34 = r33[3];
		end
		default: begin
			r34 = 0;
		end
	endcase
end

wire [5:0] w6;
wire [5:0] w5;
wire [5:0] w7;
wire [5:0] w8;

wire [5:0] w9;
wire [5:0] w10;
wire [5:0] w11;
wire [5:0] w12;

wire [5:0] w13;
wire [5:0] w14;
wire [5:0] w15;
wire [5:0] w16;

wire [5:0] w17;
wire [5:0] w18;
wire [5:0] u1_cxd;
wire w19;
wire u01_vld;

reg r35;
reg r36;
reg r37;
reg r38;

reg r39;
reg r40;
reg r41;
reg r42;

reg r43;
reg r44;
reg r45;
reg r46;

wire w20;
wire w21;
wire w22;
wire w23;

assign w20 = ((win_d2[4]==1'b1)&&(win_d2[2]==1'b0));
assign w21 = ((win_d3[4]==1'b1)&&(win_d3[2]==1'b0));
assign w22 = ((win_d4[4]==1'b1)&&(win_d4[2]==1'b0));
assign w23 = ((win_d5[4]==1'b1)&&(win_d5[2]==1'b0));

always@(*) begin 
    if((r26 == 1'b1)||((w19 == 1'b0)&&(r35 == 1'b1))) begin   
	    r43 = 1'b1;          
	end
	else begin
	    r43 = 1'b0;
	end
end

always@(*) begin
    if((r28 == 1'b1)||((w19 == 1'b0)&&(r36 == 1'b1))||((w19 == 1'b1)&&(win_d2[4]==1'b1))) begin
	    r44 = 1'b1;
	end
	else begin
	    r44 = 1'b0;
	end
end

always@(*) begin
    if((r30 == 1'b1)||((w19 == 1'b0)&&(r37 == 1'b1))||((w19 == 1'b1)&&((win_d2[4]==1'b1)||(win_d3[4]==1'b1)))) begin
	    r45 = 1'b1;
	end
	else begin
	    r45 = 1'b0;
	end
end

always@(*) begin
    if((r32 == 1'b1)||((w19 == 1'b0)&&(r38 == 1'b1))||((w19 == 1'b1)&&((win_d2[4]==1'b1)||(win_d3[4]==1'b1)||(win_d4[4]==1'b1)))) begin
	    r46 = 1'b1;
	end
	else begin
	    r46 = 1'b0;
	end
end

always@(*) begin
    if(win_d2[2] == 1'b1) begin    
	    r39 = 1'b1;
	end
	else begin
	    r39 = 1'b0;
	end
end

always@(*) begin
    if(win_d3[2] == 1'b1) begin
	    r40 = 1'b1;
	end
	else begin
	    r40 = 1'b0;
	end
end

always@(*) begin
    if(win_d4[2] == 1'b1) begin
	    r41 = 1'b1;
	end
	else begin
	    r41 = 1'b0;
	end
end

always@(*) begin
    if(win_d5[2] == 1'b1) begin
	    r42 = 1'b1;
	end
	else begin
	    r42 = 1'b0;
	end
end

always@(*) begin
    if((r26 == 1'b0)&&(r39 == 1'b0)) begin    
	    r35 = 1'b1;
	end
	else begin
	    r35 = 1'b0;
	end
end

always@(*) begin
    if((r28 == 1'b0)&&(r40 == 1'b0)) begin
	    r36 = 1'b1;
	end
	else begin
	    r36 = 1'b0;
	end
end

always@(*) begin
    if((r30 == 1'b0)&&(r41 == 1'b0)) begin
	    r37 = 1'b1;
	end
	else begin
	    r37 = 1'b0;
	end
end

always@(*) begin
    if((r32 == 1'b0)&&(r42 == 1'b0)) begin
	    r38 = 1'b1;
	end
	else begin
	    r38 = 1'b0;
	end
end

wire[2:0] pass_judge_1_d;
wire[2:0] pass_judge_2_d;
wire[2:0] pass_judge_3_d;
wire[2:0] pass_judge_4_d;

assign pass_judge_1_d = {r35,r39,r26};  
assign pass_judge_2_d = {r36,r40,r28};
assign pass_judge_3_d = {r37,r41,r30};
assign pass_judge_4_d = {r38,r42,r32};

reg[2:0] pass_judge_1;
reg[2:0] pass_judge_2;
reg[2:0] pass_judge_3;
reg[2:0] pass_judge_4;

always @(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		pass_judge_1 <= 3'b0;
		pass_judge_2 <= 3'b0;
		pass_judge_3 <= 3'b0;
		pass_judge_4 <= 3'b0;
	end
	else if(rst_syn)begin
		pass_judge_1 <= 3'b0;
		pass_judge_2 <= 3'b0;
		pass_judge_3 <= 3'b0;
		pass_judge_4 <= 3'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0) begin
			pass_judge_1 <= pass_judge_1_d;
			pass_judge_2 <= pass_judge_2_d;
			pass_judge_3 <= pass_judge_3_d;
			pass_judge_4 <= pass_judge_4_d;
		end
	end
end
reg r47;
reg r48;
reg r49;
reg r50;
reg r51;
reg r52;
reg r53;
reg r54;
reg r55;
reg r56;
reg r57;
reg r58;
reg r59;
reg r60;

always@(*) begin
    if(w41 == 1'b1) begin
	    r47 = win_d1;
		r48 = 1'b0;
		r49 = r18;
		r50 = 1'b0;
		r51 = 1'b0;
		r52 = 1'b0;
		r53 = win_c2[1];
		r54 = win_c3[1];
		r55 = win_c4[1];
		r56 = win_c5[1];
		r57 = 1'b0;
		r58 = 1'b0;
		r59 = 1'b0;
		r60 = 1'b0;
	end
	else if(w31 == 1'b1) begin
	    r47 = win_d1;
		r48 = 1'b0;
		r49 = 1'b0;
		r50 = win_e1;
		r51 = 1'b0;
		r52 = 1'b0;
		r53 = 1'b0;
		r54 = 1'b0;
		r55 = 1'b0;
		r56 = 1'b0;
		r57 = win_e2[0];
		r58 = win_e3[0];
		r59 = win_e4[0];
		r60 = win_e5[0];
	end
	else begin
	    r47 = win_d1;    
		r48 = 1'b0;    
		r49 = r18;
		r50 = win_e1;   
		r51 = 1'b0;       
		r52 = 1'b0;     
		r53 = win_c2[1];   
		r54 = win_c3[1];
		r55 = win_c4[1];
		r56 = win_c5[1];
		r57 = win_e2[0];   
		r58 = win_e3[0];
		r59 = win_e4[0];
		r60 = win_e5[0];
	end
end

reg r64;
reg r65;
reg r66;
reg r67;
reg r68;
reg r69;
reg r70;
reg r74;

always@(*) begin
    if(w41 == 1'b1) begin
	    if(r26 == 1'b1) begin
		    r64 = win_c2[2];
			r65 = 1'b0;
			r66 = r22;
			r67 = win_d3[2];
			r68 = r20;
			r69 = 1'b0;
			r70 = win_c3[2];
			r74 = 1'b0;
		end
		else begin
		    r64 = win_c2[1];
			r65 = 1'b0;
			r66 = win_d1;
			r67 = win_d3[1];
			r68 = r18;
			r69 = 1'b0;
			r70 = win_c3[1];
			r74 = 1'b0;
		end
	end
	else if(w31 == 1'b1) begin
	    if(r26 == 1'b1) begin
		    r64 = 1'b0;
			r65 = win_e2[1];
			r66 = r22;
			r67 = win_d3[2];
			r68 = 1'b0;
			r69 = r24;
			r70 = 1'b0;
			r74 = win_e3[1];
		end
		else begin
		    r64 = 1'b0;
			r65 = win_e2[0];
			r66 = win_d1;
			r67 = win_d3[1];
			r68 = 1'b0;
			r69 = win_e1;
			r70 = 1'b0;
			r74 = win_e3[0];
		end
	end
	else begin
	    if(r26 == 1'b1) begin            
		    r64 = win_c2[2];   
			r65 = win_e2[1];  
			r66 = r22; 
			r67 = win_d3[2];     
			r68 = r20;
			r69 = r24;
			r70 = win_c3[2];
			r74 = win_e3[1];
		end
		else begin                            
		    r64 = win_c2[1];   
			r65 = win_e2[0]; 
			r66 = win_d1;    
			r67 = win_d3[1]; 
			r68 = r18; 
			r69 = win_e1;       
			r70 = win_c3[1];
			r74 = win_e3[0];
		end
	end
end

reg r75;
reg r76;
reg r77;
reg r78;
reg r79;
reg r80;
reg r81;
reg r82;

always@(*) begin
    if(w41 == 1'b1) begin
	    if(r28 == 1'b1) begin
		    r75 = win_c3[2];
			r76 = 1'b0;
			r77 = win_d2[1];
			r78 = win_d4[2];
			r79 = win_c2[2];
			r80 = 1'b0;
			r81 = win_c4[2];
			r82 = 1'b0;
		end
		else begin
		    r75 = win_c3[1];
			r76 = 1'b0;
			r77 = win_e2_n[0];
			r78 = win_d4[1];
			r79 = win_c2[1];
			r80 = 1'b0;
			r81 = win_c4[1];
			r82 = 1'b0;
		end
	end
	else if(w31 == 1'b1) begin
	    if(r28 == 1'b1) begin
		    r75 = 1'b0;
			r76 = win_e3[1];
			r77 = win_d2[1];
			r78 = win_d4[2];
			r79 = 1'b0;
			r80 = win_e2[1];
			r81 = 1'b0;
			r82 = win_e4[1];
		end
		else begin
		    r75 = 1'b0;
			r76 = win_e3[0];
			r77 = win_e2_n[0];
			r78 = win_d4[1];
			r79 = 1'b0;
			r80 = win_e2[0];
			r81 = 1'b0;
			r82 = win_e4[0];
		end
	end
	else begin
	    if(r28 == 1'b1) begin
		    r75 = win_c3[2];
			r76 = win_e3[1];
			r77 = win_d2[1];
			r78 = win_d4[2];
			r79 = win_c2[2];
			r80 = win_e2[1];
			r81 = win_c4[2];
			r82 = win_e4[1];
		end
		else begin
		    r75 = win_c3[1];
			r76 = win_e3[0];
			r77 = win_e2_n[0];
			r78 = win_d4[1];
			r79 = win_c2[1];
			r80 = win_e2[0];
			r81 = win_c4[1];
			r82 = win_e4[0];
		end
	end
end

reg r83;
reg r84;
reg r85;
reg r86;
reg r87;
reg r88;
reg r89;
reg r90;

always@(*) begin
    if(w41 == 1'b1) begin
	    if(r30 == 1'b1) begin
		    r83 = win_c4[2];
			r84 = 1'b0;
			r85 = win_d3[1];
			r86 = win_d5[2];
			r87 = win_c3[2];
			r88 = 1'b0;
			r89 = win_c5[2];
			r90 = 1'b0;
		end
		else begin
		    r83 = win_c4[1];
			r84 = 1'b0;
			r85 = win_e3_n[0];
			r86 = win_d5[1];
			r87 = win_c3[1];
			r88 = 1'b0;
			r89 = win_c5[1];
			r90 = 1'b0;
		end
	end
	else if(w31 == 1'b1) begin
	    if(r30 == 1'b1) begin
		    r83 = 1'b0;
			r84 = win_e4[1];
			r85 = win_d3[1];
			r86 = win_d5[2];
			r87 = 1'b0;
			r88 = win_e3[1];
			r89 = 1'b0;
			r90 = win_e5[1];
		end
		else begin
		    r83 = 1'b0;
			r84 = win_e4[0];
			r85 = win_e3_n[0];
			r86 = win_d5[1];
			r87 = 1'b0;
			r88 = win_e3[0];
			r89 = 1'b0;
			r90 = win_e5[0];
		end
	end
	else begin
	    if(r30 == 1'b1) begin
		    r83 = win_c4[2];
			r84 = win_e4[1];
			r85 = win_d3[1];
			r86 = win_d5[2];
			r87 = win_c3[2];
			r88 = win_e3[1];
			r89 = win_c5[2];
			r90 = win_e5[1];
		end
		else begin
		    r83 = win_c4[1];
			r84 = win_e4[0];
			r85 = win_e3_n[0];
			r86 = win_d5[1];
			r87 = win_c3[1];
			r88 = win_e3[0];
			r89 = win_c5[1];
			r90 = win_e5[0];
		end
	end
end

reg r91;
reg r92;
reg r93;
reg r94;
reg r95;
reg r96;
reg r97;
reg r98;

always@(*) begin
    if(w41 == 1'b1) begin
	    if(r32 == 1'b1) begin
		    r91 = win_c5[2];
			r92 = 1'b0;
			r93 = win_d4[1];
			r94 = 1'b0;
			r95 = win_c4[2];
			r96 = 1'b0;
			r97 = 1'b0;
			r98 = 1'b0;
		end
		else begin
		    r91 = win_c5[1];
			r92 = 1'b0;
			r93 = win_e4_n[0];
			r94 = 1'b0;
			r95 = win_c4[1];
			r96 = 1'b0;
			r97 = 1'b0;
			r98 = 1'b0;
		end
	end
	else if(w31 == 1'b1) begin
	    if(r32 == 1'b1) begin
		    r91 = 1'b0;
			r92 = win_e5[1];
			r93 = win_d4[1];
			r94 = 1'b0;
			r95 = 1'b0;
			r96 = win_e4[1];
			r97 = 1'b0;
			r98 = 1'b0;
		end
		else begin
		    r91 = 1'b0;
			r92 = win_e5[0];
			r93 = win_e4_n[0];
			r94 = 1'b0;
			r95 = 1'b0;
			r96 = win_e4[0];
			r97 = 1'b0;
			r98 = 1'b0;
		end
	end
	else begin
	    if(r32 == 1'b1) begin
		    r91 = win_c5[2];
			r92 = win_e5[1];
			r93 = win_d4[1];
			r94 = 1'b0;
			r95 = win_c4[2];
			r96 = win_e4[1];
			r97 = 1'b0;
			r98 = 1'b0;
		end
		else begin
		    r91 = win_c5[1];
			r92 = win_e5[0];
			r93 = win_e4_n[0];
			r94 = 1'b0;
			r95 = win_c4[1];
			r96 = win_e4[0];
			r97 = 1'b0;
			r98 = 1'b0;
		end
	end
end

reg r99;    
reg r100;
reg r101;
reg r102;

reg r103;
reg r104;
reg r105;
reg r106;

reg r107;
reg r108;
reg r109;
reg r110;

reg r111;
reg r113;
reg r114;
reg r115;

always@(*) begin
    if(w41 == 1'b1) begin
	    r99 = win_c2[5];
	    r100 = 1'b0;
	    r101 = r34;
	    r102 = win_d3[5];
		r103 = win_c3[5];
	    r104 = 1'b0;
	    r105 = win_d2[5];
	    r106 = win_d4[5];
	    r107 = win_c4[5];
	    r108 = 1'b0;
	    r109 = win_d3[5];
	    r110 = win_d5[5];
	    r111 = win_c5[5];
	    r113 = 1'b0;
	    r114 = win_d4[5];
	    r115 = 1'b0;
	end
	else if(w31 == 1'b1) begin
	    r99 = 1'b0;
	    r100 = win_e2[5];
	    r101 = r34;
	    r102 = win_d3[5];
		r103 = 1'b0;
	    r104 = win_e3[5];
	    r105 = win_d2[5];
	    r106 = win_d4[5];
	    r107 = 1'b0;
	    r108 = win_e4[5];
	    r109 = win_d3[5];
	    r110 = win_d5[5];
	    r111 = 1'b0;
	    r113 = win_e5[5];
	    r114 = win_d4[5];
	    r115 = 1'b0;
	end
	else begin
        r99 = win_c2[5];    
	    r100 = win_e2[5];
	    r101 = r34;
	    r102 = win_d3[5];
		r103 = win_c3[5];
	    r104 = win_e3[5];
	    r105 = win_d2[5];
	    r106 = win_d4[5];
	    r107 = win_c4[5];
	    r108 = win_e4[5];
	    r109 = win_d3[5];
	    r110 = win_d5[5];
	    r111 = win_c5[5];
	    r113 = win_e5[5];
	    r114 = win_d4[5];
	    r115 = 1'b0;    
	end
end

reg r116;
reg r117;
reg r118;
reg r119;
reg r120;
reg r121;
reg r122;
reg r123;

reg r124;
reg r125;
reg r126;
reg r127;
reg r128;
reg r129;
reg r130;
reg r131;

reg r132;
reg r133;
reg r134;
reg r135;
reg r136;
reg r137;
reg r138;
reg r139;

reg r140;
reg r141;
reg r142;
reg r143;
reg r144;
reg r145;
reg r146;
reg r147;

always@(*) begin
    if(w41 == 1'b1) begin
	    r116 = win_c2[1];
        r117 = 1'b0;
        r118 = r22;
        r119 = win_d3[1];
        r120 = r20;
        r121 = 1'b0;
        r122 = win_c3[1];
        r123 = 1'b0;
		r124 = win_c3[1];
        r125 = 1'b0;
        r126 = win_d2[1];
        r127 = win_d4[1];
        r128 = win_c2[1];
        r129 = 1'b0;
        r130 = win_c4[1];
        r131 = 1'b0;
		r132 = win_c4[1];
        r133 = 1'b0;
        r134 = win_d3[1];
        r135 = win_d5[1];
        r136 = win_c3[1];
        r137 = 1'b0;
        r138 = win_c5[1];
        r139 = 1'b0;
		r140 = win_c5[1];
        r141 = 1'b0;
        r142 = win_d4[1];
        r143 = 1'b0;
        r144 = win_c4[1];
        r145 = 1'b0;
        r146 = 1'b0;
        r147 = 1'b0;
	end
	else if(w31 == 1'b1) begin
	    r116 = 1'b0;
        r117 = win_e2[1];
        r118 = r22;
        r119 = win_d3[1];
        r120 = 1'b0;
        r121 = r24;
        r122 = 1'b0;
        r123 = win_e3[1];
		r124 = 1'b0;
        r125 = win_e3[1];
        r126 = win_d2[1];
        r127 = win_d4[1];
        r128 = 1'b0;
        r129 = win_e2[1];
        r130 = 1'b0;
        r131 = win_e4[1];
		r132 = 1'b0;
        r133 = win_e4[1];
        r134 = win_d3[1];
        r135 = win_d5[1];
        r136 = 1'b0;
        r137 = win_e3[1];
        r138 = 1'b0;
        r139 = win_e5[1];
		r140 = 1'b0;
        r141 = win_e5[1];
        r142 = win_d4[1];
        r143 = 1'b0;
        r144 = 1'b0;
        r145 = win_e4[1];
        r146 = 1'b0;
        r147 = 1'b0;
	end
	else begin
	    r116 = win_c2[1];    
        r117 = win_e2[1];
        r118 = r22;
        r119 = win_d3[1];
        r120 = r20;
        r121 = r24;
        r122 = win_c3[1];
        r123 = win_e3[1];
		r124 = win_c3[1];
        r125 = win_e3[1];
        r126 = win_d2[1];
        r127 = win_d4[1];
        r128 = win_c2[1];
        r129 = win_e2[1];
        r130 = win_c4[1];
        r131 = win_e4[1];
		r132 = win_c4[1];
        r133 = win_e4[1];
        r134 = win_d3[1];
        r135 = win_d5[1];
        r136 = win_c3[1];
        r137 = win_e3[1];
        r138 = win_c5[1];
        r139 = win_e5[1];
		r140 = win_c5[1];
        r141 = win_e5[1];
        r142 = win_d4[1];
        r143 = 1'b0;
        r144 = win_c4[1];
        r145 = win_e4[1];
        r146 = 1'b0;
        r147 = 1'b0;
	end
end

ZC  u_zc0(.zc_CxD  (w6),
          .data_v  (win_d2[4]),
          .flag_band  (band),   
          .h0  (r64),
		  .h1  (r65),
          .v0  (r66),
		  .v1  (r67),
          .d0  (r68),
		  .d1  (r69),
          .d2  (r70),
		  .d3  (r74));

ZC  u_zc1(.zc_CxD  (w5),
          .data_v  (win_d3[4]),
          .flag_band  (band),
          .h0  (r75),
		  .h1  (r76),
          .v0  (r77),
		  .v1  (r78),
          .d0  (r79),
		  .d1  (r80),
          .d2  (r81),
		  .d3  (r82));

ZC  u_zc2(.zc_CxD  (w7),
          .data_v  (win_d4[4]),
          .flag_band  (band),
          .h0  (r83),
		  .h1  (r84),
          .v0  (r85),
		  .v1  (r86),
          .d0  (r87),
		  .d1  (r88),
          .d2  (r89),
		  .d3  (r90));

ZC  u_zc3(.zc_CxD  (w8),
          .data_v  (win_d5[4]),
          .flag_band  (band),
          .h0  (r91),
		  .h1  (r92),
          .v0  (r93),
		  .v1  (r94),
          .d0  (r95),
		  .d1  (r96),
          .d2  (r97),
		  .d3  (r98));
		  
SC  u_sc0(.sc_CxD  (w9),
          .data_x  (win_d2[5]),
          .h0  (r64),   
		  .h1  (r65),     
          .v0  (r66),   
		  .v1  (r67),     
          .sign_h0  (r99),   
          .sign_h1  (r100),    
          .sign_v0  (r101),    
          .sign_v1  (r102));	  

SC  u_sc1(.sc_CxD  (w10),
          .data_x  (win_d3[5]),
          .h0  (r75),
		  .h1  (r76),
          .v0  (r77),
		  .v1  (r78),
          .sign_h0  (r103),
          .sign_h1  (r104),
          .sign_v0  (r105),
          .sign_v1  (r106));

SC  u_sc2(.sc_CxD  (w11),
          .data_x  (win_d4[5]),
          .h0  (r83),
		  .h1  (r84),
          .v0  (r85),
		  .v1  (r86),
          .sign_h0  (r107),
          .sign_h1  (r108),
          .sign_v0  (r109),
          .sign_v1  (r110));

SC  u_sc3(.sc_CxD  (w12),
          .data_x  (win_d5[5]),
          .h0  (r91),
		  .h1  (r92),
          .v0  (r93),
		  .v1  (r94),
          .sign_h0  (r111),
          .sign_h1  (r113),
          .sign_v0  (r114),
          .sign_v1  (r115));		

MRC u_mrc0(.mrc_CxD  (w13),
           .data_v  (win_d2[4]),
           .data_mrc_first  (~win_d2[3]),   
           .h0  (r116),
		   .h1  (r117),
           .v0  (r118),
		   .v1  (r119),
           .d0  (r120),
		   .d1  (r121),
           .d2  (r122),
		   .d3  (r123));

MRC u_mrc1(.mrc_CxD  (w14),
           .data_v  (win_d3[4]),
           .data_mrc_first  (~win_d3[3]),
           .h0  (r124),
		   .h1  (r125),
           .v0  (r126),
		   .v1  (r127),
           .d0  (r128),
		   .d1  (r129),
           .d2  (r130),
		   .d3  (r131));	

MRC u_mrc2(.mrc_CxD  (w15),
           .data_v  (win_d4[4]),
           .data_mrc_first  (~win_d4[3]),
           .h0  (r132),
		   .h1  (r133),
           .v0  (r134),
		   .v1  (r135),
           .d0  (r136),
		   .d1  (r137),
           .d2  (r138),
		   .d3  (r139));	

MRC u_mrc3(.mrc_CxD  (w16),
           .data_v  (win_d5[4]),
           .data_mrc_first  (~win_d5[3]),
           .h0  (r140),
		   .h1  (r141),
           .v0  (r142),
		   .v1  (r143),
           .d0  (r144),
		   .d1  (r145),
           .d2  (r146),
		   .d3  (r147));	

RLC u_rlc (.rlc_CxD  (w17),
           .u0_CxD  (w18),
           .u1_CxD  (u1_cxd),
           .rlc_ac  (w19),    
           .u01_ac  (u01_vld),    
           .data_v0  (win_d2[4]),
           .data_v1  (win_d3[4]),
           .data_v2  (win_d4[4]),
           .data_v3  (win_d5[4]),
           .cp_ac0  (r35),
		   .cp_ac1  (r36),
		   .cp_ac2  (r37),
		   .cp_ac3  (r38),
           .v0  (r47),
		   .v1  (r48),
           .d0  (r49),
		   .d1  (r50),
		   .d2  (r51),
		   .d3  (r52),
           .h0  (r53),
		   .h1  (r54),
		   .h2  (r55),
		   .h3  (r56),
           .h4  (r57),
		   .h5  (r58),
		   .h6  (r59),
		   .h7  (r60));		   

reg r148;
reg r149;
reg r150;
reg r151;
reg r152;		  
reg r153;
reg r154;
reg clear0;
		   
reg [7:0] r166;
reg [7:0] r167;
reg [7:0] r168;
reg [7:0] r169;
reg [7:0] r170;
reg [7:0] r181;
reg [7:0] r182;
reg [7:0] r183;
reg [7:0] r184;
reg [7:0] r185;
reg [7:0] r1670;	

reg r155;
reg r156;
reg r157;
reg r158;
reg r159;
reg r160;
reg r161;
reg r162;
reg r163;
reg r164;
reg r165;

always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			r158 <= 1'b0;
		end
		else if(rst_syn)begin
			r158 <= 1'b0;
		end
		else if(w1==1'b1)begin
			if(stall_vld == 1'b1) begin
				r158 <= r158;
			end
			else if(clear0==1'b1) begin      
				r158 <= 0;
			end
			else if(r39 == 1'b1)begin
				r158 <= r39;   
			end
			else begin
				r158 <= r43;   
			end
	end
end
always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			r160 <= 1'b0;
		end
		else if(rst_syn)begin
			r160 <= 1'b0;
		end
		else if(w1==1'b1)begin
			if(stall_vld == 1'b1) begin
				r160 <= r160;
			end
			else if(clear0==1'b1) begin
				r160 <= 0;
			end
			else if(r40 == 1'b1)begin
				r160 <= r40;
			end
			else begin
				r160 <= r44;
			end
	end
end
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		r162 <= 1'b0;
	end
	else if(rst_syn)begin
		r162 <= 1'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b1) begin
			r162 <= r162;
		end
		else if(clear0==1'b1) begin
			r162 <= 0;
		end
		else if(r41 == 1'b1)begin
			r162 <= r41;
		end
		else begin
			r162 <= r45;
		end
	end
end
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		r164 <= 1'b0;
	end
	else if(rst_syn)begin
		r164 <= 1'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b1) begin
			r164 <= r164;
		end
		else if(clear0==1'b1) begin
			r164 <= 0;
		end
		else if(r42 == 1'b1)begin
			r164 <= r42;
		end
		else begin
			r164 <= r46;
		end
	end                                                      
end                                                                                              
always@(posedge clk_dwt or negedge rst) begin         
		if(!rst) begin                                    
			r159 <= 1'b0;                   
			r161 <= 1'b0;             
			r163 <= 1'b0;                     
			r165 <= 1'b0;                          
			r155 <= 1'b0;                         
			r156 <= 1'b0;                      
			r157 <= 1'b0;            
		end                                       
		else if(rst_syn)begin                              
			r159 <= 1'b0;                      
			r161 <= 1'b0;                     
			r163 <= 1'b0;                
			r165 <= 1'b0;             
			r155 <= 1'b0;                    
			r156 <= 1'b0;                       
			r157 <= 1'b0;                     
		end                                 
		else if(w1==1'b1)begin        
			if(clear0==1'b1)begin                        
				r159 <= 0;        
				r161 <= 0;                   
				r163 <= 0;           
				r165 <=0;                
				r155 <= 0;                    
				r156 <= 0;             
				r157 <= 0; 	              
			end                                          
			else if(stall_vld == 1'b0)begin
				r159 <= w20; 
				r161 <= w21;
				r163 <= w22;
				r165 <= w23;
				r155 <= w19;  
				r156 <= u01_vld; 
				r157 <= u01_vld;
			end
	end
end
reg [3:0]count_halt;

always@(posedge clk_dwt or negedge rst)begin
	if(!rst)begin
		clear0<=0;
	end
	else if(rst_syn)begin
		clear0<=0;
	end
	else if(w1==1'b1)begin
		if(halt)begin
			clear0<=1;
		end
		else if((r154==1'b1)&&(count_halt==4'd1))begin
			clear0<=0;
		end
	end
end

always@(posedge clk_dwt or negedge rst)begin
		if(!rst)begin
			count_halt<=0;
		end
		else if(rst_syn)begin
			count_halt<=0;
		end
		else if(w1==1'b1)begin
			if((r148==1'b1)&&(r154==1'b1)&&(clear0==1'b1))begin
				count_halt<=count_halt;
			end
			else if((r148==1'b1)&&(clear0==1'b1))begin
				count_halt<=count_halt+1;
			end
			else if((r154==1'b1)&&(clear0==1'b1))begin
				count_halt<=count_halt-1;
			end
		end
end

always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			r169 <= 8'b0;
		end
		else if(rst_syn)begin
			r169 <= r169;
		end
		else if(w1==1'b1)begin
			if(stall_vld == 1'b1) begin
				r169 <= r169;
			end
			else if(clear0==1'b1) begin
				r169 <= 0;
			end
			else if(r39 == 1'b1) begin
				r169 <= {2'b10,w13};
			end
			else if(r26 == 1'b1)begin
				r169 <= {2'b01,w6}; 
			end
			else begin
				r169 <= {2'b11,w6}; 
			end
	end
end
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		r181 <= 8'b0;
	end
	else if(rst_syn)begin	
		r181 <= 8'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b1) begin
			r181 <= r181;
		end
		else if(clear0==1'b1) begin
			r181 <= 0;
		end
		else if(r40 == 1'b1) begin
			r181 <= {2'b10,w14};    
		end
		else if(r28 == 1'b1)begin
			r181 <= {2'b01,w5};
		end
		else begin
			r181 <= {2'b11,w5};
		end
	end
end
always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			r183 <= 8'b0;
		end
		else if(rst_syn)begin
			r183 <= 8'b0;
		end
		else if(w1==1'b1)begin
			if(stall_vld == 1'b1) begin
				r183 <= r183;
			end
			else if(clear0==1'b1) begin
				r183 <= 0;
			end
			else if(r41 == 1'b1) begin
				r183 <= {2'b10,w15};  
			end
			else if(r30 == 1'b1)begin
				r183 <= {2'b01,w7};
			end
			else begin
				r183 <= {2'b11,w7};
			end
		end
end
always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			r185 <= 8'b0;
		end
		else if(rst_syn)begin
			r185 <= 8'b0;
		end
		else if(w1==1'b1)begin
			if(stall_vld == 1'b1) begin
				r185 <= r185;
			end
			else if(clear0==1'b1) begin
				r185 <= 0;
			end
			else if(r42 == 1'b1) begin
				r185 <= {2'b10,w16};   
			end
			else if(r32 == 1'b1)begin
				r185 <= {2'b01,w8};
			end
			else begin
				r185 <= {2'b11,w8};
			end
		end
end
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		r170 <= 8'b0;
	end
	else if(rst_syn)begin
		r170 <= 8'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b1) begin
			r170 <= r170;
		end
		else if(clear0==1'b1) begin
			r170 <= 0;
		end
		else if(r26 == 1'b1) begin
			r170 <= {2'b01,w9};  
		end
		else begin
			r170 <= {2'b11,w9};   
		end
	end
end	   
always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			r182 <= 8'b0;
		end
		else if(rst_syn)begin
			r182 <= 8'b0;
		end
		else if(w1==1'b1)begin
			if(stall_vld == 1'b1) begin
				r182 <= r182;
			end
			else if(clear0==1'b1) begin
				r182 <= 0;
			end
			else if(r28 == 1'b1) begin
				r182 <= {2'b01,w10};
			end
			else begin
				r182 <= {2'b11,w10};
			end
	end
end

always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		r184 <= 8'b0;
	end
	else if(rst_syn)begin
		r184 <= r184;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b1) begin
			r184 <= r184;
		end
		else if(clear0==1'b1) begin
			r184 <= 0;
		end
		else if(r30 == 1'b1) begin
			r184 <= {2'b01,w11};
		end
		else begin
			r184 <= {2'b11,w11};
		end
	end
end
always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			r1670 <= 8'b0;
		end
		else if(rst_syn)begin
			r1670 <= 8'b0;
		end
		else if(w1==1'b1)begin
			if(stall_vld == 1'b1) begin
				r1670 <= r1670;
			end
			else if(clear0==1'b1) begin
				r1670 <= 0;
			end
			else if(r32 == 1'b1) begin
				r1670 <= {2'b01,w12};
			end
			else begin
				r1670 <= {2'b11,w12};
			end
	end
end
always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			r166 <= 8'b0;
			r167 <= 8'b0;
			r168 <= 8'b0;
		end
		else if(rst_syn)begin
			r166 <= 8'b0;
			r167 <= 8'b0;
			r168 <= 8'b0;
		end
		else if(w1==1'b1)begin
			if(clear0==1'b1)begin
				r166 <=0;
				r167 <=0;
				r168 <=0;
			end
			else if(stall_vld == 1'b0)begin
				r166 <= {2'b11,w17};   
				r167 <= {2'b11,w18};
				r168 <= {2'b11,u1_cxd};
			end
		end
end

reg stop_c;
reg stop_d;
reg stop_e;
always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			r12 <= 1'b0;
			r13 <= 1'b0;
			stop_c <= 1'b0;
			stop_d <= 1'b0;
			stop_e <= 1'b0;
		end
		else if(rst_syn)begin
			r12 <= 1'b0;
			r13 <= 1'b0;
			stop_c <= 1'b0;
			stop_d <= 1'b0;
			stop_e <= 1'b0;
		end
		else if(w1==1'b1)begin
			if(stall_vld == 1'b0)begin
				r12 <= stop_flag;
				r13 <= r12;
				stop_c <= r13;
				stop_d <= stop_c;
				stop_e <= stop_d;
			end
	end
end

always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			r148 <= 1'b0;
			r149 <= 1'b0;
			r150 <= 1'b0;
			r151 <= 1'b0;	
			r152 <= 1'b0;	
			r153 <= 1'b0;
			r154 <= 1'b0;
		end
		else if(rst_syn)begin
			r148 <= 1'b0;
			r149 <= 1'b0;
			r151 <= 1'b0;	
			r152 <= 1'b0;	
			r150 <= 1'b0;
			r153 <= 1'b0;
			r154 <= 1'b0;
		end
		else if(w1==1'b1)begin
		  begin
			r148 <= halt;
			r149 <= r148;
			r150 <= r149;
			r151 <= r150;
			r152 <= r151;
			r153 <= r152;
			r154 <= r153;
		  end
	end
end


reg s1;
reg s2;
reg s3;
reg s4;
reg s5;
reg s6;
reg s7;
reg s8;
reg s9;
reg s10;
reg s20;
always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			s1 <= 1'b0;
			s2 <= 1'b0;
			s3 <= 1'b0;
			s4 <= 1'b0;
			s5 <= 1'b0;
			s6 <= 1'b0;
			s7 <= 1'b0;
			s8 <= 1'b0;
			s9 <= 1'b0;
			s10 <= 1'b0;
			s20 <= 1'b0;
		end
		else if(rst_syn)begin
			s1 <= 1'b0;
			s2 <= 1'b0;
			s3 <= 1'b0;
			s4 <= 1'b0;
			s5 <= 1'b0;
			s6 <= 1'b0;
			s7 <= 1'b0;
			s8 <= 1'b0;
			s9 <= 1'b0;
			s10 <= 1'b0;
			s20 <= 1'b0;
		end
		else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
			s1 <= stop_e;
			s2 <= s1;
			s3 <= s2;
			s4 <= s3;
			s5 <= s4;
			s6 <= s5;
			s7 <= s6;
			s8 <= s7;
			s9 <= s8;
			s10 <= s9;
			s20 <= s10;
		end
	end
end
reg s21;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		s21 <= 1'b0;
	end
	else if(rst_syn)begin
		s21 <= 1'b0;
	end
	else if(w1==1'b1)begin
		s21 <= s20;
	end
end

wire flush=((s20==1'b1)&&(s21==1'b0));   

reg s22;
reg s19;
reg s23;
reg s24;
reg s25;
reg flush_mq2;
always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			s22 <= 1'b0;
			s19 <= 1'b0;
			s23 <= 1'b0;
			s24 <= 1'b0;
			s25 <= 1'b0;
			flush_mq2 <= 1'b0;
		end
		else if(rst_syn)begin
			s22 <= 1'b0;
			s19 <= 1'b0;
			s23 <= 1'b0;
			s24 <= 1'b0;
			s25 <= 1'b0;
			flush_mq2 <= 1'b0;
		end
		else if(w1==1'b1)begin
			begin
				s22 <= flush;
				s19 <= s22;
				s23 <= s19;
				s24 <= s23;
				s25 <= s24;
				flush_mq2 <= s25;
			end
		end
end

wire [7:0] c0;
wire [7:0] c1;
wire [7:0] c2;
wire [7:0] c3;
wire [7:0] c4;
wire [7:0] c5;
wire [7:0] c6;
wire [7:0] c7;
wire [7:0] c8;
wire [7:0] c9;
wire [7:0] c10;

wire [7:0] c11;
wire [7:0] c12;
wire [7:0] c13;
wire [7:0] c14;
wire [7:0] c15;
wire [7:0] c16;
wire [7:0] c17;
wire [7:0] c18;
wire [7:0] c19;
wire [7:0] c20;
wire [7:0] c21;

wire [7:0] c22;
wire [7:0] c23;
wire [7:0] c24;
wire [7:0] c25;
wire [7:0] c26;
wire [7:0] c27;
wire [7:0] c28;
wire [7:0] c29;
wire [7:0] c30;
wire [7:0] c31;
wire [7:0] c32;

wire [7:0] c33;
wire [7:0] cell31_out;
wire [7:0] cell32_out;
wire [7:0] cell33_out;
wire [7:0] cell34_out;
wire [7:0] cell35_out;
wire [7:0] cell36_out;
wire [7:0] cell37_out;
wire [7:0] cell38_out;
wire [7:0] cell39_out;
wire [7:0] cell3a_out;

wire [7:0] cell40_out;
wire [7:0] cell41_out;
wire [7:0] cell42_out;
wire [7:0] cell43_out;
wire [7:0] cell44_out;
wire [7:0] cell45_out;
wire [7:0] cell46_out;
wire [7:0] cell47_out;
wire [7:0] cell48_out;
wire [7:0] cell49_out;
wire [7:0] cell4a_out;

wire [7:0] cell50_out;
wire [7:0] cell51_out;
wire [7:0] cell52_out;
wire [7:0] cell53_out;
wire [7:0] cell54_out;
wire [7:0] cell55_out;
wire [7:0] cell56_out;
wire [7:0] cell57_out;
wire [7:0] cell58_out;
wire [7:0] cell59_out;
wire [7:0] cell5a_out;

wire [7:0] cell60_out;
wire [7:0] cell61_out;
wire [7:0] cell62_out;
wire [7:0] cell63_out;
wire [7:0] cell64_out;
wire [7:0] cell65_out;
wire [7:0] cell66_out;
wire [7:0] cell67_out;
wire [7:0] cell68_out;
wire [7:0] cell69_out;
wire [7:0] cell6a_out;

wire [7:0] cell70_out;
wire [7:0] cell71_out;
wire [7:0] cell72_out;
wire [7:0] cell73_out;
wire [7:0] cell74_out;
wire [7:0] cell75_out;
wire [7:0] cell76_out;
wire [7:0] cell77_out;
wire [7:0] cell78_out;
wire [7:0] cell79_out;
wire [7:0] cell7a_out;

wire [7:0] cell80_out;
wire [7:0] cell81_out;
wire [7:0] cell82_out;
wire [7:0] cell83_out;
wire [7:0] cell84_out;
wire [7:0] cell85_out;
wire [7:0] cell86_out;
wire [7:0] cell87_out;
wire [7:0] cell88_out;
wire [7:0] cell89_out;
wire [7:0] cell8a_out;

wire [7:0] cell90_out;
wire [7:0] cell91_out;
wire [7:0] cell92_out;
wire [7:0] cell93_out;
wire [7:0] cell94_out;
wire [7:0] cell95_out;
wire [7:0] cell96_out;
wire [7:0] cell97_out;
wire [7:0] cell98_out;
wire [7:0] cell99_out;
wire [7:0] cell9a_out;

wire [7:0] cella0_out;
wire [7:0] cella1_out;
wire [7:0] cella2_out;
wire [7:0] cella3_out;
wire [7:0] cella4_out;
wire [7:0] cella5_out;
wire [7:0] cella6_out;
wire [7:0] cella7_out;
wire [7:0] cella8_out;
wire [7:0] cella9_out;

wire cella0_out_vld;
wire cella1_out_vld;
wire cella2_out_vld;
wire cella3_out_vld;
wire cella4_out_vld;
wire cella5_out_vld;
wire cella6_out_vld;
wire cella7_out_vld;
wire cella8_out_vld;
wire cella9_out_vld;


reg [7:0] arrange_out0;
reg [7:0] arrange_out1;
reg [7:0] arrange_out2;
reg [7:0] arrange_out3;
reg [7:0] arrange_out4;
reg [7:0] arrange_out5;
reg [7:0] arrange_out6;
reg [7:0] arrange_out7;
reg [7:0] arrange_out8;
reg [7:0] arrange_out9;

always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		arrange_out0 <= 8'b0;
		arrange_out1 <= 8'b0;
		arrange_out2 <= 8'b0;
		arrange_out3 <= 8'b0;
		arrange_out4 <= 8'b0;
		arrange_out5 <= 8'b0;
		arrange_out6 <= 8'b0;
		arrange_out7 <= 8'b0;
		arrange_out8 <= 8'b0;
		arrange_out9 <= 8'b0;
	end
	else if(rst_syn)begin
		arrange_out0 <= 8'b0;
		arrange_out1 <= 8'b0;
		arrange_out2 <= 8'b0;
		arrange_out3 <= 8'b0;
		arrange_out4 <= 8'b0;
		arrange_out5 <= 8'b0;
		arrange_out6 <= 8'b0;
		arrange_out7 <= 8'b0;
		arrange_out8 <= 8'b0;
		arrange_out9 <= 8'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld == 1'b0)begin
			arrange_out0 <= cella0_out;
			arrange_out1 <= cella1_out;
			arrange_out2 <= cella2_out;
			arrange_out3 <= cella3_out;
			arrange_out4 <= cella4_out;
			arrange_out5 <= cella5_out;
			arrange_out6 <= cella6_out;
			arrange_out7 <= cella7_out;
			arrange_out8 <= cella8_out;
			arrange_out9 <= cella9_out;
		end
	end
end

reg w2_reg;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		w2_reg <= 1'b0;
	end
	else if(rst_syn)begin
		w2_reg <= 1'b0;
	end
	else if(w1==1'b1)begin
		begin
			w2_reg <= w2;
		end
	end
end

reg halt_bpc;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst)begin
		halt_bpc<=0;
	end
	else if(rst_syn)begin
		halt_bpc<=0;	 
	end
	else if(w1==1'b1)begin
		if(s20==1'b1)begin
			if(halt==1'b1)begin
				halt_bpc<=1;
			end
		end	
		else begin
			halt_bpc<=0;
		end
	end
end

wire [3:0]vld_num;
reg [3:0] vld_num_temp;
assign vld_num=(level_flag!=3'b111)?vld_num_temp:3'b0;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		vld_num_temp <= 4'b0;
	end
	else if(rst_syn)begin
		vld_num_temp <= 4'b0;
	end
	else if(w1==1'b1)begin
		if(((s20 == 1'b1)||(w2_reg == 1'b0))&&(stall_vld==1'b0)) begin
			vld_num_temp <= 4'b0;
		end
		else if(halt_bpc==1)begin
			vld_num_temp <= 4'b0;
		end
		else if(stall_vld == 1'b0)begin
			vld_num_temp <= cella0_out_vld+cella1_out_vld+cella2_out_vld+cella3_out_vld+cella4_out_vld+cella5_out_vld+cella6_out_vld+cella7_out_vld+cella8_out_vld+cella9_out_vld; 
		end
	end
end
u_jp2k_1 u_cell00(c0,c0_vld,stall_vld,r166,r167,r155,1'b1,r156,clk_dwt,w1,rst,rst_syn);   
u_jp2k_1 u_cell01(c1,c1_vld,stall_vld,r167,r168,r156,r155,r157,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell02(c2,c2_vld,stall_vld,r168,r169,r157,r156,r158,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell03(c3,c3_vld,stall_vld,r169,r170,r158,r157,r159,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell04(c4,c4_vld,stall_vld,r170,r181,r159,r158,r160,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell05(c5,c5_vld,stall_vld,r181,r182,r160,r159,r161,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell06(c6,c6_vld,stall_vld,r182,r183,r161,r160,r162,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell07(c7,c7_vld,stall_vld,r183,r184,r162,r161,r163,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell08(c8,c8_vld,stall_vld,r184,r185,r163,r162,r164,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell09(c9,c9_vld,stall_vld,r185,r1670,r164,r163,r165,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell0a(c10,c10_vld,stall_vld,r1670,8'b0,r165,r164,1'b0,clk_dwt,w1,rst,rst_syn);
                                                       
u_jp2k_1 u_cell10(c11,c11_vld,stall_vld,c0,c1,c0_vld,1'b1,c1_vld,clk_dwt,w1,rst,rst_syn); 
u_jp2k_1 u_cell11(c12,c12_vld,stall_vld,c1,c2,c1_vld,c0_vld,c2_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell12(c13,c13_vld,stall_vld,c2,c3,c2_vld,c1_vld,c3_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell13(c14,c14_vld,stall_vld,c3,c4,c3_vld,c2_vld,c4_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell14(c15,c15_vld,stall_vld,c4,c5,c4_vld,c3_vld,c5_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell15(c16,c16_vld,stall_vld,c5,c6,c5_vld,c4_vld,c6_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell16(c17,c17_vld,stall_vld,c6,c7,c6_vld,c5_vld,c7_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell17(c18,c18_vld,stall_vld,c7,c8,c7_vld,c6_vld,c8_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell18(c19,c19_vld,stall_vld,c8,c9,c8_vld,c7_vld,c9_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell19(c20,c20_vld,stall_vld,c9,c10,c9_vld,c8_vld,c10_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell1a(c21,c21_vld,stall_vld,c10,8'b0,c10_vld,c9_vld,1'b0,clk_dwt,w1,rst,rst_syn);
                                                       
u_jp2k_1 u_cell20(c22,c22_vld,stall_vld,c11,c12,c11_vld,1'b1,c12_vld,clk_dwt,w1,rst,rst_syn);  
u_jp2k_1 u_cell21(c23,c23_vld,stall_vld,c12,c13,c12_vld,c11_vld,c13_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell22(c24,c24_vld,stall_vld,c13,c14,c13_vld,c12_vld,c14_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell23(c25,c25_vld,stall_vld,c14,c15,c14_vld,c13_vld,c15_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell24(c26,c26_vld,stall_vld,c15,c16,c15_vld,c14_vld,c16_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell25(c27,c27_vld,stall_vld,c16,c17,c16_vld,c15_vld,c17_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell26(c28,c28_vld,stall_vld,c17,c18,c17_vld,c16_vld,c18_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell27(c29,c29_vld,stall_vld,c18,c19,c18_vld,c17_vld,c19_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell28(c30,c30_vld,stall_vld,c19,c20,c19_vld,c18_vld,c20_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell29(c31,c31_vld,stall_vld,c20,c21,c20_vld,c19_vld,c21_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell2a(c32,c32_vld,stall_vld,c21,8'b0,c21_vld,c20_vld,1'b0,clk_dwt,w1,rst,rst_syn);
                                                   
u_jp2k_1 u_cell30(c33,c33_vld,stall_vld,c22,c23,c22_vld,1'b1,c23_vld,clk_dwt,w1,rst,rst_syn);  
u_jp2k_1 u_cell31(cell31_out,cell31_out_vld,stall_vld,c23,c24,c23_vld,c22_vld,c24_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell32(cell32_out,cell32_out_vld,stall_vld,c24,c25,c24_vld,c23_vld,c25_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell33(cell33_out,cell33_out_vld,stall_vld,c25,c26,c25_vld,c24_vld,c26_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell34(cell34_out,cell34_out_vld,stall_vld,c26,c27,c26_vld,c25_vld,c27_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell35(cell35_out,cell35_out_vld,stall_vld,c27,c28,c27_vld,c26_vld,c28_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell36(cell36_out,cell36_out_vld,stall_vld,c28,c29,c28_vld,c27_vld,c29_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell37(cell37_out,cell37_out_vld,stall_vld,c29,c30,c29_vld,c28_vld,c30_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell38(cell38_out,cell38_out_vld,stall_vld,c30,c31,c30_vld,c29_vld,c31_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell39(cell39_out,cell39_out_vld,stall_vld,c31,c32,c31_vld,c30_vld,c32_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell3a(cell3a_out,cell3a_out_vld,stall_vld,c32,8'b0,c32_vld,c31_vld,1'b0,clk_dwt,w1,rst,rst_syn);
                                        
u_jp2k_1 u_cell40(cell40_out,cell40_out_vld,stall_vld,c33,cell31_out,c33_vld,1'b1,cell31_out_vld,clk_dwt,w1,rst,rst_syn);  
u_jp2k_1 u_cell41(cell41_out,cell41_out_vld,stall_vld,cell31_out,cell32_out,cell31_out_vld,c33_vld,cell32_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell42(cell42_out,cell42_out_vld,stall_vld,cell32_out,cell33_out,cell32_out_vld,cell31_out_vld,cell33_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell43(cell43_out,cell43_out_vld,stall_vld,cell33_out,cell34_out,cell33_out_vld,cell32_out_vld,cell34_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell44(cell44_out,cell44_out_vld,stall_vld,cell34_out,cell35_out,cell34_out_vld,cell33_out_vld,cell35_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell45(cell45_out,cell45_out_vld,stall_vld,cell35_out,cell36_out,cell35_out_vld,cell34_out_vld,cell36_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell46(cell46_out,cell46_out_vld,stall_vld,cell36_out,cell37_out,cell36_out_vld,cell35_out_vld,cell37_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell47(cell47_out,cell47_out_vld,stall_vld,cell37_out,cell38_out,cell37_out_vld,cell36_out_vld,cell38_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell48(cell48_out,cell48_out_vld,stall_vld,cell38_out,cell39_out,cell38_out_vld,cell37_out_vld,cell39_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell49(cell49_out,cell49_out_vld,stall_vld,cell39_out,cell3a_out,cell39_out_vld,cell38_out_vld,cell3a_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell4a(cell4a_out,cell4a_out_vld,stall_vld,cell3a_out,8'b0,cell3a_out_vld,cell39_out_vld,1'b0,clk_dwt,w1,rst,rst_syn);
                                           
u_jp2k_1 u_cell50(cell50_out,cell50_out_vld,stall_vld,cell40_out,cell41_out,cell40_out_vld,1'b1,cell41_out_vld,clk_dwt,w1,rst,rst_syn);   
u_jp2k_1 u_cell51(cell51_out,cell51_out_vld,stall_vld,cell41_out,cell42_out,cell41_out_vld,cell40_out_vld,cell42_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell52(cell52_out,cell52_out_vld,stall_vld,cell42_out,cell43_out,cell42_out_vld,cell41_out_vld,cell43_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell53(cell53_out,cell53_out_vld,stall_vld,cell43_out,cell44_out,cell43_out_vld,cell42_out_vld,cell44_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell54(cell54_out,cell54_out_vld,stall_vld,cell44_out,cell45_out,cell44_out_vld,cell43_out_vld,cell45_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell55(cell55_out,cell55_out_vld,stall_vld,cell45_out,cell46_out,cell45_out_vld,cell44_out_vld,cell46_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell56(cell56_out,cell56_out_vld,stall_vld,cell46_out,cell47_out,cell46_out_vld,cell45_out_vld,cell47_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell57(cell57_out,cell57_out_vld,stall_vld,cell47_out,cell48_out,cell47_out_vld,cell46_out_vld,cell48_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell58(cell58_out,cell58_out_vld,stall_vld,cell48_out,cell49_out,cell48_out_vld,cell47_out_vld,cell49_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell59(cell59_out,cell59_out_vld,stall_vld,cell49_out,cell4a_out,cell49_out_vld,cell48_out_vld,cell4a_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell5a(cell5a_out,cell5a_out_vld,stall_vld,cell4a_out,8'b0,cell4a_out_vld,cell49_out_vld,1'b0,clk_dwt,w1,rst,rst_syn);
                                             
u_jp2k_1 u_cell60(cell60_out,cell60_out_vld,stall_vld,cell50_out,cell51_out,cell50_out_vld,1'b1,cell51_out_vld,clk_dwt,w1,rst,rst_syn);   
u_jp2k_1 u_cell61(cell61_out,cell61_out_vld,stall_vld,cell51_out,cell52_out,cell51_out_vld,cell50_out_vld,cell52_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell62(cell62_out,cell62_out_vld,stall_vld,cell52_out,cell53_out,cell52_out_vld,cell51_out_vld,cell53_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell63(cell63_out,cell63_out_vld,stall_vld,cell53_out,cell54_out,cell53_out_vld,cell52_out_vld,cell54_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell64(cell64_out,cell64_out_vld,stall_vld,cell54_out,cell55_out,cell54_out_vld,cell53_out_vld,cell55_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell65(cell65_out,cell65_out_vld,stall_vld,cell55_out,cell56_out,cell55_out_vld,cell54_out_vld,cell56_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell66(cell66_out,cell66_out_vld,stall_vld,cell56_out,cell57_out,cell56_out_vld,cell55_out_vld,cell57_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell67(cell67_out,cell67_out_vld,stall_vld,cell57_out,cell58_out,cell57_out_vld,cell56_out_vld,cell58_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell68(cell68_out,cell68_out_vld,stall_vld,cell58_out,cell59_out,cell58_out_vld,cell57_out_vld,cell59_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell69(cell69_out,cell69_out_vld,stall_vld,cell59_out,cell5a_out,cell59_out_vld,cell58_out_vld,cell5a_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell6a(cell6a_out,cell6a_out_vld,stall_vld,cell5a_out,8'b0,cell5a_out_vld,cell59_out_vld,1'b0,clk_dwt,w1,rst,rst_syn);
                                          
u_jp2k_1 u_cell70(cell70_out,cell70_out_vld,stall_vld,cell60_out,cell61_out,cell60_out_vld,1'b1,cell61_out_vld,clk_dwt,w1,rst,rst_syn); 
u_jp2k_1 u_cell71(cell71_out,cell71_out_vld,stall_vld,cell61_out,cell62_out,cell61_out_vld,cell60_out_vld,cell62_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell72(cell72_out,cell72_out_vld,stall_vld,cell62_out,cell63_out,cell62_out_vld,cell61_out_vld,cell63_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell73(cell73_out,cell73_out_vld,stall_vld,cell63_out,cell64_out,cell63_out_vld,cell62_out_vld,cell64_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell74(cell74_out,cell74_out_vld,stall_vld,cell64_out,cell65_out,cell64_out_vld,cell63_out_vld,cell65_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell75(cell75_out,cell75_out_vld,stall_vld,cell65_out,cell66_out,cell65_out_vld,cell64_out_vld,cell66_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell76(cell76_out,cell76_out_vld,stall_vld,cell66_out,cell67_out,cell66_out_vld,cell65_out_vld,cell67_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell77(cell77_out,cell77_out_vld,stall_vld,cell67_out,cell68_out,cell67_out_vld,cell66_out_vld,cell68_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell78(cell78_out,cell78_out_vld,stall_vld,cell68_out,cell69_out,cell68_out_vld,cell67_out_vld,cell69_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell79(cell79_out,cell79_out_vld,stall_vld,cell69_out,cell6a_out,cell69_out_vld,cell68_out_vld,cell6a_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell7a(cell7a_out,cell7a_out_vld,stall_vld,cell6a_out,8'b0,cell6a_out_vld,cell69_out_vld,1'b0,clk_dwt,w1,rst,rst_syn);
                                             
u_jp2k_1 u_cell80(cell80_out,cell80_out_vld,stall_vld,cell70_out,cell71_out,cell70_out_vld,1'b1,cell71_out_vld,clk_dwt,w1,rst,rst_syn);    
u_jp2k_1 u_cell81(cell81_out,cell81_out_vld,stall_vld,cell71_out,cell72_out,cell71_out_vld,cell70_out_vld,cell72_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell82(cell82_out,cell82_out_vld,stall_vld,cell72_out,cell73_out,cell72_out_vld,cell71_out_vld,cell73_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell83(cell83_out,cell83_out_vld,stall_vld,cell73_out,cell74_out,cell73_out_vld,cell72_out_vld,cell74_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell84(cell84_out,cell84_out_vld,stall_vld,cell74_out,cell75_out,cell74_out_vld,cell73_out_vld,cell75_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell85(cell85_out,cell85_out_vld,stall_vld,cell75_out,cell76_out,cell75_out_vld,cell74_out_vld,cell76_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell86(cell86_out,cell86_out_vld,stall_vld,cell76_out,cell77_out,cell76_out_vld,cell75_out_vld,cell77_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell87(cell87_out,cell87_out_vld,stall_vld,cell77_out,cell78_out,cell77_out_vld,cell76_out_vld,cell78_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell88(cell88_out,cell88_out_vld,stall_vld,cell78_out,cell79_out,cell78_out_vld,cell77_out_vld,cell79_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell89(cell89_out,cell89_out_vld,stall_vld,cell79_out,cell7a_out,cell79_out_vld,cell78_out_vld,cell7a_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell8a(cell8a_out,cell8a_out_vld,stall_vld,cell7a_out,8'b0,cell7a_out_vld,cell79_out_vld,1'b0,clk_dwt,w1,rst,rst_syn);
                                          
u_jp2k_1 u_cell90(cell90_out,cell90_out_vld,stall_vld,cell80_out,cell81_out,cell80_out_vld,1'b1,cell81_out_vld,clk_dwt,w1,rst,rst_syn); 
u_jp2k_1 u_cell91(cell91_out,cell91_out_vld,stall_vld,cell81_out,cell82_out,cell81_out_vld,cell80_out_vld,cell82_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell92(cell92_out,cell92_out_vld,stall_vld,cell82_out,cell83_out,cell82_out_vld,cell81_out_vld,cell83_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell93(cell93_out,cell93_out_vld,stall_vld,cell83_out,cell84_out,cell83_out_vld,cell82_out_vld,cell84_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell94(cell94_out,cell94_out_vld,stall_vld,cell84_out,cell85_out,cell84_out_vld,cell83_out_vld,cell85_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell95(cell95_out,cell95_out_vld,stall_vld,cell85_out,cell86_out,cell85_out_vld,cell84_out_vld,cell86_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell96(cell96_out,cell96_out_vld,stall_vld,cell86_out,cell87_out,cell86_out_vld,cell85_out_vld,cell87_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell97(cell97_out,cell97_out_vld,stall_vld,cell87_out,cell88_out,cell87_out_vld,cell86_out_vld,cell88_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell98(cell98_out,cell98_out_vld,stall_vld,cell88_out,cell89_out,cell88_out_vld,cell87_out_vld,cell89_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell99(cell99_out,cell99_out_vld,stall_vld,cell89_out,cell8a_out,cell89_out_vld,cell88_out_vld,cell8a_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cell9a(cell9a_out,cell9a_out_vld,stall_vld,cell8a_out,8'b0,cell8a_out_vld,cell89_out_vld,1'b0,clk_dwt,w1,rst,rst_syn);
                             
u_jp2k_1 u_cella0(cella0_out,cella0_out_vld,stall_vld,cell90_out,cell91_out,cell90_out_vld,1'b1,cell91_out_vld,clk_dwt,w1,rst,rst_syn);  
u_jp2k_1 u_cella1(cella1_out,cella1_out_vld,stall_vld,cell91_out,cell92_out,cell91_out_vld,cell90_out_vld,cell92_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cella2(cella2_out,cella2_out_vld,stall_vld,cell92_out,cell93_out,cell92_out_vld,cell91_out_vld,cell93_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cella3(cella3_out,cella3_out_vld,stall_vld,cell93_out,cell94_out,cell93_out_vld,cell92_out_vld,cell94_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cella4(cella4_out,cella4_out_vld,stall_vld,cell94_out,cell95_out,cell94_out_vld,cell93_out_vld,cell95_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cella5(cella5_out,cella5_out_vld,stall_vld,cell95_out,cell96_out,cell95_out_vld,cell94_out_vld,cell96_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cella6(cella6_out,cella6_out_vld,stall_vld,cell96_out,cell97_out,cell96_out_vld,cell95_out_vld,cell97_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cella7(cella7_out,cella7_out_vld,stall_vld,cell97_out,cell98_out,cell97_out_vld,cell96_out_vld,cell98_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cella8(cella8_out,cella8_out_vld,stall_vld,cell98_out,cell99_out,cell98_out_vld,cell97_out_vld,cell99_out_vld,clk_dwt,w1,rst,rst_syn);
u_jp2k_1 u_cella9(cella9_out,cella9_out_vld,stall_vld,cell99_out,cell9a_out,cell99_out_vld,cell98_out_vld,cell9a_out_vld,clk_dwt,w1,rst,rst_syn);
		   
reg bpc_start_flag_delay_1;
reg bpc_start_flag_delay_2;
reg bpc_start_flag_delay_3;
reg pass_error_start;

always @(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		bpc_start_flag_delay_1 <=1'b0;
		bpc_start_flag_delay_2 <=1'b0;
		bpc_start_flag_delay_3 <=1'b0;
		pass_error_start <=1'b0;
	end
	else if(rst_syn)begin
		bpc_start_flag_delay_1 <=1'b0;
		bpc_start_flag_delay_2 <=1'b0;
		bpc_start_flag_delay_3 <=1'b0;
		pass_error_start <=1'b0;
	end
	else if(w1==1'b1)begin
		if(stall_vld==1'b0) begin
			bpc_start_flag_delay_1 <=bpc_start_flag;
			bpc_start_flag_delay_2 <=bpc_start_flag_delay_1;
			bpc_start_flag_delay_3 <=bpc_start_flag_delay_2;
			pass_error_start <=bpc_start_flag_delay_3;
		end
	end
end

endmodule


