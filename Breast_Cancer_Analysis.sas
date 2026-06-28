/**************************************************************************
Project : Breast Cancer Clinical Data Analysis Using SAS
Author  : Sayali Doiphode
Software: SAS OnDemand for Academics
Dataset : Breast Cancer Wisconsin Dataset
**************************************************************************/

/*-------------------------------------------------------------*/
/* Step 1 : Import Dataset                                     */
/*-------------------------------------------------------------*/

proc import datafile="/home/u64543250/sasuser.v94/data.csv"
    out=bcancer
    dbms=csv
    replace;
    guessingrows=max;
run;


/*-------------------------------------------------------------*/
/* Step 2 : Explore Dataset                                    */
/*-------------------------------------------------------------*/

proc contents data=bcancer;
run;

proc print data=bcancer(obs=10);
run;


/*-------------------------------------------------------------*/
/* Step 3 : Frequency Analysis                                 */
/*-------------------------------------------------------------*/

proc freq data=bcancer;
    tables diagnosis;
run;


/*-------------------------------------------------------------*/
/* Step 4 : Descriptive Statistics                             */
/*-------------------------------------------------------------*/

proc means data=bcancer mean median std min max;
run;


/*-------------------------------------------------------------*/
/* Step 5 : Diagnosis Bar Plot                                 */
/*-------------------------------------------------------------*/

proc sgplot data=bcancer;
    vbar diagnosis;
run;


/*-------------------------------------------------------------*/
/* Step 6 : Histogram                                           */
/*-------------------------------------------------------------*/

proc sgplot data=bcancer;
    histogram radius_mean;
    density radius_mean;
run;


/*-------------------------------------------------------------*/
/* Step 7 : Group-wise Statistics                              */
/*-------------------------------------------------------------*/

proc means data=bcancer mean std;
    class diagnosis;
    var radius_mean texture_mean area_mean perimeter_mean;
run;


/*-------------------------------------------------------------*/
/* Step 8 : Boxplot                                            */
/*-------------------------------------------------------------*/

proc sgplot data=bcancer;
    vbox radius_mean / category=diagnosis;
run;


/*-------------------------------------------------------------*/
/* Step 9 : Correlation Analysis                               */
/*-------------------------------------------------------------*/

proc corr data=bcancer;
    var radius_mean texture_mean perimeter_mean area_mean;
run;


/*-------------------------------------------------------------*/
/* Step 10 : Create Frequency Dataset                          */
/*-------------------------------------------------------------*/

proc freq data=bcancer noprint;
    tables diagnosis / out=diagfreq;
run;

proc contents data=diagfreq;
run;