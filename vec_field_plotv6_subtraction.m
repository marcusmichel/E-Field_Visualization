
%% Initialization of file
clear; clc;

% yz field
% field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/7.1/rails/320rails_sphere60-20/sphere_320rails_320nm5ds_675.E','%t',23,0);
% field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/waveguide/filledWG80/E_fields/fwg80_20nm5ds_1550.E','%t',23,0);

% E field file
% field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/waveguide/filledWG80/E_fields/fwg80_0nm5ds_1550.E','%t',23,0);
field1 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_0nm5ds_675.E','%t',23,0);
field2 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_0nm5ds_923.E','%t',23,0);
% xy field
% field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/7.1/rails/160rails_sphere60-20/xy_z-0_5ds_675.E','%t',23,0);

superTitle = '320 Rails&Sphere@0nm 923nm-623nm';

% % Before running, fill out each of these with the correct information
% crossSctn = '0';
% wavelength = '675';
% waveguideLength = '320';
% dipoleSpacing = '5';
% % Full Mesh or Variable Mesh
% mesh = 'Full Mesh';

%Set to 'true' if you want to export each figure, 'false' if not. 
export = false;

% % Make sure this directory exists--it's what you're exporting to
% exportDir = '/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/subtractions/';

% Are you in the xy plane? If not, it's assumed you're in the yz plane.
xy = false;

% 
% superTitle = [wavelength,'nm Incident on ',newline,waveguideLength,'nm ',mesh,' ',dipoleSpacing, 'nmds WG @ ',crossSctn,'nm'];



% This just clarifies we're in the xy or yz plane
yz = true;
if xy 
    yz = false;
end

reEx3 = field2(:,4)-field1(:,4);
imEx = field2(:,5)-field1(:,5);
reEy = field2(:,6)-field1(:,6);
imEy = field2(:,7)-field1(:,7);
reEz = field2(:,8)-field1(:,8);
imEz = field2(:,9)-field1(:,9);

% reE_x = field(:,4);
% imE_x = field(:,5);
% reE_y =field(:,6);
% imE_y = field(:,7);
% reE_z = field(:,8);
% imE_z = field(:,9);


x1 = field1(:,1);
y3 = field1(:,2);
z = field1(:,3);

%  Change this based on which cross section you're looking at
if xy
    a = abs(max(x1)) + abs(min(x1)) + 1;
    b = abs(max(y3)) + abs(min(y3)) + 1;
elseif yz
    a = abs(max(y3)) + abs(min(y3)) + 1;
    b = abs(max(z)) + abs(min(z)) + 1;
end

reEx3 = reshape(reEx3, [b,a]);
imEx = reshape(imEx, [b,a]);
reEy = reshape(reEy, [b,a]);
imEy = reshape(imEy, [b,a]);
reEz = reshape(reEz, [b,a]);
imEz = reshape(imEz, [b,a]);
%% Cross Sections through waveguide
clc
%Cross sections through waveguide
% figure('Position',[0,0,2304,1440])
figure('Position',[0,0,800,650])
% Title = suptitle(title);
sup = suptitle(superTitle)
sup.FontSize = 15;

% Ey_mag = Ey_mag1 - Ey_mag2;
% Real x component
    if yz
        sp1 = subplot(3,2,1)
        pcolor(reEx3)
        c = colorbar('southoutside');
    elseif xy
        sp1 = subplot(1,6,1)
        pcolor(reEx3)
        c = colorbar;
    end
    %     sp1 = subplot(3,2,1)
    %     % sp1 = subplot(1,6,1)

        shading interp
        colormap(jet)
        % colorbar off
        % c.FontSize = 8;
    if yz
        c.Position = [0.1300,0.7093+.02,.3347,.01];
    elseif xy
        c.Position = [0.1441-.015,0.1100+.11,0.01,0.59];
    end
        shading flat
        shading interp
        axis equal
        axis off
        title('Re(Ex)')
        % colorbar off

