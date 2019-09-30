Drop columns where the column name contains 'status'                                                                      
                                                                                                                          
SAS Forum                                                                                                                 
https://tinyurl.com/yxcbfuan                                                                                              
https://communities.sas.com/t5/SAS-Programming/how-to-keep-the-dataset-label-while-dropping-few-variables/m-p/592639      
                                                                                                                          
macros                                                                                                                    
https://tinyurl.com/y9nfugth                                                                                              
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories                                
                                                                                                                          
*_                   _                                                                                                    
(_)_ __  _ __  _   _| |_                                                                                                  
| | '_ \| '_ \| | | | __|                                                                                                 
| | | | | |_) | |_| | |_                                                                                                  
|_|_| |_| .__/ \__,_|\__|                                                                                                 
        |_|                                                                                                               
;                                                                                                                         
                                                                                                                          
data heart;                                                                                                               
  set sashelp.heart(obs=5 keep=status sex height weight                                                                   
         chol_status bp_status weight_status smoking_status) ;                                                            
run;quit;                                                                                                                 
                                                                                                                          
WORK.HEART total obs=5                                                                                                    
                                                                                                                          
                   [------------------------- DROP THESE ---------------------------]                                     
                                                                                                                          
                              CHOL_                      WEIGHT_                                                          
 HEIGHT    WEIGHT   STATUS    STATUS       BP_STATUS      STATUS      SMOKING_STATUS                                      
                                                                                                                          
  62.50      140    Dead                    Normal      Overweight    Non-smoker                                          
  59.75      194    Dead      Desirable     High        Overweight    Non-smoker                                          
  62.25      132    Alive     High          High        Overweight    Moderate (6-15)                                     
  65.75      158    Alive     High          Normal      Overweight    Non-smoker                                          
  66.00      156    Alive     High          Optimal     Overweight    Heavy (16-25)                                       
                                                                                                                          
Variables in Creation Order                                                                                               
                                                                                                                          
1    STATUS            Char      5                                                                                        
2    SEX               Char      6                                                                                        
3    HEIGHT            Num       8                                                                                        
4    WEIGHT            Num       8                                                                                        
5    CHOL_STATUS       Char     10    Cholesterol Status                                                                  
6    BP_STATUS         Char      7    Blood Pressure Status                                                               
7    WEIGHT_STATUS     Char     11    Weight Status                                                                       
8    SMOKING_STATUS    Char     17    Smoking Status                                                                      
                                                                                                                          
*            _               _                                                                                            
  ___  _   _| |_ _ __  _   _| |_                                                                                          
 / _ \| | | | __| '_ \| | | | __|                                                                                         
| (_) | |_| | |_| |_) | |_| | |_                                                                                          
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                         
                |_|                                                                                                       
;                                                                                                                         
                                                                                                                          
Up to 40 obs from HEART total obs=5                                                                                       
                                                                                                                          
Obs     SEX      HEIGHT    WEIGHT                                                                                         
                                                                                                                          
 1     Female     62.50      140                                                                                          
 2     Female     59.75      194                                                                                          
 3     Female     62.25      132                                                                                          
 4     Female     65.75      158                                                                                          
 5     Male       66.00      156                                                                                          
                                                                                                                          
 Variables in Creation Order                                                                                              
                                                                                                                          
#    Variable    Type    Len                                                                                              
                                                                                                                          
1    SEX         Char      6                                                                                              
2    HEIGHT      Num       8                                                                                              
3    WEIGHT      Num       8                                                                                              
                                                                                                                          
*                                                                                                                         
 _ __  _ __ ___   ___ ___  ___ ___                                                                                        
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                                       
| |_) | | | (_) | (_|  __/\__ \__ \                                                                                       
| .__/|_|  \___/ \___\___||___/___/                                                                                       
|_|                                                                                                                       
;                                                                                                                         
                                                                                                                          
data heart;                                                                                                               
  set sashelp.heart(obs=5 keep=status sex height weight                                                                   
         chol_status bp_status weight_status smoking_status) ;                                                            
run;quit;                                                                                                                 
                                                                                                                          
proc sql;                                                                                                                 
   alter                                                                                                                  
       table heart                                                                                                        
   drop                                                                                                                   
       %varlist(heart,od=%str(,),prx=/STATUS/i)                                                                           
;quit;                                                                                                                    
                                                                                                                          
