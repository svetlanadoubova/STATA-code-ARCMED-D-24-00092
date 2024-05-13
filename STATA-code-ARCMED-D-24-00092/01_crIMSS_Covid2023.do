
* Analysis do file: Recovery of health services at IMSS (2018-2023) - Part 1
* Created by: Saúl Eduardo Contreras Sánchez & Svetlana V. Doubova, Nov 2023

*Required programs
ssc install carryforward

********************************************************************************
*Raw data for indicator 1 through July 2023 (without data for 2015)
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 1.xlsx", sheet("2016") clear
drop in 1
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year fp_util1 fp_util2 fp_util3 fp_util4 fp_util5 fp_util6 fp_util7 fp_util8 fp_util9 fp_util10 fp_util11 fp_util12)
replace ooad = "National" if ooad == "Nacional"
reshape long fp_util, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1_2016.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 1.xlsx", sheet("2017") clear
drop in 1
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year fp_util1 fp_util2 fp_util3 fp_util4 fp_util5 fp_util6 fp_util7 fp_util8 fp_util9 fp_util10 fp_util11 fp_util12)
replace ooad = "National" if ooad == "Nacional"
reshape long fp_util, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1_2017.dta", replace

* Adding data for 2017
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1_2017.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1_2016.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 1.xlsx", sheet("2018") clear
drop in 1
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year fp_util1 fp_util2 fp_util3 fp_util4 fp_util5 fp_util6 fp_util7 fp_util8 fp_util9 fp_util10 fp_util11 fp_util12)
replace ooad = "National" if ooad == "Nacional"
reshape long fp_util, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1_2018.dta", replace

* Adding data for 2018
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1_2018.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 1.xlsx", sheet("2019") clear
drop in 1
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year fp_util1 fp_util2 fp_util3 fp_util4 fp_util5 fp_util6 fp_util7 fp_util8 fp_util9 fp_util10 fp_util11 fp_util12)
replace ooad = "National" if ooad == "Nacional"
reshape long fp_util, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1_2019.dta", replace

* Adding data for 2019
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1_2019.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 1.xlsx", sheet("2020") clear
drop in 1
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year fp_util1 fp_util2 fp_util3 fp_util4 fp_util5 fp_util6 fp_util7 fp_util8 fp_util9 fp_util10 fp_util11 fp_util12)
replace ooad = "National" if ooad == "Nacional"
reshape long fp_util, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1_2020.dta", replace

* Adding data for 2020
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1_2020.dta"
sort year ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 1.xlsx", sheet("2021") clear
drop in 1
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year fp_util1 fp_util2 fp_util3 fp_util4 fp_util5 fp_util6 fp_util7 fp_util8 fp_util9 fp_util10 fp_util11 fp_util12)
replace ooad = "National" if ooad == "Nacional"
reshape long fp_util, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1_2021.dta", replace

* Adding data for 2021
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1_2021.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 1.xlsx", sheet("2022") clear
drop in 1
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year fp_util1 fp_util2 fp_util3 fp_util4 fp_util5 fp_util6 fp_util7 fp_util8 fp_util9 fp_util10 fp_util11 fp_util12)
replace ooad = "National" if ooad == "Nacional"
reshape long fp_util, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1_2022.dta", replace

* Adding data for 2022
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1_2022.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 1.xlsx", sheet("2023") clear
drop in 1
keep in 1/36
destring B - I, replace
keep A - I
rename * (ooad year fp_util1 fp_util2 fp_util3 fp_util4 fp_util5 fp_util6 fp_util7)
replace ooad = "National" if ooad == "Nacional"
reshape long fp_util, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1_2023.dta", replace

* Adding data for 2023
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1_2023.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1.dta", replace

********************************************************************************
*Raw data for indicator 2 through June 2023
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 2.xlsx", sheet("2015") clear
drop in 1
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year anc_util1 anc_util2 anc_util3 anc_util4 anc_util5 anc_util6 anc_util7 anc_util8 anc_util9 anc_util10 anc_util11 anc_util12)
replace ooad = "National" if ooad == "Nacional"
reshape long anc_util, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2_2015.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 2.xlsx", sheet("2016") clear
drop in 1
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year anc_util1 anc_util2 anc_util3 anc_util4 anc_util5 anc_util6 anc_util7 anc_util8 anc_util9 anc_util10 anc_util11 anc_util12)
replace ooad = "National" if ooad == "Nacional"
reshape long anc_util, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2_2016.dta", replace

* Adding data for 2016
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2_2016.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2_2015.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 2.xlsx", sheet("2017") clear
drop in 1
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year anc_util1 anc_util2 anc_util3 anc_util4 anc_util5 anc_util6 anc_util7 anc_util8 anc_util9 anc_util10 anc_util11 anc_util12)
replace ooad = "National" if ooad == "Nacional"
reshape long anc_util, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2_2017.dta", replace

* Adding data for 2017
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2_2017.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 2.xlsx", sheet("2018") clear
drop in 1
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year anc_util1 anc_util2 anc_util3 anc_util4 anc_util5 anc_util6 anc_util7 anc_util8 anc_util9 anc_util10 anc_util11 anc_util12)
replace ooad = "National" if ooad == "Nacional"
reshape long anc_util, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2_2018.dta", replace

* Adding data for 2018
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2_2018.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 2.xlsx", sheet("2019") clear
drop in 1
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year anc_util1 anc_util2 anc_util3 anc_util4 anc_util5 anc_util6 anc_util7 anc_util8 anc_util9 anc_util10 anc_util11 anc_util12)
replace ooad = "National" if ooad == "Nacional"
reshape long anc_util, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2_2019.dta", replace

* Adding data for 2019
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2_2019.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 2.xlsx", sheet("2020") clear
drop in 1
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year anc_util1 anc_util2 anc_util3 anc_util4 anc_util5 anc_util6 anc_util7 anc_util8 anc_util9 anc_util10 anc_util11 anc_util12)
replace ooad = "National" if ooad == "Nacional"
reshape long anc_util, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2_2020.dta", replace

* Adding data for 2020
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2_2020.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 2.xlsx", sheet("2021") clear
drop in 1
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year anc_util1 anc_util2 anc_util3 anc_util4 anc_util5 anc_util6 anc_util7 anc_util8 anc_util9 anc_util10 anc_util11 anc_util12)
replace ooad = "National" if ooad == "Nacional"
reshape long anc_util, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2_2021.dta", replace

* Adding data for 2021
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2_2021.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 2.xlsx", sheet("2022") clear
drop in 1
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year anc_util1 anc_util2 anc_util3 anc_util4 anc_util5 anc_util6 anc_util7 anc_util8 anc_util9 anc_util10 anc_util11 anc_util12)
replace ooad = "National" if ooad == "Nacional"
reshape long anc_util, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2_2022.dta", replace

* Adding data for 2022
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2_2022.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 2.xlsx", sheet("2023") clear
drop in 1
keep in 1/36
destring B - H, replace
keep A - H
rename * (ooad year anc_util1 anc_util2 anc_util3 anc_util4 anc_util5 anc_util6)
replace ooad = "National" if ooad == "Nacional"
reshape long anc_util, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2_2023.dta", replace

