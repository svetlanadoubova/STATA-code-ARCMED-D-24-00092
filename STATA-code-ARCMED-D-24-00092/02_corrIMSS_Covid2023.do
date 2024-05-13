
* Analysis do file: Recovery of health services at IMSS (2018-2023) - Part 2
* Created by: Catherine Arsenault, Dec 2020
* Modified by: Saúl Eduardo Contreras Sánchez & Svetlana V. Doubova, Nov 2023

*Required programs
ssc install variog 
ssc install qic

*Data and globals
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery18-23ooad.dta", clear

global maternal fp_util anc_util totaldel cs_rate
global child sc_util vax_util
global chronic cerv_util breast_util diab_util hyper_util 
global other fm_cons spec_cons emerg_cons dent_cons hosp_num elect_surg
global serv $maternal $child $chronic $other
global qual diab_qual hyper_qual
global all $serv $qual

global covars postPolicy timeafter_pol timeafter_cov ln_beds spring summer fall 
global covars_lag postPolicy_lag timeafter_pol_lag timeafter_cov_lag ln_beds_lag spring summer fall 

********************************************************************************
* INVESTIGATING CORRELATION STRUCTURES TO CHOOSE WORKING CORR FOR GEE MODELS
********************************************************************************

* Variograms for each of the outcomes
foreach x of global all {
	variog `x'
	graph export "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Final_Results_2023/variog`x'.pdf", replace
}

* Choosing the correlation structure for GEE: Compare AR, exchangeable and unstructured
* The correlation structure that minimises the QIC should be used
* See: https://journals.sagepub.com/doi/pdf/10.1177/1536867X0700700205

matrix input qic_mat = (., ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., \ ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., \ ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., .,) 

cap noisily qic fp_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(ar1) exposure(women1549) robust
	if _rc == 0 {
		matrix qic_mat[1,1] = r(qic)
		}
		
cap noisily qic fp_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(exchangeable) exposure(women1549) robust
	if _rc == 0 {
		matrix qic_mat[2,1] = r(qic)
		}
		
cap noisily qic fp_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(unstructured) exposure(women1549) robust
	if _rc == 0 {
		matrix qic_mat[3,1] = r(qic)
		}

cap noisily qic anc_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(ar1) exposure(women1549) robust
	if _rc == 0 {
		matrix qic_mat[1,2] = r(qic)
		}
		
cap noisily qic anc_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(exchangeable) exposure(women1549) robust
	if _rc == 0 {
		matrix qic_mat[2,2] = r(qic)
		}
		
cap noisily qic anc_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(unstructured) exposure(women1549) robust
	if _rc == 0 {
		matrix qic_mat[3,2] = r(qic)
		}
		
cap noisily qic totaldel $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(ar1) exposure(women1549) robust
	if _rc == 0 {
		matrix qic_mat[1,3] = r(qic)
		}
		
cap noisily qic totaldel $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(exchangeable) exposure(women1549) robust
	if _rc == 0 {
		matrix qic_mat[2,3] = r(qic)
		}
		
cap noisily qic totaldel $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(unstructured) exposure(women1549) robust
	if _rc == 0 {
		matrix qic_mat[3,3] = r(qic)
		}
		
cap noisily qic cs_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(ar1) exposure(totaldel) robust
	if _rc == 0 {
		matrix qic_mat[1,4] = r(qic)
		}

cap noisily qic cs_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(exchangeable) exposure(totaldel) robust
	if _rc == 0 {
		matrix qic_mat[2,4] = r(qic)
		}

cap noisily qic cs_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(unstructured) exposure(totaldel) robust
	if _rc == 0 {
		matrix qic_mat[3,4] = r(qic)
		}

cap noisily qic sc_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(ar1) exposure(u5) robust
	if _rc == 0 {
		matrix qic_mat[1,5] = r(qic)
		}

cap noisily qic sc_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(exchangeable) exposure(u5) robust
	if _rc == 0 {
		matrix qic_mat[2,5] = r(qic)
		}

cap noisily qic sc_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(unstructured) exposure(u5) robust
	if _rc == 0 {
		matrix qic_mat[3,5] = r(qic)
		}	
			