% Imaginary x component
    if yz
        sp2 = subplot(3,2,2)
        pcolor(imEx)
        c = colorbar('southoutside');
    elseif xy
        sp2 = subplot(1,6,2)
        pcolor(imEx)
        c = colorbar;
    end
    %     sp2 = subplot(3,2,2)
        % sp2 = subplot(1,6,2)
        shading interp
        colormap(jet)
        % colorbar off
        % c.FontSize = 8;
    if yz
        c.Position = [0.5703,0.7093+.02,.3347,.01];
    elseif xy
        c.Position = [0.2787-.015,0.1100+.11,0.01,0.59];
    end
        shading flat
        shading interp
        axis equal
        axis off
        title('Im(Ex)')
        % colorbar off

% Real y component
    if yz
        sp3 = subplot(3,2,3)
        pcolor(reEy)
        c = colorbar('southoutside');
    elseif xy
        sp3 = subplot(1,6,3)
        pcolor(reEy)
        c = colorbar;
    end
    %     sp3 = subplot(3,2,3)
        % sp3 = subplot(1,6,3)
        shading interp
        colormap(jet)
        % colorbar off
        % c.FontSize = 8;
    if yz 
        c.Position = [0.1300,0.4096+.02,.3347,.01];
    elseif xy 
        c.Position = [0.4132-.015,0.1100+.11,0.01,0.59];
    end
        shading flat
        shading interp
        axis equal
        axis off
        title('Re(Ey)')
        % colorbar off


% Imaginary y component
    if yz
        sp4 = subplot(3,2,4)
        pcolor(imEy)
        c = colorbar('southoutside');
    elseif xy
        sp4 = subplot(1,6,4)
        pcolor(imEy)
        c = colorbar;
    end
    %     sp4 = subplot(3,2,4)
        % sp6 = subplot(1,6,4)
        shading interp
        colormap(jet)
        % colorbar off
        % c.FontSize = 8;
    if yz
        c.Position = [0.5703,0.4096+.02,.3347,.01];
    elseif xy
        c.Position = [0.5478-.015,0.1100+.11,0.01,0.59];
    end
        shading flat
        shading interp
        axis equal
        axis off
        title('Im(Ey)')
        %colorbar off

% Real z component
    if yz
        sp5 = subplot(3,2,5)
        pcolor(reEz)
        c = colorbar('southoutside');
    elseif xy
        sp5 = subplot(1,6,5)
        pcolor(reEz)
        c = colorbar;
    end
    %     sp5 = subplot(3,2,5)
        % sp5 = subplot(1,6,5)
        shading interp
        colormap(jet)
        % colorbar off
        % c.FontSize = 8;
    if yz 
        c.Position = [0.1300,0.1100+.02,.3347,.01];
    elseif xy
        c.Position = [0.6823-.015,0.1100+.11,0.01,0.59];
    end
        shading flat
        shading interp
        axis equal
        axis off
        title('Re(Ez)')
        % colorbar off

% Imaginary z component
    if yz
        sp6 = subplot(3,2,6)
        pcolor(imEz)
        c = colorbar('southoutside');
    elseif xy
        sp6 = subplot(1,6,6)
        pcolor(imEz)
        c = colorbar;
    end
    %     sp6 = subplot(3,2,6)
        % sp6 = subplot(1,6,6)
        shading interp
        colormap(jet)
        % colorbar off
        % c.FontSize = 8;
    if yz
        c.Position = [0.5703,0.1100+.02,.3347,.01];
    elseif xy
        c.Position = [0.8168-.015,0.1100+.11,0.01,0.59];
    end

        shading flat
        shading interp
        axis equal
        axis off
        title('Im(Ez)')
        % colorbar off
       
if export
    saveas(gcf,[exportDir,crossSctn,'_',wavelength,'_components.png'])
end
%% Magnitude of components of E Field

figure()
%Magnitude of components of electric field
magX1 = sqrt(field1(:,4).^2 + field1(:,5).^2);
magY1 = sqrt(field1(:,6).^2 + field1(:,7).^2);
magZ1 = sqrt(field1(:,8).^2 + field1(:,9).^2);

magE = magX1;

% a = abs(max(x)) + abs(min(x)) + 1;
% % a = abs(max(y)) + abs(min(y)) + 1;
% b = abs(max(y)) + abs(min(y)) + 1;