* Adding data for 2023
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2_2023.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2.dta", replace

* Merging data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator1.dta", clear
merge 1:1 ooad year month using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator2.dta"
drop _merge
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", replace

********************************************************************************
*Raw data for indicators 3 & 4 through July 2023
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Base Recuperación.xlsx", sheet("Partos césareas") clear
drop in 1
keep in 1/3708
destring A, replace
destring D - E, replace
keep A - E
rename * (year month ooad totaldel cs_util)
order ooad, before(year)
replace ooad = "National" if ooad == "NACIONAL"
replace month = "1" if month == "ENERO"
replace month = "2" if month == "FEBRERO"
replace month = "3" if month == "MARZO"
replace month = "4" if month == "ABRIL"
replace month = "5" if month == "MAYO"
replace month = "6" if month == "JUNIO"
replace month = "7" if month == "JULIO"
replace month = "8" if month == "AGOSTO"
replace month = "9" if month == "SEPTIEMBRE"
replace month = "10" if month == "OCTUBRE "
replace month = "11" if month == "NOVIEMBRE"
replace month = "12" if month == "DICIEMBRE"
destring month, replace
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicators3&4.dta", replace

* Merging data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", clear
merge 1:1 ooad year month using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicators3&4.dta"
drop _merge
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", replace

********************************************************************************
*Raw data for indicators 5 - 7 through July 2023
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Base Recuperación.xlsx", sheet("Cons <5 años MF") clear
drop in 1/4
keep in 1/3900
drop if B == "Total"
destring B - C, replace
destring E - G, replace
keep B - G
rename * (year month ooad1 malnu_util diarr_util pneum_util)
order malnu_util, after(pneum_util)
gen ooad = substr(ooad1, 4,.)
drop ooad1
order ooad, before(year)
replace ooad = "México Oriente" if ooad == "México Ote."
replace ooad = "México Poniente" if ooad == "México Pte."
replace ooad = "Veracruz Norte" if ooad == "Veracruz Nte"
replace ooad = "CDMX Norte" if ooad == "CDMX Nte"
replace ooad = "CDMX Norte" if ooad == "CDMX Nte."
replace pneum_util = 0 if pneum_util==.
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicators5-7.dta", replace

* Adding CDMX data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicators5-7.dta", clear
collapse(sum) malnu_util diarr_util pneum_util, by(year month ooad)
keep if ooad=="CDMX Norte" | ooad=="CDMX Sur"
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicators5-7CDMX.dta", replace

use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicators5-7.dta", clear
drop if ooad=="CDMX Norte" | ooad=="CDMX Sur"
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicators5-7CDMX.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicators5-7.dta", replace

* Adding national data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicators5-7.dta", clear
collapse(sum) malnu_util diarr_util pneum_util, by(year month)
gen ooad = "National"
order ooad, before(year)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicators5-7national.dta", replace

use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicators5-7.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicators5-7national.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicators5-7.dta", replace

* Merging data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", clear
merge 1:1 ooad year month using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicators5-7.dta"
drop _merge
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", replace

********************************************************************************
*Raw data for indicators 8 & 9 through July 2023
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Base Recuperación.xlsx", sheet("Indicador 8 y 9") clear
drop in 1
keep in 1/3708
destring B, replace
destring D - E, replace
keep A - E
rename * (ooad year month diab_util	hyper_util)
replace ooad = "National" if ooad == "Total"
replace month = "1" if month == "ENERO"
replace month = "2" if month == "FEBRERO"
replace month = "3" if month == "MARZO"
replace month = "4" if month == "ABRIL"
replace month = "5" if month == "MAYO"
replace month = "6" if month == "JUNIO"
replace month = "7" if month == "JULIO"
replace month = "8" if month == "AGOSTO"
replace month = "9" if month == "SEPTIEMBRE"
replace month = "10" if month == "OCTUBRE"
replace month = "11" if month == "NOVIEMBRE"
replace month = "12" if month == "DICIEMBRE"
replace ooad = "CDMX Norte" if ooad == "DF Norte"
replace ooad = "CDMX Sur" if ooad == "DF Sur"
destring month, replace
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicators8&9.dta", replace

* Merging data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", clear
merge 1:1 ooad year month using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicators8&9.dta"
drop _merge
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", replace

********************************************************************************
*Raw data for indicators 10 - 13 through July 2023
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Base Recuperación.xlsx", sheet("Indicadores") clear
drop in 1
keep in 1/3708
destring C, replace
destring E - J, replace
keep B - G I
rename * (ooad year month diab_qual_num	hyper_qual_num cerv_util breast_util)
replace ooad = "National" if ooad == "Total"
replace month = "1" if month == "ENERO"
replace month = "2" if month == "FEBRERO"
replace month = "3" if month == "MARZO"
replace month = "4" if month == "ABRIL"
replace month = "5" if month == "MAYO"
replace month = "6" if month == "JUNIO"
replace month = "7" if month == "JULIO"
replace month = "8" if month == "AGOSTO"
replace month = "9" if month == "SEPTIEMBRE"
replace month = "10" if month == "OCTUBRE"
replace month = "11" if month == "NOVIEMBRE"
replace month = "12" if month == "DICIEMBRE"
replace ooad = "CDMX Norte" if ooad == "DF Norte"
replace ooad = "CDMX Sur" if ooad == "DF Sur"
destring month, replace
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicators10-13.dta", replace

* Merging data 
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", clear
merge 1:1 ooad year month using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicators10-13.dta"
drop _merge
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", replace

********************************************************************************
*Raw data for consultations through July 2023
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Base Recuperación.xlsx", sheet("Consultas") clear
drop in 1/3
keep in 1/3708
drop if B == "Total"
destring B - C, replace
destring E - H, replace
keep B - H
rename * (year month ooad1 fm_cons spec_cons emerg_cons dent_cons)
gen ooad = substr(ooad1, 4,.)
replace ooad = ooad1 if year == 2022
drop ooad1
order ooad, before(year)
replace ooad = "México Oriente" if ooad == "México Ote."
replace ooad = "México Oriente" if ooad == "México Ote"
replace ooad = "México Poniente" if ooad == "México Pte."
replace ooad = "México Poniente" if ooad == "México Pte"
replace ooad = "Veracruz Norte" if ooad == "Veracruz Nte"
replace ooad = "CDMX Norte" if ooad == "CDMX Nte."
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_consultations.dta", replace

* Adding national data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_consultations.dta", clear
collapse(sum) fm_cons spec_cons emerg_cons dent_cons, by(year month)
gen ooad = "National"
order ooad, before(year)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_cons_national.dta", replace

use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_consultations.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_cons_national.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_consultations.dta", replace

* Merging data 
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", clear
merge 1:1 ooad year month using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_consultations.dta"
drop _merge
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", replace

