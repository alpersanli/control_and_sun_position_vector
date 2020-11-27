%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FOR EQUINOXES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

JDUT = 2458563.41528								;
  
% 1 AU : 149.597.870,691 km
AU = 149597870.691;

% TUT1 : Number of Julian Centuries 
TUT1 = (JDUT - 2451545) / 36525;

% Let TTDB = TUT1
TTDB = TUT1;

% MLS : Mean Longitude of the Sun
MLS = 280.460 + 36000.771 * TUT1;

% MAS : Mean Anomaly for the Sun
% TTDB : Precise
MAS = 357.5291092 + 35999.05034 * TTDB;

% ECL : Ecliptic
ECL = MLS + 1.914666471 * sind(MAS) + 0.019994643 * sind(2*MAS);
  
% ECL2 : 0 degree

% E : Obliquity of the Ecliptic
E = 23.439291 - 0.013004 * 2 * TTDB;

% R : Magnitude of the Distance to the Sun
R = 1.000140612 - 0.016708617 * cosd(MAS) - 0.000139589 * cosd(2*MAS);

% r : vector
x = R*cosd(ECL)*AU ;
y = R*cosd(E)*sind(ECL)*AU ;
z = R*sind(E)*sind(ECL)*AU ;
r = (x^2 + y^2 + z^2)^(1/2) ;

% Alfa boylam ve beta enlem degerini verir
alfa = atand((y/(x^2+y^2)^(1/2))/(x/(x^2+y^2)^(1/2)));
beta = asind(z/r) ;
r_kks = [ alfa  beta  0] 

  
