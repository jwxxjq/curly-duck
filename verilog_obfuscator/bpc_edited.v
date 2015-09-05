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

reg aDkQEysUQMjSKApaeshi;
always@(posedge clk_dwt or negedge rst)
	begin
		if(!rst)
			aDkQEysUQMjSKApaeshi<=0;
		else if(rst_syn)
			aDkQEysUQMjSKApaeshi<=0;
		else 	
			aDkQEysUQMjSKApaeshi<=clk_bpc;
	end
wire TLXWChymSkORZZFunpRb=((aDkQEysUQMjSKApaeshi==1'b0)&&(clk_bpc==1'b1))?1'b1:1'b0;
reg[1:0] FuMFDshlwPAZNriIzdKA;
reg[1:0] MvoDJNLygtRbAIwfXVCr;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		FuMFDshlwPAZNriIzdKA <= 2'b0;
	end
	else if(rst_syn)begin
		FuMFDshlwPAZNriIzdKA <= 2'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		FuMFDshlwPAZNriIzdKA <= MvoDJNLygtRbAIwfXVCr;
	end
 end 

reg [5:0] BkRGIkRgfMqWorhMRKFM;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		BkRGIkRgfMqWorhMRKFM <= 6'b0;
	end
	else if(rst_syn)begin
		BkRGIkRgfMqWorhMRKFM <= 6'b0;
	end	
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if((FuMFDshlwPAZNriIzdKA!=2'b00)&&(stall_vld==1'b0)) begin
			BkRGIkRgfMqWorhMRKFM <= BkRGIkRgfMqWorhMRKFM + 1'b1;
		end
	end
end  
  
reg [3:0] wmEBGiAYKWjrjZxZfGew;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		wmEBGiAYKWjrjZxZfGew <= 4'b0;
	end
	else if(rst_syn)begin
		wmEBGiAYKWjrjZxZfGew <= 4'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(FuMFDshlwPAZNriIzdKA == 2'b01) begin
			wmEBGiAYKWjrjZxZfGew <= wmEBGiAYKWjrjZxZfGew + 1;
		end
		else begin
			wmEBGiAYKWjrjZxZfGew <= 4'b0;
		end
	end
