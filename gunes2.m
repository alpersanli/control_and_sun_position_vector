%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SUN POSITION VECTOR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Convert from calendar date and time to Julian date, https://www.onlineconversion.com/julian_date.htm
% JDUT1 : 1 January 2019
% JDUT2 : 31 December 2021


% Reference : David A. Vallado, James Wertz - Fundamentals of Astrodynamics and Applications


JDUT1 = 2458484.5;
JDUT2 = 2459579.5 ;
i= 1;

for JDUT = JDUT1 : 1 : JDUT2
  
  
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
  %   rr(i,:) = [ r ];
  r_eci(i,:) = [ x ; y ; z]';
  
  
  % ECI 
  ecii = r_eci(i,:)'  

  % Kuresel Koordinat Sistemi 
  alfa = atand((y/(x^2+y^2)^(1/2))/(x/(x^2+y^2)^(1/2)));
  beta = asind(z/r) ;
  r_kks(i,:) = [ alfa ; beta ; 0]'; 
  kks = r_kks(i,:)' 
  

  
  i=i+1;
endfor

