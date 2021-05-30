function [u v w] = ReadVector(dir,time,char,precision)

dirr = [dir num2str(time,precision) '/' char]

    fid = fopen(dirr);

% Get Nsum
for i=1:20,
    tline = fgets(fid);
end
Nsum = fscanf(fid,'%d\n');
fclose(fid);

fid = fopen(dirr);

uu = textscan(fid, '%f','Delimiter','() ',...
      'MultipleDelimsAsOne',true, 'HeaderLines', 22);
fclose(fid);
vel = uu{:};
u0 = vel(3*(1:Nsum)-2);
v0 = vel(3*(1:Nsum)-1);
w0 = vel(3*(1:Nsum));

% now format to 3D matrix
u = u0;%reshape(u0,Nx,Nz,Ny);
v = v0;%reshape(v0,Nx,Nz,Ny);
w = w0;%reshape(w0,Nx,Nz,Ny);

end