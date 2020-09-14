numToRound = argument0;
multiple = argument1;

 
 if(multiple == 0) 
 { 
  return numToRound; 
 } 

 var remainder = numToRound % multiple;
 if (remainder == 0)
  return numToRound;
 return numToRound + multiple - remainder;