cap noisily qic vax_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(ar1) exposure(u10) robust
	if _rc == 0 {
		matrix qic_mat[1,6] = r(qic)
		}

cap noisily qic vax_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(exchangeable) exposure(u10) robust
	if _rc == 0 {
		matrix qic_mat[2,6] = r(qic)
		}

cap noisily qic vax_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(unstructured) exposure(u10) robust
	if _rc == 0 {
		matrix qic_mat[3,6] = r(qic)
		}	
	
cap noisily qic cerv_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(ar1) exposure(cerv_denom) robust
	if _rc == 0 {
		matrix qic_mat[1,7] = r(qic)
		}

cap noisily qic cerv_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(exchangeable) exposure(cerv_denom) robust
	if _rc == 0 {
		matrix qic_mat[2,7] = r(qic)
		}

cap noisily qic cerv_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(unstructured) exposure(cerv_denom) robust
	if _rc == 0 {
		matrix qic_mat[3,7] = r(qic)
		}	

cap noisily qic breast_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(ar1) exposure(women5069) robust
	if _rc == 0 {
		matrix qic_mat[1,8] = r(qic)
		}

cap noisily qic breast_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(exchangeable) exposure(women5069) robust
	if _rc == 0 {
		matrix qic_mat[2,8] = r(qic)
		}

cap noisily qic breast_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(unstructured) exposure(women5069) robust
	if _rc == 0 {
		matrix qic_mat[3,8] = r(qic)
		}	

cap noisily qic diab_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(ar1) exposure(all20plus) robust
	if _rc == 0 {
		matrix qic_mat[1,9] = r(qic)
		}

cap noisily qic diab_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(exchangeable) exposure(all20plus) robust
	if _rc == 0 {
		matrix qic_mat[2,9] = r(qic)
		}

cap noisily qic diab_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(unstructured) exposure(all20plus) robust
	if _rc == 0 {
		matrix qic_mat[3,9] = r(qic)
		}		

cap noisily qic hyper_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(ar1) exposure(all20plus) robust
	if _rc == 0 {
		matrix qic_mat[1,10] = r(qic)
		}

cap noisily qic hyper_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(exchangeable) exposure(all20plus) robust
	if _rc == 0 {
		matrix qic_mat[2,10] = r(qic)
		}

cap noisily qic hyper_util $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(unstructured) exposure(all20plus) robust
	if _rc == 0 {
		matrix qic_mat[3,10] = r(qic)
		}

cap noisily qic fm_cons $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(ar1) exposure(total_pop) robust
	if _rc == 0 {
		matrix qic_mat[1,11] = r(qic)
		}

cap noisily qic fm_cons $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(exchangeable) exposure(total_pop) robust
	if _rc == 0 {
		matrix qic_mat[2,11] = r(qic)
		}

cap noisily qic fm_cons $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(unstructured) exposure(total_pop) robust
	if _rc == 0 {
		matrix qic_mat[3,11] = r(qic)
		}
		
cap noisily qic spec_cons $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(ar1) exposure(total_pop) robust
	if _rc == 0 {
		matrix qic_mat[1,12] = r(qic)
		}

cap noisily qic spec_cons $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(exchangeable) exposure(total_pop) robust
	if _rc == 0 {
		matrix qic_mat[2,12] = r(qic)
		}

cap noisily qic spec_cons $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(unstructured) exposure(total_pop) robust
	if _rc == 0 {
		matrix qic_mat[3,12] = r(qic)
		}
		
cap noisily qic emerg_cons $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(ar1) exposure(total_pop) robust
	if _rc == 0 {
		matrix qic_mat[1,13] = r(qic)
		}

cap noisily qic emerg_cons $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(exchangeable) exposure(total_pop) robust
	if _rc == 0 {
		matrix qic_mat[2,13] = r(qic)
		}

cap noisily qic emerg_cons $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(unstructured) exposure(total_pop) robust
	if _rc == 0 {
		matrix qic_mat[3,13] = r(qic)
		}
		
