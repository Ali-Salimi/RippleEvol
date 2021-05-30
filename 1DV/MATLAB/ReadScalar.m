function [s] = ReadScalar(dir,time,char,precision)

dirr = [dir num2str(time,precision) '/' char]

    fid = fopen(dirr);

% Get Nsum
for i=1:20
    tline = fgets(fid);
end
Nsum = fscanf(fid,'%d\n');
fclose(fid);

    fid = fopen(dirr);

yy = textscan(fid, '%f','Delimiter','() ',...
      'MultipleDelimsAsOne',true, 'HeaderLines', 22);
fclose(fid);
yyy = yy{:};
y0 = yyy(1:Nsum);
s = y0;%reshape(y0,Nx,Nz,Ny);

end