`timescale 1ns/10ps
module u_jp2k_27(
			data_from_mq,
			pass_plane,
			word_last_flag_plane_sp,
			word_last_flag_plane_mp,
			word_last_flag_plane_cp,
			zero_plane_number,
			one_codeblock_over,
			flush_over,
			pass_error_sp,
			pass_error_mp,
			pass_error_cp,
			addra_all_1,
			test_tier1,
			count_tiles_6,
			start_dwt,
			douta_all_1,
			clk_dwt,
			rst,
			start_cpu,
			rst_syn,
			compression_ratio);

input [31:0]douta_all_1;											
input clk_dwt;										
									
input rst;
input start_cpu;									
input rst_syn;										
input [2:0]compression_ratio;

wire aDkQEysUQMjSKApaeshi=clk_dwt;
					
output [15:0]data_from_mq;				
output [1:0]pass_plane;									
output word_last_flag_plane_sp;				
output word_last_flag_plane_mp;					
output word_last_flag_plane_cp;					
output [3:0]zero_plane_number;
output one_codeblock_over;
output flush_over;
output [30:0]pass_error_sp;
output [30:0]pass_error_mp;
output [30:0]pass_error_cp;
output count_tiles_6;
output[17:0] addra_all_1;
output test_tier1;
output start_dwt;

wire [17:0] addra_all_1;
wire [3:0]teJcaVooEJRLzkMyxXMf;
wire hXhVKpwdYJhTQEjjQyiA; 
wire ytSqxoZpMDkNRuAUbZDc;

wire count_tiles_6;
wire [16:0] wmEBGiAYKWjrjZxZfGew;
wire [16:0] jMCVmjFKEszeMFGJPhDT;
wire [13:0] CxvpyAhqMqQXTLpXgdOB;
wire [13:0] JBFuaKfGSzMztOCsXGjt;
wire iGrqtIPPBFPUhGunhSdw;
wire test_tier1;
wire XRBRKunaBXumEnJXwUaW;
reg [31:0]LObTHKeCXdohZGpVtKli;
always @(posedge clk_dwt or negedge rst)
begin
	if (!rst) 
	begin
		LObTHKeCXdohZGpVtKli<=0;		
	end
	else  
	begin
		LObTHKeCXdohZGpVtKli<=douta_all_1;
	end
end
assign test_tier1=clk_dwt&&iGrqtIPPBFPUhGunhSdw&&XRBRKunaBXumEnJXwUaW&&(&LObTHKeCXdohZGpVtKli);
assign start_dwt=iGrqtIPPBFPUhGunhSdw;



wire [15:0] cnjmhGUWkOHIVxVIhHDv;
wire [15:0] wJuREkXTuZjUDwGKconv;
wire [16:0] tAfVkAIwJeedbspKhudJ;
wire [16:0] idqOlqzawAFNusRXGZcD;
wire [2:0] PyEEDQIranrmOtTgLGUj;
wire [1:0] ePSgpDyNjLZaHJjdoJRC;
wire KrITBDcynwSzeDKOSSpS;

wire [15:0] JQihcsaYHcVHwbmuIObQ;
wire [15:0] GXJpDpCLmCzXINGxPMZk;
wire xdZgFciIrqHvwlJizAPw;
wire [15:0] TNcvWdikgEgGEJMVIpQt;
wire [15:0] wPxzMmDeVUSdzGMNnVPk;
wire icIbrKPwZHpyTefhhVqt;
wire UGCVBMZYTRhtoiYMLbHQ;
wire[16:0] lbOlCPSrCZTHlQttbDug;
wire[16:0] XFOvQMhAbaMrUyNcGbJY;
wire wWtBaYTwKrFzDctmWSYF;

wire[1:0]jxUDbZdGnigmzXceroAz;	
wire[16:0] yjbcxShalQPOIpOVRmzb;
wire[16:0] mDsCITWXfhDPUdTQuCIx;					
wire[16:0] UzqBDrsiplVMPHJoNdLS;
wire[16:0] AodmZAGdtXSrmpcZidlp;
wire [16:0]	 PZHGEEkYmcmnvPoUtLkc;			
wire [16:0]	 IQazFWpFMTVRFpOhCJuZ;				
wire [16:0]	 uvIQXoaGcIvXFkvrGQaf;			
wire [16:0]	 vFOehkeqyGreFhoQwZlf;
wire [16:0]	 MeeNSHsyevjrVlqirjok;			
wire [11:0] anpXSAKnVzeQdotHAwhY;
wire [11:0] kkkkXEMpJOVWRnfdVhUs;
wire [13:0] VNtokqcTmvhTFOkxNwHP;
wire [13:0] nQAnZVgoKyprBQAdRCfA; 
wire wEtGDzRjafclnvKxgCSP;
wire YfuArrGnpBUyrJxEvVgI;
wire tQSdMsmQOoDjgNvoiCmq;
wire LrLbKGgLtBSEzbICsDNb;											
wire DnfnMYzlPFszZtXlGDhW;
wire NhvFLRUduFzxNErEsMee;
wire FGUJmfBLDaAxYUKmfnyF;
wire UDhUDnjGRISxZIKdQMYR;
wire [13:0] uCYGrwGKzInfdhxjHSnQ;
wire [13:0] cjZwHLURVzyLNtMosbQN;
wire [13:0] PRQweGZJzjDmSpZQuquI;
wire [13:0] XmWQfEltjOUqcNLDCtfd;
wire pyhAjCtAJLKGgXMclzgY;
wire MPFTDVkljwqlROSuxXcP;
wire ESEFEoPuTgYdvrsaqlOz;
wire ARQLJGuTZBnFJHXDoAkT;
wire gStNdqadtalDMswfRuqW;
wire euqWRDzuVBfSvNZlbygs;
wire XWSDWJpZwWFziLcqAlai;
wire CHmFHLXDhsSOMWPfgbXw;

wire eojmGbYrZBcDvhuhplcn;
wire QfUEKjFcoDGGRCHDXqcI;
wire[15:0] qaVKoOckmCbhBtxSbviM;
wire[15:0] wKozjyqvbxpraCSNGCJY;
wire OhIQvlSNredlAvEzVwlD;
assign OhIQvlSNredlAvEzVwlD = (PyEEDQIranrmOtTgLGUj !=3'b000);
assign TNcvWdikgEgGEJMVIpQt = (OhIQvlSNredlAvEzVwlD == 1)? qaVKoOckmCbhBtxSbviM:cnjmhGUWkOHIVxVIhHDv;
assign wPxzMmDeVUSdzGMNnVPk = (OhIQvlSNredlAvEzVwlD == 1)? wKozjyqvbxpraCSNGCJY:wJuREkXTuZjUDwGKconv;
wire [16:0]bVNTszDvPimBrKwNycBW;
wire [16:0]CTJvELJpTGwHTCgirGVs;
wire [16:0]aSItvOfWsSQOkHOHMzuM;
wire[16:0] oEDxWLutHlOkrCgasnsy;
wire[16:0] kAXRTBBnwMdFccjIlXSw;

wire RdPhRZcalGKJvMOvrAIh;
wire xMPttPagqqqJUKztQdOZ;
wire YCteCIAKCruidjpeILHG;
wire nxlEkFPUCwQVbIQJmgbx;
wire SVzsQtfHGQqXqNoloxvo;
wire vMLEZaXExwsFFvafFmfc;
wire [13:0] MNhKBwmQfBNRRoCGsGYL;
wire [13:0] CZUlnpSgUmTCmXxNawKq;
wire [13:0] GCKDpTZdSkziHIHQTHTY;
wire TbggffYtMBhiLSACnOtm;
wire QMFreKPqLMtYHbzgqBQA;
wire NlcVQzrrHSpHBCrquBjt;
wire [13:0] FSYqURbHbEaesQcTkdrx;
wire [13:0] qEtkygphCMCbDqrWtklY;
wire [13:0] TLjaqwEsoHtrvWTBQRsK;
wire cYsREsbuuQNtJwVuIQtc;
wire IADijSHmLDuBqTQJOxSa;
wire BhAYLsocIYeStsZZVTUF;
wire WQWSkTgEaMFMXPEsFHwg;
wire [13:0] WVikipTMfwFUtPMyACXK;
wire [13:0] dXrKEPxqSBOppMxaytbW;
wire NnjJwuwNoVWroSgcnSsE;
assign  NnjJwuwNoVWroSgcnSsE=(QfUEKjFcoDGGRCHDXqcI==1'b1)?aDkQEysUQMjSKApaeshi:clk_dwt;
assign  VNtokqcTmvhTFOkxNwHP=(QfUEKjFcoDGGRCHDXqcI==1'b1)?WVikipTMfwFUtPMyACXK:dXrKEPxqSBOppMxaytbW;
assign  FGUJmfBLDaAxYUKmfnyF=(QfUEKjFcoDGGRCHDXqcI==1'b1)?cYsREsbuuQNtJwVuIQtc:IADijSHmLDuBqTQJOxSa;
assign  tQSdMsmQOoDjgNvoiCmq=(QfUEKjFcoDGGRCHDXqcI==1'b1)?BhAYLsocIYeStsZZVTUF:WQWSkTgEaMFMXPEsFHwg;

wire ASCWICejFoBbZHMJMVyD;
wire [3:0]twyoccXqjNTyiiCHZKgQ;
wire [3:0]xvRCARkQSEXoZFEiGfjC;
wire [3:0]JjLGddxBYbYmoYBVjdju;
wire [3:0]xyvvBnpUfpnejSAdOrIU;
wire [3:0]LNWqJGCGvJkqDqnyFdST;
wire [3:0]XXnujvRmwKtqZZbYXNom;
wire [3:0]rdgcYAhdMEGqsgkVVhHB;
wire [3:0]bcCzAdPYbGFOdbqFGtNY;
wire [3:0]MRTHuncHaQWNXrTdnjLu;  
wire [3:0]ZqxWPnvGQEisPGNSDkWt;
wire [3:0]jLboxjBIZGftrbnYaDHz;
wire [3:0]XPHrltKlkTYeddIYErlL;
wire [3:0]DwnEuDbYEGceHCFfntWU;
wire [3:0]AhXRxsizDLdrPCSJbgvu;
wire [3:0]dRLKJNMhCWjmYIXyBBMS;
wire [3:0]qKakmPsWXvxWDjopwmhd;
wire [3:0]OfKBQrlHgohHRFQMqPuX;
wire [3:0]OMUVfbzXJtBmpgGUlWIN;  
wire [3:0]pRjKNldSGgrOVpMtRdhl;
wire [3:0]FzItXojZYuRrQPYroXqa;
wire [3:0]tiASKMApdODRGubKCrIk;
wire [3:0]AofWIQWGCHGeAWxyBSnX;
wire [3:0]BVZJHRZIRDJUNzlhOXNj;
wire [3:0]MJngMbRNrQAqZKOoJbfA;
wire [3:0]LKEbaiUcnUkcdhTlxIWn;
wire [3:0]PIdKWDjIZqdVETXVKUyz;
wire [3:0]TeweoifYlvYAXegPEOev; 
wire [3:0]aHdPRBehEsBXhVSVEVGI;
wire [3:0]EHDzFoGEUiKMcpmeZndO;
wire [3:0]iGWdFxfLkcoPAfSnTRiW;
wire [3:0]OgwvxakMlGIDTjsTTTrF;
wire [3:0]hweOwCSFFCFpnLABsNDz;
wire [3:0]kFILldZgHWqtwHcEyrEz;
wire [3:0]BHxWpRKaPloRmedcGnVS;
wire [3:0]jEDhTzjvJVSeQkYxJusx;
wire [3:0]nVWwCingLJiAmNkXNBse;
wire [3:0]hdQpCNCsCpWxWjyDHYIf;
wire [3:0]mYfjBwhqQaPjGDGuVzVT;
wire [3:0]sPdTjZhZROmcYPkfxnHK;
wire [3:0]VOSkkJBkJQjLTSFCXXZG;
wire [3:0]wnDMhVWFcihAknOuJWgt;
wire [3:0]ZJYNMlOSJujZtBMVfIcG;
wire [3:0]cUQgUjrarAoCxWvadhrh;
wire [3:0]ayPBmMeTERtfSkylBBkl;
wire [3:0]zjiIArXGbkjgPxxXfPxg;
wire [3:0]YERHnxdykgyyioNNZJSQ;
wire [3:0]rNuBwbgCniYGlSgOMCnE;
wire [3:0]VjtVxkxLZrdVPkMsyEqe;

wire [16:0] fFwIafFNLTVTiIeJUZOi;
wire [16:0] JofSpHHAILpRCvnGOmzf;
wire [16:0] OeYMhMfjeDdvkecHiLUT;
wire [16:0] tVOTCptQSOpsjFBXiksw;
wire [1:0] AhXuWEaSPuUvIcwDuFWr;
wire ekQuaIqPJyasZNSLaQOo;
wire [2:0]osvtoSWcIuWcmvZruLsS;
wire [2:0]BzXYfwLRzqKLxtfxvmZC;
wire tgVDzxwqtPquEcvdvFrC;
wire DzNsyDbNrzFrSyvQMHnd;
wire iOnjZhBOoaDLaXXeVrwx;
wire XwvNGtBVJXErWQRUuqBI;
wire [1:0]JJgTPGsdUTcAdufkeJgK;
wire [3:0]TfnRFMUqcGKfwYVkrOcp;

wire [3:0]kuHTqKTEGHJGjcgKEkCF;
wire [3:0]FfvTBiXNEwWARzrRMUYh;
wire [3:0]VMfdRrsDolDymeMDbscN;
wire [3:0]iPuXoTiWLBGZVYAHGaYO;
wire BaxkmTikPlEanrOALJQn;
wire [2:0]TGPYgdsEOqsHqlpqyhVp;
wire VZaWDekOPjcbcuLkmTCK;
wire ceSSpUnFGIqusvzAQYyv;
wire KkgZHqKRoBphLNurbXZv;
wire BVfKHJmimWhfvhFZYdJC;
wire [3:0]XWIoNGOmiUqZuWDNerJA;
wire ymZNoaOSvkuMNFrKCZJc;
wire JtPboWbpZfxqTBEEDYyf;
wire NIzOkTmOrsmtdJpYgwkn;

wire [7:0] HPBVjcjYzqThfAZsuBko;
wire [7:0] RtOUSNvLjifycdHERnsH;
wire [7:0] RHqjRVMUmlsTYhhiTxqt;
wire [7:0] irQWRPjnSymTgyEWfOeV;
wire [7:0] gHMMxJFDpgQtSoSKsfzc;
wire [7:0] XrXzzUeQwqtdbHighLXh;
wire [7:0] VXesUOJyNaYiksaASUmr;
wire [7:0] MjDYzSbWZYtgtBPeFxFX;
wire [7:0] QocIghyhzPXBoGjaFxEW;
wire [7:0] aNNRDAQndlQbuwTNoeBC;
wire [3:0] ganwYnOuHsVFGlnGQGGf;
wire TmUIbPULspEIyexiGCHU;
wire GrWFHsoruHLBTofZiNlc;
wire [9:0]HemnvXRItkGWOQQBARSS;
wire [9:0]crDvxwhExTyEkehZAJBR;
wire [9:0] vqFRiEdZYIvaYIjwIZPo;
wire [9:0] RiyBtzLqNImqdjYXxYLF;

wire [7:0] QAZelRxmduKrKymXyprg;
wire [7:0] IixlIEeyecDFQCcIcXFK;
wire [7:0] CahtEzYLkeeOsdRKBvoI;
wire [7:0] hXvwCaJPKLmTlGnIqShO;
wire [7:0] ZapMeflJnJGQFrDdnzZx;
wire [7:0] tEZVPsZbWePhmBDkYbkW;
wire [7:0] VKIhSekuVtyFcvuoBpZH;
wire [7:0] HHissIgZPvjjCfGzZWgP;
wire [7:0] ZthEdVQnyODdQJpzqpDX;
wire [7:0] ZvVAYFyMKYuJjjuLlssM;
wire [7:0] BDVfxjBZqdgfpcXaqSxS;
wire [7:0] SYPrSAmIZhepjzRpfAbW;
wire [7:0] bheecNbLIfuKFYksBrvM;
wire [7:0] LoFfmBmHEBmQlYvRihJx;
wire [7:0] RAqkMVQdcCkZqHQrYhTY;
wire [7:0] JwazcQrhGdLokRSxMIPy;
wire [7:0] NHwKTvStgXGxecepjZCb;
wire [7:0] iFhOAEkrfnWgTHHMCrAr;
wire [7:0] KoZvZIhKhWDYlgwhYWfH;
wire [7:0] xqkVQlUmzixmBBOWsogM;
wire [7:0] mZcXpTwcGpwcsXaAXzJZ;
wire[2:0] tBkJHywSnDHjCloeCKQN;
wire[2:0] rtIOwgMybhKPbMtTkPHH;
wire[2:0] ULvOWCBpLiqodnUiPZne;
wire[2:0] UeCtXzcgpZHmscgLWNgU;

wire  NchYslfTwDoJDaIhKQld;
wire  vdLrgmXBDTPmGWwCZgJK;
wire  fypmfZbmWDbDCXEismjU;
wire  FEgAuSjALENQXZOiGFUZ;
wire  [15:0]hUaTrhFAshrngFoHaXaJ; 
wire  avmhenqBbGIfSBAIabaF;
wire [1:0] IlmCWYrxdJVqIQywKmAF;
wire  flush_over;
wire [1:0]OJxfLuIkrNnSWpokhUXW;
wire iedRhyJcTveKSbgVgPyX;
wire DDvnkzcxCllmtaJgvsKQ;
wire one_codeblock_over;
wire [1:0] HvOvrGAvaPTzYsRxiQFa;
wire[16:0] rwPuhbqaLGfEsTZJaDhF;	
wire[16:0] YphfuswJNWiAbvgWEfjm;
wire[16:0] YhTJCIYfjiXccwQDAncB;
wire[16:0] KaDxyGuuayhqIxIwbGQG;
wire[3:0] SCcERabQMmiRZhSuKFqS;
wire ASVDnraQDtLQhInOEyVK;	
wire RzDedJWchbeEickgtFOM;
wire qBWQIFhDbnPbANWZJPUR;
wire [2:0]ONSywhEkLUpjhsBVzOEr;
wire [2:0]SiWXyZwStCTfnlFxLPQx;								
wire [2:0]ljlzMOdncFtIKCHtOsVQ;
wire [2:0]sBtkXBZAHFHDVqMZHZdd;
wire [3:0]ZNywgghYzvszBznGurzE;	


wire giByCXZhzRJrKpUfJiYx;


wire[16:0]NOzoIRcSVgyFREyzzHqs=AodmZAGdtXSrmpcZidlp;
wire[16:0]hvcttLppSPcVixtVRHqN=CTJvELJpTGwHTCgirGVs;	
wire[16:0]NXURaWZymtMESRzASoml=bVNTszDvPimBrKwNycBW;     
wire[16:0]OGJwXjhBDuVzMrVxGthI=aSItvOfWsSQOkHOHMzuM;
wire      [13:0]                              tDHSWWPwhDHPIdkjEtEW;
wire      [13:0]                              spPgPLHCbVgdzOmJFakw;
wire      [13:0]                              NCLfdSDEGhGvIWQaIuMS;
wire      [13:0]                              NfdfbTCtNjYFDeLLecMe;
wire [13:0]xIHGyzqgFJSHmjAJEkTk=nQAnZVgoKyprBQAdRCfA|NfdfbTCtNjYFDeLLecMe;
wire [13:0]ffdnbvLvbNGfaiXRKcYD=giByCXZhzRJrKpUfJiYx?FSYqURbHbEaesQcTkdrx:spPgPLHCbVgdzOmJFakw;
wire [13:0]dDkKlvBKHVNSwGZicnzg=giByCXZhzRJrKpUfJiYx?qEtkygphCMCbDqrWtklY:NCLfdSDEGhGvIWQaIuMS;
wire [13:0]sTYRbAXFBXVNlExKcFRO=giByCXZhzRJrKpUfJiYx?TLjaqwEsoHtrvWTBQRsK:tDHSWWPwhDHPIdkjEtEW;
wire                                    QYcegkQFzbKFzvlPxGeR;
wire                                    WCbGOTtDaZUdMPlupDBN;
wire                                    kNoeoxFOMGDTBbVzHlLM;
wire                                    pcsafTpJQiyaKivHSiiO;
wire HhgKJaIdyWwhlApPzTKC=giByCXZhzRJrKpUfJiYx?NlcVQzrrHSpHBCrquBjt:pcsafTpJQiyaKivHSiiO;
wire LgxgHDHmFYbeGgXVWgvC=giByCXZhzRJrKpUfJiYx?QMFreKPqLMtYHbzgqBQA:WCbGOTtDaZUdMPlupDBN;
wire cKBOWdNoOXhznBHdAwlu=giByCXZhzRJrKpUfJiYx?TbggffYtMBhiLSACnOtm:QYcegkQFzbKFzvlPxGeR;
wire KASZraJCWhbAUtfwnLfk=UDhUDnjGRISxZIKdQMYR||kNoeoxFOMGDTBbVzHlLM;
wire AGPbOkqoDAYNiAUBxYWb=aDkQEysUQMjSKApaeshi;

wire [15:0]data_from_mq={hUaTrhFAshrngFoHaXaJ[7:0],hUaTrhFAshrngFoHaXaJ[15:8]};
wire [1:0]pass_plane=IlmCWYrxdJVqIQywKmAF;
wire ULkqQHcjawmJPPtzcPCS;
wire gVMkJmsMEYFtEfiuwaKj;
wire yHFGaozymIVZZMqtzLDd;
wire word_last_flag_plane_sp=ULkqQHcjawmJPPtzcPCS;
wire word_last_flag_plane_mp=gVMkJmsMEYFtEfiuwaKj;
wire word_last_flag_plane_cp=yHFGaozymIVZZMqtzLDd;
wire [3:0]zero_plane_number=TfnRFMUqcGKfwYVkrOcp;
wire [30:0]pass_error_sp;
wire [30:0]fgBVAEOmiYVjlIISCTIH;
wire [30:0]pass_error_mp=fgBVAEOmiYVjlIISCTIH;
wire [30:0]pass_error_cp;







wire vhvQKmfEYGSlphsIxeCs=BVfKHJmimWhfvhFZYdJC;
wire [13:0]ZrFbZJjPMDHEuYZROGXq;
wire [13:0]rNNkvcsqGpEfYTFDzfVx=ZrFbZJjPMDHEuYZROGXq;
reg [1:0]gSOvAWNVzyvqOdeFdGBD;
always@(posedge clk_dwt or negedge rst)
begin
	if(!rst)
		gSOvAWNVzyvqOdeFdGBD<=0;
	else gSOvAWNVzyvqOdeFdGBD<=gSOvAWNVzyvqOdeFdGBD+1;
end
assign XRBRKunaBXumEnJXwUaW=gSOvAWNVzyvqOdeFdGBD[1];
	u_jp2k_8 u_jp2k_8(/*autoinst*/
    .clk                        (AGPbOkqoDAYNiAUBxYWb                            ),
    .rst                        (rst                            ),
	.rst_syn					(rst_syn						),
    .data_HH                    (OGJwXjhBDuVzMrVxGthI[16:0]                  ),
    .data_LH                    (hvcttLppSPcVixtVRHqN[16:0]                  ),
    .data_HL                    (NXURaWZymtMESRzASoml[16:0]                  ),
    .data_LL                    (NOzoIRcSVgyFREyzzHqs[16:0]                  ),
    .Y_U_V_over                 (HvOvrGAvaPTzYsRxiQFa[1:0]                ),
    .tier1_over                 (vhvQKmfEYGSlphsIxeCs                     ),
    .one_codeblock_over         (one_codeblock_over             ),
    .compression_ratio          (compression_ratio[2:0]         ),
    
	.bpc_start                  (eojmGbYrZBcDvhuhplcn                      ),
    .entropy_calc_over          (giByCXZhzRJrKpUfJiYx              ),
    .read_en_LL                 (kNoeoxFOMGDTBbVzHlLM                     ),
    .read_en_HL                 (QYcegkQFzbKFzvlPxGeR                     ),
    .read_en_LH                 (WCbGOTtDaZUdMPlupDBN                     ),
    .read_en_HH                 (pcsafTpJQiyaKivHSiiO                     ),
    .address_LL                 (NfdfbTCtNjYFDeLLecMe[13:0]               ),
    .address_LH                 (NCLfdSDEGhGvIWQaIuMS[13:0]               ),
    .address_HL                 (spPgPLHCbVgdzOmJFakw[13:0]               ),
    .address_HH                 (tDHSWWPwhDHPIdkjEtEW[13:0]               ),
    .byte_number_codeblock      (ZrFbZJjPMDHEuYZROGXq[13:0]    )
);

u_jp2k_20   u_u_jp2k_20(
			.addra_all_1(addra_all_1[17:0]),
			.dina_o1(wmEBGiAYKWjrjZxZfGew[16:0]),
			.dina_o2(jMCVmjFKEszeMFGJPhDT[16:0]),
			.addra_o1_w(cjZwHLURVzyLNtMosbQN[13:0]),
			.addra_o2_w(XmWQfEltjOUqcNLDCtfd[13:0]),
			.wea_o1_w(MPFTDVkljwqlROSuxXcP),
			.wea_o2_w(ARQLJGuTZBnFJHXDoAkT),
			.ena_o1_w(euqWRDzuVBfSvNZlbygs),
			.ena_o2_w(CHmFHLXDhsSOMWPfgbXw),
			.start(iGrqtIPPBFPUhGunhSdw),
			.douta_all_1(douta_all_1[31:0]),
			.start_cpu(start_cpu),
			.clk_dwt(clk_dwt),
			.clk_sg(XRBRKunaBXumEnJXwUaW),
			.rst(rst),
			.rst_syn(rst_syn),
			.count_tiles_6(count_tiles_6));	


u_jp2k_24	u_u_jp2k_24( .addra_o1_r(uCYGrwGKzInfdhxjHSnQ),
										.addra_o2_r(PRQweGZJzjDmSpZQuquI),
										.ena_o1_r(gStNdqadtalDMswfRuqW),
										.ena_o2_r(XWSDWJpZwWFziLcqAlai),
										.wea_o1_r(pyhAjCtAJLKGgXMclzgY),
										.wea_o2_r(ESEFEoPuTgYdvrsaqlOz),
										.odd_data_raw (cnjmhGUWkOHIVxVIhHDv),		
										.even_data_raw (wJuREkXTuZjUDwGKconv),	
										//input		
										.dout_o1(oEDxWLutHlOkrCgasnsy),
										.dout_o2(kAXRTBBnwMdFccjIlXSw),
										.level(PyEEDQIranrmOtTgLGUj),	
										.wr_over(ePSgpDyNjLZaHJjdoJRC),	
										.start(iGrqtIPPBFPUhGunhSdw),	
										.dwt_work(KrITBDcynwSzeDKOSSpS),
										.rf_over(ASCWICejFoBbZHMJMVyD),
										.clk_mmu(clk_dwt),	
                                        .rst(rst),
										.rst_syn(rst_syn));

u_jp2k_10  u_u_jp2k_10( .row_ldata(JQihcsaYHcVHwbmuIObQ),
             .row_hdata(GXJpDpCLmCzXINGxPMZk),
             .row_out_vld(xdZgFciIrqHvwlJizAPw), 	   								
			 .odd_data(TNcvWdikgEgGEJMVIpQt),				
			 .even_data(wPxzMmDeVUSdzGMNnVPk),					
			 .start_cf(icIbrKPwZHpyTefhhVqt),					
			 .level(PyEEDQIranrmOtTgLGUj),					
			 .dwt_work(KrITBDcynwSzeDKOSSpS),
			 .rf_over(ASCWICejFoBbZHMJMVyD),			 
			 .clk_flu(clk_dwt),					
			 .rst(rst),
			 .rst_syn(rst_syn));
			 
u_jp2k_17		u_u_jp2k_17(	
				.dina_64(IQazFWpFMTVRFpOhCJuZ),
				.dina_1(PZHGEEkYmcmnvPoUtLkc),
				.dina_2(vFOehkeqyGreFhoQwZlf),	
				.dina_3(uvIQXoaGcIvXFkvrGQaf),	
				.dina_4(MeeNSHsyevjrVlqirjok),
				.addra_64(anpXSAKnVzeQdotHAwhY),
				.addrb_64(kkkkXEMpJOVWRnfdVhUs),
				.addra_1(dXrKEPxqSBOppMxaytbW),
				.addrb_1(nQAnZVgoKyprBQAdRCfA),
				.addra_2(MNhKBwmQfBNRRoCGsGYL),
				.addra_3(CZUlnpSgUmTCmXxNawKq),
				.addra_4(GCKDpTZdSkziHIHQTHTY),
				.wea_64(wEtGDzRjafclnvKxgCSP),
				.web_64(YfuArrGnpBUyrJxEvVgI),
				.wea_1(WQWSkTgEaMFMXPEsFHwg),
				.web_1(LrLbKGgLtBSEzbICsDNb),
				.wea_2(nxlEkFPUCwQVbIQJmgbx),
				.wea_3(SVzsQtfHGQqXqNoloxvo),
				.wea_4(vMLEZaXExwsFFvafFmfc),
				.ena_64(DnfnMYzlPFszZtXlGDhW),
				.enb_64(NhvFLRUduFzxNErEsMee),
				.ena_1(IADijSHmLDuBqTQJOxSa),
				.enb_1(UDhUDnjGRISxZIKdQMYR),
				.ena_2(RdPhRZcalGKJvMOvrAIh),
				.ena_3(xMPttPagqqqJUKztQdOZ),
				.ena_4(YCteCIAKCruidjpeILHG),
				.odd_data(qaVKoOckmCbhBtxSbviM),
				.even_data(wKozjyqvbxpraCSNGCJY),
				.start_cf(icIbrKPwZHpyTefhhVqt),
				.level(PyEEDQIranrmOtTgLGUj),
				.wr_over(ePSgpDyNjLZaHJjdoJRC),		
				.ce0_ctrl(UGCVBMZYTRhtoiYMLbHQ),
				.unvalid_cnt(jxUDbZdGnigmzXceroAz),
				.dwt_work(KrITBDcynwSzeDKOSSpS),
				.Y_U_V_over(HvOvrGAvaPTzYsRxiQFa),
				.bpc_start(eojmGbYrZBcDvhuhplcn),				
				.douta_64(yjbcxShalQPOIpOVRmzb),
				.doutb_64(mDsCITWXfhDPUdTQuCIx),
				.douta_1(UzqBDrsiplVMPHJoNdLS),
				.doutb_1(AodmZAGdtXSrmpcZidlp),
				.quant_out_l(XFOvQMhAbaMrUyNcGbJY),
				.quant_out_h(lbOlCPSrCZTHlQttbDug),
				.quant_out_vld(wWtBaYTwKrFzDctmWSYF),
				.start(iGrqtIPPBFPUhGunhSdw),
				.clk_mmu(clk_dwt),
				.rst(rst),
				.rst_syn(rst_syn));
					
u_jp2k_21	u_u_jp2k_21(	.quant_out_h(lbOlCPSrCZTHlQttbDug),		
                                    .quant_out_l(XFOvQMhAbaMrUyNcGbJY),
                                    .quant_out_vld(wWtBaYTwKrFzDctmWSYF),
									//input					
									.row_ldata(JQihcsaYHcVHwbmuIObQ),				
									.row_hdata(GXJpDpCLmCzXINGxPMZk),					
									.row_out_vld(xdZgFciIrqHvwlJizAPw),					
									.dwt_work(KrITBDcynwSzeDKOSSpS),				
									.ce0_ctrl(UGCVBMZYTRhtoiYMLbHQ),		
									.level(PyEEDQIranrmOtTgLGUj),	
									.clk_qk(clk_dwt),		
									.rst(rst),
									.rst_syn(rst_syn));		

ram_16k_normal   u_o1(
	                   .clka (clk_dwt),
	                   .ena (euqWRDzuVBfSvNZlbygs),
	                   .wea (MPFTDVkljwqlROSuxXcP),
	                   .addra (cjZwHLURVzyLNtMosbQN[12:0]),
	                   .dina (wmEBGiAYKWjrjZxZfGew),
	                   .douta (tAfVkAIwJeedbspKhudJ),
	                   .clkb (clk_dwt),
	                   .enb (gStNdqadtalDMswfRuqW),
	                   .web (pyhAjCtAJLKGgXMclzgY),
	                   .addrb (uCYGrwGKzInfdhxjHSnQ[12:0]),
	                   .dinb (17'b0),
	                   .doutb(oEDxWLutHlOkrCgasnsy));
					 
ram_16k_normal   u_o2(
	                   .clka (clk_dwt),
	                   .ena (CHmFHLXDhsSOMWPfgbXw),
	                   .wea (ARQLJGuTZBnFJHXDoAkT),
	                   .addra (XmWQfEltjOUqcNLDCtfd[12:0]),
	                   .dina (jMCVmjFKEszeMFGJPhDT),
	                   .douta (idqOlqzawAFNusRXGZcD),
	                   .clkb (clk_dwt),
	                   .enb (XWSDWJpZwWFziLcqAlai),
	                   .web (ESEFEoPuTgYdvrsaqlOz),
	                   .addrb (PRQweGZJzjDmSpZQuquI[12:0]),
	                   .dinb (17'b0),
	                   .doutb(kAXRTBBnwMdFccjIlXSw));

ram_4k       u_64(
	                 .clka (clk_dwt),
	                 .ena (DnfnMYzlPFszZtXlGDhW),
	                 .wea (wEtGDzRjafclnvKxgCSP),
	                 .addra (anpXSAKnVzeQdotHAwhY[10:0]),
	                 .dina (IQazFWpFMTVRFpOhCJuZ),
	                 .douta (yjbcxShalQPOIpOVRmzb),
	                 .clkb (clk_dwt),
	                 .enb (NhvFLRUduFzxNErEsMee),
	                 .web (YfuArrGnpBUyrJxEvVgI),
	                 .addrb (kkkkXEMpJOVWRnfdVhUs[10:0]),
	                 .dinb (17'b0),
	                 .doutb(mDsCITWXfhDPUdTQuCIx));

ram_16k_normal  u_1(
	                 .clka (NnjJwuwNoVWroSgcnSsE),
	                 .ena (FGUJmfBLDaAxYUKmfnyF),
	                 .wea (tQSdMsmQOoDjgNvoiCmq),
	                 .addra (VNtokqcTmvhTFOkxNwHP[12:0]),
	                 .dina (PZHGEEkYmcmnvPoUtLkc),
	                 .douta (UzqBDrsiplVMPHJoNdLS),
	                 .clkb (clk_dwt),
	                 .enb (KASZraJCWhbAUtfwnLfk),
	                 .web (LrLbKGgLtBSEzbICsDNb),
	                 .addrb (xIHGyzqgFJSHmjAJEkTk[12:0]),
	                 .dinb (17'b0),
	                 .doutb(AodmZAGdtXSrmpcZidlp));

ram_dual_port  u_2(
	                 .clka (clk_dwt),
	                 .ena (RdPhRZcalGKJvMOvrAIh),
	                 .wea (nxlEkFPUCwQVbIQJmgbx),
	                 .addra (MNhKBwmQfBNRRoCGsGYL[12:0]),
	                 .dina (uvIQXoaGcIvXFkvrGQaf),
	                 .clkb (aDkQEysUQMjSKApaeshi),
	                 .enb (cKBOWdNoOXhznBHdAwlu),
	                 .addrb (ffdnbvLvbNGfaiXRKcYD[12:0]),
	                 .doutb(bVNTszDvPimBrKwNycBW));

ram_dual_port  u_3(
	                 .clka (clk_dwt),
	                 .ena (xMPttPagqqqJUKztQdOZ),
	                 .wea (SVzsQtfHGQqXqNoloxvo),
	                 .addra (CZUlnpSgUmTCmXxNawKq[12:0]),
	                 .dina (vFOehkeqyGreFhoQwZlf),
	                 .clkb (aDkQEysUQMjSKApaeshi),
	                 .enb (LgxgHDHmFYbeGgXVWgvC),
	                 .addrb (dDkKlvBKHVNSwGZicnzg[12:0]),
	                 .doutb(CTJvELJpTGwHTCgirGVs));
					 
ram_dual_port  u_4(
	                 .clka (clk_dwt),
	                 .ena (YCteCIAKCruidjpeILHG),
	                 .wea (vMLEZaXExwsFFvafFmfc),
	                 .addra (GCKDpTZdSkziHIHQTHTY[12:0]),
	                 .dina (MeeNSHsyevjrVlqirjok),
	                 .clkb (aDkQEysUQMjSKApaeshi),
	                 .enb (HhgKJaIdyWwhlApPzTKC),
	                 .addrb (sTYRbAXFBXVNlExKcFRO[12:0]),
	                 .doutb(aSItvOfWsSQOkHOHMzuM));	
					 
u_jp2k_2		u_u_jp2k_2(  
										.block_count_0_lh_y(twyoccXqjNTyiiCHZKgQ),
										.block_count_0_lh_u(xvRCARkQSEXoZFEiGfjC),
										.block_count_0_lh_v(JjLGddxBYbYmoYBVjdju),
										.block_count_0_hl_y(xyvvBnpUfpnejSAdOrIU),
										.block_count_0_hl_u(LNWqJGCGvJkqDqnyFdST),
										.block_count_0_hl_v(XXnujvRmwKtqZZbYXNom),
										.block_count_0_hh_y(rdgcYAhdMEGqsgkVVhHB),
										.block_count_0_hh_u(bcCzAdPYbGFOdbqFGtNY),
										.block_count_0_hh_v(MRTHuncHaQWNXrTdnjLu),
										.block_count_1_lh_y(ZqxWPnvGQEisPGNSDkWt),
										.block_count_1_lh_u(jLboxjBIZGftrbnYaDHz),
										.block_count_1_lh_v(XPHrltKlkTYeddIYErlL),
										.block_count_1_hl_y(DwnEuDbYEGceHCFfntWU),
										.block_count_1_hl_u(AhXRxsizDLdrPCSJbgvu),
										.block_count_1_hl_v(dRLKJNMhCWjmYIXyBBMS),
										.block_count_1_hh_y(qKakmPsWXvxWDjopwmhd),
										.block_count_1_hh_u(OfKBQrlHgohHRFQMqPuX),
										.block_count_1_hh_v(OMUVfbzXJtBmpgGUlWIN),
										.block_count_2_lh_y(pRjKNldSGgrOVpMtRdhl),
										.block_count_2_lh_u(FzItXojZYuRrQPYroXqa),
										.block_count_2_lh_v(tiASKMApdODRGubKCrIk),
										.block_count_2_hl_y(AofWIQWGCHGeAWxyBSnX),
										.block_count_2_hl_u(BVZJHRZIRDJUNzlhOXNj),
										.block_count_2_hl_v(MJngMbRNrQAqZKOoJbfA),
										.block_count_2_hh_y(LKEbaiUcnUkcdhTlxIWn),
										.block_count_2_hh_u(PIdKWDjIZqdVETXVKUyz),
										.block_count_2_hh_v(TeweoifYlvYAXegPEOev),
										.block_count_3_lh_y(aHdPRBehEsBXhVSVEVGI),
										.block_count_3_lh_u(EHDzFoGEUiKMcpmeZndO),
										.block_count_3_lh_v(iGWdFxfLkcoPAfSnTRiW),
										.block_count_3_hl_y(OgwvxakMlGIDTjsTTTrF),
										.block_count_3_hl_u(hweOwCSFFCFpnLABsNDz),
										.block_count_3_hl_v(kFILldZgHWqtwHcEyrEz),
										.block_count_3_hh_y(BHxWpRKaPloRmedcGnVS),
										.block_count_3_hh_u(jEDhTzjvJVSeQkYxJusx),
										.block_count_3_hh_v(nVWwCingLJiAmNkXNBse),
										.block_count_4_lh_y(hdQpCNCsCpWxWjyDHYIf),
										.block_count_4_lh_u(mYfjBwhqQaPjGDGuVzVT),
										.block_count_4_lh_v(sPdTjZhZROmcYPkfxnHK),
										.block_count_4_hl_y(VOSkkJBkJQjLTSFCXXZG),
										.block_count_4_hl_u(wnDMhVWFcihAknOuJWgt),
										.block_count_4_hl_v(ZJYNMlOSJujZtBMVfIcG),
										.block_count_4_hh_y(cUQgUjrarAoCxWvadhrh),
										.block_count_4_hh_u(ayPBmMeTERtfSkylBBkl),
										.block_count_4_hh_v(zjiIArXGbkjgPxxXfPxg),
										.block_count_4_ll_y(YERHnxdykgyyioNNZJSQ),
										.block_count_4_ll_u(rNuBwbgCniYGlSgOMCnE),
										.block_count_4_ll_v(VjtVxkxLZrdVPkMsyEqe),
									   .clk_mmu(clk_dwt),	
                                       .rst(rst),		 
                                       .quant_out_vld(wWtBaYTwKrFzDctmWSYF), 
									   .dina_1(PZHGEEkYmcmnvPoUtLkc),
                                       .dina_2(vFOehkeqyGreFhoQwZlf),
                                       .dina_3(uvIQXoaGcIvXFkvrGQaf), 
                                       .dina_4(MeeNSHsyevjrVlqirjok),
									   .unvalid_cnt(jxUDbZdGnigmzXceroAz),
									   .level(PyEEDQIranrmOtTgLGUj),
									   .rst_syn(rst_syn)); 

											
u_jp2k_5	u_u_jp2k_5(	.data_out1(fFwIafFNLTVTiIeJUZOi),
                                        .data_out2(JofSpHHAILpRCvnGOmzf),
                                        .data_out3(OeYMhMfjeDdvkecHiLUT),
                                        .data_out4(tVOTCptQSOpsjFBXiksw),
                                        .addra_2(FSYqURbHbEaesQcTkdrx),
                                        .addra_3(qEtkygphCMCbDqrWtklY),
                                        .addra_4(TLjaqwEsoHtrvWTBQRsK),
                                        .addra_1(WVikipTMfwFUtPMyACXK), 
                                        .wea_1(BhAYLsocIYeStsZZVTUF),
                                        .ena_2(TbggffYtMBhiLSACnOtm),
                                        .ena_3(QMFreKPqLMtYHbzgqBQA),
                                        .ena_4(NlcVQzrrHSpHBCrquBjt),
                                        .ena_1(cYsREsbuuQNtJwVuIQtc),
                                        .bpc_start_reg(QfUEKjFcoDGGRCHDXqcI),
										.count_YUV(AhXuWEaSPuUvIcwDuFWr),
										.band(JJgTPGsdUTcAdufkeJgK),
										.stripe_over_delay(ekQuaIqPJyasZNSLaQOo),
										.level_reg(osvtoSWcIuWcmvZruLsS),
										.level_delay(BzXYfwLRzqKLxtfxvmZC),
										.last_stripe_vld_delay(tgVDzxwqtPquEcvdvFrC),
										.stop_delay4(DzNsyDbNrzFrSyvQMHnd),
										.code_over_delay(iOnjZhBOoaDLaXXeVrwx),
										.bpc_start_delay(XwvNGtBVJXErWQRUuqBI),
										.count_bp(teJcaVooEJRLzkMyxXMf),
										.halt(JtPboWbpZfxqTBEEDYyf),
										.halt_to_fifo(NIzOkTmOrsmtdJpYgwkn),
										.block_all_bp_over(iedRhyJcTveKSbgVgPyX),
										.zero_bp_count(TfnRFMUqcGKfwYVkrOcp),
										.count_bp_to_genere(ZNywgghYzvszBznGurzE),										
										.top_plane(XWIoNGOmiUqZuWDNerJA),
										.stall_vld(ymZNoaOSvkuMNFrKCZJc),
                                        .douta_1(UzqBDrsiplVMPHJoNdLS),	
                                        .douta_2(bVNTszDvPimBrKwNycBW),
                                        .douta_3(CTJvELJpTGwHTCgirGVs),
                                        .douta_4(aSItvOfWsSQOkHOHMzuM),	
                                        .bpc_start(eojmGbYrZBcDvhuhplcn),
                                        .clk_rc(aDkQEysUQMjSKApaeshi),		
                                        .rst(rst),	
										.start_aga_song(hXhVKpwdYJhTQEjjQyiA),
										.bpc_halt_T2(ytSqxoZpMDkNRuAUbZDc),
										.flush_over(flush_over),
										.rst_syn(rst_syn),
										.clk_sg(XRBRKunaBXumEnJXwUaW));

u_jp2k_4	u_u_jp2k_4(
											.bp_data1_state(kuHTqKTEGHJGjcgKEkCF),
											.bp_data2_state(FfvTBiXNEwWARzrRMUYh), 
											.bp_data3_state(VMfdRrsDolDymeMDbscN), 
											.bp_data4_state(iPuXoTiWLBGZVYAHGaYO),
											.stripe_over_flag(BaxkmTikPlEanrOALJQn),
											.level_flag(TGPYgdsEOqsHqlpqyhVp),
											.last_stripe_vld(VZaWDekOPjcbcuLkmTCK),
											.stop_flag(ceSSpUnFGIqusvzAQYyv),
											.bpc_start_flag(KkgZHqKRoBphLNurbXZv),
											.code_over_flag(BVfKHJmimWhfvhFZYdJC),
											.top_plane(XWIoNGOmiUqZuWDNerJA),
											.pass_judge_1(ONSywhEkLUpjhsBVzOEr),
											.pass_judge_2(SiWXyZwStCTfnlFxLPQx),
											.pass_judge_3(ljlzMOdncFtIKCHtOsVQ),
											.pass_judge_4(sBtkXBZAHFHDVqMZHZdd),
											.bit1_nmsedec(rwPuhbqaLGfEsTZJaDhF),
											.bit2_nmsedec(YphfuswJNWiAbvgWEfjm),
											.bit3_nmsedec(YhTJCIYfjiXccwQDAncB),
											.bit4_nmsedec(KaDxyGuuayhqIxIwbGQG),
											.mul_factor_error(SCcERabQMmiRZhSuKFqS),											
											.count_bp(teJcaVooEJRLzkMyxXMf),
											.bpc_start_delay(XwvNGtBVJXErWQRUuqBI),
											.code_over_delay(iOnjZhBOoaDLaXXeVrwx),
											.stall_vld(ymZNoaOSvkuMNFrKCZJc),
											.last_stripe_vld_delay(tgVDzxwqtPquEcvdvFrC),
											.level_reg(osvtoSWcIuWcmvZruLsS),
											.level_delay(BzXYfwLRzqKLxtfxvmZC),
											.stripe_over_delay(ekQuaIqPJyasZNSLaQOo),
											.stop_delay4(DzNsyDbNrzFrSyvQMHnd),
											.data_out1(fFwIafFNLTVTiIeJUZOi),
                                            .data_out2(JofSpHHAILpRCvnGOmzf),
                                            .data_out3(OeYMhMfjeDdvkecHiLUT),
                                            .data_out4(tVOTCptQSOpsjFBXiksw),
                                            .count_YUV(AhXuWEaSPuUvIcwDuFWr),
											.band(JJgTPGsdUTcAdufkeJgK),
                                            .clk_sg(XRBRKunaBXumEnJXwUaW),
											.clk_rc(aDkQEysUQMjSKApaeshi),
											.rst(rst),
											.rst_syn(rst_syn),
											.block_count_0_lh_y(twyoccXqjNTyiiCHZKgQ),
											.block_count_0_lh_u(xvRCARkQSEXoZFEiGfjC),
											.block_count_0_lh_v(JjLGddxBYbYmoYBVjdju),
											.block_count_0_hl_y(xyvvBnpUfpnejSAdOrIU),
											.block_count_0_hl_u(LNWqJGCGvJkqDqnyFdST),
											.block_count_0_hl_v(XXnujvRmwKtqZZbYXNom),
											.block_count_0_hh_y(rdgcYAhdMEGqsgkVVhHB),
											.block_count_0_hh_u(bcCzAdPYbGFOdbqFGtNY),
											.block_count_0_hh_v(MRTHuncHaQWNXrTdnjLu),
											.block_count_1_lh_y(ZqxWPnvGQEisPGNSDkWt),
											.block_count_1_lh_u(jLboxjBIZGftrbnYaDHz),
											.block_count_1_lh_v(XPHrltKlkTYeddIYErlL),
											.block_count_1_hl_y(DwnEuDbYEGceHCFfntWU),
											.block_count_1_hl_u(AhXRxsizDLdrPCSJbgvu),
											.block_count_1_hl_v(dRLKJNMhCWjmYIXyBBMS),
											.block_count_1_hh_y(qKakmPsWXvxWDjopwmhd),
											.block_count_1_hh_u(OfKBQrlHgohHRFQMqPuX),
											.block_count_1_hh_v(OMUVfbzXJtBmpgGUlWIN),
											.block_count_2_lh_y(pRjKNldSGgrOVpMtRdhl),
											.block_count_2_lh_u(FzItXojZYuRrQPYroXqa),
											.block_count_2_lh_v(tiASKMApdODRGubKCrIk),
											.block_count_2_hl_y(AofWIQWGCHGeAWxyBSnX),
											.block_count_2_hl_u(BVZJHRZIRDJUNzlhOXNj),
											.block_count_2_hl_v(MJngMbRNrQAqZKOoJbfA),
											.block_count_2_hh_y(block_count_2_hh_y),
											.block_count_2_hh_u(PIdKWDjIZqdVETXVKUyz),
											.block_count_2_hh_v(TeweoifYlvYAXegPEOev),
											.block_count_3_lh_y(aHdPRBehEsBXhVSVEVGI),
											.block_count_3_lh_u(EHDzFoGEUiKMcpmeZndO),
											.block_count_3_lh_v(iGWdFxfLkcoPAfSnTRiW),
											.block_count_3_hl_y(OgwvxakMlGIDTjsTTTrF),
											.block_count_3_hl_u(hweOwCSFFCFpnLABsNDz),
											.block_count_3_hl_v(kFILldZgHWqtwHcEyrEz),
											.block_count_3_hh_y(BHxWpRKaPloRmedcGnVS),
											.block_count_3_hh_u(jEDhTzjvJVSeQkYxJusx),
											.block_count_3_hh_v(nVWwCingLJiAmNkXNBse),
											.block_count_4_lh_y(hdQpCNCsCpWxWjyDHYIf),
											.block_count_4_lh_u(mYfjBwhqQaPjGDGuVzVT),
											.block_count_4_lh_v(sPdTjZhZROmcYPkfxnHK),
											.block_count_4_hl_y(VOSkkJBkJQjLTSFCXXZG),
											.block_count_4_hl_u(wnDMhVWFcihAknOuJWgt),
											.block_count_4_hl_v(ZJYNMlOSJujZtBMVfIcG),
											.block_count_4_hh_y(cUQgUjrarAoCxWvadhrh),
											.block_count_4_hh_u(ayPBmMeTERtfSkylBBkl),
											.block_count_4_hh_v(zjiIArXGbkjgPxxXfPxg),
											.block_count_4_ll_y(YERHnxdykgyyioNNZJSQ),
											.block_count_4_ll_u(rNuBwbgCniYGlSgOMCnE),
											.block_count_4_ll_v(VjtVxkxLZrdVPkMsyEqe));
											
u_jp2k_3   u_u_jp2k_3( 
					   .arrange_out0(HPBVjcjYzqThfAZsuBko),
                       .arrange_out1( RtOUSNvLjifycdHERnsH ), 
                       .arrange_out2( RHqjRVMUmlsTYhhiTxqt ), 
                       .arrange_out3( irQWRPjnSymTgyEWfOeV ), 
                       .arrange_out4( gHMMxJFDpgQtSoSKsfzc ), 
                       .arrange_out5( XrXzzUeQwqtdbHighLXh ), 
                       .arrange_out6( VXesUOJyNaYiksaASUmr ), 
                       .arrange_out7( MjDYzSbWZYtgtBPeFxFX ), 
                       .arrange_out8( QocIghyhzPXBoGjaFxEW ), 
                       .arrange_out9( aNNRDAQndlQbuwTNoeBC ), 
                       .vld_num(ganwYnOuHsVFGlnGQGGf), 
                       .flush(TmUIbPULspEIyexiGCHU), 
                       .flush_mq2(GrWFHsoruHLBTofZiNlc), 
                       .pass_judge_1(tBkJHywSnDHjCloeCKQN), 
                       .pass_judge_2(rtIOwgMybhKPbMtTkPHH), 
                       .pass_judge_3(ULvOWCBpLiqodnUiPZne), 
                       .pass_judge_4(UeCtXzcgpZHmscgLWNgU), 
                       .bit1_add_vld(NchYslfTwDoJDaIhKQld), 
                       .bit2_add_vld(vdLrgmXBDTPmGWwCZgJK), 
                       .bit3_add_vld(fypmfZbmWDbDCXEismjU), 
                       .bit4_add_vld(FEgAuSjALENQXZOiGFUZ),  
					   .pass_judge_1_d(ONSywhEkLUpjhsBVzOEr),
					   .pass_judge_2_d(SiWXyZwStCTfnlFxLPQx),
					   .pass_judge_3_d(ljlzMOdncFtIKCHtOsVQ),
					   .pass_judge_4_d(sBtkXBZAHFHDVqMZHZdd),				  
					   .stop_d(ASVDnraQDtLQhInOEyVK),
					   .clear0(RzDedJWchbeEickgtFOM),					   
					   .pass_error_start(qBWQIFhDbnPbANWZJPUR),   
						.halt(JtPboWbpZfxqTBEEDYyf),
					    .code_over_flag(BVfKHJmimWhfvhFZYdJC),
					    .bpc_start_flag(KkgZHqKRoBphLNurbXZv),
					    .last_stripe_vld(VZaWDekOPjcbcuLkmTCK),
					    .stripe_over_flag(BaxkmTikPlEanrOALJQn),
					    .level_flag(TGPYgdsEOqsHqlpqyhVp),
					    .stop_flag(ceSSpUnFGIqusvzAQYyv),
					    .band(JJgTPGsdUTcAdufkeJgK),
                        .stall_vld(ymZNoaOSvkuMNFrKCZJc),
                        .data1_state(kuHTqKTEGHJGjcgKEkCF),
                        .data2_state(FfvTBiXNEwWARzrRMUYh),
                        .data3_state(VMfdRrsDolDymeMDbscN),
                        .data4_state(iPuXoTiWLBGZVYAHGaYO),				
					    .clk_bpc(XRBRKunaBXumEnJXwUaW),
						.clk_dwt(clk_dwt),						
					    .rst(rst),
						.rst_syn(rst_syn));

u_jp2k_32 u_u_jp2k_32(
                            .fifo_in0  (QAZelRxmduKrKymXyprg),
				            .fifo_in1  (IixlIEeyecDFQCcIcXFK),
				            .fifo_in2  (CahtEzYLkeeOsdRKBvoI),
				            .fifo_in3  (hXvwCaJPKLmTlGnIqShO),
				            .fifo_in4  (ZapMeflJnJGQFrDdnzZx),
				            .fifo_in5  (tEZVPsZbWePhmBDkYbkW),
				            .fifo_in6  (VKIhSekuVtyFcvuoBpZH),
				            .fifo_in7  (HHissIgZPvjjCfGzZWgP),
				            .fifo_in8  (ZthEdVQnyODdQJpzqpDX),
				            .fifo_in9  (ZvVAYFyMKYuJjjuLlssM),
				            .wr_vld  (crDvxwhExTyEkehZAJBR),
							.stall_vld  (ymZNoaOSvkuMNFrKCZJc),
				            .wrfull  (HemnvXRItkGWOQQBARSS),
				            .arrange_out0  (HPBVjcjYzqThfAZsuBko),
				            .arrange_out1  (RtOUSNvLjifycdHERnsH),
				            .arrange_out2  (RHqjRVMUmlsTYhhiTxqt),
				            .arrange_out3  (irQWRPjnSymTgyEWfOeV),
				            .arrange_out4  (gHMMxJFDpgQtSoSKsfzc),
				            .arrange_out5  (XrXzzUeQwqtdbHighLXh),
				            .arrange_out6  (VXesUOJyNaYiksaASUmr),
				            .arrange_out7  (MjDYzSbWZYtgtBPeFxFX),
				            .arrange_out8  (QocIghyhzPXBoGjaFxEW),
				            .arrange_out9  (aNNRDAQndlQbuwTNoeBC),
				            .vld_num  (ganwYnOuHsVFGlnGQGGf),
				            .clk_wr  (XRBRKunaBXumEnJXwUaW),
							.clk_dwt	(clk_dwt),
				            .rst  (rst),
							.rst_syn(rst_syn));

fifoa  u_fifoa(
                   .fifo_out0  (SYPrSAmIZhepjzRpfAbW),
			       .fifo_out1  (bheecNbLIfuKFYksBrvM),
			       .fifo_out2  (LoFfmBmHEBmQlYvRihJx),
			       .fifo_out3  (RAqkMVQdcCkZqHQrYhTY),
			       .fifo_out4  (JwazcQrhGdLokRSxMIPy),
			       .fifo_out5  (NHwKTvStgXGxecepjZCb),
			       .fifo_out6  (iFhOAEkrfnWgTHHMCrAr),
			       .fifo_out7  (KoZvZIhKhWDYlgwhYWfH),
			       .fifo_out8  (xqkVQlUmzixmBBOWsogM),
			       .fifo_out9  (mZcXpTwcGpwcsXaAXzJZ),
			       .rdempty  (RiyBtzLqNImqdjYXxYLF),
			       .wrfull  (HemnvXRItkGWOQQBARSS),
			       .wr_vld  (crDvxwhExTyEkehZAJBR),
			       .rd_vld  (vqFRiEdZYIvaYIjwIZPo),
			       .fifo_in0  (QAZelRxmduKrKymXyprg),
			       .fifo_in1  (IixlIEeyecDFQCcIcXFK),
			       .fifo_in2  (CahtEzYLkeeOsdRKBvoI),
			       .fifo_in3  (hXvwCaJPKLmTlGnIqShO),
			       .fifo_in4  (ZapMeflJnJGQFrDdnzZx),
			       .fifo_in5  (tEZVPsZbWePhmBDkYbkW),
			       .fifo_in6  (VKIhSekuVtyFcvuoBpZH),
			       .fifo_in7  (HHissIgZPvjjCfGzZWgP),
			       .fifo_in8  (ZthEdVQnyODdQJpzqpDX),
                   .fifo_in9  (ZvVAYFyMKYuJjjuLlssM),
			       .clk_rd  (aDkQEysUQMjSKApaeshi),
			       .clk_wr  (aDkQEysUQMjSKApaeshi));
				   
u_jp2k_23 u_u_jp2k_23(
                          .fifo_out  (BDVfxjBZqdgfpcXaqSxS),
                          .rd_vld  (vqFRiEdZYIvaYIjwIZPo),
						  .start_aga (hXhVKpwdYJhTQEjjQyiA),
				          .fifo_out0  (SYPrSAmIZhepjzRpfAbW),
				          .fifo_out1  (bheecNbLIfuKFYksBrvM),
				          .fifo_out2  (LoFfmBmHEBmQlYvRihJx),
				          .fifo_out3  (RAqkMVQdcCkZqHQrYhTY),
				          .fifo_out4  (JwazcQrhGdLokRSxMIPy),
				          .fifo_out5  (NHwKTvStgXGxecepjZCb),
				          .fifo_out6  (iFhOAEkrfnWgTHHMCrAr),
				          .fifo_out7  (KoZvZIhKhWDYlgwhYWfH),
				          .fifo_out8  (xqkVQlUmzixmBBOWsogM),
				          .fifo_out9  (mZcXpTwcGpwcsXaAXzJZ),
				          .rdempty  (RiyBtzLqNImqdjYXxYLF),
				          .stop_rd  (DDvnkzcxCllmtaJgvsKQ),
				          .clk_rd  (aDkQEysUQMjSKApaeshi),
						  .halt_to_fifo	(NIzOkTmOrsmtdJpYgwkn),
				          .rst  (rst),
						  .rst_syn(rst_syn));
	
u_jp2k_19			u_u_jp2k_19(	.MQ_out(hUaTrhFAshrngFoHaXaJ),
					.word_last_flag(avmhenqBbGIfSBAIabaF),
					.stop(DDvnkzcxCllmtaJgvsKQ),
					.data_valid_pass_reg(IlmCWYrxdJVqIQywKmAF),
					.flush_over(flush_over),
					.word_last_valid(OJxfLuIkrNnSWpokhUXW),
					.bit_enough_to_bpc(ytSqxoZpMDkNRuAUbZDc),
					.PCXD(BDVfxjBZqdgfpcXaqSxS),
					.flush(GrWFHsoruHLBTofZiNlc),
					.clk(aDkQEysUQMjSKApaeshi),
					.rst(rst),
					.rst_syn(rst_syn),
					.start_aga(hXhVKpwdYJhTQEjjQyiA),
					.block_all_bp_over(iedRhyJcTveKSbgVgPyX),
					.song_require(rNNkvcsqGpEfYTFDzfVx),
					.one_codeblock_over(one_codeblock_over));

u_jp2k_13   u_u_jp2k_13 (
                                      .pass_error_sp (pass_error_sp),
						              .pass_error_mrp (fgBVAEOmiYVjlIISCTIH),
						              .pass_error_cp (pass_error_cp),
									  .clear0(RzDedJWchbeEickgtFOM),
						              .bit1_nmsedec (rwPuhbqaLGfEsTZJaDhF),
                                      .bit2_nmsedec (YphfuswJNWiAbvgWEfjm),
                                      .bit3_nmsedec (YhTJCIYfjiXccwQDAncB),
                                      .bit4_nmsedec (KaDxyGuuayhqIxIwbGQG),
                                      .pass_judge_1_delay (tBkJHywSnDHjCloeCKQN),
                                      .pass_judge_2_delay (rtIOwgMybhKPbMtTkPHH),
                                      .pass_judge_3_delay (ULvOWCBpLiqodnUiPZne),
                                      .pass_judge_4_delay (UeCtXzcgpZHmscgLWNgU),
									  .bit1_add_vld (NchYslfTwDoJDaIhKQld),
						              .bit2_add_vld (vdLrgmXBDTPmGWwCZgJK),
						              .bit3_add_vld (fypmfZbmWDbDCXEismjU),
						              .bit4_add_vld (FEgAuSjALENQXZOiGFUZ),
                                      .mul_factor_error (SCcERabQMmiRZhSuKFqS),
                                      .count_bp (ZNywgghYzvszBznGurzE),
                                      .stop_d (ASVDnraQDtLQhInOEyVK),
                                      .stall_vld (ymZNoaOSvkuMNFrKCZJc),
                                      .pass_error_start  (qBWQIFhDbnPbANWZJPUR),
                                      .clk_pass_pre  (aDkQEysUQMjSKApaeshi),
						              .clk_pass_cal (XRBRKunaBXumEnJXwUaW),
                                      .rst(rst),
									  .rst_syn(rst_syn));
									  
u_jp2k_18 		u_u_jp2k_18(
													.word_last_sp(ULkqQHcjawmJPPtzcPCS),	
													.word_last_cp(yHFGaozymIVZZMqtzLDd), 		
													.word_last_mrp(gVMkJmsMEYFtEfiuwaKj), 		 		
													.data_valid_pass_reg(IlmCWYrxdJVqIQywKmAF), 		
													.word_last_valid(OJxfLuIkrNnSWpokhUXW), 		
													.word_last_flag(avmhenqBbGIfSBAIabaF), 		
													.flush_over(flush_over), 												
					                                .clk(aDkQEysUQMjSKApaeshi), 
                                                    .rst(rst),
													.rst_syn(rst_syn));


										
										
										
										
endmodule 										
