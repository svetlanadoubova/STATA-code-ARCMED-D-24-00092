
* Analysis do file: Recovery of health services at IMSS (2018-2023) - Part 3
* Created by: Catherine Arsenault, Dec 2020
* Modified by: Saúl Eduardo Contreras Sánchez & Svetlana V. Doubova, Nov 2023

*Required programs
ssc install summtab
ssc install estout
net install grc1leg2, from("http://digital.cgdev.org/doc/stata/MO/Misc")

* Sum services // 1st paragraph results section
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery18-23nat.dta", clear
tabstat fp_util anc_util totaldel sc_util vax_util cerv_util breast_util diab_util hyper_util fm_cons spec_cons emerg_cons dent_cons hosp_num elect_surg if ooad=="National", stat(N sum) col(s) format(%20.10f)

* Sum services // 1st paragraph results section (Alternative)
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery18-23nat.dta", clear
tabstat totaldel cerv_util breast_util diab_util hyper_util fm_cons spec_cons dent_cons elect_surg if ooad=="National", stat(N sum) col(s) format(%20.10f)

* Information of COVID-19 beds occupied by month (five waves)
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery18-23ooad.dta", clear 
collapse(sum) mean_beds, by(year month)

********************************************************************************
*FIGURES AND TABLES
********************************************************************************
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery18-23ooad.dta", clear 
global maternal fp_util anc_util totaldel cs_rate
global child sc_util vax_util
global chronic cerv_util breast_util diab_util hyper_util
global other fm_cons spec_cons emerg_cons dent_cons hosp_num elect_surg
global serv $maternal $child $chronic $other 
global qual diab_qual hyper_qual
global all $serv $qual

*Define covariates
global covars postPolicy timeafter_pol timeafter_cov ln_beds spring summer fall 
global covars_lag postPolicy_lag timeafter_pol_lag timeafter_cov_lag ln_beds_lag spring summer fall 
global covars_lag1 postPolicy_lag timeafter_pol_lag timeafter_cov ln_beds spring summer fall 
global covars_lag2 postPolicy_lag2 timeafter_pol_lag2 timeafter_cov_lag ln_beds_lag spring summer fall 
global seasons rmonth spring summer fall

********************************************************************************
*Table 1: Service volume by time period
********************************************************************************
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery18-23ooad.dta", clear
* Loop over all variables
foreach v of var ooad period fp_util anc_util totaldel cs_util sc_util vax_util cerv_util breast_util diab_util hyper_util cs_rate diab_qual hyper_qual fm_cons spec_cons emerg_cons dent_cons hosp_num elect_surg {
  * Store variable label in a local
        local lab`v' : variable label `v'
            if `"`lab`v''"' == "" {
            local lab`v' "`v'"
        }
}

* Tiny .do file to run after copylabels.do > collapse
collapse (mean) fp_util anc_util totaldel cs_util sc_util vax_util cerv_util breast_util diab_util hyper_util cs_rate diab_qual hyper_qual fm_cons spec_cons emerg_cons dent_cons hosp_num elect_surg, by(ooad period)

foreach v of var * {
        label var `v' "`lab`v''"
}

summtab, contvars($all) by(period) median medfmt(0) word wordname(Table1median) replace directory("C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023")


********************************************************************************
* FIGURE 1 GRAPHS WITH TRENDS
******************************************************************************** 
*Experiments for bringing in Covid beds
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery18-23nat.dta", clear
cd "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/graphs"	
keep if ooad == "National"
lab var fp_util "Contraceptive use visits (new acceptors)"
lab var vax_util "Child vaccination"
lab var anc_util "Antenatal care (pregnancies)"
lab var sc_util "Sick child"
lab var hyper_util "Hypertension care"
lab var diab_util "Diabetes care"
lab var cerv_util "Cervical cancer screening"
lab var breast_util "Breast cancer screening"
lab var bcg_qual "BCG"
lab var pneum_qual "Pneumococcal"
lab var mmr_qual "MMR"
lab var rota_qual "Rotavirus"
lab var penthex_qual "Pentavalent/ Hexavalent"
lab var cs_rate "Cesarean section"
lab var hyper_qual "Controlled hypertension"
lab var diab_qual "Controlled diabetes"
lab var fm_cons "Family medicine consultations" 
lab var spec_cons "Specialty consultations" 
lab var emerg_cons "Emergency room attentions" 
lab var dent_cons "Dental consultations"
lab var elect_surg "Elective surgeries" 
lab var hosp_num "Hospitalizations"
egen rmonth2 = group(year month), label
lab def rmonth2 1 "1/18" 7 "7/18" 13 "1/19" 19 "7/19" 25 "1/20" 31 "7/20" 37 "1/21" 43 "7/21" 49 "1/22" 55 "7/22" 61 "1/23" 66 "6/23", modify

foreach var of varlist fp_util anc_util totaldel sc_util vax_util $chronic $other bcg_qual pneum_qual rota_qual mmr_qual penthex_qual  {
	replace `var' = `var' / 1000
}