magX1 = reshape(magX1, [b,a]);
magY1 = reshape(magY1, [b,a]);
magZ1 = reshape(magZ1, [b,a]);

% figure();
if yz
    subplot(3,1,1)
elseif xy
    subplot(1,3,1)
end
pcolor(magX1)
shading interp
colormap(jet)
c = colorbar
c.FontSize = 16;
shading flat
shading interp
axis equal
axis off
title('|Ex|','FontSize',20)

% figure();
if yz
    subplot(3,1,2)
elseif xy
    subplot(1,3,2)
end
pcolor(magY1)
shading interp
colormap(jet)
c = colorbar
c.FontSize = 16;

shading flat
shading interp
axis equal
axis off
title('|Ey|','FontSize',20)

% figure();
if yz
    subplot(3,1,3)
elseif xy
    subplot(1,3,3)
end

pcolor(magZ1)
shading interp
colormap(jet)
c = colorbar
c.FontSize = 16;
shading flat
shading interp
axis equal
axis off
title('|Ez|','FontSize',20)

if export
    saveas(gcf,[exportDir,crossSctn,'_',wavelength,'_magnitudes.png'])
end
%% Vector Plot

% figure()
figure('Position',[0,0,1000,650])
%Elements defining the shape
x1 = field1(:,1);
y3 = field1(:,2);
z = field1(:,3);


reEx3 = field2(:,4)-field1(:,4);
imEx = field2(:,5)-field1(:,5);
reEy = field2(:,6)-field1(:,6);
imEy = field2(:,7)-field1(:,7);
reEz = field2(:,8)-field1(:,8);
imEz = field2(:,9)-field1(:,9);

%Grabbing the real x,y,z components of the E-field
% reE_y = field(:,6)./sqrt(field(:,6).^2 + field(:,8).^2);
% reE_z = field(:,8)./sqrt(field(:,6).^2 + field(:,8).^2);

% reE_x = field(:,4)./max(field(:,4));
% reE_z = field(:,8)./max(field(:,4));


% zero = zeros(5313,1);

%Real part of components WITHIN the plane
if xy
    r = [x1, y3, reEx3, reEy];
elseif yz
    r = [y3,z, reEy, reEz];
end


r1 = r(:,1);
r2 = r(:,2);
r3 = r(:,3);
r4 = r(:,4);


%Thinning parameter
a = 2;

r1 = r1(1:a:end,:);
r2 = r2(1:a:end,:);
r3 = r3(1:a:end,:);
r4 = r4(1:a:end,:);

%Vector plot

% clf clears the current figure
% clf;

% figure()
if xy
    v = subplot(1,2,1)
elseif yz
    v = subplot(2,1,1)
end
quiver(r1,r2,r3,r4,1,'k','Linewidth',1)
axis equal
% v.Position = [1,1,1,1]
%axis([-35,35,-35,35]);
axis off
title('Real E-field','Fontsize',18)


%Imaginary E field in plane

x1 = field1(:,1);
y3 = field1(:,2);
z = field1(:,3);

% imE_x = field(:,5);
% imE_y = field(:,7);
% imE_z = field(:,9);

if xy
    r = [x1, y3, imEx, imEy];
elseif yz 
    r = [y3, z, imEy, imEz];
end

r1 = r(:,1);
r2 = r(:,2);
r3 = r(:,3);
r4 = r(:,4);


%Thinning parameter
a = 2;

r1 = r1(1:a:end,:);
r2 = r2(1:a:end,:);
r3 = r3(1:a:end,:);
r4 = r4(1:a:end,:);

% figure()
if xy
    subplot(1,2,2)
elseif yz
    subplot(2,1,2)
end
quiver(r1,r2,r3,r4,1,'k','Linewidth',1)
axis equal
%axis([-35,35,-35,35]);
axis off
title('Imaginary E-field','Fontsize',18)


if export
    saveas(gcf,[exportDir,crossSctn,'_',wavelength,'_vectorPlots.png'])