********************************************************************************
*Raw data for hospitalizations (census beds) through July 2023
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Base Recuperación.xlsx", sheet("Egresos") clear
drop in 1/4
keep in 1/3717
drop if B == "Total"
drop if B == "Total 2016"
drop if B == "Total 2017"
drop if B == "Total 2018"
drop if B == "Total 2019"
drop if B == "Total 2020"
drop if B == "Total 2021"
drop if B == "Total 2022"
drop if B == "Total 2023"
destring B - C, replace
destring E, replace
keep B - E
rename * (year month ooad1 hosp_num)
gen ooad = substr(ooad1, 4,.)
drop ooad1
order ooad, before(year)
replace ooad = "México Oriente" if ooad == "México Ote."
replace ooad = "México Poniente" if ooad == "México Pte."
replace ooad = "Veracruz Norte" if ooad == "Veracruz Nte"
replace ooad = "CDMX Norte" if ooad == "CDMX Nte."
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_hospitalizations.dta", replace

* Adding national data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_hospitalizations.dta", clear
collapse(sum) hosp_num, by(year month)
gen ooad = "National"
order ooad, before(year)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_hosp_national.dta", replace

use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_hospitalizations.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_hosp_national.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_hospitalizations.dta", replace

* Merging data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", clear
merge 1:1 ooad year month using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_hospitalizations.dta"
drop _merge
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", replace

********************************************************************************
*Raw data for surgeries through July 2023 (without data for 2015-2018)
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Base Recuperación.xlsx", sheet("Int. Qx") clear
drop in 1/3
keep in 1/1984
drop if B == "Total"
drop if B == "Total "
drop if B == "Total 2020"
drop if B == "Total 2021"
drop if B == "Total 2022"
destring B - C, replace
destring E - G, replace
keep B - E
rename * (year month ooad elect_surg)
order ooad, before(year)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_surgeries.dta", replace

* Adding national data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_surgeries.dta", clear
collapse(sum) elect_surg, by(year month)
gen ooad = "National"
order ooad, before(year)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_surg_national.dta", replace

use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_surgeries.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_surg_national.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_surgeries.dta", replace

* Merging data 
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", clear
merge 1:1 ooad year month using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_surgeries.dta"
drop _merge
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", replace

********************************************************************************
*Raw data for indicator 14 through June 2023
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 14.xlsx", sheet("2015") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year bcg_qual1 bcg_qual2 bcg_qual3 bcg_qual4 bcg_qual5 bcg_qual6 bcg_qual7 bcg_qual8 bcg_qual9 bcg_qual10 bcg_qual11 bcg_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long bcg_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14_2015.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 14.xlsx", sheet("2016") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year bcg_qual1 bcg_qual2 bcg_qual3 bcg_qual4 bcg_qual5 bcg_qual6 bcg_qual7 bcg_qual8 bcg_qual9 bcg_qual10 bcg_qual11 bcg_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long bcg_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14_2016.dta", replace

* Adding data for 2016
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14_2016.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14_2015.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 14.xlsx", sheet("2017") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year bcg_qual1 bcg_qual2 bcg_qual3 bcg_qual4 bcg_qual5 bcg_qual6 bcg_qual7 bcg_qual8 bcg_qual9 bcg_qual10 bcg_qual11 bcg_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long bcg_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14_2017.dta", replace

* Adding data for 2017
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14_2017.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 14.xlsx", sheet("2018") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year bcg_qual1 bcg_qual2 bcg_qual3 bcg_qual4 bcg_qual5 bcg_qual6 bcg_qual7 bcg_qual8 bcg_qual9 bcg_qual10 bcg_qual11 bcg_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long bcg_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14_2018.dta", replace

* Adding data for 2018
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14_2018.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 14.xlsx", sheet("2019") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year bcg_qual1 bcg_qual2 bcg_qual3 bcg_qual4 bcg_qual5 bcg_qual6 bcg_qual7 bcg_qual8 bcg_qual9 bcg_qual10 bcg_qual11 bcg_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long bcg_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14_2019.dta", replace

* Adding data for 2019
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14_2019.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 14.xlsx", sheet("2020") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year bcg_qual1 bcg_qual2 bcg_qual3 bcg_qual4 bcg_qual5 bcg_qual6 bcg_qual7 bcg_qual8 bcg_qual9 bcg_qual10 bcg_qual11 bcg_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long bcg_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14_2020.dta", replace

* Adding data for 2020
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14_2020.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 14.xlsx", sheet("2021") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year bcg_qual1 bcg_qual2 bcg_qual3 bcg_qual4 bcg_qual5 bcg_qual6 bcg_qual7 bcg_qual8 bcg_qual9 bcg_qual10 bcg_qual11 bcg_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long bcg_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14_2021.dta", replace

* Adding data for 2021
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14_2021.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 14.xlsx", sheet("2022") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year bcg_qual1 bcg_qual2 bcg_qual3 bcg_qual4 bcg_qual5 bcg_qual6 bcg_qual7 bcg_qual8 bcg_qual9 bcg_qual10 bcg_qual11 bcg_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long bcg_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14_2022.dta", replace

* Adding data for 2022
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14_2022.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 14.xlsx", sheet("2023") clear
drop in 1/2
keep in 1/36
destring B - H, replace
keep A - H
rename * (ooad year bcg_qual1 bcg_qual2 bcg_qual3 bcg_qual4 bcg_qual5 bcg_qual6)
replace ooad = "National" if ooad == "Nacional"
reshape long bcg_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14_2023.dta", replace

* Adding data for 2023
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14_2023.dta"
sort year month ooad
replace bcg_qual = 0 if bcg_qual==.
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14.dta", replace

* Merging data 
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", clear
merge 1:1 ooad year month using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator14.dta"
drop _merge
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", replace

********************************************************************************
*Raw data for indicator 15 through June 2023 (Pentavalent 2015-2020 & Hexavalent 2020-2023)
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 15.xlsx", sheet("2015") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year pent_qual1 pent_qual2 pent_qual3 pent_qual4 pent_qual5 pent_qual6 pent_qual7 pent_qual8 pent_qual9 pent_qual10 pent_qual11 pent_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long pent_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15_2015.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 15.xlsx", sheet("2016") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year pent_qual1 pent_qual2 pent_qual3 pent_qual4 pent_qual5 pent_qual6 pent_qual7 pent_qual8 pent_qual9 pent_qual10 pent_qual11 pent_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long pent_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15_2016.dta", replace

* Adding data for 2016 (Pentavalent)
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15_2016.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15_2015.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 15.xlsx", sheet("2017") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year pent_qual1 pent_qual2 pent_qual3 pent_qual4 pent_qual5 pent_qual6 pent_qual7 pent_qual8 pent_qual9 pent_qual10 pent_qual11 pent_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long pent_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15_2017.dta", replace

* Adding data for 2017 (Pentavalent)
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15_2017.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 15.xlsx", sheet("2018") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year pent_qual1 pent_qual2 pent_qual3 pent_qual4 pent_qual5 pent_qual6 pent_qual7 pent_qual8 pent_qual9 pent_qual10 pent_qual11 pent_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long pent_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15_2018.dta", replace

* Adding data for 2018 (Pentavalent)
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15_2018.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 15.xlsx", sheet("2019") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year pent_qual1 pent_qual2 pent_qual3 pent_qual4 pent_qual5 pent_qual6 pent_qual7 pent_qual8 pent_qual9 pent_qual10 pent_qual11 pent_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long pent_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15_2019.dta", replace

