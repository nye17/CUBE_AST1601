clear; SetDefault
format short
global Redshift Redshift_i Universe Path Dir
Universe='1';
Redshift_i='100.000';
Path='../cube/output/';
Dir=['universe',Universe,'/image1/'];
sim=get_sim_info([Path,Dir,Redshift_i,'_']);
ng=sim.nf;
disp('-------------------------------------------------------------------')
disp('nf ='); disp(sim.nf)
disp('box ='); disp(sim.box)
disp('mass_p ='); disp(sim.mass_p_solar)
xgrid=[0.5*(sim.box/sim.nf),sim.box-0.5*(sim.box/sim.nf)];
%% delta_c
Redshift='0.000';
%Redshift='5.000';
%Redshift='0.500';
delta_c=loadfield3d([Path,Dir,Redshift,'_delta_c_1.bin']);
figure; imagesc(xgrid,xgrid,reshape(mean(delta_c(:,:,1:10),3),ng,ng)'); hold on
axis xy square; colorbar; caxis([-1,5]); title('$\delta_c$'); colormap(1-gray);