end
%% 3D Vector Plots
field1 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_0nm5ds_923.E','%t',23,0);
field2 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_80nm5ds_923.E','%t',23,0);
field3 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_160nm5ds_923.E','%t',23,0);
field4 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_240nm5ds_923.E','%t',23,0);
field5 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_320nm5ds_923.E','%t',23,0);

% field1 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_0nm5ds_675.E','%t',23,0);
% field2 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_80nm5ds_675.E','%t',23,0);
% field3 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_160nm5ds_675.E','%t',23,0);
% field4 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_240nm5ds_675.E','%t',23,0);
% field5 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_320nm5ds_675.E','%t',23,0);

field6 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/xy_z-0_5ds_675.E','%t',23,0);
% 
field7 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_xz_y-0length_675.E','%t',23,0);
field8 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_xz_y-5length_675.E','%t',23,0);
field9 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/160rails_sphere60-20/sphere_160rails_xz_y-0length_675.E','%t',23,0);
field10 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/160rails_sphere60-20/sphere_160rails_xz_y-5length_675.E','%t',23,0);

% field7 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_xz_y-6length_675.E','%t',23,0);
% field8 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_xz_y-7length_675.E','%t',23,0);
% field9 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_xz_y-6length_923.E','%t',23,0);
% field10 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_xz_y-7length_923.E','%t',23,0);

% field7 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_xz_y-0length_675.E','%t',23,0);
% field8 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_xz_y-5length_675.E','%t',23,0);
% field9 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_xz_y-0length_923.E','%t',23,0);
% field10 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_xz_y-5length_923.E','%t',23,0);

% field1 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/160rails_sphere60-20/0nm5ds_675.E','%t',23,0);
% field2 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/160rails_sphere60-20/40nm5ds_675.E','%t',23,0);
% field3 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/160rails_sphere60-20/80nm5ds_675.E','%t',23,0);
% field4 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/160rails_sphere60-20/120nm5ds_675.E','%t',23,0);
% field5 = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/160rails_sphere60-20/160nm5ds_675.E','%t',23,0);



figure('Position',[0,0,1000,650])
%Elements defining the shape
x1 = field1(:,1);
y1 = field1(:,2);
z1 = field1(:,3);

x2 = field2(:,1);
y2 = field2(:,2);
z2 = field2(:,3);

x3 = field3(:,1);
y3 = field3(:,2);
z3 = field3(:,3);

x4 = field4(:,1);
y4 = field4(:,2);
z4 = field4(:,3);

x5 = field5(:,1);
y5 = field5(:,2);
z5 = field5(:,3);

x6 = field6(:,1);
y6 = field6(:,2);
z6 = field6(:,3);

x7 = field7(:,1);
y7 = field7(:,2);
z7 = field7(:,3);

x8 = field8(:,1);
y8 = field8(:,2);
z8 = field8(:,3);

x9 = field9(:,1);
y9 = field9(:,2);
z9 = field9(:,3);

x10 = field10(:,1);
y10 = field10(:,2);
z10 = field10(:,3);

reEx1 = field1(:,4);
reEy1 = field1(:,6);
reEz1 = field1(:,8);

reEx2 = field2(:,4);
reEy2 = field2(:,6);
reEz2 = field2(:,8);

reEx3 = field3(:,4);
reEy3 = field3(:,6);
reEz3 = field3(:,8);

reEx4 = field4(:,4);
reEy4 = field4(:,6);
reEz4 = field4(:,8);

reEx5 = field5(:,4);
reEy5 = field5(:,6);
reEz5 = field5(:,8);

reEx6 = field6(:,4);
reEy6 = field6(:,6);
reEz6 = field6(:,8);

reEx7 = field7(:,4);
reEy7 = field7(:,6);
reEz7 = field7(:,8);

reEx8 = field8(:,4);
reEy8 = field8(:,6);
reEz8 = field8(:,8);

reEx9 = field9(:,4);
reEy9 = field9(:,6);
reEz9 = field9(:,8);

reEx10 = field10(:,4);
reEy10 = field10(:,6);
reEz10 = field10(:,8);