* Adding data for 2019 (Pentavalent)
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15_2019.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 15.xlsx", sheet("2020") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year pent_qual1 pent_qual2 pent_qual3 pent_qual4 pent_qual5 pent_qual6 pent_qual7 pent_qual8 pent_qual9 pent_qual10 pent_qual11 pent_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long pent_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15_2020.dta", replace

* Adding data for 2020 (Pentavalent)
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15_2020.dta"
sort year month ooad
replace pent_qual = 0 if pent_qual==.
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15.dta", replace

* Merging data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", clear
merge 1:1 ooad year month using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15.dta"
drop _merge
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 15.xlsx", sheet("2020 (2)") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year hex_qual1 hex_qual2 hex_qual3 hex_qual4 hex_qual5 hex_qual6 hex_qual7 hex_qual8 hex_qual9 hex_qual10 hex_qual11 hex_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long hex_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15bis_2020.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 15.xlsx", sheet("2021") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year hex_qual1 hex_qual2 hex_qual3 hex_qual4 hex_qual5 hex_qual6 hex_qual7 hex_qual8 hex_qual9 hex_qual10 hex_qual11 hex_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long hex_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15bis_2021.dta", replace

* Adding data for 2021 (Hexavalent)
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15bis_2021.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15bis_2020.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15bis.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 15.xlsx", sheet("2022") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year hex_qual1 hex_qual2 hex_qual3 hex_qual4 hex_qual5 hex_qual6 hex_qual7 hex_qual8 hex_qual9 hex_qual10 hex_qual11 hex_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long hex_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15bis_2022.dta", replace

* Adding data for 2022 (Hexavalent)
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15bis.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15bis_2022.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15bis.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 15.xlsx", sheet("2023") clear
drop in 1/2
keep in 1/36
destring B - H, replace
keep A - H
rename * (ooad year hex_qual1 hex_qual2 hex_qual3 hex_qual4 hex_qual5 hex_qual6)
replace ooad = "National" if ooad == "Nacional"
reshape long hex_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15bis_2023.dta", replace

* Adding data for 2023 (Hexavalent)
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15bis.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15bis_2023.dta"
sort year month ooad
replace hex_qual = 0 if hex_qual==.
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15bis.dta", replace

* Merging data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", clear
merge 1:1 ooad year month using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator15bis.dta"
drop _merge
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", replace

********************************************************************************
*Raw data for indicator 16 through June 2023
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 16.xlsx", sheet("2015") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year mmr_qual1 mmr_qual2 mmr_qual3 mmr_qual4 mmr_qual5 mmr_qual6 mmr_qual7 mmr_qual8 mmr_qual9 mmr_qual10 mmr_qual11 mmr_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long mmr_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16_2015.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 16.xlsx", sheet("2016") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year mmr_qual1 mmr_qual2 mmr_qual3 mmr_qual4 mmr_qual5 mmr_qual6 mmr_qual7 mmr_qual8 mmr_qual9 mmr_qual10 mmr_qual11 mmr_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long mmr_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16_2016.dta", replace

* Adding data for 2016
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16_2016.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16_2015.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 16.xlsx", sheet("2017") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year mmr_qual1 mmr_qual2 mmr_qual3 mmr_qual4 mmr_qual5 mmr_qual6 mmr_qual7 mmr_qual8 mmr_qual9 mmr_qual10 mmr_qual11 mmr_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long mmr_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16_2017.dta", replace

* Adding data for 2017
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16_2017.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 16.xlsx", sheet("2018") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year mmr_qual1 mmr_qual2 mmr_qual3 mmr_qual4 mmr_qual5 mmr_qual6 mmr_qual7 mmr_qual8 mmr_qual9 mmr_qual10 mmr_qual11 mmr_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long mmr_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16_2018.dta", replace

* Adding data for 2018
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16_2018.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 16.xlsx", sheet("2019") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year mmr_qual1 mmr_qual2 mmr_qual3 mmr_qual4 mmr_qual5 mmr_qual6 mmr_qual7 mmr_qual8 mmr_qual9 mmr_qual10 mmr_qual11 mmr_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long mmr_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16_2019.dta", replace

* Adding data for 2019
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16_2019.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 16.xlsx", sheet("2020") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year mmr_qual1 mmr_qual2 mmr_qual3 mmr_qual4 mmr_qual5 mmr_qual6 mmr_qual7 mmr_qual8 mmr_qual9 mmr_qual10 mmr_qual11 mmr_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long mmr_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16_2020.dta", replace

* Adding data for 2020
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16_2020.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 16.xlsx", sheet("2021") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year mmr_qual1 mmr_qual2 mmr_qual3 mmr_qual4 mmr_qual5 mmr_qual6 mmr_qual7 mmr_qual8 mmr_qual9 mmr_qual10 mmr_qual11 mmr_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long mmr_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16_2021.dta", replace

* Adding data for 2021
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16_2021.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 16.xlsx", sheet("2022") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year mmr_qual1 mmr_qual2 mmr_qual3 mmr_qual4 mmr_qual5 mmr_qual6 mmr_qual7 mmr_qual8 mmr_qual9 mmr_qual10 mmr_qual11 mmr_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long mmr_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16_2022.dta", replace

* Adding data for 2022
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16_2022.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 16.xlsx", sheet("2023") clear
drop in 1/2
keep in 1/36
destring B - H, replace
keep A - H
rename * (ooad year mmr_qual1 mmr_qual2 mmr_qual3 mmr_qual4 mmr_qual5 mmr_qual6)
replace ooad = "National" if ooad == "Nacional"
reshape long mmr_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16_2023.dta", replace

* Adding data for 2023
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16_2023.dta"
sort year month ooad
replace mmr_qual = 0 if mmr_qual==.
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16.dta", replace

* Merging data 
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", clear
merge 1:1 ooad year month using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator16.dta"
drop _merge
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", replace

********************************************************************************
*Raw data for indicator 17 through June 2023
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 17.xlsx", sheet("2015") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year pneum_qual1 pneum_qual2 pneum_qual3 pneum_qual4 pneum_qual5 pneum_qual6 pneum_qual7 pneum_qual8 pneum_qual9 pneum_qual10 pneum_qual11 pneum_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long pneum_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17_2015.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 17.xlsx", sheet("2016") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year pneum_qual1 pneum_qual2 pneum_qual3 pneum_qual4 pneum_qual5 pneum_qual6 pneum_qual7 pneum_qual8 pneum_qual9 pneum_qual10 pneum_qual11 pneum_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long pneum_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17_2016.dta", replace

* Adding data for 2016
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17_2016.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17_2015.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 17.xlsx", sheet("2017") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year pneum_qual1 pneum_qual2 pneum_qual3 pneum_qual4 pneum_qual5 pneum_qual6 pneum_qual7 pneum_qual8 pneum_qual9 pneum_qual10 pneum_qual11 pneum_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long pneum_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17_2017.dta", replace

* Adding data for 2017
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17_2017.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 17.xlsx", sheet("2018") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year pneum_qual1 pneum_qual2 pneum_qual3 pneum_qual4 pneum_qual5 pneum_qual6 pneum_qual7 pneum_qual8 pneum_qual9 pneum_qual10 pneum_qual11 pneum_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long pneum_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17_2018.dta", replace

