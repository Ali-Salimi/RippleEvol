cd ../
!writeCellCentres -time 0
cd MATLAB

dir = '../';
nu = 1e-6;

% First get Nsum
fid = fopen('../0/V');
for i=1:20
    tline = fgets(fid);
end
Nsum = fscanf(fid,'%d\n');
fclose(fid);
fid = fopen('../0/V');
xx = textscan(fid, '%f','Delimiter','() ',...
      'MultipleDelimsAsOne',true, 'HeaderLines', 22);
fclose(fid);
xxx = xx{:};
V0 = xxx(1:Nsum);

[x,y,z] = ReadCord(dir,0);

times = 250:250;
precision = 10;
    
alpha = ReadScalar(dir,times(end),'alpha',precision);
epsilon = ReadScalar(dir,times(end),'epsilon',precision);
epsilon=max(epsilon,1e-10);
k = ReadScalar(dir,times(end),'k',precision);
k = max(k,1e-6);
mua = ReadScalar(dir,times(end),'mua',precision);
muf = ReadScalar(dir,times(end),'muf',precision);
muI = ReadScalar(dir,times(end),'muI',precision);
nut = ReadScalar(dir,times(end),'nut',precision);
nuvb = ReadScalar(dir,times(end),'nuvb',precision);
p = ReadScalar(dir,times(end),'p',precision);
pa = ReadScalar(dir,times(end),'pa',precision);
pff = ReadScalar(dir,times(end),'pff',precision);
ppMagf = ReadScalar(dir,times(end),'ppMagf',precision);
Theta = ReadScalar(dir,times(end),'Theta',precision);
Theta = max(Theta,1e-20);
[ua,va,wa] = ReadVector(dir,times(end),'Ua',precision);
[ub,vb,wb] = ReadVector(dir,times(end),'Ub',precision);

close all
figure
plot(alpha,y)

figure
plot(p,y)

figure
plot(ub,y)
hold on

d = 3.6e-4;
theta = 0.33;
ks = 2.5*d + 20*theta*d;
ustar = 0.0432;
kappa = 0.41;
ufit = (ustar/kappa)*log(30*abs(y)/ks);
[indx,indy] = find(y<ks/30);
ufit(indx) = 0.*ufit(indx);
plot(ufit,y,'r--','lineWidth',2)
hold off

WriteToFile( 'alpha.xy',y,alpha )
WriteToFile( 'epsilon.xy',y,epsilon )
WriteToFile( 'k.xy',y,k )
WriteToFile( 'mua.xy',y,mua )
WriteToFile( 'muf.xy',y,muf )
WriteToFile( 'muI.xy',y,muI )
WriteToFile( 'nut.xy',y,nut )
WriteToFile( 'nuvb.xy',y,nuvb )
WriteToFile( 'p.xy',y,p )
WriteToFile( 'pa.xy',y,pa )
WriteToFile( 'pff.xy',y,pff )
WriteToFile( 'ppMagf.xy',y,ppMagf )
WriteToFile( 'Theta.xy',y,Theta )
WriteToFile( 'ua.xy',y,ua )
WriteToFile( 'va.xy',y,va )
WriteToFile( 'wa.xy',y,wa )
WriteToFile( 'ub.xy',y,ub )
WriteToFile( 'vb.xy',y,vb )
WriteToFile( 'wb.xy',y,wb )