xAll = [x1;x2;x3;x4;x5];
yAll = [y1;y2;y3;y4;y5];
zAll = [z1;z2;z3;z4;z5];
% 
reExAll = [reEx1;reEx2;reEx3;reEx4;reEx5];
reEyAll = [reEy1;reEy2;reEy3;reEy4;reEy5];
reEzAll = [reEz1;reEz2;reEz3;reEz4;reEz5];

% xAll = [x7;x8;x9;x10];
% yAll = [y7;y8;y9;y10];
% zAll = [z7;z8;z9;z10];

% xAll = [x7;x9];
% yAll = [y7;y9];
% zAll = [z7;z9];

% xAll = [x8;x10];
% yAll = [y8;y10];
% zAll = [z8;z10];

% reExAll = [reEx7;reEx8;reEx9;reEx10];
% reEyAll = [reEy7;reEy8;reEy9;reEy10];
% reEzAll = [reEz7;reEz8;reEz9;reEz10];

% reExAll = [reEx7;reEx9];
% reEyAll = [reEy7;reEy9];
% reEzAll = [reEz7;reEz9];

% reExAll = [reEx8;reEx10];
% reEyAll = [reEy8;reEy10];
% reEzAll = [reEz8;reEz10];

% quiver3(x0,y0,z0,reEx0,reEy0,reEz0)
% quiver3(xAll/200,yAll/200,zAll*5,reExAll,reEyAll,reEzAll,0.1);
% quiver3(xAll,yAll,zAll,reExAll,reEyAll,reEzAll,'MaxHeadSize',0.01);
quiver3(xAll,yAll,zAll,reExAll,reEyAll,reEzAll,'AutoScale','off','MaxHeadSize',1);
% quiver3(x8,y8,z8,reEx8,reEy8,reEz8,'AutoScale','off','MaxHeadSize',1);
% quiver3(x10,y10,z10,reEx10,reEy10,reEz10,'AutoScale','off','MaxHeadSize',1);

title('320 Rails 923nm Incident Light','FontSize',20)
xlabel('x dipole spacings','FontSize',20)
ylabel('y dipole spacings','FontSize',20)
zlabel('z dipole spacings','FontSize',20)


% xlabel('x um');
% ylabel('y um');
% zlabel('z nm');

% quiver3(x6*10^(-1),y6*10^(-1),z6,reEx6,reEy6,reEz6)

% quiver3(x7,y7,z7,reEx7,reEy7,reEz7)
% figure()
% quiver3(x9,y9,z9, reEx9,reEy9,reEz9,'r')
%% 2D Plot
figure()
% plot(x7,reEy7)
plot(x8,reEy8,x10,reEy10)
% plot(x7,reEy7,x9,reEy9)
% title('Ey at Center of Slot')
title('Ey at Edge of Rail')
legend('320nm Rails','160nm Rails')
set(gca,'FontSize',20);
xlabel("x",'FontSize',24)
ylabel('Ey','FontSize',24)

figure()
% plot(x7,reEy7)
plot(x9,reEy9)
% plot(x7,reEy7,x9,reEy9)
% title('Ey at Center of Slot')
title('Ey at Edge of Rail')
legend('320nm Rails 923nm')
set(gca,'FontSize',20);
xlabel("x (dipoles)",'FontSize',24)
ylabel('Ey (V/m)','FontSize',24)


j = 1;
x8z = zeros(76,1);
reEy8z = zeros(76,1);
x10z = zeros(76,1);
reEy10z = zeros(76,1);

length = size(z8);
for i = 1:length
    if z8(i) == 0
        x8z(j) = x8(i);
        reEy8z(j) = reEy8(i);
        x10z(j) = x10(i);
        reEy10z(j) = reEy10(i);
        j = j+1;  
    end
end

j = 1;
x7z = zeros(76,1);
reEy7z = zeros(76,1);
x9z = zeros(76,1);
reEy9z = zeros(76,1);

length = size(z7);
for i = 1:length
    if z7(i) == 0
        x7z(j) = x7(i);
        reEy7z(j) = reEy7(i);
        x9z(j) = x9(i);
        reEy9z(j) = reEy9(i);
        j = j+1;  
    end
