function [] = WriteToFile( Fname,yvar,var )
%WRITETOFILE Summary of this function goes here
%   Detailed explanation goes here
fid = fopen(Fname,'w');
fprintf(fid,'(\n');
fprintf(fid,'(%e %e)\n',[yvar'; var';]);
fprintf(fid,')\n');
fclose(fid);

end