* Adding data for 2018
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17_2018.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 17.xlsx", sheet("2019") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year pneum_qual1 pneum_qual2 pneum_qual3 pneum_qual4 pneum_qual5 pneum_qual6 pneum_qual7 pneum_qual8 pneum_qual9 pneum_qual10 pneum_qual11 pneum_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long pneum_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17_2019.dta", replace

* Adding data for 2019
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17_2019.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 17.xlsx", sheet("2020") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year pneum_qual1 pneum_qual2 pneum_qual3 pneum_qual4 pneum_qual5 pneum_qual6 pneum_qual7 pneum_qual8 pneum_qual9 pneum_qual10 pneum_qual11 pneum_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long pneum_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17_2020.dta", replace

* Adding data for 2020
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17_2020.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 17.xlsx", sheet("2021") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year pneum_qual1 pneum_qual2 pneum_qual3 pneum_qual4 pneum_qual5 pneum_qual6 pneum_qual7 pneum_qual8 pneum_qual9 pneum_qual10 pneum_qual11 pneum_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long pneum_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17_2021.dta", replace

* Adding data for 2021
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17_2021.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 17.xlsx", sheet("2022") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year pneum_qual1 pneum_qual2 pneum_qual3 pneum_qual4 pneum_qual5 pneum_qual6 pneum_qual7 pneum_qual8 pneum_qual9 pneum_qual10 pneum_qual11 pneum_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long pneum_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17_2022.dta", replace

* Adding data for 2022
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17_2022.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 17.xlsx", sheet("2023") clear
drop in 1/2
keep in 1/36
destring B - H, replace
keep A - H
rename * (ooad year pneum_qual1 pneum_qual2 pneum_qual3 pneum_qual4 pneum_qual5 pneum_qual6)
replace ooad = "National" if ooad == "Nacional"
reshape long pneum_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17_2023.dta", replace

* Adding data for 2023
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17_2023.dta"
sort year month ooad
replace pneum_qual = 0 if pneum_qual==.
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17.dta", replace

* Merging data 
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", clear
merge 1:1 ooad year month using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator17.dta"
drop _merge
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", replace

********************************************************************************
*Raw data for indicator 18 through June 2023 (Rotavirus Pentavalent 2015-2022 & Monovalent 2021-2023)
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 18.xlsx", sheet("2015") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year rotap_qual1 rotap_qual2 rotap_qual3 rotap_qual4 rotap_qual5 rotap_qual6 rotap_qual7 rotap_qual8 rotap_qual9 rotap_qual10 rotap_qual11 rotap_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long rotap_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18_2015.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 18.xlsx", sheet("2016") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year rotap_qual1 rotap_qual2 rotap_qual3 rotap_qual4 rotap_qual5 rotap_qual6 rotap_qual7 rotap_qual8 rotap_qual9 rotap_qual10 rotap_qual11 rotap_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long rotap_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18_2016.dta", replace

* Adding data for 2016 (Rotavirus Pentavalent)
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18_2016.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18_2015.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 18.xlsx", sheet("2017") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year rotap_qual1 rotap_qual2 rotap_qual3 rotap_qual4 rotap_qual5 rotap_qual6 rotap_qual7 rotap_qual8 rotap_qual9 rotap_qual10 rotap_qual11 rotap_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long rotap_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18_2017.dta", replace

* Adding data for 2017 (Rotavirus Pentavalent)
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18_2017.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 18.xlsx", sheet("2018") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year rotap_qual1 rotap_qual2 rotap_qual3 rotap_qual4 rotap_qual5 rotap_qual6 rotap_qual7 rotap_qual8 rotap_qual9 rotap_qual10 rotap_qual11 rotap_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long rotap_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18_2018.dta", replace

* Adding data for 2018 (Rotavirus Pentavalent)
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18_2018.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 18.xlsx", sheet("2019") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year rotap_qual1 rotap_qual2 rotap_qual3 rotap_qual4 rotap_qual5 rotap_qual6 rotap_qual7 rotap_qual8 rotap_qual9 rotap_qual10 rotap_qual11 rotap_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long rotap_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18_2019.dta", replace

* Adding data for 2019 (Rotavirus Pentavalent)
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18_2019.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 18.xlsx", sheet("2020") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year rotap_qual1 rotap_qual2 rotap_qual3 rotap_qual4 rotap_qual5 rotap_qual6 rotap_qual7 rotap_qual8 rotap_qual9 rotap_qual10 rotap_qual11 rotap_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long rotap_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18_2020.dta", replace

* Adding data for 2020 (Rotavirus Pentavalent)
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18_2020.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 18.xlsx", sheet("2021") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year rotap_qual1 rotap_qual2 rotap_qual3 rotap_qual4 rotap_qual5 rotap_qual6 rotap_qual7 rotap_qual8 rotap_qual9 rotap_qual10 rotap_qual11 rotap_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long rotap_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18_2021.dta", replace

* Adding data for 2021 (Rotavirus Pentavalent)
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18_2021.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 18.xlsx", sheet("2022") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year rotap_qual1 rotap_qual2 rotap_qual3 rotap_qual4 rotap_qual5 rotap_qual6 rotap_qual7 rotap_qual8 rotap_qual9 rotap_qual10 rotap_qual11 rotap_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long rotap_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18_2022.dta", replace

* Adding data for 2022 (Rotavirus Pentavalent)
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18_2022.dta"
sort year month ooad
replace rotap_qual = 0 if rotap_qual==.
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18.dta", replace

* Merging data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", clear
merge 1:1 ooad year month using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18.dta"
drop _merge
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 18.xlsx", sheet("2021 (2)") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year rotam_qual1 rotam_qual2 rotam_qual3 rotam_qual4 rotam_qual5 rotam_qual6 rotam_qual7 rotam_qual8 rotam_qual9 rotam_qual10 rotam_qual11 rotam_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long rotam_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18bis_2021.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 18.xlsx", sheet("2022 (2)") clear
drop in 1/2
keep in 1/36
destring B - N, replace
keep A - N
rename * (ooad year rotam_qual1 rotam_qual2 rotam_qual3 rotam_qual4 rotam_qual5 rotam_qual6 rotam_qual7 rotam_qual8 rotam_qual9 rotam_qual10 rotam_qual11 rotam_qual12)
replace ooad = "National" if ooad == "Nacional"
reshape long rotam_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18bis_2022.dta", replace

* Adding data for 2022 (Rotavirus Monovalent)
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18bis_2022.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18bis_2021.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18bis.dta", replace

import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Indicadores CUPN Indicador 18.xlsx", sheet("2023") clear
drop in 1/2
keep in 1/36
destring B - H, replace
keep A - H
rename * (ooad year rotam_qual1 rotam_qual2 rotam_qual3 rotam_qual4 rotam_qual5 rotam_qual6)
replace ooad = "National" if ooad == "Nacional"
reshape long rotam_qual, i(ooad year) j(month)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18bis_2023.dta", replace

* Adding data for 2023 (Rotavirus Monovalent)
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18bis.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18bis_2023.dta"
sort year month ooad
replace rotam_qual = 0 if rotam_qual==.
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18bis.dta", replace

* Merging data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", clear
merge 1:1 ooad year month using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_indicator18bis.dta"
drop _merge
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", replace

