% assignment 2
% select a set of raiding warrior
enum WARRIOR;
WARRIOR: dummy; 
enum CLAN; % the clan they belong too

int: l; % minimum raid party size
int: u; % maximum raid party size
int: m; % limit of hatreds

array[WARRIOR] of int: strength;
array[WARRIOR] of CLAN: clan;
array[CLAN,CLAN] of 0..1: hates;

var set of WARRIOR:x;

constraint not(dummy in x);
constraint card(x)>=l;
constraint card(x)<=u;
constraint sum(i,j in x where i<j)(hates[clan[i],clan[j]])<=m;
int: power;
constraint power=sum([strength[i]|i in x]);


solve maximize power;
output["raid=\(x);\nobj=\(power);\n"]