**global gph_set "xline(28, lpattern(dash) lcolor(black) lwidth(medthick) ) xline(40, lpattern(longdash) lwidth(medthick) lcolor(black)) xtitle("") graphregion(color(white)) xtick(1 66)  graphregion(color(white)) ysize(5) xsize(7) legend(size(vsmall)) xlabel(1 7 13 19 25 31 37 43 49 55 61 66, value labsize(vsmall)) xtitle("") yscale(range(0(5000)15000) axis(2)) ylabel(#3, labsize(small) axis(2)) ylabel(#3, labsize(small) axis(1)) legend(symxs(*.5) rows(2) region(lstyle(none))) ytitle("Covid-19 beds occupied", axis(2) size(small)) "	

**twoway  (line fp_util anc_util totaldel cerv_util breast_util rmonth2, lwidth(thick thick thick thick thick) lcolor("199 233 180" "127 205 187" "65 182 196" "44 127 184" "37 52 148")) (spike mean_beds rmonth2, yaxis(2) lwidth(medthick) color(red)) , $gph_set ylabel(#5) yscale(range(0(100)300)) ytitle("Frequency (thousands)", axis(1) size(small)) legend(order (1 2 3 4 5)) subtitle("Women's health", size(medsmall))
**graph save "Fig1Aalt.gph", replace

**twoway  (line bcg_qual pneum_qual rota_qual mmr_qual penthex_qual rmonth2, lwidth(thick thick thick thick thick) lcolor("199 233 192" "161 217 155" "116 196 118" "49 163 84" "0 109 44") lpattern(solid dash solid dash solid)) (spike mean_beds rmonth2, yaxis(2) lwidth(medthick) color(red)) (line sc_util rmonth2, lwidth(thick) lcolor(gold)), $gph_set ylabel(#5) yscale(range(0(20)60)) ytitle("Frequency (thousands)", axis(1) size(small)) legend(order (6 1 2 3 4 5)) subtitle("Child health" , size(medsmall))
**graph save "Fig1Balt.gph", replace

**twoway  (line diab_util hyper_util rmonth2, lwidth(thick thick) lcolor("122 1 119" "247 104 161")) (spike mean_beds rmonth2, yaxis(2) lwidth(medthick) color(red)) , $gph_set ylabel(#5) yscale(range(0(500)2000)) ytitle("Frequency (thousands)", axis(1) size(small)) legend(order (1 2)) subtitle("NCD service use", size(medsmall))
**graph save "Fig1Calt.gph", replace

**twoway  (line cs_rate $qual rmonth2, lwidth(thick thick thick) lcolor("65 182 196" "197 27 138" "250 159 181")) (spike mean_beds rmonth2, yaxis(2) lwidth(medthick) color(red)), $gph_set ylabel(#5) yscale(range(0(20)100)) ytitle("Percent", size(small) axis(1)) legend(order (1 2 3)) subtitle("Care outcomes", size(medsmall))
**graph save "Fig1Dalt.gph", replace

**twoway  (line fm_cons spec_cons emerg_cons dent_cons rmonth2, lwidth(thick thick thick thick) lcolor("0 109 44" "49 163 84" "116 196 118" "161 217 155")) (spike mean_beds rmonth2, yaxis(2) lwidth(medthick) color(red)), $gph_set ylabel(#5) yscale(range(0(2000)8000)) ytitle("Frequency(thousands)", size(small) axis(1)) legend(order (1 2 3 4)) subtitle("Consultations", size(medsmall))
**graph save "Fig1Ealt.gph", replace

**twoway  (line hosp_num elect_surg rmonth2, lwidth(thick thick) lcolor(brown maroon)) (spike mean_beds rmonth2, yaxis(2) lwidth(medthick) color(red)) , $gph_set ylabel(#5) yscale(range(0(50)200)) ytitle("Frequency (thousands)", axis(1) size(small)) legend(order (1 2)) subtitle("Hospitalizations and surgeries", size(medsmall))
**graph save "Fig1Falt.gph", replace

**graph combine "Fig1Aalt.gph" "Fig1Balt.gph", cols(1) graphregion(color(white)) ysize(12) xsize(10)
**graph export "Fig1.png", replace

**graph combine "Fig1Calt.gph" "Fig1Dalt.gph", cols(1) graphregion(color(white)) ysize(12) xsize(10)
**graph export "Fig2.png", replace

**graph combine "Fig1Ealt.gph" "Fig1Falt.gph", cols(1) graphregion(color(white)) ysize(12) xsize(10)
**graph export "Fig3.png", replace

****Alternative graphs"****

global gph_set "xline(28, lpattern(dash) lcolor(black) lwidth(medthick) ) xline(40, lpattern(longdash) lwidth(medthick) lcolor(black)) xtitle("") graphregion(color(white)) xtick(1 66)  graphregion(color(white)) ysize(5) xsize(7) legend(size(vsmall)) xlabel(1 7 13 19 25 31 37 43 49 55 61 66, value labsize(vsmall)) xtitle("") yscale(range(0(5000)15000) axis(2)) ylabel(#3, labsize(small) axis(2)) ylabel(#3, labsize(small) axis(1)) legend(symxs(*.5) rows(2) region(lstyle(none))) ytitle("Covid-19 beds occupied", axis(2) size(small))"	

twoway  (line fm_cons spec_cons dent_cons rmonth2, lwidth(thick thick thick) lcolor("0 109 44" "49 163 84" "116 196 118")) (spike mean_beds rmonth2, yaxis(2) lwidth(medthick) color(red)), $gph_set ylabel(#5) yscale(range(0(2000)8000)) ytitle("Frequency (thousands)", size(small) axis(1)) legend(order (1 2 3) row(1)) subtitle("Primary and specialized care", size(medsmall))
graph save "Fig1Galt.gph", replace

twoway  (line totaldel elect_surg rmonth2, lwidth(thick thick) lcolor(gold brown)) (spike mean_beds rmonth2, yaxis(2) lwidth(medthick) color(red)) , $gph_set ylabel(#5) yscale(range(0(20)80)) ytitle("Frequency (thousands)", axis(1) size(small)) legend(order (1 2) row(1)) subtitle("Hospital care", size(medsmall))
graph save "Fig1Halt.gph", replace

twoway  (line cerv_util breast_util rmonth2, lwidth(thick thick) lcolor("122 1 119" "247 104 161")) (spike mean_beds rmonth2, yaxis(2) lwidth(medthick) color(red)) , $gph_set ylabel(#5) yscale(range(0(100)300)) ytitle("Frequency (thousands)", axis(1) size(small)) legend(order (1 2) row(1)) subtitle("Cancer screening", size(medsmall))
graph save "Fig1Ialt.gph", replace

twoway  (line diab_util hyper_util rmonth2, lwidth(thick thick) lcolor("44 127 184" "37 52 148")) (spike mean_beds rmonth2, yaxis(2) lwidth(medthick) color(red)) , $gph_set ylabel(#5) yscale(range(0(500)2000)) ytitle("Frequency (thousands)", axis(1) size(small)) legend(order (1 2) row(1)) subtitle("Noncommunicable chronic deseases treatment", size(medsmall))
graph save "Fig1Jalt.gph", replace

twoway  (line $qual rmonth2, lwidth(thick thick) lcolor("65 182 196" "127 205 187")) (spike mean_beds rmonth2, yaxis(2) lwidth(medthick) color(red)), $gph_set ylabel(#5) yscale(range(0(20)100)) ytitle("Percent", size(small) axis(1)) legend(order (1 2) row(1)) subtitle("Noncommunicable chronic deseases control", size(medsmall))
graph save "Fig1Kalt.gph", replace

graph combine "Fig1Galt.gph" "Fig1Halt.gph", cols(1) graphregion(color(white)) ysize(12) xsize(10)
graph export "Fig4.png", replace

graph combine "Fig1Halt.gph" "Fig1Ialt.gph", cols(1) graphregion(color(white)) ysize(12) xsize(10)
graph export "Fig5.png", replace

graph combine "Fig1Ialt.gph" "Fig1Jalt.gph", cols(1) graphregion(color(white)) ysize(12) xsize(10)
graph export "Fig6.png", replace

graph combine "Fig1Jalt.gph" "Fig1Kalt.gph", cols(1) graphregion(color(white)) ysize(12) xsize(10)
graph export "Fig7.png", replace

graph combine "Fig1Kalt.gph" "Fig1Galt.gph", cols(1) graphregion(color(white)) ysize(12) xsize(10)
graph export "Fig8.png", replace


********************************************************************************
* Table 2
* REGRESSION ANALYSES 
* Poisson GEE models, exposure, exchangeable correlation
********************************************************************************

use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery18-23ooad.dta", clear
* Declare data to be time series panel data
xtset ooad1 rmonth

*AR for fp_util anc_util totaldel sc_util vax_util cerv_util breast_util diab_util hyper_util fm_cons spec_cons emerg_cons dent_cons hosp_num elect_surg
*Exc for cs_util diab_qual hyper_qual

foreach var of varlist fp_util anc_util totaldel {
	xtgee `var' $covars, family(poisson) link(log) exposure(women1549) corr(ar1) vce(robust)
	eststo pm_`var'
	xtgee `var' $seasons if period == 1, family(poisson) link(log) exposure(women1549) corr(ar1) vce(robust)
	eststo pcpm_`var'
}

xtgee cs_util $covars, family(poisson) link(log) exposure(totaldel) corr(exc) vce(robust)
	eststo pm_cs_util
xtgee cs_util $seasons if period == 1, family(poisson) link(log) exposure(totaldel) corr(exc) vce(robust)
	eststo pcpm_cs_util

xtgee sc_util $covars, family(poisson) link(log) exposure(u5) corr(ar1) vce(robust)
	eststo pm_sc_util
xtgee sc_util $seasons if period == 1, family(poisson) link(log) exposure(u5) corr(ar1) vce(robust)
	eststo pcpm_sc_util
	
xtgee vax_util $covars, family(poisson) link(log) exposure(u10) corr(ar1) vce(robust)
	eststo pm_vax_util
xtgee vax_util $seasons if period == 1, family(poisson) link(log) exposure(u10) corr(ar1) vce(robust)
	eststo pcpm_vax_util

xtgee cerv_util $covars, family(poisson) link(log) exposure(women2564) corr(ar1) vce(robust)
	eststo pm_cerv_util
xtgee cerv_util $seasons if period == 1, family(poisson) link(log) exposure(cerv_denom) corr(ar1) vce(robust)
	eststo pcpm_cerv_util

xtgee breast_util $covars, family(poisson) link(log) exposure(all20plus) corr(ar1) vce(robust)
	eststo pm_breast_util
xtgee breast_util $seasons if period == 1, family(poisson) link(log) exposure(women5069) corr(ar1) vce(robust)
	eststo pcpm_breast_util

foreach var of varlist diab_util hyper_util {
	xtgee `var' $covars, family(poisson) link(log) exposure(all20plus) corr(ar1) vce(robust)
	eststo pm_`var'
	xtgee `var' $seasons if period == 1, family(poisson) link(log) exposure(all20plus) corr(ar1) vce(robust)
	eststo pcpm_`var'
}

foreach var of varlist fm_cons spec_cons emerg_cons dent_cons hosp_num elect_surg {
	xtgee `var' $covars, family(poisson) link(log) exposure(total_pop) corr(ar1) vce(robust)
	eststo pm_`var'
	xtgee `var' $seasons if period == 1, family(poisson) link(log) exposure(total_pop) corr(ar1) vce(robust)
	eststo pcpm_`var'
}

xtgee diab_qual_num $covars_lag, family(poisson) link(log) exposure(diab_util) corr(exc) vce(robust)
	eststo pm_diab_qual_num
xtgee diab_qual_num $seasons if period == 1, family(nbinomial) link(log) exposure(diab_util) corr(exc) vce(robust)
	eststo pcpm_diab_qual_num

xtgee hyper_qual_num $covars_lag, family(poisson) link(log) exposure(hyper_util) corr(exc) vce(robust)
	eststo pm_hyper_qual_num
xtgee hyper_qual_num $seasons if period == 1, family(nbinomial) link(log) exposure(hyper_util) corr(exc) vce(robust)
	eststo pcpm_hyper_qual_num

esttab pm_sc_util pm_vax_util using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/Table2.rtf", eform replace wide b(3) ci(3) nostar compress /// 
 title( "A: Child health services") mtitles ("Sick child visits" "Vaccination") rename(timeafter_cov "Months into pandemic" postPolicy "NHSR Strategy" timeafter_pol "Months into NHSR" ln_beds "Covid inpatients, log" spring "Spring" summer "Summer" fall "Fall")

esttab pm_fp_util pm_anc_util pm_totaldel pm_cs_util using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/Table2.rtf", eform append wide b(3) ci(3) nostar compress /// 
 title( "B: Reproductive and maternal health services") mtitles ("Contraceptive use" "ANC" "Delivery" "C-sections") rename(timeafter_cov "Months into pandemic" postPolicy "NHSR Strategy" timeafter_pol "Months into NHSR" ln_beds "Covid inpatients, log" spring "Spring" summer "Summer" fall "Fall")

esttab pm_cerv_util pm_breast_util using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/Table2.rtf", eform append wide b(3) ci(3) nostar compress /// 
 title( "C: Cancer screening services") mtitles ("Cervical cancer" "Breast cancer") rename(timeafter_cov "Months into pandemic" postPolicy "NHSR Strategy" timeafter_pol "Months into NHSR" ln_beds "Covid inpatients, log" spring "Spring" summer "Summer" fall "Fall")

esttab pm_diab_util pm_hyper_util using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/Table2.rtf", eform append wide b(3) ci(3) nostar compress /// 
 title( "D: NCD service use") mtitles ("Diabetes visits" "Hypertension visits") rename(timeafter_cov "Months into pandemic" postPolicy "NHSR Strategy" timeafter_pol "Months into NHSR" ln_beds "Covid inpatients, log" spring "Spring" summer "Summer" fall "Fall")

esttab pm_diab_qual_num pm_hyper_qual_num using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/Table2.rtf", eform append wide b(3) ci(3) nostar compress /// 
 title( "E: NCD service outcomes") mtitles ("Diabetes control" "Hypertension control") rename(timeafter_cov_lag "Months into pandemic (1 mo. lag)" postPolicy_lag "NHSR Strategy (1 mo. lag)" timeafter_pol_lag "Months into NHSR (1 mo. lag)" ln_beds_lag "Covid inpatients, log (1 mo. lag)" spring "Spring" summer "Summer" fall "Fall")

esttab pm_fm_cons pm_spec_cons pm_emerg_cons pm_dent_cons using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/Table2.rtf", eform append wide b(3) ci(3) nostar compress /// 
 title( "F: Consultations") mtitles ("Familiar medicine" "Specialty" "Emergency" "Dental") rename(timeafter_cov "Months into pandemic" postPolicy "NHSR Strategy" timeafter_pol "Months into NHSR" ln_beds "Covid inpatients, log" spring "Spring" summer "Summer" fall "Fall")

esttab pm_hosp_num pm_elect_surg using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/Table2.rtf", eform append wide b(3) ci(3) nostar compress /// 
 title( "G: Hospitalizations and surgeries") mtitles ("Hospitalizations" "Elective surgeries") rename(timeafter_cov "Months into pandemic" postPolicy "NHSR Strategy" timeafter_pol "Months into NHSR" ln_beds "Covid inpatients, log" spring "Spring" summer "Summer" fall "Fall")

 
********************************************************************************
* NUMBER OF VISITS During policy period
* Figure 2
********************************************************************************

cd "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/graphs"	

expand 2 if period == 3, gen(counterfact)
replace postPolicy = 0 if counterfact == 1
replace timeafter_pol = 0 if counterfact == 1
replace postPolicy_lag = 0 if counterfact == 1
replace timeafter_pol_lag = 0 if counterfact == 1

cap drop cs_rate

foreach var in fp_util anc_util totaldel cs_util sc_util vax_util cerv_util breast_util diab_util hyper_util diab_qual_num hyper_qual_num fm_cons spec_cons emerg_cons dent_cons hosp_num elect_surg {
	estimates restore pm_`var'
	predict prd_`var'xb, xb
	predict stdp_`var', stdp
	gen lcl`var'= prd_`var'xb-(invnormal(1-.05/2)*stdp_`var') // conf. interval
	gen ucl`var'= prd_`var'xb+(invnormal(1-.05/2)*stdp_`var')	
	gen prd_`var' = exp(prd_`var'xb)
	replace lcl`var' = exp(lcl`var')
	replace ucl`var' = exp(ucl`var')
	gen prd_obs`var' = `var' > ucl`var' if period == 3
	replace prd_obs`var' = prd_obs`var' + 1 if `var' > lcl`var' & period == 3
	lab var prd_obs`var' obsprd
}

foreach var in fp_util anc_util totaldel cs_util sc_util vax_util cerv_util breast_util diab_util hyper_util diab_qual_num hyper_qual_num fm_cons spec_cons emerg_cons dent_cons hosp_num elect_surg {
	estimates restore pcpm_`var'
	predict PCprd_`var'xb, xb
	predict PCstdp_`var', stdp
	gen PClcl`var'= PCprd_`var'xb-(invnormal(1-.05/2)*PCstdp_`var') // conf. interval
	gen PCucl`var'= PCprd_`var'xb+(invnormal(1-.05/2)*PCstdp_`var')	
	gen PCprd_`var' = exp(PCprd_`var'xb)
	replace PClcl`var' = exp(PClcl`var')
	replace PCucl`var' = exp(PCucl`var')
}

foreach x in fp_util anc_util totaldel cs_util sc_util vax_util cerv_util breast_util diab_util hyper_util diab_qual_num hyper_qual_num fm_cons spec_cons emerg_cons dent_cons hosp_num elect_surg {
	local label: variable label `x'
*	keep if timeafter_pol == 3
	twoway  (rcap lcl`x' ucl`x' pop_rank if rmonth == 66 & counterfact == 1, horiz msize(tiny) color(navy%75)) (scatter pop_rank `x' if timeafter_pol == 27 & counterfact == 0, symbol(x) color(maroon)), graphregion(color(white)) legend(order(2 "Observed Jun. 2023" 1 "Range predicted pre-policy") rows(1) symxs(*.4) size(vsmall))  subtitle("`label'", size(small)) ytitle("") ylabel(35(1)1, alt angle(0) val labsize(tiny) nogrid) ysc(reverse) xlabel(#3)
	graph save "pred_`x'.gph", replace
	twoway  (rcap PClcl`x' PCucl`x' pop_rank if rmonth == 66 & counterfact == 0, horiz msize(tiny) color(navy%75)) (scatter pop_rank `x' if timeafter_pol == 27 & counterfact == 0, symbol(x) color(maroon)), graphregion(color(white)) legend(order(2 "Observed Jun. 2023" 1 "Range predicted pre-Covid") rows(1) symxs(*.4) size(vsmall))  subtitle("`label'", size(small)) ytitle("") ylabel(35(1)1, alt angle(0) val labsize(tiny) nogrid) ysc(reverse) xlabel(#3)
	graph save "PCpred_`x'.gph", replace
}

**grc1leg2 "pred_sc_util.gph" "pred_vax_util.gph" "pred_fp_util.gph" "pred_anc_util.gph" "pred_totaldel.gph" "pred_cs_util.gph", rows(2) graphregion(color(white)) ysize(12) xsize(17) lrows(1) symxs(*.4) labsize(vsmall)

**graph export "Figure2A.png", replace

**grc1leg2 "pred_cerv_util.gph" "pred_breast_util.gph" "pred_diab_util.gph" "pred_hyper_util.gph"  "pred_diab_qual_num.gph" "pred_hyper_qual_num.gph", rows(2) graphregion(color(white)) ysize(12) xsize(17) lrows(1) symxs(*.4) labsize(vsmall)

**graph export "Figure2B.png", replace

**grc1leg2 "pred_fm_cons.gph" "pred_spec_cons.gph" "pred_emerg_cons.gph" "pred_dent_cons.gph" "pred_hosp_num.gph" "pred_elect_surg.gph", rows(2) graphregion(color(white)) ysize(12) xsize(17) lrows(1) symxs(*.4) labsize(vsmall)

**graph export "Figure2C.png", replace

**grc1leg2 "PCpred_sc_util.gph" "PCpred_vax_util.gph" "PCpred_fp_util.gph" "PCpred_anc_util.gph" "PCpred_totaldel.gph" "PCpred_cs_util.gph", rows(2) graphregion(color(white)) ysize(12) xsize(17) lrows(1) symxs(*.4) labsize(vsmall)

**graph export "Figure2Asup.png", replace

**grc1leg2 "PCpred_cerv_util.gph" "PCpred_breast_util.gph" "PCpred_diab_util.gph" "PCpred_hyper_util.gph"  "PCpred_diab_qual_num.gph" "PCpred_hyper_qual_num.gph", rows(2) graphregion(color(white)) ysize(12) xsize(17) lrows(1) symxs(*.4) labsize(vsmall)

**graph export "Figure2Bsup.png", replace

**grc1leg2 "PCpred_fm_cons.gph" "PCpred_spec_cons.gph" "PCpred_emerg_cons.gph" "PCpred_dent_cons.gph" "PCpred_hosp_num.gph" "PCpred_elect_surg.gph", rows(2) graphregion(color(white)) ysize(12) xsize(17) lrows(1) symxs(*.4) labsize(vsmall)

**graph export "Figure2Csup.png", replace

****Alternative graphs"****

grc1leg2 "PCpred_fm_cons.gph" "PCpred_dent_cons.gph" "PCpred_spec_cons.gph" "PCpred_totaldel.gph" "PCpred_elect_surg.gph", rows(2) graphregion(color(white)) ysize(12) xsize(17) lrows(1) symxs(*.4) labsize(vsmall)

graph export "Figure2Dsup.png", replace

grc1leg2 "PCpred_cerv_util.gph" "PCpred_breast_util.gph" "PCpred_diab_util.gph" "PCpred_hyper_util.gph" "PCpred_diab_qual_num.gph" "PCpred_hyper_qual_num.gph", rows(2) graphregion(color(white)) ysize(12) xsize(17) lrows(1) symxs(*.4) labsize(vsmall)

graph export "Figure2Esup.png", replace


***************************************
* Table 3 - June 2023
****************************************
preserve
keep if counterfact == 1 & rmonth == 66
collapse (sum) fp_util *prd_fp_util anc_util *prd_anc_util totaldel *prd_totaldel cs_util *prd_cs_util sc_util *prd_sc_util vax_util *prd_vax_util cerv_util *prd_cerv_util breast_util *prd_breast_util diab_util *prd_diab_util hyper_util *prd_hyper_util diab_qual_num *prd_diab_qual_num hyper_qual_num *prd_hyper_qual_num fm_cons *prd_fm_cons spec_cons *prd_spec_cons emerg_cons *prd_emerg_cons dent_cons *prd_dent_cons hosp_num *prd_hosp_num elect_surg *prd_elect_surg

foreach x in diab hyper {
	gen `x'_qual = `x'_qual_num / `x'_util * 100
	gen prd_`x'_qual = prd_`x'_qual_num / `x'_util * 100
	gen PCprd_`x'_qual = PCprd_`x'_qual_num / `x'_util * 100
}

tabstat sc_util *prd_sc_util vax_util *prd_vax_util fp_util *prd_fp_util anc_util *prd_anc_util totaldel *prd_totaldel cs_util *prd_cs_util cerv_util *prd_cerv_util breast_util *prd_breast_util diab_util *prd_diab_util hyper_util *prd_hyper_util diab_qual *prd_diab_qual hyper_qual *prd_hyper_qual fm_cons *prd_fm_cons spec_cons *prd_spec_cons emerg_cons *prd_emerg_cons dent_cons *prd_dent_cons hosp_num *prd_hosp_num elect_surg *prd_elect_surg, stat(sum) c(s) format(%12.0gc)
restore


********************************************************************************
* SUPPLEMENTARY MATERIALS
********************************************************************************
*Supplemental Table 1: indicator definitions, no data

********************************************************************************
*  EFFECT ON ALL 5 VACCINES SEPARATELY
********************************************************************************	

*Supplemental Table 2:  Vaccines administered
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery18-23ooad.dta", clear
preserve
* Loop over all variables
foreach v of var ooad period penthex_qual mmr_qual rota_qual pneum_qual bcg_qual {
  * Store variable label in a local
        local lab`v' : variable label `v'
            if `"`lab`v''"' == "" {
            local lab`v' "`v'"
        }
}

* Tiny .do file to run after copylabels.do > collapse
collapse (mean) penthex_qual mmr_qual rota_qual pneum_qual bcg_qual, by(ooad period)

foreach v of var * {
        label var `v' "`lab`v''"
}

summtab, contvars(bcg_qual penthex_qual mmr_qual rota_qual pneum_qual) by(period) median medfmt(0) word wordname(STable2) replace directory("C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023")

restore 

*Supplemental Table 3: Poisson regression models of each vaccine
*AR: BCG, penthex, measles, pneum, rota
xtset ooad1 rmonth

foreach var of varlist penthex_qual mmr_qual rota_qual pneum_qual {
	xtgee `var' $covars, family(poisson) link(log) exposure(u10) corr(ar1) vce(robust)
	eststo pm_`var'
}

xtgee bcg_qual $covars, family(poisson) link(log) exposure(u1) corr(ar1) vce(robust)
	eststo pm_bcg_qual
	
esttab pm_bcg_qual pm_penthex_qual pm_mmr_qual pm_rota_qual pm_pneum_qual using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/STableVacc.rtf", eform replace wide b(2) ci(2) nostar compress /// 
 title( "Supplemental Table: Individual vaccine use") mtitles("BCG" "Pentavalent/ Hexavalent" "Measles" "Rotavirus" "Pneumococcal") rename(timeafter_cov "Months into pandemic" postPolicy "NHSR Strategy" timeafter_pol "Months into NHSR" ln_beds "Covid inpatients, log" spring "Spring" summer "Summer" fall "Fall")

 
********************************************************************************
*  Supplemental Table 4: Alternative model specifications
********************************************************************************	
 
**** A: All outcomes, linear regression with appropriate correlation structure

*Updated with data from Covid to Jun 2023, ln_beds:
*AR for fp_util cs_rate sc_util emerg_cons dent_cons 
*Exc for anc_util totaldel vax_util cerv_util breast_util diab_util hyper_util fm_cons spec_cons hosp_num elect_surg diab_qual hyper_qual

use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery18-23ooad.dta", clear  

global ar_vars fp_util cs_rate sc_util emerg_cons dent_cons 
global exc_vars anc_util totaldel vax_util cerv_util breast_util diab_util hyper_util fm_cons spec_cons hosp_num elect_surg
global exc_vars_lag diab_qual hyper_qual

*Declare data to be time series panel data
xtset ooad1 rmonth

*Limit to Covid data onwards
drop if rmonth < 28 
* Call GEE, export RR to excel

foreach var of global exc_vars {

	xtgee `var' $covars, family(gaussian) link(identity) corr(exchangeable) vce(robust)	
	eststo m_`var'	
}

foreach var of global ar_vars {
	
	xtgee `var' $covars, family(gaussian) link(identity) corr(ar1) vce(robust)	
	eststo m_`var'
}

drop if rmonth < 29
foreach var of global exc_vars_lag {
	
	xtgee `var' $covars_lag, family(gaussian) link(identity) corr(exchangeable) vce(robust)	
	eststo mlag_`var'
}

esttab m_sc_util m_vax_util using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/STable4A.rtf", replace wide b(2) ci(2) nostar compress /// 
 title( "A: Child health services") mtitles ("Sick child visits" "Vaccination") rename(timeafter_cov "Months into pandemic" postPolicy "NHSR Strategy" timeafter_pol "Months into NHSR" ln_beds "Covid inpatients, log" spring "Spring" summer "Summer" fall "Fall")

esttab m_fp_util m_anc_util m_totaldel m_cs_rate using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/STable4A.rtf", append wide b(2) ci(2) nostar compress /// 
 title( "B: Reproductive and maternal health services") mtitles ("Contraceptive use" "ANC" "Delivery" "C-sections") rename(timeafter_cov "Months into pandemic" postPolicy "NHSR Strategy" timeafter_pol "Months into NHSR" ln_beds "Covid inpatients, log" spring "Spring" summer "Summer" fall "Fall")

esttab m_cerv_util m_breast_util using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/STable4A.rtf", append wide b(2) ci(2) nostar compress /// 
 title( "C: Cancer screening services") mtitles ("Cervical cancer" "Breast cancer") rename(timeafter_cov "Months into pandemic" postPolicy "NHSR Strategy" timeafter_pol "Months into NHSR" ln_beds "Covid inpatients, log" spring "Spring" summer "Summer" fall "Fall")

esttab m_diab_util m_hyper_util using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/STable4A.rtf", append wide b(2) ci(2) nostar compress /// 
 title( "D: NCD service use") mtitles ("Diabetes visits" "Hypertension visits") rename(timeafter_cov "Months into pandemic" postPolicy "NHSR Strategy" timeafter_pol "Months into NHSR" ln_beds "Covid inpatients, log" spring "Spring" summer "Summer" fall "Fall")

esttab mlag_diab_qual mlag_hyper_qual using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/STable4A.rtf", append wide b(2) ci(2) nostar compress /// 
 title( "E: NCD service outcomes") mtitles ("Diabetes control" "Hypertension control") rename(timeafter_cov_lag "Months into pandemic (1 mo. lag)" postPolicy_lag "NHSR Strategy (1 mo. lag)" timeafter_pol_lag "Months into NHSR (1 mo. lag)" ln_beds_lag "Covid inpatients, log (1 mo. lag)" spring "Spring" summer "Summer" fall "Fall")

esttab m_fm_cons m_spec_cons m_emerg_cons m_dent_cons using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/STable4A.rtf", append wide b(2) ci(2) nostar compress /// 
 title( "F: Consultations") mtitles ("Familiar medicine" "Specialty" "Emergency" "Dental") rename(timeafter_cov "Months into pandemic" postPolicy "NHSR Strategy" timeafter_pol "Months into NHSR" ln_beds "Covid inpatients, log" spring "Spring" summer "Summer" fall "Fall")

esttab m_hosp_num m_elect_surg using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/STable4A.rtf", append wide b(2) ci(2) nostar compress /// 
 title( "G: Hospitalizations and surgeries") mtitles ("Hospitalizations" "Elective surgeries") rename(timeafter_cov "Months into pandemic" postPolicy "NHSR Strategy" timeafter_pol "Months into NHSR" ln_beds "Covid inpatients, log" spring "Spring" summer "Summer" fall "Fall")

 
**** B: adding 1 mo. lag to the policy variables

use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery18-23ooad.dta", clear 

* Declare data to be time series panel data
xtset ooad1 rmonth

*AR for fp_util anc_util totaldel sc_util vax_util cerv_util breast_util diab_util hyper_util fm_cons spec_cons emerg_cons dent_cons hosp_num elect_surg
*Exc for cs_util diab_qual hyper_qual
	
foreach var of varlist fp_util anc_util totaldel {
	xtgee `var' $covars_lag1, family(poisson) link(log) exposure(women1549) corr(ar1) vce(robust)
	eststo pmlag_`var'
}

xtgee cs_util $covars_lag1, family(poisson) link(log) exposure(totaldel) corr(exc) vce(robust)
	eststo pmlag_cs_util
	
xtgee sc_util $covars_lag1, family(poisson) link(log) exposure(u5) corr(ar1) vce(robust)
	eststo pmlag_sc_util

xtgee vax_util $covars_lag1, family(poisson) link(log) exposure(u10) corr(ar1) vce(robust)
	eststo pmlag_vax_util
	
xtgee cerv_util $covars_lag1, family(poisson) link(log) exposure(cerv_denom) corr(ar1) vce(robust)
	eststo pmlag_cerv_util

xtgee breast_util $covars_lag1, family(poisson) link(log) exposure(women5069) corr(ar1) vce(robust)
	eststo pmlag_breast_util
	
foreach var of varlist diab_util hyper_util {
	xtgee `var' $covars_lag1, family(poisson) link(log) exposure(all20plus) corr(ar1) vce(robust)
	eststo pmlag_`var'
}

foreach var of varlist fm_cons spec_cons emerg_cons dent_cons hosp_num elect_surg {
	xtgee `var' $covars_lag1, family(poisson) link(log) exposure(total_pop) corr(ar1) vce(robust)
	eststo pmlag_`var'
}

xtgee diab_qual_num $covars_lag2, family(poisson) link(log) exposure(diab_util) corr(exc) vce(robust)
eststo pmlag_diab_qual_num

xtgee hyper_qual_num $covars_lag2, family(poisson) link(log) exposure(hyper_util) corr(exc) vce(robust)
eststo pmlag_hyper_qual_num

esttab pmlag_sc_util pmlag_vax_util using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/STable4B.rtf", eform replace wide b(2) ci(2) nostar compress /// 
 title( "A: Child health services") mtitles ("Sick child visits" "Vaccination") rename(timeafter_cov "Months into pandemic" postPolicy_lag "NHSR Strategy (1 mo. lag)" timeafter_pol_lag "Months into NHSR (1 mo. lag)" ln_beds "Covid inpatients, log" spring "Spring" summer "Summer" fall "Fall")

esttab pmlag_fp_util pmlag_anc_util pmlag_totaldel pmlag_cs_util using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/STable4B.rtf", eform append wide b(2) ci(2) nostar compress /// 
 title( "B: Reproductive and maternal health services") mtitles ("Contraceptive use" "ANC" "Delivery" "C-sections") rename(timeafter_cov "Months into pandemic" postPolicy_lag "NHSR Strategy (1 mo. lag)" timeafter_pol_lag "Months into NHSR (1 mo. lag)" ln_beds "Covid inpatients, log" spring "Spring" summer "Summer" fall "Fall")

esttab pmlag_cerv_util pmlag_breast_util using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/STable4B.rtf", eform append wide b(2) ci(2) nostar compress /// 
 title( "C: Cancer screening services") mtitles ("Cervical cancer" "Breast cancer") rename(timeafter_cov "Months into pandemic" postPolicy_lag "NHSR Strategy (1 mo. lag)" timeafter_pol_lag "Months into NHSR (1 mo. lag)" ln_beds "Covid inpatients, log" spring "Spring" summer "Summer" fall "Fall")

esttab pmlag_diab_util pmlag_hyper_util using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/STable4B.rtf", eform append wide b(2) ci(2) nostar compress /// 
 title( "D: NCD service use") mtitles ("Diabetes visits" "Hypertension visits") rename(timeafter_cov "Months into pandemic" postPolicy_lag "NHSR Strategy (1 mo. lag)" timeafter_pol_lag "Months into NHSR (1 mo. lag)" ln_beds "Covid inpatients, log" spring "Spring" summer "Summer" fall "Fall")

esttab pmlag_diab_qual_num pmlag_hyper_qual_num using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/STable4B.rtf", eform append wide b(2) ci(2) nostar compress /// 
 title( "E: NCD service outcomes") mtitles ("Diabetes control" "Hypertension control") rename(timeafter_cov_lag "Months into pandemic (1 mo. lag)" postPolicy_lag2 "NHSR Strategy (2 mo. lag)" timeafter_pol_lag2 "Months into NHSR (2 mo. lag)" ln_beds_lag "Covid inpatients, log (1 mo. lag)" spring "Spring" summer "Summer" fall "Fall")

esttab pmlag_fm_cons pmlag_spec_cons pmlag_emerg_cons pmlag_dent_cons using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/STable4B.rtf", eform append wide b(2) ci(2) nostar compress /// 
 title( "F: Consultations") mtitles ("Familiar medicine" "Specialty" "Emergency" "Dental") rename(timeafter_cov "Months into pandemic" postPolicy_lag "NHSR Strategy (1 mo. lag)" timeafter_pol_lag "Months into NHSR (1 mo. lag)" ln_beds "Covid inpatients, log" spring "Spring" summer "Summer" fall "Fall")

esttab pmlag_hosp_num pmlag_elect_surg using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/STable4B.rtf", eform append wide b(2) ci(2) nostar compress /// 
 title( "G: Hospitalizations and surgeries") mtitles ("Hospitalizations" "Elective surgeries") rename(timeafter_cov "Months into pandemic" postPolicy_lag "NHSR Strategy (1 mo. lag)" timeafter_pol_lag "Months into NHSR (1 mo. lag)" ln_beds "Covid inpatients, log" spring "Spring" summer "Summer" fall "Fall")