********************************************************************************
*Raw data for COVID-19 beds occupied through June 2023
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Extracción ocupación camas COVID a Jun2023 VF.xlsx", sheet("Ocupación camas por mes y año") clear
drop in 1
keep in 1/1365
destring B, replace
destring D, replace
keep A - D
rename * (ooad year month occup_beds)
replace ooad = "Aguascalientes" if ooad == "AGUASCALIENTES"
replace ooad = "Baja California" if ooad == "BAJA CALIFORNIA"
replace ooad = "Baja California Sur" if ooad == "BAJA CALIFORNIA SUR"
replace ooad = "Campeche" if ooad == "CAMPECHE"
replace ooad = "CDMX Norte" if ooad == "CDMX NORTE"
replace ooad = "CDMX Sur" if ooad == "CDMX SUR"
replace ooad = "Chiapas" if ooad == "CHIAPAS"
replace ooad = "Chihuahua" if ooad == "CHIHUAHUA"
replace ooad = "Coahuila" if ooad == "COAHUILA"
replace ooad = "Colima" if ooad == "COLIMA"
replace ooad = "Durango" if ooad == "DURANGO"
replace ooad = "México Oriente" if ooad == "ESTADO DE MEXICO ORIENTE"
replace ooad = "México Poniente" if ooad == "ESTADO DE MEXICO PONIENTE"
replace ooad = "Guanajuato" if ooad == "GUANAJUATO"
replace ooad = "Guerrero" if ooad == "GUERRERO"
replace ooad = "Hidalgo" if ooad == "HIDALGO"
replace ooad = "Jalisco" if ooad == "JALISCO"
replace ooad = "Michoacán" if ooad == "MICHOACAN"
replace ooad = "Morelos" if ooad == "MORELOS"
replace ooad = "Nayarit" if ooad == "NAYARIT"
replace ooad = "Nuevo León" if ooad == "NUEVO LEON"
replace ooad = "Oaxaca" if ooad == "OAXACA"
replace ooad = "Puebla" if ooad == "PUEBLA"
replace ooad = "Querétaro" if ooad == "QUERETARO"
replace ooad = "Quintana Roo" if ooad == "QUINTANA ROO"
replace ooad = "San Luis Potosí" if ooad == "SAN LUIS POTOSI"
replace ooad = "Sinaloa" if ooad == "SINALOA"
replace ooad = "Sonora" if ooad == "SONORA"
replace ooad = "Tabasco" if ooad == "TABASCO"
replace ooad = "Tamaulipas" if ooad == "TAMAULIPAS"
replace ooad = "Tlaxcala" if ooad == "TLAXCALA"
replace ooad = "Veracruz Norte" if ooad == "VERACRUZ NORTE"
replace ooad = "Veracruz Sur" if ooad == "VERACRUZ SUR"
replace ooad = "Yucatán" if ooad == "YUCATAN"
replace ooad = "Zacatecas" if ooad == "ZACATECAS"
replace month = "1" if month == "enero"
replace month = "2" if month == "febrero"
replace month = "3" if month == "marzo"
replace month = "4" if month == "abril"
replace month = "5" if month == "mayo"
replace month = "6" if month == "junio"
replace month = "7" if month == "julio"
replace month = "8" if month == "agosto"
replace month = "9" if month == "septiembre"
replace month = "10" if month == "octubre"
replace month = "11" if month == "noviembre"
replace month = "12" if month == "diciembre"
destring month, replace
replace occup_beds = 0 if occup_beds==.
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_occupied_beds.dta", replace

* Adding national data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_occupied_beds.dta", clear
collapse(sum) occup_beds, by(year month)
gen ooad = "National"
order ooad, before(year)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_occupbeds_national.dta", replace

use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_occupied_beds.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_occupbeds_national.dta"
sort year month ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_occupied_beds.dta", replace

*Calculating mean of beds occupied by month
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_occupied_beds.dta", clear
gen days_month = 31 if month == 1 | month == 3 | month == 5 | month == 7 | month == 8 | month == 10 | month == 12
replace days_month = 30 if month == 4 | month == 6 | month == 9 | month == 11
replace days_month = 28 if month == 2
gen mean_beds = occup_beds / days_month
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_occupied_beds.dta", replace

* Merging data 
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", clear
merge 1:1 ooad year month using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_occupied_beds.dta"
replace occup_beds = 0 if _merge == 1 // No data prior to April 2020
replace mean_beds = 0 if _merge == 1 // No data prior to April 2020
drop _merge
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", replace

********************************************************************************
*Raw data for 2015 population
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Base Recuperación.xlsx", sheet("Grupo de Edad MF 2015") clear
drop in 1/12
keep if C == "Total Delegacional" | B == "Nacional"
drop A C D
destring E F K Q-AH CI - CW, replace
rename (B E) (ooad total_pop)
gen u1 = F
gen u5 = K
egen u10 = rowtotal(K Q)
egen all20plus = rowtotal(T - AG)
egen women1549 = rowtotal(CI - CO)
egen women2564 = rowtotal(CK - CR)
egen women5069 = rowtotal(CP - CS)
keep ooad total_pop u1 - women5069
replace ooad = "National" if ooad == "Nacional"
replace ooad = "CDMX Norte" if ooad == "D. F. Norte"
replace ooad = "CDMX Sur" if ooad == "D. F. Sur"
gen year = "2015"
destring year, replace
order year, after(ooad)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSSpopulation_2015.dta", replace

********************************************************************************
*Raw data for 2016 population
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Base Recuperación.xlsx", sheet("Grupo de Edad MF 2016") clear
drop in 1/12
keep if C == "Total Delegacional" | B == "Nacional"
drop A C D
destring E F K Q-AH CI - CW, replace
rename (B E) (ooad total_pop)
gen u1 = F
gen u5 = K
egen u10 = rowtotal(K Q)
egen all20plus = rowtotal(T - AG)
egen women1549 = rowtotal(CI - CO)
egen women2564 = rowtotal(CK - CR)
egen women5069 = rowtotal(CP - CS)
keep ooad total_pop u1 - women5069
replace ooad = "National" if ooad == "Nacional"
replace ooad = "CDMX Norte" if ooad == "D. F. Norte"
replace ooad = "CDMX Sur" if ooad == "D. F. Sur"
gen year = "2016"
destring year, replace
order year, after(ooad)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSSpopulation_2016.dta", replace

* Adding data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSSpopulation_2016.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSSpopulation_2015.dta"
sort year ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_population15-23.dta", replace

********************************************************************************
*Raw data for 2017 population
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Base Recuperación.xlsx", sheet("Grupo de Edad MF 2017") clear
drop in 1/12
keep if C == "Total Delegacional" | B == "Nacional"
drop A C D
destring E F K Q-AH CI - CW, replace
rename (B E) (ooad total_pop)
gen u1 = F
gen u5 = K
egen u10 = rowtotal(K Q)
egen all20plus = rowtotal(T - AG)
egen women1549 = rowtotal(CI - CO)
egen women2564 = rowtotal(CK - CR)
egen women5069 = rowtotal(CP - CS)
keep ooad total_pop u1 - women5069
replace ooad = "National" if ooad == "Nacional"
replace ooad = "CDMX Norte" if ooad == "D. F. Norte"
replace ooad = "CDMX Sur" if ooad == "D. F. Sur"
gen year = "2017"
destring year, replace
order year, after(ooad)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSSpopulation_2017.dta", replace