cap noisily qic dent_cons $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(ar1) exposure(total_pop) robust
	if _rc == 0 {
		matrix qic_mat[1,14] = r(qic)
		}

cap noisily qic dent_cons $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(exchangeable) exposure(total_pop) robust
	if _rc == 0 {
		matrix qic_mat[2,14] = r(qic)
		}

cap noisily qic dent_cons $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(unstructured) exposure(total_pop) robust
	if _rc == 0 {
		matrix qic_mat[3,14] = r(qic)
		}
		
cap noisily qic hosp_num $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(ar1) exposure(total_pop) robust
	if _rc == 0 {
		matrix qic_mat[1,15] = r(qic)
		}

cap noisily qic hosp_num $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(exchangeable) exposure(total_pop) robust
	if _rc == 0 {
		matrix qic_mat[2,15] = r(qic)
		}

cap noisily qic hosp_num $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(unstructured) exposure(total_pop) robust
	if _rc == 0 {
		matrix qic_mat[3,15] = r(qic)
		}
		
cap noisily qic elect_surg $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(ar1) exposure(total_pop) robust
	if _rc == 0 {
		matrix qic_mat[1,16] = r(qic)
		}

cap noisily qic elect_surg $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(exchangeable) exposure(total_pop) robust
	if _rc == 0 {
		matrix qic_mat[2,16] = r(qic)
		}

cap noisily qic elect_surg $covars, i(ooad1) t(rmonth) family(poisson) link(log) corr(unstructured) exposure(total_pop) robust
	if _rc == 0 {
		matrix qic_mat[3,16] = r(qic)
		}

cap noisily qic diab_qual_num $covars_lag, i(ooad1) t(rmonth) family(poisson) link(log) corr(ar1) exposure(diab_util) robust
	if _rc == 0 {
		matrix qic_mat[1,17] = r(qic)
		}

cap noisily qic diab_qual_num $covars_lag, i(ooad1) t(rmonth) family(poisson) link(log) corr(exchangeable) exposure(diab_util) robust
	if _rc == 0 {
		matrix qic_mat[2,17] = r(qic)
		}

cap noisily qic diab_qual_num $covars_lag, i(ooad1) t(rmonth) family(poisson) link(log) corr(unstructured) exposure(diab_util) robust
	if _rc == 0 {
		matrix qic_mat[3,17] = r(qic)
		}	

cap noisily qic hyper_qual_num $covars_lag, i(ooad1) t(rmonth) family(poisson) link(log) corr(ar1) exposure(hyper_util) robust
	if _rc == 0 {
		matrix qic_mat[1,18] = r(qic)
		}

cap noisily qic hyper_qual_num $covars_lag, i(ooad1) t(rmonth) family(poisson) link(log) corr(exchangeable) exposure(hyper_util) robust
	if _rc == 0 {
		matrix qic_mat[2,18] = r(qic)
		}

cap noisily qic hyper_qual_num $covars_lag, i(ooad1) t(rmonth) family(poisson) link(log) corr(unstructured) exposure(hyper_util) robust
	if _rc == 0 {
		matrix qic_mat[3,18] = r(qic)
		}	

matrix colnames qic_mat = fp_util anc_util totaldel cs_util sc_util vax_util cerv_util breast_util diab_util hyper_util fm_cons spec_cons emerg_cons dent_cons hosp_num elect_surg diab_qual_num hyper_qual_num
matrix rownames qic_mat = AR1 Exc Uns
matrix list qic_mat

*Updated with data from Covid to Jun 2023, ln_beds:
*With Poisson model
*AR for fp_util anc_util totaldel sc_util vax_util cerv_util breast_util diab_util hyper_util fm_cons spec_cons emerg_cons dent_cons hosp_num elect_surg
*Exc for cs_util diab_qual hyper_qual


*Vaccines
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery18-23ooad.dta", clear

global vax bcg_qual penthex_qual mmr_qual pneum_qual rota_qual 
global vax10  penthex_qual mmr_qual pneum_qual rota_qual 

matrix input qic_mat_v = (., ., ., ., .,  \ ., ., ., ., .,  \ ., ., ., ., ., ) 