end


figure()
% plot(x7,reEy7)
plot(x8z,reEy8z,x10z,reEy10z)
% plot(x7,reEy7,x9,reEy9)
% title('Ey at Center of Slot')

title('Wavelength Dependence of Skin Depth, 10nm into Rail','FontSize',28)
l=legend('675nm','923nm')
l.FontSize = 20;
set(gca,'FontSize',20);
xlabel("x",'FontSize',24)
ylabel('Ey','FontSize',24)

figure()
% plot(x7,reEy7)
plot(x7z,reEy7z,x9z,reEy9z)

title('Wavelength Dependence of Skin Depth, 5nm into Rail','FontSize',28)
l=legend('675nm','923nm')
l.FontSize = 20;
set(gca,'FontSize',20);
xlabel("x",'FontSize',24)
ylabel('Ey','FontSize',24)

figure()
% plot(x7,reEy7)
plot(x7z,reEy7z,x9z,reEy9z,x8z,reEy8z,x10z,reEy10z,'LineWidth',1.7)

title('Length Dependence of E Field at Center of Slot and Side Face of Rail','FontSize',28)
l=legend('320nm Center','160nm Center', '320nm Face', '160nm Face')
l.FontSize = 20;
set(gca,'FontSize',20);
xlabel("x (dipoles)",'FontSize',24)
ylabel('Ey (V/m)','FontSize',24)

% title('Ey at Edge of Rail, z=0')
% legend('320nm Rails','160nm Rails')
% xlabel("x")
% ylabel('Ey')
%% Magnitude of components of E Field



table = strings(4,5);
%Magnitude of components of electric field
magX1 = sqrt(field1(:,4).^2 + field1(:,5).^2);
magY1 = sqrt(field1(:,6).^2 + field1(:,7).^2);
magZ1 = sqrt(field1(:,8).^2 + field1(:,9).^2);
magTot1 = sqrt(field1(:,4).^2 + field1(:,5).^2 + field1(:,6).^2 + field1(:,7).^2 + field1(:,8).^2 + field1(:,9).^2);

magX2 = sqrt(field2(:,4).^2 + field2(:,5).^2);
magY2 = sqrt(field2(:,6).^2 + field2(:,7).^2);
magZ2 = sqrt(field2(:,8).^2 + field2(:,9).^2);
magTot2 = sqrt(field2(:,4).^2 + field2(:,5).^2 + field2(:,6).^2 + field2(:,7).^2 + field2(:,8).^2 + field2(:,9).^2);

magX3 = sqrt(field3(:,4).^2 + field3(:,5).^2);
magY3 = sqrt(field3(:,6).^2 + field3(:,7).^2);
magZ3 = sqrt(field3(:,8).^2 + field3(:,9).^2);
magTot3 = sqrt(field3(:,4).^2 + field3(:,5).^2 + field3(:,6).^2 + field3(:,7).^2 + field3(:,8).^2 + field3(:,9).^2);

magX4 = sqrt(field4(:,4).^2 + field4(:,5).^2);
magY4 = sqrt(field4(:,6).^2 + field4(:,7).^2);
magZ4 = sqrt(field4(:,8).^2 + field4(:,9).^2);
magTot4 = sqrt(field4(:,4).^2 + field4(:,5).^2 + field4(:,6).^2 + field4(:,7).^2 + field4(:,8).^2 + field4(:,9).^2);

magX5 = sqrt(field5(:,4).^2 + field5(:,5).^2);
magY5 = sqrt(field5(:,6).^2 + field5(:,7).^2);
magZ5 = sqrt(field5(:,8).^2 + field5(:,9).^2);
magTot5 = sqrt(field5(:,4).^2 + field5(:,5).^2 + field5(:,6).^2 + field5(:,7).^2 + field5(:,8).^2 + field5(:,9).^2);

table(1,1) = "Cross Section 1";
table(2,1) ="Max X: "+max(magX1);
table(3,1) ="Max Y: "+max(magY1);
table(4,1) ="Max Z: "+max(magZ1);