* Adding data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_population15-23.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSSpopulation_2017.dta"
sort year ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_population15-23.dta", replace

********************************************************************************
*Raw data for 2018 population
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Base Recuperación.xlsx", sheet("Grupo de Edad MF 2018") clear
drop in 1/12
keep if C == "Total Delegacional" | B == "Nacional"
drop A C D
destring E F K Q-AH CI - CW, replace
rename (B E) (ooad total_pop)
gen u1 = F
gen u5 = K
egen u10 = rowtotal(K Q)
egen all20plus = rowtotal(T - AG)
egen women1549 = rowtotal(CI - CO)
egen women2564 = rowtotal(CK - CR)
egen women5069 = rowtotal(CP - CS)
keep ooad total_pop u1 - women5069
replace ooad = "National" if ooad == "Nacional"
replace ooad = "CDMX Norte" if ooad == "D. F. Norte"
replace ooad = "CDMX Sur" if ooad == "D. F. Sur"
gen year = "2018"
destring year, replace
order year, after(ooad)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSSpopulation_2018.dta", replace

* Adding data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_population15-23.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSSpopulation_2018.dta"
sort year ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_population15-23.dta", replace

********************************************************************************
*Raw data for 2019 population
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Base Recuperación.xlsx", sheet("Grupo de Edad MF 2019") clear
drop in 1/12
keep if C == "Total Delegacional" | B == "Nacional"
drop A C D
destring E F K Q-AH CI - CW, replace
rename (B E) (ooad total_pop)
gen u1 = F
gen u5 = K
egen u10 = rowtotal(K Q)
egen all20plus = rowtotal(T - AG)
egen women1549 = rowtotal(CI - CO)
egen women2564 = rowtotal(CK - CR)
egen women5069 = rowtotal(CP - CS)
keep ooad total_pop u1 - women5069
replace ooad = "National" if ooad == "Nacional"
replace ooad = "CDMX Norte" if ooad == "D. F. Norte"
replace ooad = "CDMX Sur" if ooad == "D. F. Sur"
gen year = "2019"
destring year, replace
order year, after(ooad)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSSpopulation_2019.dta", replace

* Adding data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_population15-23.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSSpopulation_2019.dta"
sort year ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_population15-23.dta", replace

********************************************************************************
*Raw data for 2020 population
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Base Recuperación.xlsx", sheet("Grupo de Edad MF 2020") clear
drop in 1/12
keep if C == "Total Delegacional" | B == "Nacional"
drop A C D
destring E F K Q-AH CI - CW, replace
rename (B E) (ooad total_pop)
gen u1 = F
gen u5 = K
egen u10 = rowtotal(K Q)
egen all20plus = rowtotal(T - AG)
egen women1549 = rowtotal(CI - CO)
egen women2564 = rowtotal(CK - CR)
egen women5069 = rowtotal(CP - CS)
keep ooad total_pop u1 - women5069
replace ooad = "National" if ooad == "Nacional"
replace ooad = "CDMX Norte" if ooad == "D. F. Norte"
replace ooad = "CDMX Sur" if ooad == "D. F. Sur"
gen year = "2020"
destring year, replace
order year, after(ooad)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSSpopulation_2020.dta", replace

* Adding data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_population15-23.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSSpopulation_2020.dta"
sort year ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_population15-23.dta", replace

********************************************************************************
*Raw data for 2021 population
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Base Recuperación.xlsx", sheet("Grupo de Edad MF 2021") clear
drop in 1/12
keep if C == "Total Delegacional" | B == "Nacional"
drop A C D
destring E F K Q-AH CI - CW, replace
rename (B E) (ooad total_pop)
gen u1 = F
gen u5 = K
egen u10 = rowtotal(K Q)
egen all20plus = rowtotal(T - AG)
egen women1549 = rowtotal(CI - CO)
egen women2564 = rowtotal(CK - CR)
egen women5069 = rowtotal(CP - CS)
keep ooad total_pop u1 - women5069
replace ooad = "National" if ooad == "Nacional"
replace ooad = "CDMX Norte" if ooad == "D. F. Norte"
replace ooad = "CDMX Sur" if ooad == "D. F. Sur"
gen year = "2021"
destring year, replace
order year, after(ooad)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSSpopulation_2021.dta", replace

* Adding data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_population15-23.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSSpopulation_2021.dta"
sort year ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_population15-23.dta", replace

********************************************************************************
*Raw data for 2022 population
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Base Recuperación.xlsx", sheet("Grupo de Edad MF 2022") clear
drop in 1/12
keep if C == "Total Delegacional" | B == "Nacional"
drop A C D
destring E F K Q-AH CI - CW, replace
rename (B E) (ooad total_pop)
gen u1 = F
gen u5 = K
egen u10 = rowtotal(K Q)
egen all20plus = rowtotal(T - AG)
egen women1549 = rowtotal(CI - CO)
egen women2564 = rowtotal(CK - CR)
egen women5069 = rowtotal(CP - CS)
keep ooad total_pop u1 - women5069
replace ooad = "National" if ooad == "Nacional"
replace ooad = "CDMX Norte" if ooad == "D. F. Norte"
replace ooad = "CDMX Sur" if ooad == "D. F. Sur"
gen year = "2022"
destring year, replace
order year, after(ooad)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSSpopulation_2022.dta", replace

* Adding data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_population15-23.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSSpopulation_2022.dta"
sort year ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_population15-23.dta", replace

********************************************************************************
*Raw data for 2023(through June) population
********************************************************************************
import excel using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/Base Recuperación.xlsx", sheet("Grupo de Edad MF 06-2023") clear
drop in 1/12
keep if C == "Total Delegacional" | B == "Nacional"
drop A C D
destring E F K Q-AH CI - CW, replace
rename (B E) (ooad total_pop)
gen u1 = F
gen u5 = K
egen u10 = rowtotal(K Q)
egen all20plus = rowtotal(T - AG)
egen women1549 = rowtotal(CI - CO)
egen women2564 = rowtotal(CK - CR)
egen women5069 = rowtotal(CP - CS)
keep ooad total_pop u1 - women5069
replace ooad = "National" if ooad == "Nacional"
replace ooad = "CDMX Norte" if ooad == "D. F. Norte"
replace ooad = "CDMX Sur" if ooad == "D. F. Sur"
gen year = "2023"
destring year, replace
order year, after(ooad)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSSpopulation_2023.dta", replace

* Adding data
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_population15-23.dta", clear
append using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSSpopulation_2023.dta"
sort year ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_population15-23.dta", replace

********************************************************************************
*Assembling data
********************************************************************************

use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", clear
merge m:1 ooad year using "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_population15-23.dta"
drop _merge
format %20s ooad
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", replace

********************************************************************************
* CREATE VARIABLES FOR ANALYSIS 2018-2023
********************************************************************************
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery15-23.dta", clear
drop if year <2018
drop if year==2023 & month==7