local i = 1
foreach var of varlist bcg_qual {
	cap noisily qic `var' $covars, i(ooad1) t(rmonth) family (poisson) link(log) exposure(u1) corr(ar1) robust
	if _rc == 0 {
		matrix qic_mat_v[1,`i'] = r(qic)
		}
	cap noisily qic `var' $covars, i(ooad1) t(rmonth) family (poisson) link(log) exposure(u1) corr(exchangeable) robust
	if _rc == 0 {
		matrix qic_mat_v[2,`i'] = r(qic)
		}
	cap noisily qic `var' $covars, i(ooad1) t(rmonth) family (poisson) link(log) exposure(u1) corr(unstructured) robust
	if _rc == 0 {
		matrix qic_mat_v[3,`i'] = r(qic)
		}
	local i = `i' + 1
}

local i = 2
foreach var of varlist $vax10 {
	cap noisily qic `var' $covars, i(ooad1) t(rmonth) family (poisson) link(log) exposure(u10) corr(ar1) robust
	if _rc == 0 {
		matrix qic_mat_v[1,`i'] = r(qic)
		}
	cap noisily qic `var' $covars, i(ooad1) t(rmonth) family (poisson) link(log) exposure(u10) corr(exchangeable) robust
	if _rc == 0 {
		matrix qic_mat_v[2,`i'] = r(qic)
		}
	cap noisily qic `var' $covars, i(ooad1) t(rmonth) family (poisson) link(log) exposure(u10) corr(unstructured) robust
	if _rc == 0 {
		matrix qic_mat_v[3,`i'] = r(qic)
		}
	local i = `i' + 1
}

matrix colnames qic_mat_v = $vax
matrix rownames qic_mat_v = AR1 Exc Uns
matrix list qic_mat_v

*Updated with data from Covid to Jun 2023, ln_beds:
*With Poisson model
*AR: BCG, penthex, measles, pneum, rota


*Linear models, main outcomes
matrix input qic_mat_lin = (., ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., \ ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., \ ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., ., .,) 

local i = 1
foreach var of varlist $serv {
	cap noisily qic `var' $covars, i(ooad1) t(rmonth) family (gaussian) link(identity) corr(ar1) robust
	if _rc == 0 {
		matrix qic_mat_lin[1,`i'] = r(qic)
		}
	cap noisily qic `var' $covars, i(ooad1) t(rmonth) family (gaussian) link(identity) corr(exchangeable) robust
	if _rc == 0 {
		matrix qic_mat_lin[2,`i'] = r(qic)
		}
	cap noisily qic `var' $covars, i(ooad1) t(rmonth) family (gaussian) link(identity) corr(unstructured) robust
	if _rc == 0 {
		matrix qic_mat_lin[3,`i'] = r(qic)
		}
	local i = `i' + 1
}

local i = 17
foreach var of varlist $qual {
	cap noisily qic `var' $covars_lag, i(ooad1) t(rmonth) family (gaussian) link(identity) corr(ar1) robust
	if _rc == 0 {
		matrix qic_mat_lin[1,`i'] = r(qic)
		}
	cap noisily qic `var' $covars_lag, i(ooad1) t(rmonth) family (gaussian) link(identity) corr(exchangeable) robust
	if _rc == 0 {
		matrix qic_mat_lin[2,`i'] = r(qic)
		}
	cap noisily qic `var' $covars_lag, i(ooad1) t(rmonth) family (gaussian) link(identity) corr(unstructured) robust
	if _rc == 0 {
		matrix qic_mat_lin[3,`i'] = r(qic)
		}
	local i = `i' + 1
}

matrix colnames qic_mat_lin = $serv $qual
matrix rownames qic_mat_lin = AR1 Exc Uns
matrix list qic_mat_lin

*Updated with data from Covid to Jun 2023, ln_beds:
*AR for fp_util cs_rate sc_util emerg_cons dent_cons 
*Exc for anc_util totaldel vax_util cerv_util breast_util diab_util hyper_util fm_cons spec_cons hosp_num elect_surg diab_qual hyper_qual

