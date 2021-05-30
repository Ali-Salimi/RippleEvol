function [x y z] = ReadCord(char,time)

%Nsum = Nx*Ny*Nz;

% Get Nsum
fid = fopen([char num2str(time) '/ccx']);
for i=1:20
    tline = fgets(fid);
end
Nsum = fscanf(fid,'%d\n');
fclose(fid);
fid = fopen([char num2str(time) '/ccx']);
xx = textscan(fid, '%f','Delimiter','() ',...
      'MultipleDelimsAsOne',true, 'HeaderLines', 22);
fclose(fid);
xxx = xx{:};
x0 = xxx(1:Nsum);

x = x0;%reshape(x0,Nx,Nz,Ny);

fid = fopen([char num2str(time) '/ccy']);
yy = textscan(fid, '%f','Delimiter','() ',...
      'MultipleDelimsAsOne',true, 'HeaderLines', 22);
fclose(fid);
yyy = yy{:};
y0 = yyy(1:Nsum);
y = y0;%reshape(y0,Nx,Nz,Ny);

fid = fopen([char num2str(time) '/ccz']);
zz = textscan(fid, '%f','Delimiter','() ',...
      'MultipleDelimsAsOne',true, 'HeaderLines', 22);
fclose(fid);
zzz = zz{:};
z0 = zzz(1:Nsum);
z = z0;%reshape(z0,Nx,Nz,Ny);

end