table(1,2) = "Cross Section 2";
table(2,2) ="Max X: "+max(magX2);
table(3,2) ="Max Y: "+max(magY2);
table(4,2) ="Max Z: "+max(magZ2);

table(1,3) = "Cross Section 3";
table(2,3) ="Max X: "+max(magX3);
table(3,3) ="Max Y: "+max(magY3);
table(4,3) ="Max Z: "+max(magZ3);

table(1,4) = "Cross Section 4";
table(2,4) ="Max X: "+max(magX4);
table(3,4) ="Max Y: "+max(magY4);
table(4,4) ="Max Z: "+max(magZ4);

table(1,5) = "Cross Section 5";
table(2,5) ="Max X: "+max(magX5);
table(3,5) ="Max Y: "+max(magY5);
table(4,5) ="Max Z: "+max(magZ5);

% This "values" table is to be able to find the overall max E field for all
% cross sections
values = zeros(3,5);

values(1,1) = max(magX1);
values(2,1) = max(magY1);
values(3,1) = max(magZ1);

values(1,2) = max(magX2);
values(2,2) = max(magY2);
values(3,2) = max(magZ2);

values(1,3) = max(magX3);
values(2,3) = max(magY3);
values(3,3) = max(magZ3);

values(1,4) = max(magX4);
values(2,4) = max(magY4);
values(3,4) = max(magZ4);

values(1,5) = max(magX5);
values(2,5) = max(magY5);
values(3,5) = max(magZ5);

max(values)
max(max(values))

magE = magX1+magY1+magZ1;
%%
% a = abs(max(x)) + abs(min(x)) + 1;
% % a = abs(max(y)) + abs(min(y)) + 1;
% b = abs(max(y)) + abs(min(y)) + 1;


figure('Position',[0,0,800,650])

magX1 = reshape(magX1, [b,a]);
magY1 = reshape(magY1, [b,a]);
magZ1 = reshape(magZ1, [b,a]);

% figure();
if yz
    subplot(3,1,1)
elseif xy
    subplot(1,3,1)
end
pcolor(magX1)
shading interp
colormap(jet)
cx = colorbar;
cx.Limits = [0,10];
shading flat
shading interp
axis equal
axis off
title('|Ex|')

% figure();
if yz
    subplot(3,1,2)
elseif xy
    subplot(1,3,2)
end
pcolor(magY1)
shading interp
colormap(jet)
colorbar
shading flat
shading interp
axis equal
axis off
title('|Ey|')

% figure();
if yz
    subplot(3,1,3)
elseif xy
    subplot(1,3,3)
end

pcolor(magZ1)
shading interp
colormap(jet)
colorbar
shading flat
shading interp
axis equal
axis off
title('|Ez|')
%%
% 
% reEx = field2(:,4)-field1(:,4);
% imEx = field2(:,5)-field1(:,5);
% reEy = field2(:,6)-field1(:,6);
% imEy = field2(:,7)-field1(:,7);
% reEz = field2(:,8)-field1(:,8);
% imEz = field2(:,9)-field1(:,9);

%Grabbing the real x,y,z components of the E-field
% reE_y = field(:,6)./sqrt(field(:,6).^2 + field(:,8).^2);
% reE_z = field(:,8)./sqrt(field(:,6).^2 + field(:,8).^2);

% reE_x = field(:,4)./max(field(:,4));
% reE_z = field(:,8)./max(field(:,4));


% zero = zeros(5313,1);



%Real part of components WITHIN the plane
if xy
    r = [x1, y3, reEx3, reEy];
elseif yz
    r = [y3,z, reEy, reEz];
end


r1 = r(:,1);
r2 = r(:,2);
r3 = r(:,3);
r4 = r(:,4);


%Thinning parameter
a = 2;

r1 = r1(1:a:end,:);
r2 = r2(1:a:end,:);
r3 = r3(1:a:end,:);
r4 = r4(1:a:end,:);

%Vector plot

% clf clears the current figure
% clf;

% figure()
if xy
    v = subplot(1,2,1)
elseif yz
    v = subplot(2,1,1)