end  
always@(*) begin
  MvoDJNLygtRbAIwfXVCr = FuMFDshlwPAZNriIzdKA;
  case(FuMFDshlwPAZNriIzdKA)
    2'b00: begin
      if(bpc_start_flag == 1'b1) begin
        MvoDJNLygtRbAIwfXVCr = 2'b01; 
      end
    end 
    2'b01: begin
      if(wmEBGiAYKWjrjZxZfGew == 4'b1110) begin
        MvoDJNLygtRbAIwfXVCr = 2'b10;    
      end
    end
    2'b10: begin
      if(code_over_flag == 1'b1) begin
        MvoDJNLygtRbAIwfXVCr = 2'b00;
      end
    end
    default: begin
      MvoDJNLygtRbAIwfXVCr = FuMFDshlwPAZNriIzdKA;
    end
  endcase
end

wire jMCVmjFKEszeMFGJPhDT;
assign jMCVmjFKEszeMFGJPhDT = (FuMFDshlwPAZNriIzdKA == 2'b10);
	 
reg [2:0] CxvpyAhqMqQXTLpXgdOB;
reg [2:0] JBFuaKfGSzMztOCsXGjt;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		CxvpyAhqMqQXTLpXgdOB <= 3'b0;
		JBFuaKfGSzMztOCsXGjt <= 3'b0;
	end
	else if(rst_syn)begin
		CxvpyAhqMqQXTLpXgdOB <= 3'b0;
		JBFuaKfGSzMztOCsXGjt <= 3'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
			CxvpyAhqMqQXTLpXgdOB <= level_flag;
			JBFuaKfGSzMztOCsXGjt <= CxvpyAhqMqQXTLpXgdOB;
		end
	end
end
reg iGrqtIPPBFPUhGunhSdw;
reg CZceBwenUmhgWecdrVuw;
reg FODhltaveISdQIJPBJhJ;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		iGrqtIPPBFPUhGunhSdw <= 1'b0;
		CZceBwenUmhgWecdrVuw <= 1'b0;
		FODhltaveISdQIJPBJhJ <= 1'b0;
	end
	else if(rst_syn)begin
		iGrqtIPPBFPUhGunhSdw <= 1'b0;
		CZceBwenUmhgWecdrVuw <= 1'b0;
		FODhltaveISdQIJPBJhJ <= 1'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
			iGrqtIPPBFPUhGunhSdw <= last_stripe_vld;     
			FODhltaveISdQIJPBJhJ <= iGrqtIPPBFPUhGunhSdw;
			CZceBwenUmhgWecdrVuw <= FODhltaveISdQIJPBJhJ;
		end
	end
end
reg mBUfUweOiYOTkxaNfvqZ;
reg XCEBnusbPkduEdkiHxFK;
reg UKLUuuVquDsMMMMhkoJV;
reg LkKGICfCcYyYLBJKtucQ;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		mBUfUweOiYOTkxaNfvqZ<=1'b0;
		UKLUuuVquDsMMMMhkoJV <= 1'b0;
		LkKGICfCcYyYLBJKtucQ <= 1'b0;
		XCEBnusbPkduEdkiHxFK <= 1'b0;
	end
	else if(rst_syn)begin
		mBUfUweOiYOTkxaNfvqZ<=1'b0;
		UKLUuuVquDsMMMMhkoJV <= 1'b0;
		LkKGICfCcYyYLBJKtucQ <= 1'b0;
		XCEBnusbPkduEdkiHxFK <= 1'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
			mBUfUweOiYOTkxaNfvqZ<=stripe_over_flag;
			UKLUuuVquDsMMMMhkoJV <= mBUfUweOiYOTkxaNfvqZ;
			LkKGICfCcYyYLBJKtucQ <= UKLUuuVquDsMMMMhkoJV;
			XCEBnusbPkduEdkiHxFK <= LkKGICfCcYyYLBJKtucQ;
		end
	end
end
wire SupobFuabxSWuLFQTEEe;
assign SupobFuabxSWuLFQTEEe=((LkKGICfCcYyYLBJKtucQ==1'b1)&&(UKLUuuVquDsMMMMhkoJV==1'b0));
wire BUOYkUPXSUGjGnnMOiLz;
assign BUOYkUPXSUGjGnnMOiLz=((XCEBnusbPkduEdkiHxFK==1'b1)&&(LkKGICfCcYyYLBJKtucQ==1'b0));


	reg [5:0] tOmHmkYobOhcasHrvveC;
	reg [5:0] HMRNTVVBwfsQwiaIOdeu;
	reg [5:0] hGCZylpOryFfZNhxLZOH;
	reg [5:0] GVEVAzxUWjnkLWGcHbCC;
	
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    tOmHmkYobOhcasHrvveC <= 6'b0;
		HMRNTVVBwfsQwiaIOdeu <= 6'b0;
		hGCZylpOryFfZNhxLZOH <= 6'b0;
		GVEVAzxUWjnkLWGcHbCC <= 6'b0;
	end
	else if(rst_syn)begin
		tOmHmkYobOhcasHrvveC <= 6'b0;
	    HMRNTVVBwfsQwiaIOdeu <= 6'b0;
	    hGCZylpOryFfZNhxLZOH <= 6'b0;
	    GVEVAzxUWjnkLWGcHbCC <= 6'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
		    tOmHmkYobOhcasHrvveC <= {data1_state,1'b0,1'b0};  
			HMRNTVVBwfsQwiaIOdeu <= {data2_state,1'b0,1'b0};
			hGCZylpOryFfZNhxLZOH <= {data3_state,1'b0,1'b0};
			GVEVAzxUWjnkLWGcHbCC <= {data4_state,1'b0,1'b0};
		end
	end
end	
	reg [5:0] artgRMUHHAMMXysfVQxf;            
	reg [5:0] ZOkiujEkXjtpgkcONTax;
	reg [5:0] CcBPKbMCVTPpuzcHaNNl;
	reg [5:0] QcQmUnoklSTURFcjjsxj;
	
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    artgRMUHHAMMXysfVQxf <= 6'b0;
		ZOkiujEkXjtpgkcONTax <= 6'b0;
		CcBPKbMCVTPpuzcHaNNl <= 6'b0;
		QcQmUnoklSTURFcjjsxj <= 6'b0;
	end
	else if(rst_syn)begin
		artgRMUHHAMMXysfVQxf <= 6'b0;
	    ZOkiujEkXjtpgkcONTax <= 6'b0;
	    CcBPKbMCVTPpuzcHaNNl <= 6'b0;
	    QcQmUnoklSTURFcjjsxj <= 6'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
		    artgRMUHHAMMXysfVQxf <= tOmHmkYobOhcasHrvveC;
			ZOkiujEkXjtpgkcONTax <= HMRNTVVBwfsQwiaIOdeu;
			CcBPKbMCVTPpuzcHaNNl <= hGCZylpOryFfZNhxLZOH;
			QcQmUnoklSTURFcjjsxj <= GVEVAzxUWjnkLWGcHbCC;
		end
	end
end	
	reg [5:0] MQgLtHVUbOxalviVAmNV;       
	reg [5:0] qUkWgSUxlHDGwaShnpJD;
	reg [5:0] AKnQHFnRxMsayGvtbpFT;
	reg [5:0] EdvpzeTpOWEloDTnpLTm;
	
	reg [5:0] vWFpyuXCRPPETqWnXLgO;
	reg [5:0] dbsLvjpjMhdBsPiUgbjQ;
	reg [5:0] oXZLEogkFzslyJXIZmAm;
	reg [5:0] rczbRGCFDOHKNTiwObwc;
	
	reg [64:0] OHenhlDjGfxNrcoKTDTe;
	
	reg FssIYlUsXIkosBplffKR;
	reg fvbJniljSNczcXeDYDTv;
	reg uoqQSqkDyZwtvuETruXA;
	
	always@(*) begin
	    case(JBFuaKfGSzMztOCsXGjt) 
		    3'b000: begin
			    FssIYlUsXIkosBplffKR = OHenhlDjGfxNrcoKTDTe[62];
				fvbJniljSNczcXeDYDTv = OHenhlDjGfxNrcoKTDTe[63];
				uoqQSqkDyZwtvuETruXA = OHenhlDjGfxNrcoKTDTe[64];
			end
			3'b001: begin
			    FssIYlUsXIkosBplffKR = OHenhlDjGfxNrcoKTDTe[30];
				fvbJniljSNczcXeDYDTv = OHenhlDjGfxNrcoKTDTe[31];
				uoqQSqkDyZwtvuETruXA = OHenhlDjGfxNrcoKTDTe[32];
			end
			3'b010: begin
			    FssIYlUsXIkosBplffKR = OHenhlDjGfxNrcoKTDTe[14];
				fvbJniljSNczcXeDYDTv = OHenhlDjGfxNrcoKTDTe[15];
				uoqQSqkDyZwtvuETruXA = OHenhlDjGfxNrcoKTDTe[16];
			end
			3'b011: begin
			    FssIYlUsXIkosBplffKR = OHenhlDjGfxNrcoKTDTe[6];
				fvbJniljSNczcXeDYDTv = OHenhlDjGfxNrcoKTDTe[7];
				uoqQSqkDyZwtvuETruXA = OHenhlDjGfxNrcoKTDTe[8];
			end
			3'b100: begin
			    FssIYlUsXIkosBplffKR = OHenhlDjGfxNrcoKTDTe[2];
				fvbJniljSNczcXeDYDTv = OHenhlDjGfxNrcoKTDTe[3];
				uoqQSqkDyZwtvuETruXA = OHenhlDjGfxNrcoKTDTe[4];
			end
			default: begin
			  FssIYlUsXIkosBplffKR = 0;
			  fvbJniljSNczcXeDYDTv = 0;
			  uoqQSqkDyZwtvuETruXA = 0;
			end
		endcase
	end
	
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    OHenhlDjGfxNrcoKTDTe <= 65'b0;
	end
	else if(rst_syn)begin
		OHenhlDjGfxNrcoKTDTe <= 65'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b1) begin
		    OHenhlDjGfxNrcoKTDTe <= OHenhlDjGfxNrcoKTDTe;
		end
		else if(CZceBwenUmhgWecdrVuw == 1'b1) begin
		    OHenhlDjGfxNrcoKTDTe <= {OHenhlDjGfxNrcoKTDTe[63:0],1'b0};
		end
		else begin
		    OHenhlDjGfxNrcoKTDTe <= {OHenhlDjGfxNrcoKTDTe[63:0],rczbRGCFDOHKNTiwObwc[1]};   
		end
	end
end	
	
	reg AnaDOfYtVBlpyqvNRuwL;
    reg irdAYQxVjzyKmWopQQGP;
	
	
	reg daVvNjfwJBQRozThYCld;   
	reg XtrJUtwJnzBPPMzRDosc;
	reg jqYKkScMbgeCDBlepdvg;
	reg XLyxVCsTIgAfoCPtSMys;
	always@(*) begin
	    if((SupobFuabxSWuLFQTEEe == 1'b1)||((AnaDOfYtVBlpyqvNRuwL==1'b1)&&(irdAYQxVjzyKmWopQQGP==1'b0))) begin    
		    daVvNjfwJBQRozThYCld = (artgRMUHHAMMXysfVQxf[2] == 1'b0)? (fvbJniljSNczcXeDYDTv||uoqQSqkDyZwtvuETruXA||MQgLtHVUbOxalviVAmNV[1]||qUkWgSUxlHDGwaShnpJD[1]||ZOkiujEkXjtpgkcONTax[2]):1'b0;
		end
		else if(BUOYkUPXSUGjGnnMOiLz == 1'b1) begin                                  
		    daVvNjfwJBQRozThYCld = (artgRMUHHAMMXysfVQxf[2] == 1'b0)? (FssIYlUsXIkosBplffKR||fvbJniljSNczcXeDYDTv||tOmHmkYobOhcasHrvveC[2]||HMRNTVVBwfsQwiaIOdeu[2]||ZOkiujEkXjtpgkcONTax[2]):1'b0;
		end
		else begin  
		    daVvNjfwJBQRozThYCld = (artgRMUHHAMMXysfVQxf[2] == 1'b0)? (FssIYlUsXIkosBplffKR||fvbJniljSNczcXeDYDTv||uoqQSqkDyZwtvuETruXA||tOmHmkYobOhcasHrvveC[2]||HMRNTVVBwfsQwiaIOdeu[2]||ZOkiujEkXjtpgkcONTax[2]||MQgLtHVUbOxalviVAmNV[1]||qUkWgSUxlHDGwaShnpJD[1]||ZOkiujEkXjtpgkcONTax[2]):1'b0;
		end
	end
	
	always@(*) begin
	    if((SupobFuabxSWuLFQTEEe == 1'b1)||((AnaDOfYtVBlpyqvNRuwL==1'b1)&&(irdAYQxVjzyKmWopQQGP==1'b0))) begin
		    XtrJUtwJnzBPPMzRDosc = (ZOkiujEkXjtpgkcONTax[2] == 1'b0)? ((artgRMUHHAMMXysfVQxf[2]^(daVvNjfwJBQRozThYCld&&artgRMUHHAMMXysfVQxf[4]))||MQgLtHVUbOxalviVAmNV[1]||qUkWgSUxlHDGwaShnpJD[1]||AKnQHFnRxMsayGvtbpFT[1]||CcBPKbMCVTPpuzcHaNNl[2]):1'b0;    
		end
		else if(BUOYkUPXSUGjGnnMOiLz == 1'b1) begin
		    XtrJUtwJnzBPPMzRDosc = (ZOkiujEkXjtpgkcONTax[2] == 1'b0)? ((artgRMUHHAMMXysfVQxf[2]^(daVvNjfwJBQRozThYCld&&artgRMUHHAMMXysfVQxf[4]))||tOmHmkYobOhcasHrvveC[2]||HMRNTVVBwfsQwiaIOdeu[2]||hGCZylpOryFfZNhxLZOH[2]||CcBPKbMCVTPpuzcHaNNl[2]):1'b0;
		end
		else begin
		    XtrJUtwJnzBPPMzRDosc = (ZOkiujEkXjtpgkcONTax[2] == 1'b0)? (tOmHmkYobOhcasHrvveC[2]||HMRNTVVBwfsQwiaIOdeu[2]||hGCZylpOryFfZNhxLZOH[2]||(artgRMUHHAMMXysfVQxf[2]^(daVvNjfwJBQRozThYCld&&artgRMUHHAMMXysfVQxf[4]))||CcBPKbMCVTPpuzcHaNNl[2]||MQgLtHVUbOxalviVAmNV[1]||qUkWgSUxlHDGwaShnpJD[1]||AKnQHFnRxMsayGvtbpFT[1]):1'b0;
		end                                                   
	end
	
	always@(*) begin
	    if((SupobFuabxSWuLFQTEEe == 1'b1)||((AnaDOfYtVBlpyqvNRuwL==1'b1)&&(irdAYQxVjzyKmWopQQGP==1'b0))) begin
		    jqYKkScMbgeCDBlepdvg = (CcBPKbMCVTPpuzcHaNNl[2] == 1'b0)? ((ZOkiujEkXjtpgkcONTax[2]^(XtrJUtwJnzBPPMzRDosc&&ZOkiujEkXjtpgkcONTax[4]))||qUkWgSUxlHDGwaShnpJD[1]||AKnQHFnRxMsayGvtbpFT[1]||EdvpzeTpOWEloDTnpLTm[1]||QcQmUnoklSTURFcjjsxj[2]):1'b0;
		end
		else if(BUOYkUPXSUGjGnnMOiLz == 1'b1) begin
		    jqYKkScMbgeCDBlepdvg = (CcBPKbMCVTPpuzcHaNNl[2] == 1'b0)? ((ZOkiujEkXjtpgkcONTax[2]^(XtrJUtwJnzBPPMzRDosc&&ZOkiujEkXjtpgkcONTax[4]))||HMRNTVVBwfsQwiaIOdeu[2]||hGCZylpOryFfZNhxLZOH[2]||GVEVAzxUWjnkLWGcHbCC[2]||QcQmUnoklSTURFcjjsxj[2]):1'b0;
		end
		else begin
		    jqYKkScMbgeCDBlepdvg = (CcBPKbMCVTPpuzcHaNNl[2] == 1'b0)? (HMRNTVVBwfsQwiaIOdeu[2]||hGCZylpOryFfZNhxLZOH[2]||GVEVAzxUWjnkLWGcHbCC[2]||(ZOkiujEkXjtpgkcONTax[2]^(XtrJUtwJnzBPPMzRDosc&&ZOkiujEkXjtpgkcONTax[4]))||QcQmUnoklSTURFcjjsxj[2]||qUkWgSUxlHDGwaShnpJD[1]||AKnQHFnRxMsayGvtbpFT[1]||EdvpzeTpOWEloDTnpLTm[1]):1'b0;
		end
	end
	
	always@(*) begin
	    if((SupobFuabxSWuLFQTEEe == 1'b1)||((AnaDOfYtVBlpyqvNRuwL==1'b1)&&(irdAYQxVjzyKmWopQQGP==1'b0)))begin
		    XLyxVCsTIgAfoCPtSMys = (QcQmUnoklSTURFcjjsxj[2] == 1'b0)? ((CcBPKbMCVTPpuzcHaNNl[2]^(jqYKkScMbgeCDBlepdvg&&CcBPKbMCVTPpuzcHaNNl[4]))||AKnQHFnRxMsayGvtbpFT[1]||EdvpzeTpOWEloDTnpLTm[1]):1'b0;
		end
		else if(BUOYkUPXSUGjGnnMOiLz == 1'b1) begin
		    XLyxVCsTIgAfoCPtSMys = (QcQmUnoklSTURFcjjsxj[2] == 1'b0)? ((CcBPKbMCVTPpuzcHaNNl[2]^(jqYKkScMbgeCDBlepdvg&&CcBPKbMCVTPpuzcHaNNl[4]))||hGCZylpOryFfZNhxLZOH[2]||GVEVAzxUWjnkLWGcHbCC[2]):1'b0;
		end
		else begin
		    XLyxVCsTIgAfoCPtSMys = (QcQmUnoklSTURFcjjsxj[2] == 1'b0)? (hGCZylpOryFfZNhxLZOH[2]||GVEVAzxUWjnkLWGcHbCC[2]||(CcBPKbMCVTPpuzcHaNNl[2]^(jqYKkScMbgeCDBlepdvg&&CcBPKbMCVTPpuzcHaNNl[4]))||AKnQHFnRxMsayGvtbpFT[1]||EdvpzeTpOWEloDTnpLTm[1]):1'b0;
		end
	end
	
	always@(*) begin
	    vWFpyuXCRPPETqWnXLgO = {artgRMUHHAMMXysfVQxf[5:2],(artgRMUHHAMMXysfVQxf[2]^(daVvNjfwJBQRozThYCld&&artgRMUHHAMMXysfVQxf[4])),artgRMUHHAMMXysfVQxf[0]};
		dbsLvjpjMhdBsPiUgbjQ = {ZOkiujEkXjtpgkcONTax[5:2],(ZOkiujEkXjtpgkcONTax[2]^(XtrJUtwJnzBPPMzRDosc&&ZOkiujEkXjtpgkcONTax[4])),ZOkiujEkXjtpgkcONTax[0]};
		oXZLEogkFzslyJXIZmAm = {CcBPKbMCVTPpuzcHaNNl[5:2],(CcBPKbMCVTPpuzcHaNNl[2]^(jqYKkScMbgeCDBlepdvg&&CcBPKbMCVTPpuzcHaNNl[4])),CcBPKbMCVTPpuzcHaNNl[0]};
		rczbRGCFDOHKNTiwObwc = {QcQmUnoklSTURFcjjsxj[5:2],(QcQmUnoklSTURFcjjsxj[2]^(XLyxVCsTIgAfoCPtSMys&&QcQmUnoklSTURFcjjsxj[4])),QcQmUnoklSTURFcjjsxj[0]};
	end

always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    MQgLtHVUbOxalviVAmNV <= 6'b0;
		qUkWgSUxlHDGwaShnpJD <= 6'b0;
		AKnQHFnRxMsayGvtbpFT <= 6'b0;
		EdvpzeTpOWEloDTnpLTm <= 6'b0;
	end
	else if(rst_syn)begin
		MQgLtHVUbOxalviVAmNV <= 6'b0;
	    qUkWgSUxlHDGwaShnpJD <= 6'b0;
	    AKnQHFnRxMsayGvtbpFT <= 6'b0;
	    EdvpzeTpOWEloDTnpLTm <= 6'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
		    MQgLtHVUbOxalviVAmNV <= vWFpyuXCRPPETqWnXLgO;
			qUkWgSUxlHDGwaShnpJD <= dbsLvjpjMhdBsPiUgbjQ;
			AKnQHFnRxMsayGvtbpFT <= oXZLEogkFzslyJXIZmAm;
			EdvpzeTpOWEloDTnpLTm <= rczbRGCFDOHKNTiwObwc;
		end
	end
end
	
		
	reg [2:0] lWqhFaXBuamUEhaBVHlv;
	reg [2:0] hmffJQzxHvHfRtTBYuLG;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    lWqhFaXBuamUEhaBVHlv <= 3'b0;
		hmffJQzxHvHfRtTBYuLG <= 3'b0;
	end
	else if(rst_syn)begin
	    lWqhFaXBuamUEhaBVHlv <= 3'b0;	
		hmffJQzxHvHfRtTBYuLG <= 3'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
		    lWqhFaXBuamUEhaBVHlv <= JBFuaKfGSzMztOCsXGjt;
			hmffJQzxHvHfRtTBYuLG <= lWqhFaXBuamUEhaBVHlv;
		end
	end
end	
	reg lIKIHcrXqqitoXmnGNEo;
	reg aCMoPRLpCvfufIiJIMUN;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    aCMoPRLpCvfufIiJIMUN <= 1'b0;
	    lIKIHcrXqqitoXmnGNEo <= 1'b0;
	end
	else if(rst_syn)begin
		aCMoPRLpCvfufIiJIMUN <= 1'b0;
	    lIKIHcrXqqitoXmnGNEo <= 1'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
		    aCMoPRLpCvfufIiJIMUN <= XCEBnusbPkduEdkiHxFK;
		    lIKIHcrXqqitoXmnGNEo <= aCMoPRLpCvfufIiJIMUN;
		end
	end
end	
	wire xHcIMfHkmMZNUCUTGLMh;
	assign xHcIMfHkmMZNUCUTGLMh=((aCMoPRLpCvfufIiJIMUN==1'b1)&&(lIKIHcrXqqitoXmnGNEo==1'b0));
	
	wire ZcufvwoxlnHUTxvmYMrL;
	assign ZcufvwoxlnHUTxvmYMrL=((lIKIHcrXqqitoXmnGNEo==1'b1)&&(aCMoPRLpCvfufIiJIMUN==1'b0));
	
	reg cugZMcaJXKNhJFIYdVSG;
	reg qgkpXRmlTwkWNutDGWMM;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    cugZMcaJXKNhJFIYdVSG <= 1'b0;
		qgkpXRmlTwkWNutDGWMM <= 1'b0;
	end
	else if(rst_syn)begin
		cugZMcaJXKNhJFIYdVSG <= 1'b0;
	    qgkpXRmlTwkWNutDGWMM <= 1'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
		    cugZMcaJXKNhJFIYdVSG <= CZceBwenUmhgWecdrVuw;
			qgkpXRmlTwkWNutDGWMM <= cugZMcaJXKNhJFIYdVSG;
		end
	end
end	
	reg [5:0] GVfnzKKftzXfxeBqPQMD;
	reg [5:0] wlenGNqnzNDsKYuoUEFs;
	reg [5:0] WVoNBXVHcnpPnosVQmql;
	reg [5:0] ObqqhBrMFEWIKEdpaOZE;
	
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    GVfnzKKftzXfxeBqPQMD <= 6'b0;
		wlenGNqnzNDsKYuoUEFs <= 6'b0;
		WVoNBXVHcnpPnosVQmql <= 6'b0;
		ObqqhBrMFEWIKEdpaOZE <= 6'b0;
	end
	else if(rst_syn)begin
		GVfnzKKftzXfxeBqPQMD <= 6'b0;
	    wlenGNqnzNDsKYuoUEFs <= 6'b0;
	    WVoNBXVHcnpPnosVQmql <= 6'b0;
	    ObqqhBrMFEWIKEdpaOZE <= 6'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
		    GVfnzKKftzXfxeBqPQMD <= MQgLtHVUbOxalviVAmNV;
			wlenGNqnzNDsKYuoUEFs <= qUkWgSUxlHDGwaShnpJD;
			WVoNBXVHcnpPnosVQmql <= AKnQHFnRxMsayGvtbpFT;
			ObqqhBrMFEWIKEdpaOZE <= EdvpzeTpOWEloDTnpLTm;
		end
	end
end	
	reg [5:0] xOFOFRpZSrifYYEfdruw;
	reg [5:0] pBlIpiTyRVEixJQZYAec;
	reg [5:0] dUuDxKDEFktOVDQPXOkG;
	reg [5:0] ihLJCGZZFABcRUCnaWQf;
	
	reg [5:0] FDTEmqmGIINzAjvyZUbd;
	reg [5:0] rXbXOOONFccCKhoMrsAV;
	reg [5:0] BpSCsagoCaNdVPktxOTV;
	reg [5:0] kHkrNHXiGjveuNNRJvzH;
	
	reg [64:0] FSrEVMbPHefBFwbIYvdr;
	
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    FSrEVMbPHefBFwbIYvdr <= 65'b0;
	end
	else if(rst_syn)begin
		FSrEVMbPHefBFwbIYvdr <= 65'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b1) begin
		    FSrEVMbPHefBFwbIYvdr <= FSrEVMbPHefBFwbIYvdr;
		end
		else if(qgkpXRmlTwkWNutDGWMM == 1'b1) begin
		    FSrEVMbPHefBFwbIYvdr <= {FSrEVMbPHefBFwbIYvdr[63:0],1'b0};
		end
		else begin
		    FSrEVMbPHefBFwbIYvdr <= {FSrEVMbPHefBFwbIYvdr[63:0],(ObqqhBrMFEWIKEdpaOZE[1]||ObqqhBrMFEWIKEdpaOZE[4])};        
		end
	end
end	
	reg kPRmTzDNbMypwHeWblNC;
	reg stiszqtCKxtkZisxkQUK;
	reg yWJHMVCutPkodurwdxze;
	
	always@(*) begin
	    case(hmffJQzxHvHfRtTBYuLG)
		    3'b000: begin
			    kPRmTzDNbMypwHeWblNC = FSrEVMbPHefBFwbIYvdr[62];           
			    stiszqtCKxtkZisxkQUK = FSrEVMbPHefBFwbIYvdr[63];
				yWJHMVCutPkodurwdxze = FSrEVMbPHefBFwbIYvdr[64];
			end
			3'b001: begin
			    kPRmTzDNbMypwHeWblNC = FSrEVMbPHefBFwbIYvdr[30];
			    stiszqtCKxtkZisxkQUK = FSrEVMbPHefBFwbIYvdr[31];
				yWJHMVCutPkodurwdxze = FSrEVMbPHefBFwbIYvdr[32];
			end
			3'b010: begin
			    kPRmTzDNbMypwHeWblNC = FSrEVMbPHefBFwbIYvdr[14];
			    stiszqtCKxtkZisxkQUK = FSrEVMbPHefBFwbIYvdr[15];
				yWJHMVCutPkodurwdxze = FSrEVMbPHefBFwbIYvdr[16];
			end
            3'b011: begin
			    kPRmTzDNbMypwHeWblNC = FSrEVMbPHefBFwbIYvdr[6];
			    stiszqtCKxtkZisxkQUK = FSrEVMbPHefBFwbIYvdr[7];
				yWJHMVCutPkodurwdxze = FSrEVMbPHefBFwbIYvdr[8];
			end	
			3'b100: begin
			    kPRmTzDNbMypwHeWblNC = FSrEVMbPHefBFwbIYvdr[2];
			    stiszqtCKxtkZisxkQUK = FSrEVMbPHefBFwbIYvdr[3];
				yWJHMVCutPkodurwdxze = FSrEVMbPHefBFwbIYvdr[4];
			end	
			default: begin
			    kPRmTzDNbMypwHeWblNC = 1'b0;  
			    stiszqtCKxtkZisxkQUK = 1'b0;
				yWJHMVCutPkodurwdxze = 1'b0;
			end
		endcase
	end
	
	always@(*) begin
	    FDTEmqmGIINzAjvyZUbd = {GVfnzKKftzXfxeBqPQMD[5:1],(GVfnzKKftzXfxeBqPQMD[1]||GVfnzKKftzXfxeBqPQMD[4])};  
		rXbXOOONFccCKhoMrsAV = {wlenGNqnzNDsKYuoUEFs[5:1],(wlenGNqnzNDsKYuoUEFs[1]||wlenGNqnzNDsKYuoUEFs[4])};
		BpSCsagoCaNdVPktxOTV = {WVoNBXVHcnpPnosVQmql[5:1],(WVoNBXVHcnpPnosVQmql[1]||WVoNBXVHcnpPnosVQmql[4])};
		kHkrNHXiGjveuNNRJvzH = {ObqqhBrMFEWIKEdpaOZE[5:1],(ObqqhBrMFEWIKEdpaOZE[1]||ObqqhBrMFEWIKEdpaOZE[4])};
	end
	
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    xOFOFRpZSrifYYEfdruw <= 6'b0;
		pBlIpiTyRVEixJQZYAec <= 6'b0;
		dUuDxKDEFktOVDQPXOkG <= 6'b0;
		ihLJCGZZFABcRUCnaWQf <= 6'b0;
	end
	else if(rst_syn)begin
		xOFOFRpZSrifYYEfdruw <= 6'b0;
		pBlIpiTyRVEixJQZYAec <= 6'b0;
	    dUuDxKDEFktOVDQPXOkG <= 6'b0;
	    ihLJCGZZFABcRUCnaWQf <= 6'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
		    xOFOFRpZSrifYYEfdruw <= FDTEmqmGIINzAjvyZUbd;
			pBlIpiTyRVEixJQZYAec <= rXbXOOONFccCKhoMrsAV;
			dUuDxKDEFktOVDQPXOkG <= BpSCsagoCaNdVPktxOTV;
			ihLJCGZZFABcRUCnaWQf <= kHkrNHXiGjveuNNRJvzH;
		end
	end
end
	wire bit1_add_vld;
	wire bit2_add_vld;
	wire bit3_add_vld;
	wire bit4_add_vld;
	
	assign bit1_add_vld= xOFOFRpZSrifYYEfdruw[4];
	assign bit2_add_vld= pBlIpiTyRVEixJQZYAec[4];
	assign bit3_add_vld= dUuDxKDEFktOVDQPXOkG[4];
	assign bit4_add_vld= ihLJCGZZFABcRUCnaWQf[4];
	
	
	reg xHakCVQlOGnlmBNRbOYh;
	reg AMpFUyPXvTDKXOABcGwQ;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    xHakCVQlOGnlmBNRbOYh <= 1'b0;
		AMpFUyPXvTDKXOABcGwQ <= 1'b0;
	end
	else if(rst_syn)begin
		xHakCVQlOGnlmBNRbOYh <= 1'b0;
	    AMpFUyPXvTDKXOABcGwQ <= 1'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
		    xHakCVQlOGnlmBNRbOYh <= FssIYlUsXIkosBplffKR;
			AMpFUyPXvTDKXOABcGwQ <= xHakCVQlOGnlmBNRbOYh;  
		end
	end
end	
	reg UOxuLGtcikggvdOQzBgR;
	reg CsQkcOiTiBTyncfufXZj;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    UOxuLGtcikggvdOQzBgR <= 1'b0;
		CsQkcOiTiBTyncfufXZj <= 1'b0;
	end
	else if(rst_syn)begin
		UOxuLGtcikggvdOQzBgR <= 1'b0;
	    CsQkcOiTiBTyncfufXZj <= 1'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
		    UOxuLGtcikggvdOQzBgR <= fvbJniljSNczcXeDYDTv;
			CsQkcOiTiBTyncfufXZj <= UOxuLGtcikggvdOQzBgR;    
		end
	end
end	
	reg FVnQDQCjxSIKkHAsHNWV;
	reg KdoJZktdmkwWBKlDvMdP;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
	    FVnQDQCjxSIKkHAsHNWV <= 1'b0;
		KdoJZktdmkwWBKlDvMdP <= 1'b0;
	end
	else if(rst_syn)begin
		FVnQDQCjxSIKkHAsHNWV <= 1'b0;
	    KdoJZktdmkwWBKlDvMdP <= 1'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
		    FVnQDQCjxSIKkHAsHNWV <= uoqQSqkDyZwtvuETruXA;
			KdoJZktdmkwWBKlDvMdP <= FVnQDQCjxSIKkHAsHNWV;   
		end
	end
end	

reg RaOIZijTYDmTjRjxwtQu;
reg ScyRLdqxTkIfrAjHfyCe;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		RaOIZijTYDmTjRjxwtQu <= 1'b0;
		ScyRLdqxTkIfrAjHfyCe <= 1'b0;
	end
	else if(rst_syn)begin
		RaOIZijTYDmTjRjxwtQu <= 1'b0;
		ScyRLdqxTkIfrAjHfyCe <= 1'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
			RaOIZijTYDmTjRjxwtQu <= daVvNjfwJBQRozThYCld;
			ScyRLdqxTkIfrAjHfyCe <= RaOIZijTYDmTjRjxwtQu;  
		end
	end
end
reg CmTwcTuqlNWMMZwUGiRl;
reg ukbTnNDbmRSfKKceUWrz;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		CmTwcTuqlNWMMZwUGiRl <= 1'b0;
		ukbTnNDbmRSfKKceUWrz <= 1'b0;
	end
	else if(rst_syn)begin
		CmTwcTuqlNWMMZwUGiRl <= 1'b0;
		ukbTnNDbmRSfKKceUWrz <= 1'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
			CmTwcTuqlNWMMZwUGiRl <= XtrJUtwJnzBPPMzRDosc;
			ukbTnNDbmRSfKKceUWrz <= CmTwcTuqlNWMMZwUGiRl;
		end
	end
end
reg UZIbEQrMAwaDCzVroLtq;
reg IjiwjVZQiEWuSfonIrZA;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		UZIbEQrMAwaDCzVroLtq <= 1'b0;
		IjiwjVZQiEWuSfonIrZA <= 1'b0;
	end
	else if(rst_syn)begin
		UZIbEQrMAwaDCzVroLtq <= 1'b0;
		IjiwjVZQiEWuSfonIrZA <= 1'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
			UZIbEQrMAwaDCzVroLtq <= jqYKkScMbgeCDBlepdvg;
			IjiwjVZQiEWuSfonIrZA <= UZIbEQrMAwaDCzVroLtq;
		end
	end
end
reg WbcSSJNDDnHYmQYuzLPQ;
reg PJhNpCthKhZROimGgCqU;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		WbcSSJNDDnHYmQYuzLPQ <= 1'b0;
		PJhNpCthKhZROimGgCqU <= 1'b0;
	end
	else if(rst_syn)begin
		WbcSSJNDDnHYmQYuzLPQ <= 1'b0;
		PJhNpCthKhZROimGgCqU <= 1'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
			WbcSSJNDDnHYmQYuzLPQ <= XLyxVCsTIgAfoCPtSMys;
			PJhNpCthKhZROimGgCqU <= WbcSSJNDDnHYmQYuzLPQ;
		end
	end
end
reg [63:0] iJscfdFCjPBfcKkSZVbf;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		iJscfdFCjPBfcKkSZVbf <= 64'b0;
	end
	else if(rst_syn)begin
		iJscfdFCjPBfcKkSZVbf <= 64'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b1) begin
			iJscfdFCjPBfcKkSZVbf <= iJscfdFCjPBfcKkSZVbf;
		end
		else if(qgkpXRmlTwkWNutDGWMM == 1'b1) begin
			iJscfdFCjPBfcKkSZVbf <= {iJscfdFCjPBfcKkSZVbf[62:0],1'b0};
		end
		else begin
			iJscfdFCjPBfcKkSZVbf <= {iJscfdFCjPBfcKkSZVbf[62:0],ObqqhBrMFEWIKEdpaOZE[5]}; 
		end
	end
end
reg hvcQnhbMPIYQRfXPtdaK;

always@(*) begin
    case(hmffJQzxHvHfRtTBYuLG)
	    3'b000: begin
			hvcQnhbMPIYQRfXPtdaK = iJscfdFCjPBfcKkSZVbf[63];
		end
		3'b001: begin
			hvcQnhbMPIYQRfXPtdaK = iJscfdFCjPBfcKkSZVbf[31];
		end
		3'b010: begin
			hvcQnhbMPIYQRfXPtdaK = iJscfdFCjPBfcKkSZVbf[15];
		end
		3'b011: begin
			hvcQnhbMPIYQRfXPtdaK = iJscfdFCjPBfcKkSZVbf[7];
		end
		3'b100: begin
			hvcQnhbMPIYQRfXPtdaK = iJscfdFCjPBfcKkSZVbf[3];
		end
		default: begin
			hvcQnhbMPIYQRfXPtdaK = 0;
		end
	endcase
end

wire [5:0] nUcvoGMUQAyFvkkNKtjY;
wire [5:0] dsqvhOxPSNmrxhIMFonB;
wire [5:0] FtmPDiwqoZcWFUaAxCkO;
wire [5:0] vNwqhqUgvKlnIAxSJzvz;

wire [5:0] ZOtXbSepnanqtWVZDuyz;
wire [5:0] mtxvjxcqPDeqRFTdOeCy;
wire [5:0] hJRUqkSdbIbaDoVNyBwV;
wire [5:0] vyNQySISFoomjfGcZIij;

wire [5:0] yTGSjqlPczasLIzerqoK;
wire [5:0] nfEXnqhiCOkZzjflZjMq;
wire [5:0] DvTzkZIPCHcTKThgKbxF;
wire [5:0] efILpTiRRkTMGybaFavH;

wire [5:0] XKEboOlymZUysNbdgYvz;
wire [5:0] YnUHFWqMbTwhpriTzfCj;
wire [5:0] EKkouikFTiQAhxGiNBgA;
wire mxUXarOdzFVqEXRyKhvn;
wire EakVkLNuSPmYJvnabwQm;

reg iOLMSFRCeFMeGsFMvGQL;
reg PZQyCgBFWGoAxEUyiNzO;
reg DIvaAYGARSychJVfuaHY;
reg wSCAowmKMCzIwDDaXfFU;

reg yXFXdzGdxaoIkmFBQQEg;
reg MWUPIctWCOwXGGiHpLLf;
reg KenTZnwjdIMALELIKQKk;
reg zEUqlZLBLdpXOXXjPGcU;

reg AnjBJxnRNvrmjOYaJdbg;
reg QBOAjUdMyIByZKpqyMhL;
reg jwJehzFhoYfRjtxXBfpX;
reg GQGskmRcyBxJqfiLqYCm;

wire LCnqDiWxDusKfEkYTayX;
wire tbXyWvHmtBVltKRkWupt;
wire vGfKaMkyzbfLNzVNKFuM;
wire FvqlLSYAEuUqbqBPjrJy;

assign LCnqDiWxDusKfEkYTayX = ((GVfnzKKftzXfxeBqPQMD[4]==1'b1)&&(GVfnzKKftzXfxeBqPQMD[2]==1'b0));
assign tbXyWvHmtBVltKRkWupt = ((wlenGNqnzNDsKYuoUEFs[4]==1'b1)&&(wlenGNqnzNDsKYuoUEFs[2]==1'b0));
assign vGfKaMkyzbfLNzVNKFuM = ((WVoNBXVHcnpPnosVQmql[4]==1'b1)&&(WVoNBXVHcnpPnosVQmql[2]==1'b0));
assign FvqlLSYAEuUqbqBPjrJy = ((ObqqhBrMFEWIKEdpaOZE[4]==1'b1)&&(ObqqhBrMFEWIKEdpaOZE[2]==1'b0));

always@(*) begin 
    if((ScyRLdqxTkIfrAjHfyCe == 1'b1)||((mxUXarOdzFVqEXRyKhvn == 1'b0)&&(iOLMSFRCeFMeGsFMvGQL == 1'b1))) begin   
	    AnjBJxnRNvrmjOYaJdbg = 1'b1;          
	end
	else begin
	    AnjBJxnRNvrmjOYaJdbg = 1'b0;
	end
end

always@(*) begin
    if((ukbTnNDbmRSfKKceUWrz == 1'b1)||((mxUXarOdzFVqEXRyKhvn == 1'b0)&&(PZQyCgBFWGoAxEUyiNzO == 1'b1))||((mxUXarOdzFVqEXRyKhvn == 1'b1)&&(GVfnzKKftzXfxeBqPQMD[4]==1'b1))) begin
	    QBOAjUdMyIByZKpqyMhL = 1'b1;
	end
	else begin
	    QBOAjUdMyIByZKpqyMhL = 1'b0;
	end
end

always@(*) begin
    if((IjiwjVZQiEWuSfonIrZA == 1'b1)||((mxUXarOdzFVqEXRyKhvn == 1'b0)&&(DIvaAYGARSychJVfuaHY == 1'b1))||((mxUXarOdzFVqEXRyKhvn == 1'b1)&&((GVfnzKKftzXfxeBqPQMD[4]==1'b1)||(wlenGNqnzNDsKYuoUEFs[4]==1'b1)))) begin
	    jwJehzFhoYfRjtxXBfpX = 1'b1;
	end
	else begin
	    jwJehzFhoYfRjtxXBfpX = 1'b0;
	end
end

always@(*) begin
    if((PJhNpCthKhZROimGgCqU == 1'b1)||((mxUXarOdzFVqEXRyKhvn == 1'b0)&&(wSCAowmKMCzIwDDaXfFU == 1'b1))||((mxUXarOdzFVqEXRyKhvn == 1'b1)&&((GVfnzKKftzXfxeBqPQMD[4]==1'b1)||(wlenGNqnzNDsKYuoUEFs[4]==1'b1)||(WVoNBXVHcnpPnosVQmql[4]==1'b1)))) begin
	    GQGskmRcyBxJqfiLqYCm = 1'b1;
	end
	else begin
	    GQGskmRcyBxJqfiLqYCm = 1'b0;
	end
end

always@(*) begin
    if(GVfnzKKftzXfxeBqPQMD[2] == 1'b1) begin    
	    yXFXdzGdxaoIkmFBQQEg = 1'b1;
	end
	else begin
	    yXFXdzGdxaoIkmFBQQEg = 1'b0;
	end
end

always@(*) begin
    if(wlenGNqnzNDsKYuoUEFs[2] == 1'b1) begin
	    MWUPIctWCOwXGGiHpLLf = 1'b1;
	end
	else begin
	    MWUPIctWCOwXGGiHpLLf = 1'b0;
	end
end

always@(*) begin
    if(WVoNBXVHcnpPnosVQmql[2] == 1'b1) begin
	    KenTZnwjdIMALELIKQKk = 1'b1;
	end
	else begin
	    KenTZnwjdIMALELIKQKk = 1'b0;
	end
end

always@(*) begin
    if(ObqqhBrMFEWIKEdpaOZE[2] == 1'b1) begin
	    zEUqlZLBLdpXOXXjPGcU = 1'b1;
	end
	else begin
	    zEUqlZLBLdpXOXXjPGcU = 1'b0;
	end
end

always@(*) begin
    if((ScyRLdqxTkIfrAjHfyCe == 1'b0)&&(yXFXdzGdxaoIkmFBQQEg == 1'b0)) begin    
	    iOLMSFRCeFMeGsFMvGQL = 1'b1;
	end
	else begin
	    iOLMSFRCeFMeGsFMvGQL = 1'b0;
	end
end

always@(*) begin
    if((ukbTnNDbmRSfKKceUWrz == 1'b0)&&(MWUPIctWCOwXGGiHpLLf == 1'b0)) begin
	    PZQyCgBFWGoAxEUyiNzO = 1'b1;
	end
	else begin
	    PZQyCgBFWGoAxEUyiNzO = 1'b0;
	end
end

always@(*) begin
    if((IjiwjVZQiEWuSfonIrZA == 1'b0)&&(KenTZnwjdIMALELIKQKk == 1'b0)) begin
	    DIvaAYGARSychJVfuaHY = 1'b1;
	end
	else begin
	    DIvaAYGARSychJVfuaHY = 1'b0;
	end
end

always@(*) begin
    if((PJhNpCthKhZROimGgCqU == 1'b0)&&(zEUqlZLBLdpXOXXjPGcU == 1'b0)) begin
	    wSCAowmKMCzIwDDaXfFU = 1'b1;
	end
	else begin
	    wSCAowmKMCzIwDDaXfFU = 1'b0;
	end
end

wire[2:0] pass_judge_1_d;
wire[2:0] pass_judge_2_d;
wire[2:0] pass_judge_3_d;
wire[2:0] pass_judge_4_d;

assign pass_judge_1_d = {iOLMSFRCeFMeGsFMvGQL,yXFXdzGdxaoIkmFBQQEg,ScyRLdqxTkIfrAjHfyCe};  
assign pass_judge_2_d = {PZQyCgBFWGoAxEUyiNzO,MWUPIctWCOwXGGiHpLLf,ukbTnNDbmRSfKKceUWrz};
assign pass_judge_3_d = {DIvaAYGARSychJVfuaHY,KenTZnwjdIMALELIKQKk,IjiwjVZQiEWuSfonIrZA};
assign pass_judge_4_d = {wSCAowmKMCzIwDDaXfFU,zEUqlZLBLdpXOXXjPGcU,PJhNpCthKhZROimGgCqU};

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
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0) begin
			pass_judge_1 <= pass_judge_1_d;
			pass_judge_2 <= pass_judge_2_d;
			pass_judge_3 <= pass_judge_3_d;
			pass_judge_4 <= pass_judge_4_d;
		end
	end
end
reg hJbnFyJCwWSCdnyKlTAP;
reg OiPTAsOnkSPKocAtfryA;
reg wPnclwjLvNTvuFBpWQxi;
reg ROCrGAVlXuhCUavzlyYo;
reg SChJApzreectmjOkIzBX;
reg RMlFbjHrYqPuugXjOloi;
reg GeDDKVWYIpzkYxFRiAby;
reg iMZueMKdVPHIdaWHnfbE;
reg LxEOjvQABcCaICwJYiyn;
reg MbwejxbltOgmKDxkKTsk;
reg tRZckyVlZtuAOtlwesoj;
reg DzkRrIwaMiNHudDvvzFi;
reg OFZazskRPRGaTQldCVvG;
reg tMINSRlmFWUealRnEpYc;

always@(*) begin
    if(ZcufvwoxlnHUTxvmYMrL == 1'b1) begin
	    hJbnFyJCwWSCdnyKlTAP = stiszqtCKxtkZisxkQUK;
		OiPTAsOnkSPKocAtfryA = 1'b0;
		wPnclwjLvNTvuFBpWQxi = kPRmTzDNbMypwHeWblNC;
		ROCrGAVlXuhCUavzlyYo = 1'b0;
		SChJApzreectmjOkIzBX = 1'b0;
		RMlFbjHrYqPuugXjOloi = 1'b0;
		GeDDKVWYIpzkYxFRiAby = MQgLtHVUbOxalviVAmNV[1];
		iMZueMKdVPHIdaWHnfbE = qUkWgSUxlHDGwaShnpJD[1];
		LxEOjvQABcCaICwJYiyn = AKnQHFnRxMsayGvtbpFT[1];
		MbwejxbltOgmKDxkKTsk = EdvpzeTpOWEloDTnpLTm[1];
		tRZckyVlZtuAOtlwesoj = 1'b0;
		DzkRrIwaMiNHudDvvzFi = 1'b0;
		OFZazskRPRGaTQldCVvG = 1'b0;
		tMINSRlmFWUealRnEpYc = 1'b0;
	end
	else if(xHcIMfHkmMZNUCUTGLMh == 1'b1) begin
	    hJbnFyJCwWSCdnyKlTAP = stiszqtCKxtkZisxkQUK;
		OiPTAsOnkSPKocAtfryA = 1'b0;
		wPnclwjLvNTvuFBpWQxi = 1'b0;
		ROCrGAVlXuhCUavzlyYo = yWJHMVCutPkodurwdxze;
		SChJApzreectmjOkIzBX = 1'b0;
		RMlFbjHrYqPuugXjOloi = 1'b0;
		GeDDKVWYIpzkYxFRiAby = 1'b0;
		iMZueMKdVPHIdaWHnfbE = 1'b0;
		LxEOjvQABcCaICwJYiyn = 1'b0;
		MbwejxbltOgmKDxkKTsk = 1'b0;
		tRZckyVlZtuAOtlwesoj = xOFOFRpZSrifYYEfdruw[0];
		DzkRrIwaMiNHudDvvzFi = pBlIpiTyRVEixJQZYAec[0];
		OFZazskRPRGaTQldCVvG = dUuDxKDEFktOVDQPXOkG[0];
		tMINSRlmFWUealRnEpYc = ihLJCGZZFABcRUCnaWQf[0];
	end
	else begin
	    hJbnFyJCwWSCdnyKlTAP = stiszqtCKxtkZisxkQUK;    
		OiPTAsOnkSPKocAtfryA = 1'b0;    
		wPnclwjLvNTvuFBpWQxi = kPRmTzDNbMypwHeWblNC;
		ROCrGAVlXuhCUavzlyYo = yWJHMVCutPkodurwdxze;   
		SChJApzreectmjOkIzBX = 1'b0;       
		RMlFbjHrYqPuugXjOloi = 1'b0;     
		GeDDKVWYIpzkYxFRiAby = MQgLtHVUbOxalviVAmNV[1];   
		iMZueMKdVPHIdaWHnfbE = qUkWgSUxlHDGwaShnpJD[1];
		LxEOjvQABcCaICwJYiyn = AKnQHFnRxMsayGvtbpFT[1];
		MbwejxbltOgmKDxkKTsk = EdvpzeTpOWEloDTnpLTm[1];
		tRZckyVlZtuAOtlwesoj = xOFOFRpZSrifYYEfdruw[0];   
		DzkRrIwaMiNHudDvvzFi = pBlIpiTyRVEixJQZYAec[0];
		OFZazskRPRGaTQldCVvG = dUuDxKDEFktOVDQPXOkG[0];
		tMINSRlmFWUealRnEpYc = ihLJCGZZFABcRUCnaWQf[0];
	end
end

reg HwMlSewLUFWHfNzcdCVz;
reg qqzWVPMvDplFUuYiUmck;
reg VyetNAObVKIwVoDtKfHy;
reg AOrHoOiQMOwnAIBkfOCH;
reg qzfrfAzMSXBxGOhKtDPe;
reg JRtwQAVKwrThaZwmPnSu;
reg ZTPtJbvUMljVhaDDHqEP;
reg QvbniyysNCjGSoJYRSJy;

always@(*) begin
    if(ZcufvwoxlnHUTxvmYMrL == 1'b1) begin
	    if(ScyRLdqxTkIfrAjHfyCe == 1'b1) begin
		    HwMlSewLUFWHfNzcdCVz = MQgLtHVUbOxalviVAmNV[2];
			qqzWVPMvDplFUuYiUmck = 1'b0;
			VyetNAObVKIwVoDtKfHy = CsQkcOiTiBTyncfufXZj;
			AOrHoOiQMOwnAIBkfOCH = wlenGNqnzNDsKYuoUEFs[2];
			qzfrfAzMSXBxGOhKtDPe = AMpFUyPXvTDKXOABcGwQ;
			JRtwQAVKwrThaZwmPnSu = 1'b0;
			ZTPtJbvUMljVhaDDHqEP = qUkWgSUxlHDGwaShnpJD[2];
			QvbniyysNCjGSoJYRSJy = 1'b0;
		end
		else begin
		    HwMlSewLUFWHfNzcdCVz = MQgLtHVUbOxalviVAmNV[1];
			qqzWVPMvDplFUuYiUmck = 1'b0;
			VyetNAObVKIwVoDtKfHy = stiszqtCKxtkZisxkQUK;
			AOrHoOiQMOwnAIBkfOCH = wlenGNqnzNDsKYuoUEFs[1];
			qzfrfAzMSXBxGOhKtDPe = kPRmTzDNbMypwHeWblNC;
			JRtwQAVKwrThaZwmPnSu = 1'b0;
			ZTPtJbvUMljVhaDDHqEP = qUkWgSUxlHDGwaShnpJD[1];
			QvbniyysNCjGSoJYRSJy = 1'b0;
		end
	end
	else if(xHcIMfHkmMZNUCUTGLMh == 1'b1) begin
	    if(ScyRLdqxTkIfrAjHfyCe == 1'b1) begin
		    HwMlSewLUFWHfNzcdCVz = 1'b0;
			qqzWVPMvDplFUuYiUmck = xOFOFRpZSrifYYEfdruw[1];
			VyetNAObVKIwVoDtKfHy = CsQkcOiTiBTyncfufXZj;
			AOrHoOiQMOwnAIBkfOCH = wlenGNqnzNDsKYuoUEFs[2];
			qzfrfAzMSXBxGOhKtDPe = 1'b0;
			JRtwQAVKwrThaZwmPnSu = KdoJZktdmkwWBKlDvMdP;
			ZTPtJbvUMljVhaDDHqEP = 1'b0;
			QvbniyysNCjGSoJYRSJy = pBlIpiTyRVEixJQZYAec[1];
		end
		else begin
		    HwMlSewLUFWHfNzcdCVz = 1'b0;
			qqzWVPMvDplFUuYiUmck = xOFOFRpZSrifYYEfdruw[0];
			VyetNAObVKIwVoDtKfHy = stiszqtCKxtkZisxkQUK;
			AOrHoOiQMOwnAIBkfOCH = wlenGNqnzNDsKYuoUEFs[1];
			qzfrfAzMSXBxGOhKtDPe = 1'b0;
			JRtwQAVKwrThaZwmPnSu = yWJHMVCutPkodurwdxze;
			ZTPtJbvUMljVhaDDHqEP = 1'b0;
			QvbniyysNCjGSoJYRSJy = pBlIpiTyRVEixJQZYAec[0];
		end
	end
	else begin
	    if(ScyRLdqxTkIfrAjHfyCe == 1'b1) begin            
		    HwMlSewLUFWHfNzcdCVz = MQgLtHVUbOxalviVAmNV[2];   
			qqzWVPMvDplFUuYiUmck = xOFOFRpZSrifYYEfdruw[1];  
			VyetNAObVKIwVoDtKfHy = CsQkcOiTiBTyncfufXZj; 
			AOrHoOiQMOwnAIBkfOCH = wlenGNqnzNDsKYuoUEFs[2];     
			qzfrfAzMSXBxGOhKtDPe = AMpFUyPXvTDKXOABcGwQ;
			JRtwQAVKwrThaZwmPnSu = KdoJZktdmkwWBKlDvMdP;
			ZTPtJbvUMljVhaDDHqEP = qUkWgSUxlHDGwaShnpJD[2];
			QvbniyysNCjGSoJYRSJy = pBlIpiTyRVEixJQZYAec[1];
		end
		else begin                            
		    HwMlSewLUFWHfNzcdCVz = MQgLtHVUbOxalviVAmNV[1];   
			qqzWVPMvDplFUuYiUmck = xOFOFRpZSrifYYEfdruw[0]; 
			VyetNAObVKIwVoDtKfHy = stiszqtCKxtkZisxkQUK;    
			AOrHoOiQMOwnAIBkfOCH = wlenGNqnzNDsKYuoUEFs[1]; 
			qzfrfAzMSXBxGOhKtDPe = kPRmTzDNbMypwHeWblNC; 
			JRtwQAVKwrThaZwmPnSu = yWJHMVCutPkodurwdxze;       
			ZTPtJbvUMljVhaDDHqEP = qUkWgSUxlHDGwaShnpJD[1];
			QvbniyysNCjGSoJYRSJy = pBlIpiTyRVEixJQZYAec[0];
		end
	end
end

reg hWGjVnLEkDQrysEvjhUk;
reg OTAFvTUooJQuCEUeiOKb;
reg KSjctPBlfoUFuQVMzwRe;
reg UfyHFVwpFQNFelcxnthB;
reg RYUcCJyEjaFkfmUmBpuF;
reg GFJpzOmHZajaMOYgUnwR;
reg JNzZrDqUJYIjSscXpIfs;
reg jIDvdTXgcuXgFwdFLwQs;

always@(*) begin
    if(ZcufvwoxlnHUTxvmYMrL == 1'b1) begin
	    if(ukbTnNDbmRSfKKceUWrz == 1'b1) begin
		    hWGjVnLEkDQrysEvjhUk = qUkWgSUxlHDGwaShnpJD[2];
			OTAFvTUooJQuCEUeiOKb = 1'b0;
			KSjctPBlfoUFuQVMzwRe = GVfnzKKftzXfxeBqPQMD[1];
			UfyHFVwpFQNFelcxnthB = WVoNBXVHcnpPnosVQmql[2];
			RYUcCJyEjaFkfmUmBpuF = MQgLtHVUbOxalviVAmNV[2];
			GFJpzOmHZajaMOYgUnwR = 1'b0;
			JNzZrDqUJYIjSscXpIfs = AKnQHFnRxMsayGvtbpFT[2];
			jIDvdTXgcuXgFwdFLwQs = 1'b0;
		end
		else begin
		    hWGjVnLEkDQrysEvjhUk = qUkWgSUxlHDGwaShnpJD[1];
			OTAFvTUooJQuCEUeiOKb = 1'b0;
			KSjctPBlfoUFuQVMzwRe = FDTEmqmGIINzAjvyZUbd[0];
			UfyHFVwpFQNFelcxnthB = WVoNBXVHcnpPnosVQmql[1];
			RYUcCJyEjaFkfmUmBpuF = MQgLtHVUbOxalviVAmNV[1];
			GFJpzOmHZajaMOYgUnwR = 1'b0;
			JNzZrDqUJYIjSscXpIfs = AKnQHFnRxMsayGvtbpFT[1];
			jIDvdTXgcuXgFwdFLwQs = 1'b0;
		end
	end
	else if(xHcIMfHkmMZNUCUTGLMh == 1'b1) begin
	    if(ukbTnNDbmRSfKKceUWrz == 1'b1) begin
		    hWGjVnLEkDQrysEvjhUk = 1'b0;
			OTAFvTUooJQuCEUeiOKb = pBlIpiTyRVEixJQZYAec[1];
			KSjctPBlfoUFuQVMzwRe = GVfnzKKftzXfxeBqPQMD[1];
			UfyHFVwpFQNFelcxnthB = WVoNBXVHcnpPnosVQmql[2];
			RYUcCJyEjaFkfmUmBpuF = 1'b0;
			GFJpzOmHZajaMOYgUnwR = xOFOFRpZSrifYYEfdruw[1];
			JNzZrDqUJYIjSscXpIfs = 1'b0;
			jIDvdTXgcuXgFwdFLwQs = dUuDxKDEFktOVDQPXOkG[1];
		end
		else begin
		    hWGjVnLEkDQrysEvjhUk = 1'b0;
			OTAFvTUooJQuCEUeiOKb = pBlIpiTyRVEixJQZYAec[0];
			KSjctPBlfoUFuQVMzwRe = FDTEmqmGIINzAjvyZUbd[0];
			UfyHFVwpFQNFelcxnthB = WVoNBXVHcnpPnosVQmql[1];
			RYUcCJyEjaFkfmUmBpuF = 1'b0;
			GFJpzOmHZajaMOYgUnwR = xOFOFRpZSrifYYEfdruw[0];
			JNzZrDqUJYIjSscXpIfs = 1'b0;
			jIDvdTXgcuXgFwdFLwQs = dUuDxKDEFktOVDQPXOkG[0];
		end
	end
	else begin
	    if(ukbTnNDbmRSfKKceUWrz == 1'b1) begin
		    hWGjVnLEkDQrysEvjhUk = qUkWgSUxlHDGwaShnpJD[2];
			OTAFvTUooJQuCEUeiOKb = pBlIpiTyRVEixJQZYAec[1];
			KSjctPBlfoUFuQVMzwRe = GVfnzKKftzXfxeBqPQMD[1];
			UfyHFVwpFQNFelcxnthB = WVoNBXVHcnpPnosVQmql[2];
			RYUcCJyEjaFkfmUmBpuF = MQgLtHVUbOxalviVAmNV[2];
			GFJpzOmHZajaMOYgUnwR = xOFOFRpZSrifYYEfdruw[1];
			JNzZrDqUJYIjSscXpIfs = AKnQHFnRxMsayGvtbpFT[2];
			jIDvdTXgcuXgFwdFLwQs = dUuDxKDEFktOVDQPXOkG[1];
		end
		else begin
		    hWGjVnLEkDQrysEvjhUk = qUkWgSUxlHDGwaShnpJD[1];
			OTAFvTUooJQuCEUeiOKb = pBlIpiTyRVEixJQZYAec[0];
			KSjctPBlfoUFuQVMzwRe = FDTEmqmGIINzAjvyZUbd[0];
			UfyHFVwpFQNFelcxnthB = WVoNBXVHcnpPnosVQmql[1];
			RYUcCJyEjaFkfmUmBpuF = MQgLtHVUbOxalviVAmNV[1];
			GFJpzOmHZajaMOYgUnwR = xOFOFRpZSrifYYEfdruw[0];
			JNzZrDqUJYIjSscXpIfs = AKnQHFnRxMsayGvtbpFT[1];
			jIDvdTXgcuXgFwdFLwQs = dUuDxKDEFktOVDQPXOkG[0];
		end
	end
end

reg YeMOMRIeYZPyzXOowtFE;
reg ixURmUmnpqsmlTURRxZg;
reg AldqzOAOgLzSiZYoXvqk;
reg gisHxWFtQvIInGQwAxNb;
reg bbhOGHWAGFziVMGHNWaZ;
reg ngmgnIPJTQQOdZFLMtCN;
reg FgzHiMFOVkCtqVvUqwAJ;
reg ZXaaduGCBlakrqdXSdjh;

always@(*) begin
    if(ZcufvwoxlnHUTxvmYMrL == 1'b1) begin
	    if(IjiwjVZQiEWuSfonIrZA == 1'b1) begin
		    YeMOMRIeYZPyzXOowtFE = AKnQHFnRxMsayGvtbpFT[2];
			ixURmUmnpqsmlTURRxZg = 1'b0;
			AldqzOAOgLzSiZYoXvqk = wlenGNqnzNDsKYuoUEFs[1];
			gisHxWFtQvIInGQwAxNb = ObqqhBrMFEWIKEdpaOZE[2];
			bbhOGHWAGFziVMGHNWaZ = qUkWgSUxlHDGwaShnpJD[2];
			ngmgnIPJTQQOdZFLMtCN = 1'b0;
			FgzHiMFOVkCtqVvUqwAJ = EdvpzeTpOWEloDTnpLTm[2];
			ZXaaduGCBlakrqdXSdjh = 1'b0;
		end
		else begin
		    YeMOMRIeYZPyzXOowtFE = AKnQHFnRxMsayGvtbpFT[1];
			ixURmUmnpqsmlTURRxZg = 1'b0;
			AldqzOAOgLzSiZYoXvqk = rXbXOOONFccCKhoMrsAV[0];
			gisHxWFtQvIInGQwAxNb = ObqqhBrMFEWIKEdpaOZE[1];
			bbhOGHWAGFziVMGHNWaZ = qUkWgSUxlHDGwaShnpJD[1];
			ngmgnIPJTQQOdZFLMtCN = 1'b0;
			FgzHiMFOVkCtqVvUqwAJ = EdvpzeTpOWEloDTnpLTm[1];
			ZXaaduGCBlakrqdXSdjh = 1'b0;
		end
	end
	else if(xHcIMfHkmMZNUCUTGLMh == 1'b1) begin
	    if(IjiwjVZQiEWuSfonIrZA == 1'b1) begin
		    YeMOMRIeYZPyzXOowtFE = 1'b0;
			ixURmUmnpqsmlTURRxZg = dUuDxKDEFktOVDQPXOkG[1];
			AldqzOAOgLzSiZYoXvqk = wlenGNqnzNDsKYuoUEFs[1];
			gisHxWFtQvIInGQwAxNb = ObqqhBrMFEWIKEdpaOZE[2];
			bbhOGHWAGFziVMGHNWaZ = 1'b0;
			ngmgnIPJTQQOdZFLMtCN = pBlIpiTyRVEixJQZYAec[1];
			FgzHiMFOVkCtqVvUqwAJ = 1'b0;
			ZXaaduGCBlakrqdXSdjh = ihLJCGZZFABcRUCnaWQf[1];
		end
		else begin
		    YeMOMRIeYZPyzXOowtFE = 1'b0;
			ixURmUmnpqsmlTURRxZg = dUuDxKDEFktOVDQPXOkG[0];
			AldqzOAOgLzSiZYoXvqk = rXbXOOONFccCKhoMrsAV[0];
			gisHxWFtQvIInGQwAxNb = ObqqhBrMFEWIKEdpaOZE[1];
			bbhOGHWAGFziVMGHNWaZ = 1'b0;
			ngmgnIPJTQQOdZFLMtCN = pBlIpiTyRVEixJQZYAec[0];
			FgzHiMFOVkCtqVvUqwAJ = 1'b0;
			ZXaaduGCBlakrqdXSdjh = ihLJCGZZFABcRUCnaWQf[0];
		end
	end
	else begin
	    if(IjiwjVZQiEWuSfonIrZA == 1'b1) begin
		    YeMOMRIeYZPyzXOowtFE = AKnQHFnRxMsayGvtbpFT[2];
			ixURmUmnpqsmlTURRxZg = dUuDxKDEFktOVDQPXOkG[1];
			AldqzOAOgLzSiZYoXvqk = wlenGNqnzNDsKYuoUEFs[1];
			gisHxWFtQvIInGQwAxNb = ObqqhBrMFEWIKEdpaOZE[2];
			bbhOGHWAGFziVMGHNWaZ = qUkWgSUxlHDGwaShnpJD[2];
			ngmgnIPJTQQOdZFLMtCN = pBlIpiTyRVEixJQZYAec[1];
			FgzHiMFOVkCtqVvUqwAJ = EdvpzeTpOWEloDTnpLTm[2];
			ZXaaduGCBlakrqdXSdjh = ihLJCGZZFABcRUCnaWQf[1];
		end
		else begin
		    YeMOMRIeYZPyzXOowtFE = AKnQHFnRxMsayGvtbpFT[1];
			ixURmUmnpqsmlTURRxZg = dUuDxKDEFktOVDQPXOkG[0];
			AldqzOAOgLzSiZYoXvqk = rXbXOOONFccCKhoMrsAV[0];
			gisHxWFtQvIInGQwAxNb = ObqqhBrMFEWIKEdpaOZE[1];
			bbhOGHWAGFziVMGHNWaZ = qUkWgSUxlHDGwaShnpJD[1];
			ngmgnIPJTQQOdZFLMtCN = pBlIpiTyRVEixJQZYAec[0];
			FgzHiMFOVkCtqVvUqwAJ = EdvpzeTpOWEloDTnpLTm[1];
			ZXaaduGCBlakrqdXSdjh = ihLJCGZZFABcRUCnaWQf[0];
		end
	end
end

reg wTjVLKCnfjXNfLxzpTmh;
reg HGaDEpyxpcnUKaIqltue;
reg rIvifzIRzwjaNeMXhNUx;
reg aHWKGvWmLBjpxOjkPpzR;
reg zVgIYAxQpqCqkMXZNqdZ;
reg ajGfFSyjcRyvaGpkRcYa;
reg XpJDwRzWkHRCroYHeHRH;
reg oiEumTbeQnFaJdmouriO;

always@(*) begin
    if(ZcufvwoxlnHUTxvmYMrL == 1'b1) begin
	    if(PJhNpCthKhZROimGgCqU == 1'b1) begin
		    wTjVLKCnfjXNfLxzpTmh = EdvpzeTpOWEloDTnpLTm[2];
			HGaDEpyxpcnUKaIqltue = 1'b0;
			rIvifzIRzwjaNeMXhNUx = WVoNBXVHcnpPnosVQmql[1];
			aHWKGvWmLBjpxOjkPpzR = 1'b0;
			zVgIYAxQpqCqkMXZNqdZ = AKnQHFnRxMsayGvtbpFT[2];
			ajGfFSyjcRyvaGpkRcYa = 1'b0;
			XpJDwRzWkHRCroYHeHRH = 1'b0;
			oiEumTbeQnFaJdmouriO = 1'b0;
		end
		else begin
		    wTjVLKCnfjXNfLxzpTmh = EdvpzeTpOWEloDTnpLTm[1];
			HGaDEpyxpcnUKaIqltue = 1'b0;
			rIvifzIRzwjaNeMXhNUx = BpSCsagoCaNdVPktxOTV[0];
			aHWKGvWmLBjpxOjkPpzR = 1'b0;
			zVgIYAxQpqCqkMXZNqdZ = AKnQHFnRxMsayGvtbpFT[1];
			ajGfFSyjcRyvaGpkRcYa = 1'b0;
			XpJDwRzWkHRCroYHeHRH = 1'b0;
			oiEumTbeQnFaJdmouriO = 1'b0;
		end
	end
	else if(xHcIMfHkmMZNUCUTGLMh == 1'b1) begin
	    if(PJhNpCthKhZROimGgCqU == 1'b1) begin
		    wTjVLKCnfjXNfLxzpTmh = 1'b0;
			HGaDEpyxpcnUKaIqltue = ihLJCGZZFABcRUCnaWQf[1];
			rIvifzIRzwjaNeMXhNUx = WVoNBXVHcnpPnosVQmql[1];
			aHWKGvWmLBjpxOjkPpzR = 1'b0;
			zVgIYAxQpqCqkMXZNqdZ = 1'b0;
			ajGfFSyjcRyvaGpkRcYa = dUuDxKDEFktOVDQPXOkG[1];
			XpJDwRzWkHRCroYHeHRH = 1'b0;
			oiEumTbeQnFaJdmouriO = 1'b0;
		end
		else begin
		    wTjVLKCnfjXNfLxzpTmh = 1'b0;
			HGaDEpyxpcnUKaIqltue = ihLJCGZZFABcRUCnaWQf[0];
			rIvifzIRzwjaNeMXhNUx = BpSCsagoCaNdVPktxOTV[0];
			aHWKGvWmLBjpxOjkPpzR = 1'b0;
			zVgIYAxQpqCqkMXZNqdZ = 1'b0;
			ajGfFSyjcRyvaGpkRcYa = dUuDxKDEFktOVDQPXOkG[0];
			XpJDwRzWkHRCroYHeHRH = 1'b0;
			oiEumTbeQnFaJdmouriO = 1'b0;
		end
	end
	else begin
	    if(PJhNpCthKhZROimGgCqU == 1'b1) begin
		    wTjVLKCnfjXNfLxzpTmh = EdvpzeTpOWEloDTnpLTm[2];
			HGaDEpyxpcnUKaIqltue = ihLJCGZZFABcRUCnaWQf[1];
			rIvifzIRzwjaNeMXhNUx = WVoNBXVHcnpPnosVQmql[1];
			aHWKGvWmLBjpxOjkPpzR = 1'b0;
			zVgIYAxQpqCqkMXZNqdZ = AKnQHFnRxMsayGvtbpFT[2];
			ajGfFSyjcRyvaGpkRcYa = dUuDxKDEFktOVDQPXOkG[1];
			XpJDwRzWkHRCroYHeHRH = 1'b0;
			oiEumTbeQnFaJdmouriO = 1'b0;
		end
		else begin
		    wTjVLKCnfjXNfLxzpTmh = EdvpzeTpOWEloDTnpLTm[1];
			HGaDEpyxpcnUKaIqltue = ihLJCGZZFABcRUCnaWQf[0];
			rIvifzIRzwjaNeMXhNUx = BpSCsagoCaNdVPktxOTV[0];
			aHWKGvWmLBjpxOjkPpzR = 1'b0;
			zVgIYAxQpqCqkMXZNqdZ = AKnQHFnRxMsayGvtbpFT[1];
			ajGfFSyjcRyvaGpkRcYa = dUuDxKDEFktOVDQPXOkG[0];
			XpJDwRzWkHRCroYHeHRH = 1'b0;
			oiEumTbeQnFaJdmouriO = 1'b0;
		end
	end
end

reg uOwYLnkHZVTtMvztMMwV;    
reg TuJlheJyAnxHlnuWcoTX;
reg HPrfLvxdntjsoZMlJKSY;
reg QKJtxyiIiIRVzdXpBKWh;

reg psIsKXeoUhGdJicTNQxT;
reg NeXVwDHYZKpxcjzkmkUT;
reg xiBAUFHoQwanlBwVvNGG;
reg DMbtiHjJZmEhNsIuamFJ;

reg kPDQftYnDzJarkoPlEts;
reg ZspMeJBtIQrkBuPFHpVo;
reg sMCgrEPGVWmKmZZcGYZt;
reg qbFLLHERyPKsOtwMDakI;

reg cDbXxfwjBJdsAzAvypGt;
reg VFQOiBjuGBYSiLhTxnck;
reg oeVMOqpkBmaFOldWHOWz;
reg SFCnSzDSHukMkqWCRsSR;

always@(*) begin
    if(ZcufvwoxlnHUTxvmYMrL == 1'b1) begin
	    uOwYLnkHZVTtMvztMMwV = MQgLtHVUbOxalviVAmNV[5];
	    TuJlheJyAnxHlnuWcoTX = 1'b0;
	    HPrfLvxdntjsoZMlJKSY = hvcQnhbMPIYQRfXPtdaK;
	    QKJtxyiIiIRVzdXpBKWh = wlenGNqnzNDsKYuoUEFs[5];
		psIsKXeoUhGdJicTNQxT = qUkWgSUxlHDGwaShnpJD[5];
	    NeXVwDHYZKpxcjzkmkUT = 1'b0;
	    xiBAUFHoQwanlBwVvNGG = GVfnzKKftzXfxeBqPQMD[5];
	    DMbtiHjJZmEhNsIuamFJ = WVoNBXVHcnpPnosVQmql[5];
	    kPDQftYnDzJarkoPlEts = AKnQHFnRxMsayGvtbpFT[5];
	    ZspMeJBtIQrkBuPFHpVo = 1'b0;
	    sMCgrEPGVWmKmZZcGYZt = wlenGNqnzNDsKYuoUEFs[5];
	    qbFLLHERyPKsOtwMDakI = ObqqhBrMFEWIKEdpaOZE[5];
	    cDbXxfwjBJdsAzAvypGt = EdvpzeTpOWEloDTnpLTm[5];
	    VFQOiBjuGBYSiLhTxnck = 1'b0;
	    oeVMOqpkBmaFOldWHOWz = WVoNBXVHcnpPnosVQmql[5];
	    SFCnSzDSHukMkqWCRsSR = 1'b0;
	end
	else if(xHcIMfHkmMZNUCUTGLMh == 1'b1) begin
	    uOwYLnkHZVTtMvztMMwV = 1'b0;
	    TuJlheJyAnxHlnuWcoTX = xOFOFRpZSrifYYEfdruw[5];
	    HPrfLvxdntjsoZMlJKSY = hvcQnhbMPIYQRfXPtdaK;
	    QKJtxyiIiIRVzdXpBKWh = wlenGNqnzNDsKYuoUEFs[5];
		psIsKXeoUhGdJicTNQxT = 1'b0;
	    NeXVwDHYZKpxcjzkmkUT = pBlIpiTyRVEixJQZYAec[5];
	    xiBAUFHoQwanlBwVvNGG = GVfnzKKftzXfxeBqPQMD[5];
	    DMbtiHjJZmEhNsIuamFJ = WVoNBXVHcnpPnosVQmql[5];
	    kPDQftYnDzJarkoPlEts = 1'b0;
	    ZspMeJBtIQrkBuPFHpVo = dUuDxKDEFktOVDQPXOkG[5];
	    sMCgrEPGVWmKmZZcGYZt = wlenGNqnzNDsKYuoUEFs[5];
	    qbFLLHERyPKsOtwMDakI = ObqqhBrMFEWIKEdpaOZE[5];
	    cDbXxfwjBJdsAzAvypGt = 1'b0;
	    VFQOiBjuGBYSiLhTxnck = ihLJCGZZFABcRUCnaWQf[5];
	    oeVMOqpkBmaFOldWHOWz = WVoNBXVHcnpPnosVQmql[5];
	    SFCnSzDSHukMkqWCRsSR = 1'b0;
	end
	else begin
        uOwYLnkHZVTtMvztMMwV = MQgLtHVUbOxalviVAmNV[5];    
	    TuJlheJyAnxHlnuWcoTX = xOFOFRpZSrifYYEfdruw[5];
	    HPrfLvxdntjsoZMlJKSY = hvcQnhbMPIYQRfXPtdaK;
	    QKJtxyiIiIRVzdXpBKWh = wlenGNqnzNDsKYuoUEFs[5];
		psIsKXeoUhGdJicTNQxT = qUkWgSUxlHDGwaShnpJD[5];
	    NeXVwDHYZKpxcjzkmkUT = pBlIpiTyRVEixJQZYAec[5];
	    xiBAUFHoQwanlBwVvNGG = GVfnzKKftzXfxeBqPQMD[5];
	    DMbtiHjJZmEhNsIuamFJ = WVoNBXVHcnpPnosVQmql[5];
	    kPDQftYnDzJarkoPlEts = AKnQHFnRxMsayGvtbpFT[5];
	    ZspMeJBtIQrkBuPFHpVo = dUuDxKDEFktOVDQPXOkG[5];
	    sMCgrEPGVWmKmZZcGYZt = wlenGNqnzNDsKYuoUEFs[5];
	    qbFLLHERyPKsOtwMDakI = ObqqhBrMFEWIKEdpaOZE[5];
	    cDbXxfwjBJdsAzAvypGt = EdvpzeTpOWEloDTnpLTm[5];
	    VFQOiBjuGBYSiLhTxnck = ihLJCGZZFABcRUCnaWQf[5];
	    oeVMOqpkBmaFOldWHOWz = WVoNBXVHcnpPnosVQmql[5];
	    SFCnSzDSHukMkqWCRsSR = 1'b0;    
	end
end

reg IvfRMxIHjMYRrPLeLBMz;
reg IBKEfbgOWcRSSKcMMgAi;
reg ZfkMwCjiAcEuKVZWEREP;
reg PPhrMbXzyvobhgzdrYUC;
reg QqbfqECqTXMHtIAjfgxN;
reg tdrrNVApyUHiTKJVAhJo;
reg jVmZRNgHGosfqzIvFioH;
reg KjTSVPlCSznxgDeCAMOH;

reg hEgUZvEROWSDHvifIjIQ;
reg bxmJtGgOcSsrWVSlGVfh;
reg yZYWaoARDhVmngMQHaxT;
reg bIqnrkARBAHOajvqLVgA;
reg kQWWWEZXdBZTyhHpshuO;
reg BmfQGwybwXatikdxWoAV;
reg sbyBpirZUjaSGSxEHWLW;
reg gumzttGlkLctgoLJlWLc;

reg xSguMFEtMTXtKMBkcIRr;
reg LlNyDtIYmDQUcpwyesLo;
reg naamCpnqfhzCWwNkuMSL;
reg oQEdPmbFyDqbjXbahGzM;
reg pQBcvKTUOwJxyTdqyLrJ;
reg qylUKpzxapjYAKMiMDNx;
reg AnZeWrFhEhwvcwkiFCOM;
reg HIuZOCQTPRthrdVKEZBA;

reg YiiisWYoYTqYwajkqDuC;
reg VsGUUOtwkcHoVIxvuGPi;
reg rpYGdItNHzbgojcbUMFY;
reg qWVQVMNaFDrFeqIkzufV;
reg IChEtfLugkhsDrwthLKl;
reg eApNvlvUibUYXlIjyyiJ;
reg TZKXYAiBzQHRsPjsQaBX;
reg oVCHkhoYlezUtfkWNxEX;

always@(*) begin
    if(ZcufvwoxlnHUTxvmYMrL == 1'b1) begin
	    IvfRMxIHjMYRrPLeLBMz = MQgLtHVUbOxalviVAmNV[1];
        IBKEfbgOWcRSSKcMMgAi = 1'b0;
        ZfkMwCjiAcEuKVZWEREP = CsQkcOiTiBTyncfufXZj;
        PPhrMbXzyvobhgzdrYUC = wlenGNqnzNDsKYuoUEFs[1];
        QqbfqECqTXMHtIAjfgxN = AMpFUyPXvTDKXOABcGwQ;
        tdrrNVApyUHiTKJVAhJo = 1'b0;
        jVmZRNgHGosfqzIvFioH = qUkWgSUxlHDGwaShnpJD[1];
        KjTSVPlCSznxgDeCAMOH = 1'b0;
		hEgUZvEROWSDHvifIjIQ = qUkWgSUxlHDGwaShnpJD[1];
        bxmJtGgOcSsrWVSlGVfh = 1'b0;
        yZYWaoARDhVmngMQHaxT = GVfnzKKftzXfxeBqPQMD[1];
        bIqnrkARBAHOajvqLVgA = WVoNBXVHcnpPnosVQmql[1];
        kQWWWEZXdBZTyhHpshuO = MQgLtHVUbOxalviVAmNV[1];
        BmfQGwybwXatikdxWoAV = 1'b0;
        sbyBpirZUjaSGSxEHWLW = AKnQHFnRxMsayGvtbpFT[1];
        gumzttGlkLctgoLJlWLc = 1'b0;
		xSguMFEtMTXtKMBkcIRr = AKnQHFnRxMsayGvtbpFT[1];
        LlNyDtIYmDQUcpwyesLo = 1'b0;
        naamCpnqfhzCWwNkuMSL = wlenGNqnzNDsKYuoUEFs[1];
        oQEdPmbFyDqbjXbahGzM = ObqqhBrMFEWIKEdpaOZE[1];
        pQBcvKTUOwJxyTdqyLrJ = qUkWgSUxlHDGwaShnpJD[1];
        qylUKpzxapjYAKMiMDNx = 1'b0;
        AnZeWrFhEhwvcwkiFCOM = EdvpzeTpOWEloDTnpLTm[1];
        HIuZOCQTPRthrdVKEZBA = 1'b0;
		YiiisWYoYTqYwajkqDuC = EdvpzeTpOWEloDTnpLTm[1];
        VsGUUOtwkcHoVIxvuGPi = 1'b0;
        rpYGdItNHzbgojcbUMFY = WVoNBXVHcnpPnosVQmql[1];
        qWVQVMNaFDrFeqIkzufV = 1'b0;
        IChEtfLugkhsDrwthLKl = AKnQHFnRxMsayGvtbpFT[1];
        eApNvlvUibUYXlIjyyiJ = 1'b0;
        TZKXYAiBzQHRsPjsQaBX = 1'b0;
        oVCHkhoYlezUtfkWNxEX = 1'b0;
	end
	else if(xHcIMfHkmMZNUCUTGLMh == 1'b1) begin
	    IvfRMxIHjMYRrPLeLBMz = 1'b0;
        IBKEfbgOWcRSSKcMMgAi = xOFOFRpZSrifYYEfdruw[1];
        ZfkMwCjiAcEuKVZWEREP = CsQkcOiTiBTyncfufXZj;
        PPhrMbXzyvobhgzdrYUC = wlenGNqnzNDsKYuoUEFs[1];
        QqbfqECqTXMHtIAjfgxN = 1'b0;
        tdrrNVApyUHiTKJVAhJo = KdoJZktdmkwWBKlDvMdP;
        jVmZRNgHGosfqzIvFioH = 1'b0;
        KjTSVPlCSznxgDeCAMOH = pBlIpiTyRVEixJQZYAec[1];
		hEgUZvEROWSDHvifIjIQ = 1'b0;
        bxmJtGgOcSsrWVSlGVfh = pBlIpiTyRVEixJQZYAec[1];
        yZYWaoARDhVmngMQHaxT = GVfnzKKftzXfxeBqPQMD[1];
        bIqnrkARBAHOajvqLVgA = WVoNBXVHcnpPnosVQmql[1];
        kQWWWEZXdBZTyhHpshuO = 1'b0;
        BmfQGwybwXatikdxWoAV = xOFOFRpZSrifYYEfdruw[1];
        sbyBpirZUjaSGSxEHWLW = 1'b0;
        gumzttGlkLctgoLJlWLc = dUuDxKDEFktOVDQPXOkG[1];
		xSguMFEtMTXtKMBkcIRr = 1'b0;
        LlNyDtIYmDQUcpwyesLo = dUuDxKDEFktOVDQPXOkG[1];
        naamCpnqfhzCWwNkuMSL = wlenGNqnzNDsKYuoUEFs[1];
        oQEdPmbFyDqbjXbahGzM = ObqqhBrMFEWIKEdpaOZE[1];
        pQBcvKTUOwJxyTdqyLrJ = 1'b0;
        qylUKpzxapjYAKMiMDNx = pBlIpiTyRVEixJQZYAec[1];
        AnZeWrFhEhwvcwkiFCOM = 1'b0;
        HIuZOCQTPRthrdVKEZBA = ihLJCGZZFABcRUCnaWQf[1];
		YiiisWYoYTqYwajkqDuC = 1'b0;
        VsGUUOtwkcHoVIxvuGPi = ihLJCGZZFABcRUCnaWQf[1];
        rpYGdItNHzbgojcbUMFY = WVoNBXVHcnpPnosVQmql[1];
        qWVQVMNaFDrFeqIkzufV = 1'b0;
        IChEtfLugkhsDrwthLKl = 1'b0;
        eApNvlvUibUYXlIjyyiJ = dUuDxKDEFktOVDQPXOkG[1];
        TZKXYAiBzQHRsPjsQaBX = 1'b0;
        oVCHkhoYlezUtfkWNxEX = 1'b0;
	end
	else begin
	    IvfRMxIHjMYRrPLeLBMz = MQgLtHVUbOxalviVAmNV[1];    
        IBKEfbgOWcRSSKcMMgAi = xOFOFRpZSrifYYEfdruw[1];
        ZfkMwCjiAcEuKVZWEREP = CsQkcOiTiBTyncfufXZj;
        PPhrMbXzyvobhgzdrYUC = wlenGNqnzNDsKYuoUEFs[1];
        QqbfqECqTXMHtIAjfgxN = AMpFUyPXvTDKXOABcGwQ;
        tdrrNVApyUHiTKJVAhJo = KdoJZktdmkwWBKlDvMdP;
        jVmZRNgHGosfqzIvFioH = qUkWgSUxlHDGwaShnpJD[1];
        KjTSVPlCSznxgDeCAMOH = pBlIpiTyRVEixJQZYAec[1];
		hEgUZvEROWSDHvifIjIQ = qUkWgSUxlHDGwaShnpJD[1];
        bxmJtGgOcSsrWVSlGVfh = pBlIpiTyRVEixJQZYAec[1];
        yZYWaoARDhVmngMQHaxT = GVfnzKKftzXfxeBqPQMD[1];
        bIqnrkARBAHOajvqLVgA = WVoNBXVHcnpPnosVQmql[1];
        kQWWWEZXdBZTyhHpshuO = MQgLtHVUbOxalviVAmNV[1];
        BmfQGwybwXatikdxWoAV = xOFOFRpZSrifYYEfdruw[1];
        sbyBpirZUjaSGSxEHWLW = AKnQHFnRxMsayGvtbpFT[1];
        gumzttGlkLctgoLJlWLc = dUuDxKDEFktOVDQPXOkG[1];
		xSguMFEtMTXtKMBkcIRr = AKnQHFnRxMsayGvtbpFT[1];
        LlNyDtIYmDQUcpwyesLo = dUuDxKDEFktOVDQPXOkG[1];
        naamCpnqfhzCWwNkuMSL = wlenGNqnzNDsKYuoUEFs[1];
        oQEdPmbFyDqbjXbahGzM = ObqqhBrMFEWIKEdpaOZE[1];
        pQBcvKTUOwJxyTdqyLrJ = qUkWgSUxlHDGwaShnpJD[1];
        qylUKpzxapjYAKMiMDNx = pBlIpiTyRVEixJQZYAec[1];
        AnZeWrFhEhwvcwkiFCOM = EdvpzeTpOWEloDTnpLTm[1];
        HIuZOCQTPRthrdVKEZBA = ihLJCGZZFABcRUCnaWQf[1];
		YiiisWYoYTqYwajkqDuC = EdvpzeTpOWEloDTnpLTm[1];
        VsGUUOtwkcHoVIxvuGPi = ihLJCGZZFABcRUCnaWQf[1];
        rpYGdItNHzbgojcbUMFY = WVoNBXVHcnpPnosVQmql[1];
        qWVQVMNaFDrFeqIkzufV = 1'b0;
        IChEtfLugkhsDrwthLKl = AKnQHFnRxMsayGvtbpFT[1];
        eApNvlvUibUYXlIjyyiJ = dUuDxKDEFktOVDQPXOkG[1];
        TZKXYAiBzQHRsPjsQaBX = 1'b0;
        oVCHkhoYlezUtfkWNxEX = 1'b0;
	end
end

ZC  u_zc0(.zc_CxD  (nUcvoGMUQAyFvkkNKtjY),
          .data_v  (GVfnzKKftzXfxeBqPQMD[4]),
          .flag_band  (band),   
          .h0  (HwMlSewLUFWHfNzcdCVz),
		  .h1  (qqzWVPMvDplFUuYiUmck),
          .v0  (VyetNAObVKIwVoDtKfHy),
		  .v1  (AOrHoOiQMOwnAIBkfOCH),
          .d0  (qzfrfAzMSXBxGOhKtDPe),
		  .d1  (JRtwQAVKwrThaZwmPnSu),
          .d2  (ZTPtJbvUMljVhaDDHqEP),
		  .d3  (QvbniyysNCjGSoJYRSJy));

ZC  u_zc1(.zc_CxD  (dsqvhOxPSNmrxhIMFonB),
          .data_v  (wlenGNqnzNDsKYuoUEFs[4]),
          .flag_band  (band),
          .h0  (hWGjVnLEkDQrysEvjhUk),
		  .h1  (OTAFvTUooJQuCEUeiOKb),
          .v0  (KSjctPBlfoUFuQVMzwRe),
		  .v1  (UfyHFVwpFQNFelcxnthB),
          .d0  (RYUcCJyEjaFkfmUmBpuF),
		  .d1  (GFJpzOmHZajaMOYgUnwR),
          .d2  (JNzZrDqUJYIjSscXpIfs),
		  .d3  (jIDvdTXgcuXgFwdFLwQs));

ZC  u_zc2(.zc_CxD  (FtmPDiwqoZcWFUaAxCkO),
          .data_v  (WVoNBXVHcnpPnosVQmql[4]),
          .flag_band  (band),
          .h0  (YeMOMRIeYZPyzXOowtFE),
		  .h1  (ixURmUmnpqsmlTURRxZg),
          .v0  (AldqzOAOgLzSiZYoXvqk),
		  .v1  (gisHxWFtQvIInGQwAxNb),
          .d0  (bbhOGHWAGFziVMGHNWaZ),
		  .d1  (ngmgnIPJTQQOdZFLMtCN),
          .d2  (FgzHiMFOVkCtqVvUqwAJ),
		  .d3  (ZXaaduGCBlakrqdXSdjh));

ZC  u_zc3(.zc_CxD  (vNwqhqUgvKlnIAxSJzvz),
          .data_v  (ObqqhBrMFEWIKEdpaOZE[4]),
          .flag_band  (band),
          .h0  (wTjVLKCnfjXNfLxzpTmh),
		  .h1  (HGaDEpyxpcnUKaIqltue),
          .v0  (rIvifzIRzwjaNeMXhNUx),
		  .v1  (aHWKGvWmLBjpxOjkPpzR),
          .d0  (zVgIYAxQpqCqkMXZNqdZ),
		  .d1  (ajGfFSyjcRyvaGpkRcYa),
          .d2  (XpJDwRzWkHRCroYHeHRH),
		  .d3  (oiEumTbeQnFaJdmouriO));
		  
SC  u_sc0(.sc_CxD  (ZOtXbSepnanqtWVZDuyz),
          .data_x  (GVfnzKKftzXfxeBqPQMD[5]),
          .h0  (HwMlSewLUFWHfNzcdCVz),   
		  .h1  (qqzWVPMvDplFUuYiUmck),     
          .v0  (VyetNAObVKIwVoDtKfHy),   
		  .v1  (AOrHoOiQMOwnAIBkfOCH),     
          .sign_h0  (uOwYLnkHZVTtMvztMMwV),   
          .sign_h1  (TuJlheJyAnxHlnuWcoTX),    
          .sign_v0  (HPrfLvxdntjsoZMlJKSY),    
          .sign_v1  (QKJtxyiIiIRVzdXpBKWh));	  

SC  u_sc1(.sc_CxD  (mtxvjxcqPDeqRFTdOeCy),
          .data_x  (wlenGNqnzNDsKYuoUEFs[5]),
          .h0  (hWGjVnLEkDQrysEvjhUk),
		  .h1  (OTAFvTUooJQuCEUeiOKb),
          .v0  (KSjctPBlfoUFuQVMzwRe),
		  .v1  (UfyHFVwpFQNFelcxnthB),
          .sign_h0  (psIsKXeoUhGdJicTNQxT),
          .sign_h1  (NeXVwDHYZKpxcjzkmkUT),
          .sign_v0  (xiBAUFHoQwanlBwVvNGG),
          .sign_v1  (DMbtiHjJZmEhNsIuamFJ));

SC  u_sc2(.sc_CxD  (hJRUqkSdbIbaDoVNyBwV),
          .data_x  (WVoNBXVHcnpPnosVQmql[5]),
          .h0  (YeMOMRIeYZPyzXOowtFE),
		  .h1  (ixURmUmnpqsmlTURRxZg),
          .v0  (AldqzOAOgLzSiZYoXvqk),
		  .v1  (gisHxWFtQvIInGQwAxNb),
          .sign_h0  (kPDQftYnDzJarkoPlEts),
          .sign_h1  (ZspMeJBtIQrkBuPFHpVo),
          .sign_v0  (sMCgrEPGVWmKmZZcGYZt),
          .sign_v1  (qbFLLHERyPKsOtwMDakI));

SC  u_sc3(.sc_CxD  (vyNQySISFoomjfGcZIij),
          .data_x  (ObqqhBrMFEWIKEdpaOZE[5]),
          .h0  (wTjVLKCnfjXNfLxzpTmh),
		  .h1  (HGaDEpyxpcnUKaIqltue),
          .v0  (rIvifzIRzwjaNeMXhNUx),
		  .v1  (aHWKGvWmLBjpxOjkPpzR),
          .sign_h0  (cDbXxfwjBJdsAzAvypGt),
          .sign_h1  (VFQOiBjuGBYSiLhTxnck),
          .sign_v0  (oeVMOqpkBmaFOldWHOWz),
          .sign_v1  (SFCnSzDSHukMkqWCRsSR));		

MRC u_mrc0(.mrc_CxD  (yTGSjqlPczasLIzerqoK),
           .data_v  (GVfnzKKftzXfxeBqPQMD[4]),
           .data_mrc_first  (~GVfnzKKftzXfxeBqPQMD[3]),   
           .h0  (IvfRMxIHjMYRrPLeLBMz),
		   .h1  (IBKEfbgOWcRSSKcMMgAi),
           .v0  (ZfkMwCjiAcEuKVZWEREP),
		   .v1  (PPhrMbXzyvobhgzdrYUC),
           .d0  (QqbfqECqTXMHtIAjfgxN),
		   .d1  (tdrrNVApyUHiTKJVAhJo),
           .d2  (jVmZRNgHGosfqzIvFioH),
		   .d3  (KjTSVPlCSznxgDeCAMOH));

MRC u_mrc1(.mrc_CxD  (nfEXnqhiCOkZzjflZjMq),
           .data_v  (wlenGNqnzNDsKYuoUEFs[4]),
           .data_mrc_first  (~wlenGNqnzNDsKYuoUEFs[3]),
           .h0  (hEgUZvEROWSDHvifIjIQ),
		   .h1  (bxmJtGgOcSsrWVSlGVfh),
           .v0  (yZYWaoARDhVmngMQHaxT),
		   .v1  (bIqnrkARBAHOajvqLVgA),
           .d0  (kQWWWEZXdBZTyhHpshuO),
		   .d1  (BmfQGwybwXatikdxWoAV),
           .d2  (sbyBpirZUjaSGSxEHWLW),
		   .d3  (gumzttGlkLctgoLJlWLc));	

MRC u_mrc2(.mrc_CxD  (DvTzkZIPCHcTKThgKbxF),
           .data_v  (WVoNBXVHcnpPnosVQmql[4]),
           .data_mrc_first  (~WVoNBXVHcnpPnosVQmql[3]),
           .h0  (xSguMFEtMTXtKMBkcIRr),
		   .h1  (LlNyDtIYmDQUcpwyesLo),
           .v0  (naamCpnqfhzCWwNkuMSL),
		   .v1  (oQEdPmbFyDqbjXbahGzM),
           .d0  (pQBcvKTUOwJxyTdqyLrJ),
		   .d1  (qylUKpzxapjYAKMiMDNx),
           .d2  (AnZeWrFhEhwvcwkiFCOM),
		   .d3  (HIuZOCQTPRthrdVKEZBA));	

MRC u_mrc3(.mrc_CxD  (efILpTiRRkTMGybaFavH),
           .data_v  (ObqqhBrMFEWIKEdpaOZE[4]),
           .data_mrc_first  (~ObqqhBrMFEWIKEdpaOZE[3]),
           .h0  (YiiisWYoYTqYwajkqDuC),
		   .h1  (VsGUUOtwkcHoVIxvuGPi),
           .v0  (rpYGdItNHzbgojcbUMFY),
		   .v1  (qWVQVMNaFDrFeqIkzufV),
           .d0  (IChEtfLugkhsDrwthLKl),
		   .d1  (eApNvlvUibUYXlIjyyiJ),
           .d2  (TZKXYAiBzQHRsPjsQaBX),
		   .d3  (oVCHkhoYlezUtfkWNxEX));	

RLC u_rlc (.rlc_CxD  (XKEboOlymZUysNbdgYvz),
           .u0_CxD  (YnUHFWqMbTwhpriTzfCj),
           .u1_CxD  (EKkouikFTiQAhxGiNBgA),
           .rlc_ac  (mxUXarOdzFVqEXRyKhvn),    
           .u01_ac  (EakVkLNuSPmYJvnabwQm),    
           .data_v0  (GVfnzKKftzXfxeBqPQMD[4]),
           .data_v1  (wlenGNqnzNDsKYuoUEFs[4]),
           .data_v2  (WVoNBXVHcnpPnosVQmql[4]),
           .data_v3  (ObqqhBrMFEWIKEdpaOZE[4]),
           .cp_ac0  (iOLMSFRCeFMeGsFMvGQL),
		   .cp_ac1  (PZQyCgBFWGoAxEUyiNzO),
		   .cp_ac2  (DIvaAYGARSychJVfuaHY),
		   .cp_ac3  (wSCAowmKMCzIwDDaXfFU),
           .v0  (hJbnFyJCwWSCdnyKlTAP),
		   .v1  (OiPTAsOnkSPKocAtfryA),
           .d0  (wPnclwjLvNTvuFBpWQxi),
		   .d1  (ROCrGAVlXuhCUavzlyYo),
		   .d2  (SChJApzreectmjOkIzBX),
		   .d3  (RMlFbjHrYqPuugXjOloi),
           .h0  (GeDDKVWYIpzkYxFRiAby),
		   .h1  (iMZueMKdVPHIdaWHnfbE),
		   .h2  (LxEOjvQABcCaICwJYiyn),
		   .h3  (MbwejxbltOgmKDxkKTsk),
           .h4  (tRZckyVlZtuAOtlwesoj),
		   .h5  (DzkRrIwaMiNHudDvvzFi),
		   .h6  (OFZazskRPRGaTQldCVvG),
		   .h7  (tMINSRlmFWUealRnEpYc));		   

reg zaOGJQEfTLEBpUaywacy;
reg nUKtZNtPhJNNNmgxqurR;
reg ixcGcSoQldNotjgOOoYM;
reg wjPdbOyNQanWDIguicCl;
reg vNBjWwHoPWnZwyRdEAvG;		  
reg OJxfLuIkrNnSWpokhUXW;
reg iedRhyJcTveKSbgVgPyX;
reg clear0;
		   
reg [7:0] AtkWXjDVDEZLaumbWZzI;
reg [7:0] HvOvrGAvaPTzYsRxiQFa;
reg [7:0] rwPuhbqaLGfEsTZJaDhF;
reg [7:0] YphfuswJNWiAbvgWEfjm;
reg [7:0] YhTJCIYfjiXccwQDAncB;
reg [7:0] KaDxyGuuayhqIxIwbGQG;
reg [7:0] SCcERabQMmiRZhSuKFqS;
reg [7:0] ASVDnraQDtLQhInOEyVK;
reg [7:0] RzDedJWchbeEickgtFOM;
reg [7:0] qBWQIFhDbnPbANWZJPUR;
reg [7:0] ONSywhEkLUpjhsBVzOEr;	

reg SiWXyZwStCTfnlFxLPQx;
reg ljlzMOdncFtIKCHtOsVQ;
reg sBtkXBZAHFHDVqMZHZdd;
reg ZNywgghYzvszBznGurzE;
reg giByCXZhzRJrKpUfJiYx;
reg NOzoIRcSVgyFREyzzHqs;
reg hvcttLppSPcVixtVRHqN;
reg NXURaWZymtMESRzASoml;
reg OGJwXjhBDuVzMrVxGthI;
reg tDHSWWPwhDHPIdkjEtEW;
reg spPgPLHCbVgdzOmJFakw;

always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			ZNywgghYzvszBznGurzE <= 1'b0;
		end
		else if(rst_syn)begin
			ZNywgghYzvszBznGurzE <= 1'b0;
		end
		else if(TLXWChymSkORZZFunpRb==1'b1)begin
			if(stall_vld == 1'b1) begin
				ZNywgghYzvszBznGurzE <= ZNywgghYzvszBznGurzE;
			end
			else if(clear0==1'b1) begin      
				ZNywgghYzvszBznGurzE <= 0;
			end
			else if(yXFXdzGdxaoIkmFBQQEg == 1'b1)begin
				ZNywgghYzvszBznGurzE <= yXFXdzGdxaoIkmFBQQEg;   
			end
			else begin
				ZNywgghYzvszBznGurzE <= AnjBJxnRNvrmjOYaJdbg;   
			end
	end
end
always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			NOzoIRcSVgyFREyzzHqs <= 1'b0;
		end
		else if(rst_syn)begin
			NOzoIRcSVgyFREyzzHqs <= 1'b0;
		end
		else if(TLXWChymSkORZZFunpRb==1'b1)begin
			if(stall_vld == 1'b1) begin
				NOzoIRcSVgyFREyzzHqs <= NOzoIRcSVgyFREyzzHqs;
			end
			else if(clear0==1'b1) begin
				NOzoIRcSVgyFREyzzHqs <= 0;
			end
			else if(MWUPIctWCOwXGGiHpLLf == 1'b1)begin
				NOzoIRcSVgyFREyzzHqs <= MWUPIctWCOwXGGiHpLLf;
			end
			else begin
				NOzoIRcSVgyFREyzzHqs <= QBOAjUdMyIByZKpqyMhL;
			end
	end
end
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		NXURaWZymtMESRzASoml <= 1'b0;
	end
	else if(rst_syn)begin
		NXURaWZymtMESRzASoml <= 1'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b1) begin
			NXURaWZymtMESRzASoml <= NXURaWZymtMESRzASoml;
		end
		else if(clear0==1'b1) begin
			NXURaWZymtMESRzASoml <= 0;
		end
		else if(KenTZnwjdIMALELIKQKk == 1'b1)begin
			NXURaWZymtMESRzASoml <= KenTZnwjdIMALELIKQKk;
		end
		else begin
			NXURaWZymtMESRzASoml <= jwJehzFhoYfRjtxXBfpX;
		end
	end
end
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		tDHSWWPwhDHPIdkjEtEW <= 1'b0;
	end
	else if(rst_syn)begin
		tDHSWWPwhDHPIdkjEtEW <= 1'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b1) begin
			tDHSWWPwhDHPIdkjEtEW <= tDHSWWPwhDHPIdkjEtEW;
		end
		else if(clear0==1'b1) begin
			tDHSWWPwhDHPIdkjEtEW <= 0;
		end
		else if(zEUqlZLBLdpXOXXjPGcU == 1'b1)begin
			tDHSWWPwhDHPIdkjEtEW <= zEUqlZLBLdpXOXXjPGcU;
		end
		else begin
			tDHSWWPwhDHPIdkjEtEW <= GQGskmRcyBxJqfiLqYCm;
		end
	end                                                      
end                                                                                              
always@(posedge clk_dwt or negedge rst) begin         
		if(!rst) begin                                    
			giByCXZhzRJrKpUfJiYx <= 1'b0;                   
			hvcttLppSPcVixtVRHqN <= 1'b0;             
			OGJwXjhBDuVzMrVxGthI <= 1'b0;                     
			spPgPLHCbVgdzOmJFakw <= 1'b0;                          
			SiWXyZwStCTfnlFxLPQx <= 1'b0;                         
			ljlzMOdncFtIKCHtOsVQ <= 1'b0;                      
			sBtkXBZAHFHDVqMZHZdd <= 1'b0;            
		end                                       
		else if(rst_syn)begin                              
			giByCXZhzRJrKpUfJiYx <= 1'b0;                      
			hvcttLppSPcVixtVRHqN <= 1'b0;                     
			OGJwXjhBDuVzMrVxGthI <= 1'b0;                
			spPgPLHCbVgdzOmJFakw <= 1'b0;             
			SiWXyZwStCTfnlFxLPQx <= 1'b0;                    
			ljlzMOdncFtIKCHtOsVQ <= 1'b0;                       
			sBtkXBZAHFHDVqMZHZdd <= 1'b0;                     
		end                                 
		else if(TLXWChymSkORZZFunpRb==1'b1)begin        
			if(clear0==1'b1)begin                        
				giByCXZhzRJrKpUfJiYx <= 0;        
				hvcttLppSPcVixtVRHqN <= 0;                   
				OGJwXjhBDuVzMrVxGthI <= 0;           
				spPgPLHCbVgdzOmJFakw <=0;                
				SiWXyZwStCTfnlFxLPQx <= 0;                    
				ljlzMOdncFtIKCHtOsVQ <= 0;             
				sBtkXBZAHFHDVqMZHZdd <= 0; 	              
			end                                          
			else if(stall_vld == 1'b0)begin
				giByCXZhzRJrKpUfJiYx <= LCnqDiWxDusKfEkYTayX; 
				hvcttLppSPcVixtVRHqN <= tbXyWvHmtBVltKRkWupt;
				OGJwXjhBDuVzMrVxGthI <= vGfKaMkyzbfLNzVNKFuM;
				spPgPLHCbVgdzOmJFakw <= FvqlLSYAEuUqbqBPjrJy;
				SiWXyZwStCTfnlFxLPQx <= mxUXarOdzFVqEXRyKhvn;  
				ljlzMOdncFtIKCHtOsVQ <= EakVkLNuSPmYJvnabwQm; 
				sBtkXBZAHFHDVqMZHZdd <= EakVkLNuSPmYJvnabwQm;
			end
	end
end
reg [3:0]NCLfdSDEGhGvIWQaIuMS;

always@(posedge clk_dwt or negedge rst)begin
	if(!rst)begin
		clear0<=0;
	end
	else if(rst_syn)begin
		clear0<=0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(halt)begin
			clear0<=1;
		end
		else if((iedRhyJcTveKSbgVgPyX==1'b1)&&(NCLfdSDEGhGvIWQaIuMS==4'd1))begin
			clear0<=0;
		end
	end
end

always@(posedge clk_dwt or negedge rst)begin
		if(!rst)begin
			NCLfdSDEGhGvIWQaIuMS<=0;
		end
		else if(rst_syn)begin
			NCLfdSDEGhGvIWQaIuMS<=0;
		end
		else if(TLXWChymSkORZZFunpRb==1'b1)begin
			if((zaOGJQEfTLEBpUaywacy==1'b1)&&(iedRhyJcTveKSbgVgPyX==1'b1)&&(clear0==1'b1))begin
				NCLfdSDEGhGvIWQaIuMS<=NCLfdSDEGhGvIWQaIuMS;
			end
			else if((zaOGJQEfTLEBpUaywacy==1'b1)&&(clear0==1'b1))begin
				NCLfdSDEGhGvIWQaIuMS<=NCLfdSDEGhGvIWQaIuMS+1;
			end
			else if((iedRhyJcTveKSbgVgPyX==1'b1)&&(clear0==1'b1))begin
				NCLfdSDEGhGvIWQaIuMS<=NCLfdSDEGhGvIWQaIuMS-1;
			end
		end
end

always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			YphfuswJNWiAbvgWEfjm <= 8'b0;
		end
		else if(rst_syn)begin
			YphfuswJNWiAbvgWEfjm <= YphfuswJNWiAbvgWEfjm;
		end
		else if(TLXWChymSkORZZFunpRb==1'b1)begin
			if(stall_vld == 1'b1) begin
				YphfuswJNWiAbvgWEfjm <= YphfuswJNWiAbvgWEfjm;
			end
			else if(clear0==1'b1) begin
				YphfuswJNWiAbvgWEfjm <= 0;
			end
			else if(yXFXdzGdxaoIkmFBQQEg == 1'b1) begin
				YphfuswJNWiAbvgWEfjm <= {2'b10,yTGSjqlPczasLIzerqoK};
			end
			else if(ScyRLdqxTkIfrAjHfyCe == 1'b1)begin
				YphfuswJNWiAbvgWEfjm <= {2'b01,nUcvoGMUQAyFvkkNKtjY}; 
			end
			else begin
				YphfuswJNWiAbvgWEfjm <= {2'b11,nUcvoGMUQAyFvkkNKtjY}; 
			end
	end
end
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		KaDxyGuuayhqIxIwbGQG <= 8'b0;
	end
	else if(rst_syn)begin	
		KaDxyGuuayhqIxIwbGQG <= 8'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b1) begin
			KaDxyGuuayhqIxIwbGQG <= KaDxyGuuayhqIxIwbGQG;
		end
		else if(clear0==1'b1) begin
			KaDxyGuuayhqIxIwbGQG <= 0;
		end
		else if(MWUPIctWCOwXGGiHpLLf == 1'b1) begin
			KaDxyGuuayhqIxIwbGQG <= {2'b10,nfEXnqhiCOkZzjflZjMq};    
		end
		else if(ukbTnNDbmRSfKKceUWrz == 1'b1)begin
			KaDxyGuuayhqIxIwbGQG <= {2'b01,dsqvhOxPSNmrxhIMFonB};
		end
		else begin
			KaDxyGuuayhqIxIwbGQG <= {2'b11,dsqvhOxPSNmrxhIMFonB};
		end
	end
end
always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			ASVDnraQDtLQhInOEyVK <= 8'b0;
		end
		else if(rst_syn)begin
			ASVDnraQDtLQhInOEyVK <= 8'b0;
		end
		else if(TLXWChymSkORZZFunpRb==1'b1)begin
			if(stall_vld == 1'b1) begin
				ASVDnraQDtLQhInOEyVK <= ASVDnraQDtLQhInOEyVK;
			end
			else if(clear0==1'b1) begin
				ASVDnraQDtLQhInOEyVK <= 0;
			end
			else if(KenTZnwjdIMALELIKQKk == 1'b1) begin
				ASVDnraQDtLQhInOEyVK <= {2'b10,DvTzkZIPCHcTKThgKbxF};  
			end
			else if(IjiwjVZQiEWuSfonIrZA == 1'b1)begin
				ASVDnraQDtLQhInOEyVK <= {2'b01,FtmPDiwqoZcWFUaAxCkO};
			end
			else begin
				ASVDnraQDtLQhInOEyVK <= {2'b11,FtmPDiwqoZcWFUaAxCkO};
			end
		end
end
always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			qBWQIFhDbnPbANWZJPUR <= 8'b0;
		end
		else if(rst_syn)begin
			qBWQIFhDbnPbANWZJPUR <= 8'b0;
		end
		else if(TLXWChymSkORZZFunpRb==1'b1)begin
			if(stall_vld == 1'b1) begin
				qBWQIFhDbnPbANWZJPUR <= qBWQIFhDbnPbANWZJPUR;
			end
			else if(clear0==1'b1) begin
				qBWQIFhDbnPbANWZJPUR <= 0;
			end
			else if(zEUqlZLBLdpXOXXjPGcU == 1'b1) begin
				qBWQIFhDbnPbANWZJPUR <= {2'b10,efILpTiRRkTMGybaFavH};   
			end
			else if(PJhNpCthKhZROimGgCqU == 1'b1)begin
				qBWQIFhDbnPbANWZJPUR <= {2'b01,vNwqhqUgvKlnIAxSJzvz};
			end
			else begin
				qBWQIFhDbnPbANWZJPUR <= {2'b11,vNwqhqUgvKlnIAxSJzvz};
			end
		end
end
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		YhTJCIYfjiXccwQDAncB <= 8'b0;
	end
	else if(rst_syn)begin
		YhTJCIYfjiXccwQDAncB <= 8'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b1) begin
			YhTJCIYfjiXccwQDAncB <= YhTJCIYfjiXccwQDAncB;
		end
		else if(clear0==1'b1) begin
			YhTJCIYfjiXccwQDAncB <= 0;
		end
		else if(ScyRLdqxTkIfrAjHfyCe == 1'b1) begin
			YhTJCIYfjiXccwQDAncB <= {2'b01,ZOtXbSepnanqtWVZDuyz};  
		end
		else begin
			YhTJCIYfjiXccwQDAncB <= {2'b11,ZOtXbSepnanqtWVZDuyz};   
		end
	end
end	   
always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			SCcERabQMmiRZhSuKFqS <= 8'b0;
		end
		else if(rst_syn)begin
			SCcERabQMmiRZhSuKFqS <= 8'b0;
		end
		else if(TLXWChymSkORZZFunpRb==1'b1)begin
			if(stall_vld == 1'b1) begin
				SCcERabQMmiRZhSuKFqS <= SCcERabQMmiRZhSuKFqS;
			end
			else if(clear0==1'b1) begin
				SCcERabQMmiRZhSuKFqS <= 0;
			end
			else if(ukbTnNDbmRSfKKceUWrz == 1'b1) begin
				SCcERabQMmiRZhSuKFqS <= {2'b01,mtxvjxcqPDeqRFTdOeCy};
			end
			else begin
				SCcERabQMmiRZhSuKFqS <= {2'b11,mtxvjxcqPDeqRFTdOeCy};
			end
	end
end

always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		RzDedJWchbeEickgtFOM <= 8'b0;
	end
	else if(rst_syn)begin
		RzDedJWchbeEickgtFOM <= RzDedJWchbeEickgtFOM;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b1) begin
			RzDedJWchbeEickgtFOM <= RzDedJWchbeEickgtFOM;
		end
		else if(clear0==1'b1) begin
			RzDedJWchbeEickgtFOM <= 0;
		end
		else if(IjiwjVZQiEWuSfonIrZA == 1'b1) begin
			RzDedJWchbeEickgtFOM <= {2'b01,hJRUqkSdbIbaDoVNyBwV};
		end
		else begin
			RzDedJWchbeEickgtFOM <= {2'b11,hJRUqkSdbIbaDoVNyBwV};
		end
	end
end
always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			ONSywhEkLUpjhsBVzOEr <= 8'b0;
		end
		else if(rst_syn)begin
			ONSywhEkLUpjhsBVzOEr <= 8'b0;
		end
		else if(TLXWChymSkORZZFunpRb==1'b1)begin
			if(stall_vld == 1'b1) begin
				ONSywhEkLUpjhsBVzOEr <= ONSywhEkLUpjhsBVzOEr;
			end
			else if(clear0==1'b1) begin
				ONSywhEkLUpjhsBVzOEr <= 0;
			end
			else if(PJhNpCthKhZROimGgCqU == 1'b1) begin
				ONSywhEkLUpjhsBVzOEr <= {2'b01,vyNQySISFoomjfGcZIij};
			end
			else begin
				ONSywhEkLUpjhsBVzOEr <= {2'b11,vyNQySISFoomjfGcZIij};
			end
	end
end
always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			AtkWXjDVDEZLaumbWZzI <= 8'b0;
			HvOvrGAvaPTzYsRxiQFa <= 8'b0;
			rwPuhbqaLGfEsTZJaDhF <= 8'b0;
		end
		else if(rst_syn)begin
			AtkWXjDVDEZLaumbWZzI <= 8'b0;
			HvOvrGAvaPTzYsRxiQFa <= 8'b0;
			rwPuhbqaLGfEsTZJaDhF <= 8'b0;
		end
		else if(TLXWChymSkORZZFunpRb==1'b1)begin
			if(clear0==1'b1)begin
				AtkWXjDVDEZLaumbWZzI <=0;
				HvOvrGAvaPTzYsRxiQFa <=0;
				rwPuhbqaLGfEsTZJaDhF <=0;
			end
			else if(stall_vld == 1'b0)begin
				AtkWXjDVDEZLaumbWZzI <= {2'b11,XKEboOlymZUysNbdgYvz};   
				HvOvrGAvaPTzYsRxiQFa <= {2'b11,YnUHFWqMbTwhpriTzfCj};
				rwPuhbqaLGfEsTZJaDhF <= {2'b11,EKkouikFTiQAhxGiNBgA};
			end
		end
end

reg NfdfbTCtNjYFDeLLecMe;
reg stop_d;
reg cZtnlbbCHcnJaupBkWiH;
always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			AnaDOfYtVBlpyqvNRuwL <= 1'b0;
			irdAYQxVjzyKmWopQQGP <= 1'b0;
			NfdfbTCtNjYFDeLLecMe <= 1'b0;
			stop_d <= 1'b0;
			cZtnlbbCHcnJaupBkWiH <= 1'b0;
		end
		else if(rst_syn)begin
			AnaDOfYtVBlpyqvNRuwL <= 1'b0;
			irdAYQxVjzyKmWopQQGP <= 1'b0;
			NfdfbTCtNjYFDeLLecMe <= 1'b0;
			stop_d <= 1'b0;
			cZtnlbbCHcnJaupBkWiH <= 1'b0;
		end
		else if(TLXWChymSkORZZFunpRb==1'b1)begin
			if(stall_vld == 1'b0)begin
				AnaDOfYtVBlpyqvNRuwL <= stop_flag;
				irdAYQxVjzyKmWopQQGP <= AnaDOfYtVBlpyqvNRuwL;
				NfdfbTCtNjYFDeLLecMe <= irdAYQxVjzyKmWopQQGP;
				stop_d <= NfdfbTCtNjYFDeLLecMe;
				cZtnlbbCHcnJaupBkWiH <= stop_d;
			end
	end
end

always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			zaOGJQEfTLEBpUaywacy <= 1'b0;
			nUKtZNtPhJNNNmgxqurR <= 1'b0;
			ixcGcSoQldNotjgOOoYM <= 1'b0;
			wjPdbOyNQanWDIguicCl <= 1'b0;	
			vNBjWwHoPWnZwyRdEAvG <= 1'b0;	
			OJxfLuIkrNnSWpokhUXW <= 1'b0;
			iedRhyJcTveKSbgVgPyX <= 1'b0;
		end
		else if(rst_syn)begin
			zaOGJQEfTLEBpUaywacy <= 1'b0;
			nUKtZNtPhJNNNmgxqurR <= 1'b0;
			wjPdbOyNQanWDIguicCl <= 1'b0;	
			vNBjWwHoPWnZwyRdEAvG <= 1'b0;	
			ixcGcSoQldNotjgOOoYM <= 1'b0;
			OJxfLuIkrNnSWpokhUXW <= 1'b0;
			iedRhyJcTveKSbgVgPyX <= 1'b0;
		end
		else if(TLXWChymSkORZZFunpRb==1'b1)begin
		  begin
			zaOGJQEfTLEBpUaywacy <= halt;
			nUKtZNtPhJNNNmgxqurR <= zaOGJQEfTLEBpUaywacy;
			ixcGcSoQldNotjgOOoYM <= nUKtZNtPhJNNNmgxqurR;
			wjPdbOyNQanWDIguicCl <= ixcGcSoQldNotjgOOoYM;
			vNBjWwHoPWnZwyRdEAvG <= wjPdbOyNQanWDIguicCl;
			OJxfLuIkrNnSWpokhUXW <= vNBjWwHoPWnZwyRdEAvG;
			iedRhyJcTveKSbgVgPyX <= OJxfLuIkrNnSWpokhUXW;
		  end
	end
end


reg EKBqBkGyDrNcFHOfjtgn;
reg KumgZSySTTIGMUcWgRdh;
reg HxXYWpNqyqlzgutCIOpi;
reg yzpfeoTAaHHpJpkuQmAL;
reg ghlCNlUzfCnYSTaJpNbT;
reg jLBoLaUfmLsnEHwyAwLL;
reg llosDFMvnCAKMOxOibDN;
reg MrzmNYBuuFEuvAOOCmID;
reg VCUnrYIIgEylHRijrmgt;
reg KBRhkzHtzdoYThlTfbxX;
reg NxoMdKnjbLmEbfTszmAA;
always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			EKBqBkGyDrNcFHOfjtgn <= 1'b0;
			KumgZSySTTIGMUcWgRdh <= 1'b0;
			HxXYWpNqyqlzgutCIOpi <= 1'b0;
			yzpfeoTAaHHpJpkuQmAL <= 1'b0;
			ghlCNlUzfCnYSTaJpNbT <= 1'b0;
			jLBoLaUfmLsnEHwyAwLL <= 1'b0;
			llosDFMvnCAKMOxOibDN <= 1'b0;
			MrzmNYBuuFEuvAOOCmID <= 1'b0;
			VCUnrYIIgEylHRijrmgt <= 1'b0;
			KBRhkzHtzdoYThlTfbxX <= 1'b0;
			NxoMdKnjbLmEbfTszmAA <= 1'b0;
		end
		else if(rst_syn)begin
			EKBqBkGyDrNcFHOfjtgn <= 1'b0;
			KumgZSySTTIGMUcWgRdh <= 1'b0;
			HxXYWpNqyqlzgutCIOpi <= 1'b0;
			yzpfeoTAaHHpJpkuQmAL <= 1'b0;
			ghlCNlUzfCnYSTaJpNbT <= 1'b0;
			jLBoLaUfmLsnEHwyAwLL <= 1'b0;
			llosDFMvnCAKMOxOibDN <= 1'b0;
			MrzmNYBuuFEuvAOOCmID <= 1'b0;
			VCUnrYIIgEylHRijrmgt <= 1'b0;
			KBRhkzHtzdoYThlTfbxX <= 1'b0;
			NxoMdKnjbLmEbfTszmAA <= 1'b0;
		end
		else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
			EKBqBkGyDrNcFHOfjtgn <= cZtnlbbCHcnJaupBkWiH;
			KumgZSySTTIGMUcWgRdh <= EKBqBkGyDrNcFHOfjtgn;
			HxXYWpNqyqlzgutCIOpi <= KumgZSySTTIGMUcWgRdh;
			yzpfeoTAaHHpJpkuQmAL <= HxXYWpNqyqlzgutCIOpi;
			ghlCNlUzfCnYSTaJpNbT <= yzpfeoTAaHHpJpkuQmAL;
			jLBoLaUfmLsnEHwyAwLL <= ghlCNlUzfCnYSTaJpNbT;
			llosDFMvnCAKMOxOibDN <= jLBoLaUfmLsnEHwyAwLL;
			MrzmNYBuuFEuvAOOCmID <= llosDFMvnCAKMOxOibDN;
			VCUnrYIIgEylHRijrmgt <= MrzmNYBuuFEuvAOOCmID;
			KBRhkzHtzdoYThlTfbxX <= VCUnrYIIgEylHRijrmgt;
			NxoMdKnjbLmEbfTszmAA <= KBRhkzHtzdoYThlTfbxX;
		end
	end
end
reg WEZSWrIvxomNfGvFQSiS;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		WEZSWrIvxomNfGvFQSiS <= 1'b0;
	end
	else if(rst_syn)begin
		WEZSWrIvxomNfGvFQSiS <= 1'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		WEZSWrIvxomNfGvFQSiS <= NxoMdKnjbLmEbfTszmAA;
	end
end

wire flush=((NxoMdKnjbLmEbfTszmAA==1'b1)&&(WEZSWrIvxomNfGvFQSiS==1'b0));   

reg ULkqQHcjawmJPPtzcPCS;
reg gVMkJmsMEYFtEfiuwaKj;
reg yHFGaozymIVZZMqtzLDd;
reg XyhfMHNDiNoQgejMGALx;
reg zWhpxSLccsmBmQBUhbQT;
reg flush_mq2;
always@(posedge clk_dwt or negedge rst) begin
		if(!rst) begin
			ULkqQHcjawmJPPtzcPCS <= 1'b0;
			gVMkJmsMEYFtEfiuwaKj <= 1'b0;
			yHFGaozymIVZZMqtzLDd <= 1'b0;
			XyhfMHNDiNoQgejMGALx <= 1'b0;
			zWhpxSLccsmBmQBUhbQT <= 1'b0;
			flush_mq2 <= 1'b0;
		end
		else if(rst_syn)begin
			ULkqQHcjawmJPPtzcPCS <= 1'b0;
			gVMkJmsMEYFtEfiuwaKj <= 1'b0;
			yHFGaozymIVZZMqtzLDd <= 1'b0;
			XyhfMHNDiNoQgejMGALx <= 1'b0;
			zWhpxSLccsmBmQBUhbQT <= 1'b0;
			flush_mq2 <= 1'b0;
		end
		else if(TLXWChymSkORZZFunpRb==1'b1)begin
			begin
				ULkqQHcjawmJPPtzcPCS <= flush;
				gVMkJmsMEYFtEfiuwaKj <= ULkqQHcjawmJPPtzcPCS;
				yHFGaozymIVZZMqtzLDd <= gVMkJmsMEYFtEfiuwaKj;
				XyhfMHNDiNoQgejMGALx <= yHFGaozymIVZZMqtzLDd;
				zWhpxSLccsmBmQBUhbQT <= XyhfMHNDiNoQgejMGALx;
				flush_mq2 <= zWhpxSLccsmBmQBUhbQT;
			end
		end
end

wire [7:0] fgBVAEOmiYVjlIISCTIH;
wire [7:0] PdLWGIyUFHffTRZAsXiT;
wire [7:0] vhvQKmfEYGSlphsIxeCs;
wire [7:0] ZrFbZJjPMDHEuYZROGXq;
wire [7:0] rNNkvcsqGpEfYTFDzfVx;
wire [7:0] gSOvAWNVzyvqOdeFdGBD;
wire [7:0] swvJpulbpsiHraGukmel;
wire [7:0] MZAAugUMqOwtwlGxrxHD;
wire [7:0] wiIBdEFJlcmgdYcgLXUm;
wire [7:0] IjOxLvRkFoEokvDkjrWC;
wire [7:0] IEUQfWnHqBExbBpXwbvB;

wire [7:0] GbYmcGaIlqjpWzdZjqBp;
wire [7:0] TghzaXxRPdJlXVwzFDAD;
wire [7:0] YAASZmHihSFveuiuJvLh;
wire [7:0] ocPDqzzUPgxTaaFQZlAE;
wire [7:0] kcusTHsweGWDyjtCnIBf;
wire [7:0] dKkjeMyncyQRxvRIwqPA;
wire [7:0] EHWbumRhhmCKMpopxvsh;
wire [7:0] cCnPBAQqvspFpEzzETzl;
wire [7:0] UYqzkztXutPXfAlntmIe;
wire [7:0] oodnGoVBEFLXRYbIuTZH;
wire [7:0] UEjSAfHFDOHJVjUcqlyV;

wire [7:0] KbCXNnOzLNNXshAASoJQ;
wire [7:0] dZuQNijhFBiKnuZpqbhR;
wire [7:0] MxeVrIIjXjHhMTtBElyf;
wire [7:0] kKAPmncZqeprKWNSWaTt;
wire [7:0] VQgYvKGZkjJJdsVwucAn;
wire [7:0] ZBAcKCzbbtyGNFJTLssB;
wire [7:0] CiOSqQnSEhYxmkXsaDND;
wire [7:0] LDsPXWEPicfpIjiWWkyV;
wire [7:0] nwCqqIlwmIahIICTFdFZ;
wire [7:0] QtIuCkNDVwtcSHZjgOQS;
wire [7:0] LDQqguWjQKoxPNymDyBm;

wire [7:0] DfputgBBPRNGLqgzPBuA;
wire [7:0] kKDaJKfyhGUjRrYwUzKX;
wire [7:0] GDZIoCcQuBITjSmBaikb;
wire [7:0] ljadIVAQTunpolprdLGQ;
wire [7:0] OxcEJGONRWfXnCqSZXTH;
wire [7:0] gNgEiixQfJFjHtuQANMI;
wire [7:0] vtSfmOeSBNpxPquiNIqP;
wire [7:0] RMsvoDBxWZNHZYyRnucE;
wire [7:0] odCWwYTcNelybScqPOrq;
wire [7:0] qamgOkghlPFeFDHIGFOg;
wire [7:0] bvJEkPmMozsNjTgxGIjx;

wire [7:0] qoYkKuhRcFRIEjGVNSYr;
wire [7:0] UJQCDCcaYonSiaokxDre;
wire [7:0] XfgkZLFlzjyrDznMrcdV;
wire [7:0] pDhwqtEHzvhljjKMPTWP;
wire [7:0] qfjPeklMjDGejTiSfNIt;
wire [7:0] vrecAxiqQRDsoCHUfiFb;
wire [7:0] gbkYGwdQTqZWSCtNFrZe;
wire [7:0] UYZDjbOKWxcSdKfttqUj;
wire [7:0] tSvfZFkWjBAhoMbTMbGC;
wire [7:0] xpKEZGLFzrHJpOvPPJaM;
wire [7:0] SZXfYOpMhabsiRRCseep;

wire [7:0] wdktOdkfpRIjBFWRskyy;
wire [7:0] XtpCtWnmSuWHOsTqZTym;
wire [7:0] DhkTmLWGgIijHQCsyBGu;
wire [7:0] dCdOIdQSdpJJEpfVtfcI;
wire [7:0] xDRSACReidKmHWwBGfrd;
wire [7:0] uSDdEsjCTtDTYbbzgPYt;
wire [7:0] mMmeQlGeOWUHeCGZYuFH;
wire [7:0] BzuLPpKZoBjzJGrJsCNT;
wire [7:0] qzjxgrtVaWdFUvDXZSlW;
wire [7:0] aKhjwQvKRXkKESxNpCdv;
wire [7:0] RlJbMuoNsFRvRGUndmqJ;

wire [7:0] aUXkQrNeprUTqroMVQkh;
wire [7:0] ueGkTdhRmAPwkHUFjCcB;
wire [7:0] WJgVcZeIlUPAOKNBDkRp;
wire [7:0] GbyWvndxMseuyAnHwqnn;
wire [7:0] fgSaGMvdDFsySIwaEFDl;
wire [7:0] TWNIsjejhhesTXHcPEXR;
wire [7:0] oOMQdvXrwnziblklWeCC;
wire [7:0] PRPGGGOZHlXZawqLHheG;
wire [7:0] sRxxBWOUzCnzaJSwPVis;
wire [7:0] WUpTDUSrWypCEwLSuGfv;
wire [7:0] aosXwrwMOrAgqTMonPEl;

wire [7:0] wGXyGfTnNwRhTumdiCGF;
wire [7:0] lYiujcECoGxEWkrYSXyu;
wire [7:0] FcfzXjMGKuXLyaJFuFYp;
wire [7:0] aNBYERFSzNqtXSXlqnBT;
wire [7:0] CJtqbdygHCsrTkXruGSz;
wire [7:0] bKIkKcnefDXbiSoGbphG;
wire [7:0] QQmGqPKzzfLgdsKYgOcf;
wire [7:0] gdYapLlMIvytKkdCPGdF;
wire [7:0] aCJESItBOvnDmuXhGLUj;
wire [7:0] cCJQFJSCdvVDIbNwwNYX;
wire [7:0] wUTXVpqsmevBpWIEQIcX;

wire [7:0] arAMQHIzryMkLJaQqtfc;
wire [7:0] IbJlCRYwAhvuEtwkcBcb;
wire [7:0] vnkIPwebhyHAOTzzgwVN;
wire [7:0] lntJsaTLMeamyadjIcTz;
wire [7:0] qYjtKZZixtZuERqFtmIt;
wire [7:0] kmnIYqtQigWTYlmkNXLZ;
wire [7:0] lVoLEEsHkrGIptSSdJcY;
wire [7:0] SgmCLdndNiIesEfyKaAV;
wire [7:0] CIiJbWTXRTpdlclBsmUo;
wire [7:0] mEAXrFrKUcZGRUUUPlCz;
wire [7:0] vRiAMmICbUzvsnWJgkIc;

wire [7:0] TcgQxrdWVGHwfyElUUiW;
wire [7:0] guNUkxLYmXSQcvDmFJjZ;
wire [7:0] qLIEqYlgQSYNbeBecRoB;
wire [7:0] UHncrmKWsoaHDctgdVja;
wire [7:0] PQSouAAUPcxkmmblfshP;
wire [7:0] uwxRdnAxqWbPQTUuriZn;
wire [7:0] SFhHYzgkWQvWPnYCsDQG;
wire [7:0] wlhWXlRaNWiNUaCsDbir;
wire [7:0] ZCvoQcyBQrHPNpBpgqWq;
wire [7:0] DoUSRWVGFusLLetLJBat;
wire [7:0] lyzLOaLahwZtRIJhxymQ;

wire [7:0] LNBmAEdbMEaMLoyGjfrg;
wire [7:0] NGUIuhzztIZkaOVpHXkO;
wire [7:0] PPSQkMpMFizQsBRWIVai;
wire [7:0] GRuWEivLoABPjtPLXVMJ;
wire [7:0] sKoGsBbnNlQcSJQjwTEW;
wire [7:0] oIGQlTOwKxwTNFHglOMa;
wire [7:0] icqejOGfHvoPMyPQlOYY;
wire [7:0] myNXLrkAdgdxqjfkvzMr;
wire [7:0] SQvlodcafgaLzSTpKwZU;
wire [7:0] JFcINZjcavbTjAQKtCAw;

wire ExtHnVBbbCKXmXvjlQbJ;
wire fyCXQMODfHLggLbBphNv;
wire FegNvVfGaRhonmIqphKH;
wire XKLIUflcsFaNUXkXzpGV;
wire WGoVpQqTXnVgKMxSubxK;
wire kkZHarzgXLRhVsIHWayf;
wire WSOxsHPzGmWQhcOCvFgt;
wire bvwQWDbjMnOESnlTUssU;
wire ZCyUDUWbyCkGqyuKuIIZ;
wire upupOTpybpRssnNDEENe;


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
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld == 1'b0)begin
			arrange_out0 <= LNBmAEdbMEaMLoyGjfrg;
			arrange_out1 <= NGUIuhzztIZkaOVpHXkO;
			arrange_out2 <= PPSQkMpMFizQsBRWIVai;
			arrange_out3 <= GRuWEivLoABPjtPLXVMJ;
			arrange_out4 <= sKoGsBbnNlQcSJQjwTEW;
			arrange_out5 <= oIGQlTOwKxwTNFHglOMa;
			arrange_out6 <= icqejOGfHvoPMyPQlOYY;
			arrange_out7 <= myNXLrkAdgdxqjfkvzMr;
			arrange_out8 <= SQvlodcafgaLzSTpKwZU;
			arrange_out9 <= JFcINZjcavbTjAQKtCAw;
		end
	end
end

reg OhNfXTYefFZeDsgPpgBQ;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		OhNfXTYefFZeDsgPpgBQ <= 1'b0;
	end
	else if(rst_syn)begin
		OhNfXTYefFZeDsgPpgBQ <= 1'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		begin
			OhNfXTYefFZeDsgPpgBQ <= jMCVmjFKEszeMFGJPhDT;
		end
	end
end

reg PPgHUmQXljcKYbhzgNbQ;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst)begin
		PPgHUmQXljcKYbhzgNbQ<=0;
	end
	else if(rst_syn)begin
		PPgHUmQXljcKYbhzgNbQ<=0;	 
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(NxoMdKnjbLmEbfTszmAA==1'b1)begin
			if(halt==1'b1)begin
				PPgHUmQXljcKYbhzgNbQ<=1;
			end
		end	
		else begin
			PPgHUmQXljcKYbhzgNbQ<=0;
		end
	end
end

wire [3:0]vld_num;
reg [3:0] lZVGNfUlVmsuLbJxnQDA;
assign vld_num=(level_flag!=3'b111)?lZVGNfUlVmsuLbJxnQDA:3'b0;
always@(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		lZVGNfUlVmsuLbJxnQDA <= 4'b0;
	end
	else if(rst_syn)begin
		lZVGNfUlVmsuLbJxnQDA <= 4'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(((NxoMdKnjbLmEbfTszmAA == 1'b1)||(OhNfXTYefFZeDsgPpgBQ == 1'b0))&&(stall_vld==1'b0)) begin
			lZVGNfUlVmsuLbJxnQDA <= 4'b0;
		end
		else if(PPgHUmQXljcKYbhzgNbQ==1)begin
			lZVGNfUlVmsuLbJxnQDA <= 4'b0;
		end
		else if(stall_vld == 1'b0)begin
			lZVGNfUlVmsuLbJxnQDA <= ExtHnVBbbCKXmXvjlQbJ+fyCXQMODfHLggLbBphNv+FegNvVfGaRhonmIqphKH+XKLIUflcsFaNUXkXzpGV+WGoVpQqTXnVgKMxSubxK+kkZHarzgXLRhVsIHWayf+WSOxsHPzGmWQhcOCvFgt+bvwQWDbjMnOESnlTUssU+ZCyUDUWbyCkGqyuKuIIZ+upupOTpybpRssnNDEENe; 
		end
	end
end
u_jp2k_1 u_cell00(fgBVAEOmiYVjlIISCTIH,c0_vld,stall_vld,AtkWXjDVDEZLaumbWZzI,HvOvrGAvaPTzYsRxiQFa,SiWXyZwStCTfnlFxLPQx,1'b1,ljlzMOdncFtIKCHtOsVQ,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);   
u_jp2k_1 u_cell01(PdLWGIyUFHffTRZAsXiT,c1_vld,stall_vld,HvOvrGAvaPTzYsRxiQFa,rwPuhbqaLGfEsTZJaDhF,ljlzMOdncFtIKCHtOsVQ,SiWXyZwStCTfnlFxLPQx,sBtkXBZAHFHDVqMZHZdd,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell02(vhvQKmfEYGSlphsIxeCs,c2_vld,stall_vld,rwPuhbqaLGfEsTZJaDhF,YphfuswJNWiAbvgWEfjm,sBtkXBZAHFHDVqMZHZdd,ljlzMOdncFtIKCHtOsVQ,ZNywgghYzvszBznGurzE,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell03(ZrFbZJjPMDHEuYZROGXq,c3_vld,stall_vld,YphfuswJNWiAbvgWEfjm,YhTJCIYfjiXccwQDAncB,ZNywgghYzvszBznGurzE,sBtkXBZAHFHDVqMZHZdd,giByCXZhzRJrKpUfJiYx,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell04(rNNkvcsqGpEfYTFDzfVx,c4_vld,stall_vld,YhTJCIYfjiXccwQDAncB,KaDxyGuuayhqIxIwbGQG,giByCXZhzRJrKpUfJiYx,ZNywgghYzvszBznGurzE,NOzoIRcSVgyFREyzzHqs,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell05(gSOvAWNVzyvqOdeFdGBD,c5_vld,stall_vld,KaDxyGuuayhqIxIwbGQG,SCcERabQMmiRZhSuKFqS,NOzoIRcSVgyFREyzzHqs,giByCXZhzRJrKpUfJiYx,hvcttLppSPcVixtVRHqN,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell06(swvJpulbpsiHraGukmel,c6_vld,stall_vld,SCcERabQMmiRZhSuKFqS,ASVDnraQDtLQhInOEyVK,hvcttLppSPcVixtVRHqN,NOzoIRcSVgyFREyzzHqs,NXURaWZymtMESRzASoml,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell07(MZAAugUMqOwtwlGxrxHD,c7_vld,stall_vld,ASVDnraQDtLQhInOEyVK,RzDedJWchbeEickgtFOM,NXURaWZymtMESRzASoml,hvcttLppSPcVixtVRHqN,OGJwXjhBDuVzMrVxGthI,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell08(wiIBdEFJlcmgdYcgLXUm,c8_vld,stall_vld,RzDedJWchbeEickgtFOM,qBWQIFhDbnPbANWZJPUR,OGJwXjhBDuVzMrVxGthI,NXURaWZymtMESRzASoml,tDHSWWPwhDHPIdkjEtEW,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell09(IjOxLvRkFoEokvDkjrWC,c9_vld,stall_vld,qBWQIFhDbnPbANWZJPUR,ONSywhEkLUpjhsBVzOEr,tDHSWWPwhDHPIdkjEtEW,OGJwXjhBDuVzMrVxGthI,spPgPLHCbVgdzOmJFakw,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell0a(IEUQfWnHqBExbBpXwbvB,c10_vld,stall_vld,ONSywhEkLUpjhsBVzOEr,8'b0,spPgPLHCbVgdzOmJFakw,tDHSWWPwhDHPIdkjEtEW,1'b0,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
                                                       
u_jp2k_1 u_cell10(GbYmcGaIlqjpWzdZjqBp,c11_vld,stall_vld,fgBVAEOmiYVjlIISCTIH,PdLWGIyUFHffTRZAsXiT,c0_vld,1'b1,c1_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn); 
u_jp2k_1 u_cell11(TghzaXxRPdJlXVwzFDAD,c12_vld,stall_vld,PdLWGIyUFHffTRZAsXiT,vhvQKmfEYGSlphsIxeCs,c1_vld,c0_vld,c2_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell12(YAASZmHihSFveuiuJvLh,c13_vld,stall_vld,vhvQKmfEYGSlphsIxeCs,ZrFbZJjPMDHEuYZROGXq,c2_vld,c1_vld,c3_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell13(ocPDqzzUPgxTaaFQZlAE,c14_vld,stall_vld,ZrFbZJjPMDHEuYZROGXq,rNNkvcsqGpEfYTFDzfVx,c3_vld,c2_vld,c4_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell14(kcusTHsweGWDyjtCnIBf,c15_vld,stall_vld,rNNkvcsqGpEfYTFDzfVx,gSOvAWNVzyvqOdeFdGBD,c4_vld,c3_vld,c5_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell15(dKkjeMyncyQRxvRIwqPA,c16_vld,stall_vld,gSOvAWNVzyvqOdeFdGBD,swvJpulbpsiHraGukmel,c5_vld,c4_vld,c6_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell16(EHWbumRhhmCKMpopxvsh,c17_vld,stall_vld,swvJpulbpsiHraGukmel,MZAAugUMqOwtwlGxrxHD,c6_vld,c5_vld,c7_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell17(cCnPBAQqvspFpEzzETzl,c18_vld,stall_vld,MZAAugUMqOwtwlGxrxHD,wiIBdEFJlcmgdYcgLXUm,c7_vld,c6_vld,c8_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell18(UYqzkztXutPXfAlntmIe,c19_vld,stall_vld,wiIBdEFJlcmgdYcgLXUm,IjOxLvRkFoEokvDkjrWC,c8_vld,c7_vld,c9_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell19(oodnGoVBEFLXRYbIuTZH,c20_vld,stall_vld,IjOxLvRkFoEokvDkjrWC,IEUQfWnHqBExbBpXwbvB,c9_vld,c8_vld,c10_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell1a(UEjSAfHFDOHJVjUcqlyV,c21_vld,stall_vld,IEUQfWnHqBExbBpXwbvB,8'b0,c10_vld,c9_vld,1'b0,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
                                                       
u_jp2k_1 u_cell20(KbCXNnOzLNNXshAASoJQ,c22_vld,stall_vld,GbYmcGaIlqjpWzdZjqBp,TghzaXxRPdJlXVwzFDAD,c11_vld,1'b1,c12_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);  
u_jp2k_1 u_cell21(dZuQNijhFBiKnuZpqbhR,c23_vld,stall_vld,TghzaXxRPdJlXVwzFDAD,YAASZmHihSFveuiuJvLh,c12_vld,c11_vld,c13_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell22(MxeVrIIjXjHhMTtBElyf,c24_vld,stall_vld,YAASZmHihSFveuiuJvLh,ocPDqzzUPgxTaaFQZlAE,c13_vld,c12_vld,c14_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell23(kKAPmncZqeprKWNSWaTt,c25_vld,stall_vld,ocPDqzzUPgxTaaFQZlAE,kcusTHsweGWDyjtCnIBf,c14_vld,c13_vld,c15_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell24(VQgYvKGZkjJJdsVwucAn,c26_vld,stall_vld,kcusTHsweGWDyjtCnIBf,dKkjeMyncyQRxvRIwqPA,c15_vld,c14_vld,c16_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell25(ZBAcKCzbbtyGNFJTLssB,c27_vld,stall_vld,dKkjeMyncyQRxvRIwqPA,EHWbumRhhmCKMpopxvsh,c16_vld,c15_vld,c17_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell26(CiOSqQnSEhYxmkXsaDND,c28_vld,stall_vld,EHWbumRhhmCKMpopxvsh,cCnPBAQqvspFpEzzETzl,c17_vld,c16_vld,c18_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell27(LDsPXWEPicfpIjiWWkyV,c29_vld,stall_vld,cCnPBAQqvspFpEzzETzl,UYqzkztXutPXfAlntmIe,c18_vld,c17_vld,c19_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell28(nwCqqIlwmIahIICTFdFZ,c30_vld,stall_vld,UYqzkztXutPXfAlntmIe,oodnGoVBEFLXRYbIuTZH,c19_vld,c18_vld,c20_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell29(QtIuCkNDVwtcSHZjgOQS,c31_vld,stall_vld,oodnGoVBEFLXRYbIuTZH,UEjSAfHFDOHJVjUcqlyV,c20_vld,c19_vld,c21_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell2a(LDQqguWjQKoxPNymDyBm,c32_vld,stall_vld,UEjSAfHFDOHJVjUcqlyV,8'b0,c21_vld,c20_vld,1'b0,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
                                                   
u_jp2k_1 u_cell30(DfputgBBPRNGLqgzPBuA,c33_vld,stall_vld,KbCXNnOzLNNXshAASoJQ,dZuQNijhFBiKnuZpqbhR,c22_vld,1'b1,c23_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);  
u_jp2k_1 u_cell31(kKDaJKfyhGUjRrYwUzKX,cell31_out_vld,stall_vld,dZuQNijhFBiKnuZpqbhR,MxeVrIIjXjHhMTtBElyf,c23_vld,c22_vld,c24_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell32(GDZIoCcQuBITjSmBaikb,cell32_out_vld,stall_vld,MxeVrIIjXjHhMTtBElyf,kKAPmncZqeprKWNSWaTt,c24_vld,c23_vld,c25_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell33(ljadIVAQTunpolprdLGQ,cell33_out_vld,stall_vld,kKAPmncZqeprKWNSWaTt,VQgYvKGZkjJJdsVwucAn,c25_vld,c24_vld,c26_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell34(OxcEJGONRWfXnCqSZXTH,cell34_out_vld,stall_vld,VQgYvKGZkjJJdsVwucAn,ZBAcKCzbbtyGNFJTLssB,c26_vld,c25_vld,c27_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell35(gNgEiixQfJFjHtuQANMI,cell35_out_vld,stall_vld,ZBAcKCzbbtyGNFJTLssB,CiOSqQnSEhYxmkXsaDND,c27_vld,c26_vld,c28_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell36(vtSfmOeSBNpxPquiNIqP,cell36_out_vld,stall_vld,CiOSqQnSEhYxmkXsaDND,LDsPXWEPicfpIjiWWkyV,c28_vld,c27_vld,c29_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell37(RMsvoDBxWZNHZYyRnucE,cell37_out_vld,stall_vld,LDsPXWEPicfpIjiWWkyV,nwCqqIlwmIahIICTFdFZ,c29_vld,c28_vld,c30_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell38(odCWwYTcNelybScqPOrq,cell38_out_vld,stall_vld,nwCqqIlwmIahIICTFdFZ,QtIuCkNDVwtcSHZjgOQS,c30_vld,c29_vld,c31_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell39(qamgOkghlPFeFDHIGFOg,cell39_out_vld,stall_vld,QtIuCkNDVwtcSHZjgOQS,LDQqguWjQKoxPNymDyBm,c31_vld,c30_vld,c32_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell3a(bvJEkPmMozsNjTgxGIjx,cell3a_out_vld,stall_vld,LDQqguWjQKoxPNymDyBm,8'b0,c32_vld,c31_vld,1'b0,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
                                        
u_jp2k_1 u_cell40(qoYkKuhRcFRIEjGVNSYr,cell40_out_vld,stall_vld,DfputgBBPRNGLqgzPBuA,kKDaJKfyhGUjRrYwUzKX,c33_vld,1'b1,cell31_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);  
u_jp2k_1 u_cell41(UJQCDCcaYonSiaokxDre,cell41_out_vld,stall_vld,kKDaJKfyhGUjRrYwUzKX,GDZIoCcQuBITjSmBaikb,cell31_out_vld,c33_vld,cell32_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell42(XfgkZLFlzjyrDznMrcdV,cell42_out_vld,stall_vld,GDZIoCcQuBITjSmBaikb,ljadIVAQTunpolprdLGQ,cell32_out_vld,cell31_out_vld,cell33_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell43(pDhwqtEHzvhljjKMPTWP,cell43_out_vld,stall_vld,ljadIVAQTunpolprdLGQ,OxcEJGONRWfXnCqSZXTH,cell33_out_vld,cell32_out_vld,cell34_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell44(qfjPeklMjDGejTiSfNIt,cell44_out_vld,stall_vld,OxcEJGONRWfXnCqSZXTH,gNgEiixQfJFjHtuQANMI,cell34_out_vld,cell33_out_vld,cell35_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell45(vrecAxiqQRDsoCHUfiFb,cell45_out_vld,stall_vld,gNgEiixQfJFjHtuQANMI,vtSfmOeSBNpxPquiNIqP,cell35_out_vld,cell34_out_vld,cell36_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell46(gbkYGwdQTqZWSCtNFrZe,cell46_out_vld,stall_vld,vtSfmOeSBNpxPquiNIqP,RMsvoDBxWZNHZYyRnucE,cell36_out_vld,cell35_out_vld,cell37_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell47(UYZDjbOKWxcSdKfttqUj,cell47_out_vld,stall_vld,RMsvoDBxWZNHZYyRnucE,odCWwYTcNelybScqPOrq,cell37_out_vld,cell36_out_vld,cell38_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell48(tSvfZFkWjBAhoMbTMbGC,cell48_out_vld,stall_vld,odCWwYTcNelybScqPOrq,qamgOkghlPFeFDHIGFOg,cell38_out_vld,cell37_out_vld,cell39_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell49(xpKEZGLFzrHJpOvPPJaM,cell49_out_vld,stall_vld,qamgOkghlPFeFDHIGFOg,bvJEkPmMozsNjTgxGIjx,cell39_out_vld,cell38_out_vld,cell3a_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell4a(SZXfYOpMhabsiRRCseep,cell4a_out_vld,stall_vld,bvJEkPmMozsNjTgxGIjx,8'b0,cell3a_out_vld,cell39_out_vld,1'b0,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
                                           
u_jp2k_1 u_cell50(wdktOdkfpRIjBFWRskyy,cell50_out_vld,stall_vld,qoYkKuhRcFRIEjGVNSYr,UJQCDCcaYonSiaokxDre,cell40_out_vld,1'b1,cell41_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);   
u_jp2k_1 u_cell51(XtpCtWnmSuWHOsTqZTym,cell51_out_vld,stall_vld,UJQCDCcaYonSiaokxDre,XfgkZLFlzjyrDznMrcdV,cell41_out_vld,cell40_out_vld,cell42_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell52(DhkTmLWGgIijHQCsyBGu,cell52_out_vld,stall_vld,XfgkZLFlzjyrDznMrcdV,pDhwqtEHzvhljjKMPTWP,cell42_out_vld,cell41_out_vld,cell43_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell53(dCdOIdQSdpJJEpfVtfcI,cell53_out_vld,stall_vld,pDhwqtEHzvhljjKMPTWP,qfjPeklMjDGejTiSfNIt,cell43_out_vld,cell42_out_vld,cell44_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell54(xDRSACReidKmHWwBGfrd,cell54_out_vld,stall_vld,qfjPeklMjDGejTiSfNIt,vrecAxiqQRDsoCHUfiFb,cell44_out_vld,cell43_out_vld,cell45_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell55(uSDdEsjCTtDTYbbzgPYt,cell55_out_vld,stall_vld,vrecAxiqQRDsoCHUfiFb,gbkYGwdQTqZWSCtNFrZe,cell45_out_vld,cell44_out_vld,cell46_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell56(mMmeQlGeOWUHeCGZYuFH,cell56_out_vld,stall_vld,gbkYGwdQTqZWSCtNFrZe,UYZDjbOKWxcSdKfttqUj,cell46_out_vld,cell45_out_vld,cell47_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell57(BzuLPpKZoBjzJGrJsCNT,cell57_out_vld,stall_vld,UYZDjbOKWxcSdKfttqUj,tSvfZFkWjBAhoMbTMbGC,cell47_out_vld,cell46_out_vld,cell48_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell58(qzjxgrtVaWdFUvDXZSlW,cell58_out_vld,stall_vld,tSvfZFkWjBAhoMbTMbGC,xpKEZGLFzrHJpOvPPJaM,cell48_out_vld,cell47_out_vld,cell49_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell59(aKhjwQvKRXkKESxNpCdv,cell59_out_vld,stall_vld,xpKEZGLFzrHJpOvPPJaM,SZXfYOpMhabsiRRCseep,cell49_out_vld,cell48_out_vld,cell4a_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell5a(RlJbMuoNsFRvRGUndmqJ,cell5a_out_vld,stall_vld,SZXfYOpMhabsiRRCseep,8'b0,cell4a_out_vld,cell49_out_vld,1'b0,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
                                             
u_jp2k_1 u_cell60(aUXkQrNeprUTqroMVQkh,cell60_out_vld,stall_vld,wdktOdkfpRIjBFWRskyy,XtpCtWnmSuWHOsTqZTym,cell50_out_vld,1'b1,cell51_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);   
u_jp2k_1 u_cell61(ueGkTdhRmAPwkHUFjCcB,cell61_out_vld,stall_vld,XtpCtWnmSuWHOsTqZTym,DhkTmLWGgIijHQCsyBGu,cell51_out_vld,cell50_out_vld,cell52_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell62(WJgVcZeIlUPAOKNBDkRp,cell62_out_vld,stall_vld,DhkTmLWGgIijHQCsyBGu,dCdOIdQSdpJJEpfVtfcI,cell52_out_vld,cell51_out_vld,cell53_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell63(GbyWvndxMseuyAnHwqnn,cell63_out_vld,stall_vld,dCdOIdQSdpJJEpfVtfcI,xDRSACReidKmHWwBGfrd,cell53_out_vld,cell52_out_vld,cell54_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell64(fgSaGMvdDFsySIwaEFDl,cell64_out_vld,stall_vld,xDRSACReidKmHWwBGfrd,uSDdEsjCTtDTYbbzgPYt,cell54_out_vld,cell53_out_vld,cell55_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell65(TWNIsjejhhesTXHcPEXR,cell65_out_vld,stall_vld,uSDdEsjCTtDTYbbzgPYt,mMmeQlGeOWUHeCGZYuFH,cell55_out_vld,cell54_out_vld,cell56_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell66(oOMQdvXrwnziblklWeCC,cell66_out_vld,stall_vld,mMmeQlGeOWUHeCGZYuFH,BzuLPpKZoBjzJGrJsCNT,cell56_out_vld,cell55_out_vld,cell57_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell67(PRPGGGOZHlXZawqLHheG,cell67_out_vld,stall_vld,BzuLPpKZoBjzJGrJsCNT,qzjxgrtVaWdFUvDXZSlW,cell57_out_vld,cell56_out_vld,cell58_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell68(sRxxBWOUzCnzaJSwPVis,cell68_out_vld,stall_vld,qzjxgrtVaWdFUvDXZSlW,aKhjwQvKRXkKESxNpCdv,cell58_out_vld,cell57_out_vld,cell59_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell69(WUpTDUSrWypCEwLSuGfv,cell69_out_vld,stall_vld,aKhjwQvKRXkKESxNpCdv,RlJbMuoNsFRvRGUndmqJ,cell59_out_vld,cell58_out_vld,cell5a_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell6a(aosXwrwMOrAgqTMonPEl,cell6a_out_vld,stall_vld,RlJbMuoNsFRvRGUndmqJ,8'b0,cell5a_out_vld,cell59_out_vld,1'b0,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
                                          
u_jp2k_1 u_cell70(wGXyGfTnNwRhTumdiCGF,cell70_out_vld,stall_vld,aUXkQrNeprUTqroMVQkh,ueGkTdhRmAPwkHUFjCcB,cell60_out_vld,1'b1,cell61_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn); 
u_jp2k_1 u_cell71(lYiujcECoGxEWkrYSXyu,cell71_out_vld,stall_vld,ueGkTdhRmAPwkHUFjCcB,WJgVcZeIlUPAOKNBDkRp,cell61_out_vld,cell60_out_vld,cell62_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell72(FcfzXjMGKuXLyaJFuFYp,cell72_out_vld,stall_vld,WJgVcZeIlUPAOKNBDkRp,GbyWvndxMseuyAnHwqnn,cell62_out_vld,cell61_out_vld,cell63_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell73(aNBYERFSzNqtXSXlqnBT,cell73_out_vld,stall_vld,GbyWvndxMseuyAnHwqnn,fgSaGMvdDFsySIwaEFDl,cell63_out_vld,cell62_out_vld,cell64_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell74(CJtqbdygHCsrTkXruGSz,cell74_out_vld,stall_vld,fgSaGMvdDFsySIwaEFDl,TWNIsjejhhesTXHcPEXR,cell64_out_vld,cell63_out_vld,cell65_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell75(bKIkKcnefDXbiSoGbphG,cell75_out_vld,stall_vld,TWNIsjejhhesTXHcPEXR,oOMQdvXrwnziblklWeCC,cell65_out_vld,cell64_out_vld,cell66_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell76(QQmGqPKzzfLgdsKYgOcf,cell76_out_vld,stall_vld,oOMQdvXrwnziblklWeCC,PRPGGGOZHlXZawqLHheG,cell66_out_vld,cell65_out_vld,cell67_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell77(gdYapLlMIvytKkdCPGdF,cell77_out_vld,stall_vld,PRPGGGOZHlXZawqLHheG,sRxxBWOUzCnzaJSwPVis,cell67_out_vld,cell66_out_vld,cell68_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell78(aCJESItBOvnDmuXhGLUj,cell78_out_vld,stall_vld,sRxxBWOUzCnzaJSwPVis,WUpTDUSrWypCEwLSuGfv,cell68_out_vld,cell67_out_vld,cell69_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell79(cCJQFJSCdvVDIbNwwNYX,cell79_out_vld,stall_vld,WUpTDUSrWypCEwLSuGfv,aosXwrwMOrAgqTMonPEl,cell69_out_vld,cell68_out_vld,cell6a_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell7a(wUTXVpqsmevBpWIEQIcX,cell7a_out_vld,stall_vld,aosXwrwMOrAgqTMonPEl,8'b0,cell6a_out_vld,cell69_out_vld,1'b0,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
                                             
u_jp2k_1 u_cell80(arAMQHIzryMkLJaQqtfc,cell80_out_vld,stall_vld,wGXyGfTnNwRhTumdiCGF,lYiujcECoGxEWkrYSXyu,cell70_out_vld,1'b1,cell71_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);    
u_jp2k_1 u_cell81(IbJlCRYwAhvuEtwkcBcb,cell81_out_vld,stall_vld,lYiujcECoGxEWkrYSXyu,FcfzXjMGKuXLyaJFuFYp,cell71_out_vld,cell70_out_vld,cell72_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell82(vnkIPwebhyHAOTzzgwVN,cell82_out_vld,stall_vld,FcfzXjMGKuXLyaJFuFYp,aNBYERFSzNqtXSXlqnBT,cell72_out_vld,cell71_out_vld,cell73_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell83(lntJsaTLMeamyadjIcTz,cell83_out_vld,stall_vld,aNBYERFSzNqtXSXlqnBT,CJtqbdygHCsrTkXruGSz,cell73_out_vld,cell72_out_vld,cell74_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell84(qYjtKZZixtZuERqFtmIt,cell84_out_vld,stall_vld,CJtqbdygHCsrTkXruGSz,bKIkKcnefDXbiSoGbphG,cell74_out_vld,cell73_out_vld,cell75_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell85(kmnIYqtQigWTYlmkNXLZ,cell85_out_vld,stall_vld,bKIkKcnefDXbiSoGbphG,QQmGqPKzzfLgdsKYgOcf,cell75_out_vld,cell74_out_vld,cell76_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell86(lVoLEEsHkrGIptSSdJcY,cell86_out_vld,stall_vld,QQmGqPKzzfLgdsKYgOcf,gdYapLlMIvytKkdCPGdF,cell76_out_vld,cell75_out_vld,cell77_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell87(SgmCLdndNiIesEfyKaAV,cell87_out_vld,stall_vld,gdYapLlMIvytKkdCPGdF,aCJESItBOvnDmuXhGLUj,cell77_out_vld,cell76_out_vld,cell78_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell88(CIiJbWTXRTpdlclBsmUo,cell88_out_vld,stall_vld,aCJESItBOvnDmuXhGLUj,cCJQFJSCdvVDIbNwwNYX,cell78_out_vld,cell77_out_vld,cell79_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell89(mEAXrFrKUcZGRUUUPlCz,cell89_out_vld,stall_vld,cCJQFJSCdvVDIbNwwNYX,wUTXVpqsmevBpWIEQIcX,cell79_out_vld,cell78_out_vld,cell7a_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell8a(vRiAMmICbUzvsnWJgkIc,cell8a_out_vld,stall_vld,wUTXVpqsmevBpWIEQIcX,8'b0,cell7a_out_vld,cell79_out_vld,1'b0,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
                                          
u_jp2k_1 u_cell90(TcgQxrdWVGHwfyElUUiW,cell90_out_vld,stall_vld,arAMQHIzryMkLJaQqtfc,IbJlCRYwAhvuEtwkcBcb,cell80_out_vld,1'b1,cell81_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn); 
u_jp2k_1 u_cell91(guNUkxLYmXSQcvDmFJjZ,cell91_out_vld,stall_vld,IbJlCRYwAhvuEtwkcBcb,vnkIPwebhyHAOTzzgwVN,cell81_out_vld,cell80_out_vld,cell82_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell92(qLIEqYlgQSYNbeBecRoB,cell92_out_vld,stall_vld,vnkIPwebhyHAOTzzgwVN,lntJsaTLMeamyadjIcTz,cell82_out_vld,cell81_out_vld,cell83_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell93(UHncrmKWsoaHDctgdVja,cell93_out_vld,stall_vld,lntJsaTLMeamyadjIcTz,qYjtKZZixtZuERqFtmIt,cell83_out_vld,cell82_out_vld,cell84_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell94(PQSouAAUPcxkmmblfshP,cell94_out_vld,stall_vld,qYjtKZZixtZuERqFtmIt,kmnIYqtQigWTYlmkNXLZ,cell84_out_vld,cell83_out_vld,cell85_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell95(uwxRdnAxqWbPQTUuriZn,cell95_out_vld,stall_vld,kmnIYqtQigWTYlmkNXLZ,lVoLEEsHkrGIptSSdJcY,cell85_out_vld,cell84_out_vld,cell86_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell96(SFhHYzgkWQvWPnYCsDQG,cell96_out_vld,stall_vld,lVoLEEsHkrGIptSSdJcY,SgmCLdndNiIesEfyKaAV,cell86_out_vld,cell85_out_vld,cell87_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell97(wlhWXlRaNWiNUaCsDbir,cell97_out_vld,stall_vld,SgmCLdndNiIesEfyKaAV,CIiJbWTXRTpdlclBsmUo,cell87_out_vld,cell86_out_vld,cell88_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell98(ZCvoQcyBQrHPNpBpgqWq,cell98_out_vld,stall_vld,CIiJbWTXRTpdlclBsmUo,mEAXrFrKUcZGRUUUPlCz,cell88_out_vld,cell87_out_vld,cell89_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell99(DoUSRWVGFusLLetLJBat,cell99_out_vld,stall_vld,mEAXrFrKUcZGRUUUPlCz,vRiAMmICbUzvsnWJgkIc,cell89_out_vld,cell88_out_vld,cell8a_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cell9a(lyzLOaLahwZtRIJhxymQ,cell9a_out_vld,stall_vld,vRiAMmICbUzvsnWJgkIc,8'b0,cell8a_out_vld,cell89_out_vld,1'b0,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
                             
u_jp2k_1 u_cella0(LNBmAEdbMEaMLoyGjfrg,ExtHnVBbbCKXmXvjlQbJ,stall_vld,TcgQxrdWVGHwfyElUUiW,guNUkxLYmXSQcvDmFJjZ,cell90_out_vld,1'b1,cell91_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);  
u_jp2k_1 u_cella1(NGUIuhzztIZkaOVpHXkO,fyCXQMODfHLggLbBphNv,stall_vld,guNUkxLYmXSQcvDmFJjZ,qLIEqYlgQSYNbeBecRoB,cell91_out_vld,cell90_out_vld,cell92_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cella2(PPSQkMpMFizQsBRWIVai,FegNvVfGaRhonmIqphKH,stall_vld,qLIEqYlgQSYNbeBecRoB,UHncrmKWsoaHDctgdVja,cell92_out_vld,cell91_out_vld,cell93_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cella3(GRuWEivLoABPjtPLXVMJ,XKLIUflcsFaNUXkXzpGV,stall_vld,UHncrmKWsoaHDctgdVja,PQSouAAUPcxkmmblfshP,cell93_out_vld,cell92_out_vld,cell94_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cella4(sKoGsBbnNlQcSJQjwTEW,WGoVpQqTXnVgKMxSubxK,stall_vld,PQSouAAUPcxkmmblfshP,uwxRdnAxqWbPQTUuriZn,cell94_out_vld,cell93_out_vld,cell95_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cella5(oIGQlTOwKxwTNFHglOMa,kkZHarzgXLRhVsIHWayf,stall_vld,uwxRdnAxqWbPQTUuriZn,SFhHYzgkWQvWPnYCsDQG,cell95_out_vld,cell94_out_vld,cell96_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cella6(icqejOGfHvoPMyPQlOYY,WSOxsHPzGmWQhcOCvFgt,stall_vld,SFhHYzgkWQvWPnYCsDQG,wlhWXlRaNWiNUaCsDbir,cell96_out_vld,cell95_out_vld,cell97_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cella7(myNXLrkAdgdxqjfkvzMr,bvwQWDbjMnOESnlTUssU,stall_vld,wlhWXlRaNWiNUaCsDbir,ZCvoQcyBQrHPNpBpgqWq,cell97_out_vld,cell96_out_vld,cell98_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cella8(SQvlodcafgaLzSTpKwZU,ZCyUDUWbyCkGqyuKuIIZ,stall_vld,ZCvoQcyBQrHPNpBpgqWq,DoUSRWVGFusLLetLJBat,cell98_out_vld,cell97_out_vld,cell99_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
u_jp2k_1 u_cella9(JFcINZjcavbTjAQKtCAw,upupOTpybpRssnNDEENe,stall_vld,DoUSRWVGFusLLetLJBat,lyzLOaLahwZtRIJhxymQ,cell99_out_vld,cell98_out_vld,cell9a_out_vld,clk_dwt,TLXWChymSkORZZFunpRb,rst,rst_syn);
		   
reg rMBkqrLcKhflEMUYxGkE;
reg wMlYFxkSbZTCTvhQOIei;
reg WQGVbnQQZGQWVmpcxvbb;
reg pass_error_start;

always @(posedge clk_dwt or negedge rst) begin
	if(!rst) begin
		rMBkqrLcKhflEMUYxGkE <=1'b0;
		wMlYFxkSbZTCTvhQOIei <=1'b0;
		WQGVbnQQZGQWVmpcxvbb <=1'b0;
		pass_error_start <=1'b0;
	end
	else if(rst_syn)begin
		rMBkqrLcKhflEMUYxGkE <=1'b0;
		wMlYFxkSbZTCTvhQOIei <=1'b0;
		WQGVbnQQZGQWVmpcxvbb <=1'b0;
		pass_error_start <=1'b0;
	end
	else if(TLXWChymSkORZZFunpRb==1'b1)begin
		if(stall_vld==1'b0) begin
			rMBkqrLcKhflEMUYxGkE <=bpc_start_flag;
			wMlYFxkSbZTCTvhQOIei <=rMBkqrLcKhflEMUYxGkE;
			WQGVbnQQZGQWVmpcxvbb <=wMlYFxkSbZTCTvhQOIei;
			pass_error_start <=WQGVbnQQZGQWVmpcxvbb;
		end
	end
end

endmodule


