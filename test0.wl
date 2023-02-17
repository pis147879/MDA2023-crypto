scelta=0;

n=RandomInteger[2^200];
y=Hash[n+scelta];

TimeConstrained[n1=0;
While[!(Hash[n1+1]==y),n1++];n1,100]