end
quiver(r1,r2,r3,r4,1,'k','Linewidth',1)
axis equal
% v.Position = [1,1,1,1]
%axis([-35,35,-35,35]);
axis off
title('Real E-field','Fontsize',18)


%Imaginary E field in plane

x1 = field1(:,1);
y3 = field1(:,2);
z = field1(:,3);

% imE_x = field(:,5);
% imE_y = field(:,7);
% imE_z = field(:,9);

if xy
    r = [x1, y3, imEx, imEy];
elseif yz 
    r = [y3, z, imEy, imEz];
end

r1 = r(:,1);
r2 = r(:,2);
r3 = r(:,3);
r4 = r(:,4);


%Thinning parameter
a = 2;

r1 = r1(1:a:end,:);
r2 = r2(1:a:end,:);
r3 = r3(1:a:end,:);
r4 = r4(1:a:end,:);

% figure()
if xy
    subplot(1,2,2)
elseif yz
    subplot(2,1,2)
end
quiver(r1,r2,r3,r4,1,'k','Linewidth',1)
axis equal
%axis([-35,35,-35,35]);
axis off
title('Imaginary E-field','Fontsize',18)

end
%% Center Line Calculation
% 
% %Center Line Calculation 
% 
% % field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/7.1/waveguide/filledWG/centerLine.E','%t',23,0);
% field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/7.1/rails/160rails_sphere60-20/centerLine.E','%t',23,0);
% % figure()
% %
% dipoleSpacing = 5;
% x = field(:,1)*5;
% magEx = (field(:,4).^2 +field(:,5).^2).^(1/2);
% magEy = (field(:,6).^2 +field(:,7).^2).^(1/2);
% magEz = (field(:,8).^2 +field(:,9).^2).^(1/2);
% 
% reE = (field(:,4).^2 +field(:,6).^2 +field(:,8).^2).^(1/2);
% imE = (field(:,5).^2 +field(:,7).^2 +field(:,9).^2).^(1/2);
% 
% figure()
% %Real and Imaginary components of E
%     subplot(2,1,1)
%     plot(x,reE)
%     title('|Real E|')
%     xlabel('x Distance Along Length of Slot (nm)')
%     
% 
% 
%     subplot(2,1,2)
%     plot(x,imE)
%     title('|Imaginary E|`')
%      xlabel('x Distance Along Length of Slot (nm)')
% 
% %Magnitude of each component of E
%     figure()
%     subplot(3,1,1)
%     plot(x,magEx)
%     title('|Ex|')
%     xlabel('x Distance Along Length of Slot (nm)')
% 
%     subplot(3,1,2)
%     plot(x,magEy)
%     title('|Ey|')
%     xlabel('x Distance Along Length of Slot (nm)')
% 
%     subplot(3,1,3)
%     plot(x,magEz)
%     title('|Ez|')
%     xlabel('x Distance Along Length of Slot (nm)')
% 
% %Each component of E
%     figure()
%     suptitle('160nm Rails + Sphere')
% %     x = field(:,1);
%     reEx = field(:,4);
%     imEx = field(:,5);
%     reEy = field(:,6);
%     imEy = field(:,7);
%     reEz = field(:,8);
%     imEz = field(:,9);
% 
%     subplot(3,2,1)
%     plot(x,reEx)
%     title('Real Ex')
%     xlabel('x Distance Along Length of Slot (nm)')
%     subplot(3,2,2)
%     plot(x,imEx)
%     title('Imaginary Ex')
%     xlabel('x Distance Along Length of Slot (nm)')
% 
%     subplot(3,2,3)
%     plot(x,reEy)
%     title('Real Ey')
%     xlabel('x Distance Along Length of Slot (nm)')
%     subplot(3,2,4)
%     plot(x,imEy)
%     title('Imaginary Ey')
%     xlabel('x Distance Along Length of Slot (nm)')
% 
%     subplot(3,2,5)
%     plot(x,reEz)
%     title('Real Ez')
%     xlabel('x Distance Along Length of Slot (nm)')
%     subplot(3,2,6)
%     plot(x,imEz)
%     title('Imaginary Ez')
%     xlabel('x Distance Along Length of Slot (nm)')