egen ooad_tag = tag(ooad)
gsort -ooad_tag total_pop
gen pop_rank = _n if ooad_tag == 1
gsort ooad -pop_rank
by ooad: carryforward pop_rank, replace

lab def del 35 "Jal" 34 "Mex Or" 33 "NL" 32 "CDMX Sur" 31 "Gto" 30 "Coah" 29 "Chih" 28 "Mex Pon" 27 "CDMX Nor" 26 "BC" 25 "Tamp" 24 "Sin" 23 "Son" 22 "Pue" 21 "Ver Nor" 20 "Mich" 19 "SLP" 18 "Qro" 17 "Ver Sur" 16 "Yuc" 15 "QR" 14 "Ags" 13 "Dgo" 12 "Hgo" 11 "Mor" 10 "Chis" 9 "Gro" 8 "Oax" 7 "Tab" 6 "Zac" 5 "Nay" 4 "BCS" 3 "Col" 2 "Tlax" 1 "Camp"
lab val pop_rank del

gen rmonth= month if year==2018
replace rmonth = month+12 if year ==2019
replace rmonth = month+24 if year ==2020
replace rmonth = month+36 if year ==2021
replace rmonth = month+48 if year ==2022
replace rmonth = month+60 if year ==2023
sort ooad rmonth

gen postCovid = rmonth >27 // State of Emergency was March 30th.

*HL addition
gen postPolicy = rmonth >39 // Service resumption policies begin April 2021.

* Calculating rates and merging child indicators
gen cs_rate = (cs_util/totaldel)*100
lab var cs_rate "c-section rate %"
order cs_rate, after(cs_util)

gen diab_qual = (diab_qual_num/ diab_util)*100
lab var diab_qual "Proportion with controlled blood sugar"
order diab_qual, after(diab_qual_num)
order diab_util, after(diab_qual_num)

gen hyper_qual = (hyper_qual_num / hyper_util)*100
lab var hyper_qual "Proportion with controlled BP"
order hyper_qual, after(hyper_qual_num)
order hyper_util, after(hyper_qual_num)

egen sc_util = rowtotal (diarr_util pneum_util malnu_util), m 
lab var sc_util "Total sick child visits"
order sc_util, after(malnu_util)

egen penthex_qual = rowtotal(pent_qual hex_qual), m
order penthex_qual, after(hex_qual)
drop pent_qual hex_qual

egen rota_qual = rowtotal(rotap_qual rotam_qual), m
order rota_qual, after(rotam_qual)
drop rotap_qual rotam_qual

egen vax_util = rowtotal(penthex_qual bcg_qual mmr_qual pneum_qual rota_qual), m
lab var vax_util "Total children vaccinated"
order vax_util, after(rota_qual)

gen cerv_denom = women2564 * 0.89 // considering hysterectomy women (11%, ENCOPREVENIMSS 2006)
replace cerv_denom= round(cerv_denom)
order cerv_denom, after(cerv_util)

*Number of months since Covid
gen timeafter_cov = rmonth - 27
replace timeafter_cov = 0 if rmonth < 27

*Number of months since policy change
gen timeafter_pol = rmonth - 39
replace timeafter_pol = 0 if rmonth < 39

*Seasons
gen spring = month>=3 & month<=5
gen summer = month>=6 & month<=8
gen fall = month>=9 & month<=11
gen winter= month==12 | month==1 | month==2

*Quarters of 2020 - 2023
gen quarter_20 = 2 if rmonth>=28 & rmonth<=30 // April - June 2020
replace quarter_20 = 3 if rmonth>=31 & rmonth<=33 // July - Sept 2020
replace quarter_20 = 4 if rmonth>=34 & rmonth<=36 // Oct - Dec 2020
gen quarter_21 = 1 if rmonth>=37 & rmonth<=39 // Jan - Mar 2021
replace quarter_21 = 2 if rmonth>=40 & rmonth<=42 // April - June 2021
replace quarter_21 = 3 if rmonth>=43 & rmonth<=45 // July - Sept 2021
replace quarter_21 = 4 if rmonth>=46 & rmonth<=48 // Oct - Dec 2021
gen quarter_22 = 1 if rmonth>=49 & rmonth<=51 // Jan - Mar 2022
replace quarter_22 = 2 if rmonth>=52 & rmonth<=54 // April - June 2022
replace quarter_22 = 3 if rmonth>=55 & rmonth<=57 // July - Sept 2022
replace quarter_22 = 4 if rmonth>=58 & rmonth<=60 // Oct - Dec 2022
gen quarter_23 = 1 if rmonth>=61 & rmonth<=63 // Jan - Mar 2023
replace quarter_23 = 2 if rmonth>=64 & rmonth<=66 // April - June 2023
egen q = concat(year quarter_20 quarter_21 quarter_22 quarter_23), punct("-")
replace q = regexr(q, "-\.", "")
replace q = regexr(q, "-\.", "")
replace q = regexr(q, "-\.", "")
encode q, gen(quarter)

*Log population and COVID-19 beds occupied
gen logpop= log(total_pop) 
gen ln_beds = ln(mean_beds)
replace ln_beds = 0 if ln_beds ==. & rmonth>=28

sort ooad year month
foreach var of varlist postCovid postPolicy timeafter_cov timeafter_pol mean_beds ln_beds {
	by ooad: gen `var'_lag = `var'[_n-1]
	replace `var'_lag = 0 if year == 2018 & month == 1
	by ooad: gen `var'_lag2 = `var'[_n-2]
	replace `var'_lag2 = 0 if year == 2018 & month < 3	
}

lab var fp_util "Contraceptive use visits (new acceptors)"
lab var anc_util "Antenatal care (pregnancies)"
lab var totaldel "Deliveries"
lab var cs_util "Caesarean sections"
lab var sc_util "Sick child visits"        
lab var vax_util "Child vaccination"
lab var cerv_util "Cervical cancer screening"
lab var breast_util "Breast cancer screening"
lab var diab_util "Diabetes visits"
lab var hyper_util "Hypertension visits"
lab var cs_rate "C section %" 
lab var diab_qual "Controlled diabetes %"
lab var hyper_qual "Controlled hypertension %"
lab var hyper_qual_num "Hypertension pts w/ controlled BP"
lab var diab_qual_num "Diabetes pts w/ controlled blood sugar"
lab var fm_cons "Family medicine consultations" 
lab var spec_cons "Specialty consultations" 
lab var emerg_cons "Emergency room attentions" 
lab var dent_cons "Dental consultations"
lab var elect_surg "Elective surgeries" 
lab var hosp_num "Hospitalizations"
lab var rmonth "Months since January 2018"
lab var timeafter_cov "Months since COVID"
lab var timeafter_pol "Months since NHSR strategy"
recode rmonth (1/27 = 1 "Pre-Covid") (28/39 = 2 "Covid pre-policy") (40/66 = 3 "Covid post-policy"), gen(period)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery18-23nat.dta", replace

********************************************************************************
* DELETE NATIONAL DATA
********************************************************************************
use "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery18-23nat.dta", clear
drop if ooad=="National"
encode ooad, gen(ooad1)
save "C:/Users/zwitt/Downloads/servicios de salud/ANALISIS FINAL/IMSS_service_delivery18-23ooad.dta", replace

