
clear; clc;

field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/7.1/rails/rails5ds160l_sphere60nm20radius/xy_z-0_5ds_675.E','%t',23,0);

%%

%Center Line Calculation 
% figure()
%
x = field(:,1);
magEx = (field(:,4).^2 +field(:,5).^2).^(1/2);
magEy = (field(:,6).^2 +field(:,7).^2).^(1/2);
magEz = (field(:,8).^2 +field(:,9).^2).^(1/2);

reE = (field(:,4).^2 +field(:,6).^2 +field(:,8).^2).^(1/2);
imE = (field(:,5).^2 +field(:,7).^2 +field(:,9).^2).^(1/2);

figure()
%Real and Imaginary components of E
    subplot(2,1,1)
    plot(x,reE)
    title('|Real E|')


    subplot(2,1,2)
    plot(x,imE)
    title('|Imaginary E|`')

%Magnitude of each component of E
    figure()
    subplot(3,1,1)
    plot(x,magEx)
    title('|Ex|')

    subplot(3,1,2)
    plot(x,magEy)
    title('|Ey|')

    subplot(3,1,3)
    plot(x,magEz)
    title('|Ez|')

%Each component of E
    figure()
    x = field(:,1);
    reEx = field(:,4);
    imEx = field(:,5);
    reEy = field(:,6);
    imEy = field(:,7);
    reEz = field(:,8);
    imEz = field(:,9);

    subplot(3,2,1)
    plot(x,reEx)
    title('Real Ex')
    subplot(3,2,2)
    plot(x,imEx)
    title('Imaginary Ex')

    subplot(3,2,3)
    plot(x,reEy)
    title('Real Ey')
    subplot(3,2,4)
    plot(x,imEy)
    title('Imaginary Ey')

    subplot(3,2,5)
    plot(x,reEz)
    title('Real Ez')
    subplot(3,2,6)
    plot(x,imEz)
    title('Imaginary Ez')

%%
Title = suptitle('Rails + Sphere 0nm in');
Title.FontSize = 25;
%y component plot

%y component of electric field

reEx = field(:,4);
imEx = field(:,5);
reEy =field(:,6);
imEy = field(:,7);
reEz = field(:,8);
imEz = field(:,9);

x = field(:,1);
y = field(:,2);
z = field(:,3);

% a = abs(max(y)) + abs(min(y)) + 1;
a = abs(max(x)) + abs(min(x)) + 1;
b = abs(max(y)) + abs(min(y)) + 1;
% b = abs(max(z)) + abs(min(z)) + 1;

% Ey_mag = Ey_mag1 - Ey_mag2;

reEx = reshape(reEx, [b,a]);
imEx = reshape(imEx, [b,a]);
reEy = reshape(reEy, [b,a]);
imEy = reshape(imEy, [b,a]);
reEz = reshape(reEz, [b,a]);
imEz = reshape(imEz, [b,a]);
% reEy(:,1)
% plot(reEy)

% figure(1);
% subplot(2,3,2)
% subplot(3,2,3)
% pcolor(reEy)
% % shading flat
% shading interp
% 
% colormap(jet)
% %Here you can adjust the color scale
% %caxis([-1,1])
% 
% % caxis([-8,6])
% % caxis([-2.2,2.5])
% % colorbar off
% c = colorbar('southoutside');
% c.FontSize = 8;
% c.Position = [0,0,.1,.01]
% c.Position
% 
% shading flat
% shading interp
% %This makes sure the axes aren't stretched to fit
% axis equal
% 
% %This is to prevent confusion with respect to the axis formatting
% %If we don't include the correct coordinates, then we shouldn't include
% %coordinates at all.
% axis off
% title('Re(Ey)')
% % str = "Re(Ey) Middle Cross Section of 960nm Long Empty Waveguide";
% % str = str + newline +"1310nm Plane Wave,10nm Dipole Spacing"
% % title('Re(Ey) Rail 0nm (front) 625nm Plane Wave, 5nm Dipole Spacing')
% % title('Electric Field Im(z) Component 142.37nm PW 1nm ds')
% % title(str)

sp1 = subplot(3,2,1)
% sp1 = subplot(1,6,1)
pcolor(reEx)
shading interp
colormap(jet)
% colorbar off
c = colorbar('southoutside');
% c.FontSize = 8;
c.Position = [0.1300,0.7093+.02,.3347,.01]
shading flat
shading interp
axis equal
axis off
title('Re(Ex)')
% colorbar off

sp2 = subplot(3,2,2)
% sp2 = subplot(1,6,2)
pcolor(imEx)
shading interp
colormap(jet)
% colorbar off
c = colorbar('southoutside');
% c.FontSize = 8;
c.Position = [0.5703,0.7093+.02,.3347,.01]
shading flat
shading interp
axis equal
axis off
title('Im(Ex)')
% colorbar off

sp3 = subplot(3,2,3)
% sp3 = subplot(1,6,3)
pcolor(reEy)
shading interp
colormap(jet)
% colorbar off
c = colorbar('southoutside');
% c.FontSize = 8;
c.Position = [0.1300,0.4096+.02,.3347,.01]
shading flat
shading interp
axis equal
axis off
title('Re(Ey)')
% colorbar off


sp4 = subplot(3,2,4)
% sp6 = subplot(1,6,4)
pcolor(imEy)
shading interp
colormap(jet)
% colorbar off
c = colorbar('southoutside');
% c.FontSize = 8;
c.Position = [0.5703,0.4096+.02,.3347,.01]
shading flat
shading interp
axis equal
axis off
title('Im(Ey)')
% colorbar off

sp5 = subplot(3,2,5)
% sp5 = subplot(1,6,5)
pcolor(reEz)
shading interp
colormap(jet)
% colorbar off
c = colorbar('southoutside');
% c.FontSize = 8;
c.Position = [0.1300,0.1100+.02,.3347,.01]
shading flat
shading interp
axis equal
axis off
title('Re(Ez)')
% colorbar off

sp6 = subplot(3,2,6)
% sp6 = subplot(1,6,6)
pcolor(imEz)
shading interp
colormap(jet)
% colorbar off
c = colorbar('southoutside');
% c.FontSize = 8;
c.Position = [0.5703,0.1100+.02,.3347,.01]
shading flat
shading interp
axis equal
axis off
title('Im(Ez)')
% colorbar off
%%
%XY plane cross sections
% sp1 = subplot(3,2,1)
sp1 = subplot(1,6,1);
pcolor(reEx)
shading interp
colormap(jet)
% colorbar off
c = colorbar;
% c.FontSize = 8;
c.Position = [0.1441-.015,0.1100+.11,0.01,0.59];
shading flat
shading interp
axis equal
axis off
title('Re(Ex)')
% colorbar off

% sp2 = subplot(3,2,2)
sp2 = subplot(1,6,2);
pcolor(imEx)
shading interp
colormap(jet)
% colorbar off
c = colorbar;
% c.FontSize = 8;
c.Position = [0.2787-.015,0.1100+.11,0.01,0.59];
shading flat
shading interp
axis equal
axis off
title('Im(Ex)')
% colorbar off

% sp3 = subplot(3,2,3)
sp3 = subplot(1,6,3);
pcolor(reEy)
shading interp
colormap(jet)
% colorbar off
c = colorbar;
% c.FontSize = 8;
c.Position = [0.4132-.015,0.1100+.11,0.01,0.59];
shading flat
shading interp
axis equal
axis off
title('Re(Ey)')
% colorbar off


% sp4 = subplot(3,2,4)
sp4 = subplot(1,6,4);
pcolor(imEy)
shading interp
colormap(jet)
% colorbar off
c = colorbar;
% c.FontSize = 8;
c.Position = [0.5478-.015,0.1100+.11,0.01,0.59];
shading flat
shading interp
axis equal
axis off
title('Im(Ey)')
% colorbar off

% sp5 = subplot(3,2,5)
sp5 = subplot(1,6,5);
pcolor(reEz)
shading interp
colormap(jet)
% colorbar off
c = colorbar;
% c.FontSize = 8;
c.Position = [0.6823-.015,0.1100+.11,0.01,0.59];
shading flat
shading interp
axis equal
axis off
title('Re(Ez)')
% colorbar off

% sp6 = subplot(3,2,6)
sp6 = subplot(1,6,6);
pcolor(imEz)
shading interp
colormap(jet)
% colorbar off
c = colorbar;
% c.FontSize = 8;
c.Position = [0.8168-.015,0.1100+.11,0.01,0.59];
shading flat
shading interp
axis equal
axis off
title('Im(Ez)')
% colorbar off
%%

%Magnitude of components of electric field
magX = sqrt(field(:,4).^2 + field(:,5).^2);
magY = sqrt(field(:,6).^2 + field(:,7).^2);
magZ = sqrt(field(:,8).^2 + field(:,9).^2);

magE = magX;

a = abs(max(y)) + abs(min(y)) + 1;
% a = abs(max(y)) + abs(min(y)) + 1;
b = abs(max(z)) + abs(min(z)) + 1;

magX = reshape(magX, [b,a]);
magY = reshape(magY, [b,a]);
magZ = reshape(magZ, [b,a]);

figure(3);
pcolor(magX)
shading interp
colormap(jet)
colorbar
shading flat
shading interp
axis equal
axis off

figure(4);
pcolor(magY)
shading interp
colormap(jet)
colorbar
shading flat
shading interp
axis equal
axis off

figure(5);
pcolor(magZ)
shading interp
colormap(jet)
colorbar
shading flat
shading interp
axis equal
axis off
%%
%%Electric Field Vector Plot

%field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/7.1/simple_tests/ddfield.E','%t',23,0);
%field = dlmread('/Users/elliotbeutler/Desktop/Projects/superquadric/mgo_edge/17.5/bottom/ddfield.E','%t',23,0);

%field = [field1(:,1) field1(:,2) field1(:,3) field1(:,4) - field2(:,4) field1(:,5) - field2(:,5) field1(:,6) - field2(:,6) field1(:,7) - field2(:,7) field1(:,8) - field2(:,8)  field1(:,9) - field2(:,9)];
%Elements defining the shape
s_x = field(:,1);
s_y = field(:,2);
s_z = field(:,3);

%Grabbing the real x,y,z components of the E-field
% reE_y = field(:,6)./sqrt(field(:,6).^2 + field(:,8).^2);
% reE_z = field(:,8)./sqrt(field(:,6).^2 + field(:,8).^2);

reE_x = field(:,4);
imE_y = field(:,6);
imE_z = field(:,8);

% reE_x = field(:,4)./max(field(:,4));
% reE_z = field(:,8)./max(field(:,4));


r = [s_x, s_y, reE_x, imE_y];


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



%Grabbing the imaginary x,y,z components of the E-field
% imE_x = field(:,5)./max(field(:,5));
% imE_y = field(:,7)./sqrt(field(:,7).^2 + field(:,9).^2);
% imE_z = field(:,9)./sqrt(field(:,7).^2 + field(:,9).^2);
% 
% %Grouping shape and field elements into an array for optional editing
% i = [s_y, s_z, imE_y, imE_z];
% 
% i1 = i(:,1);
% i2 = i(:,2);
% i3 = i(:,3);
% i4 = i(:,4);
% 
% i1 = i1(1:a:end,:);
% i2 = i2(1:a:end,:);
% i3 = i3(1:a:end,:);
% i4 = i4(1:a:end,:);

%Vector plot

% clf clears the current figure
% clf;

% hold on
%rectangle('Position',[-62,-62,28,125],'Curvature',.1,'Linewidth',2,'Linestyle','-.','Edgecolor','m')
%viscircles([0,0],30,'Color','r','Linewidth',3);
%viscircles([0,35],30,'Color','r','Linewidth',5);

% figure()
subplot(1,2,1)
quiver(r1,r2,r3,r4,.8,'k','Linewidth',1)
axis equal
%axis([-35,35,-35,35]);
axis off
title('Real E-field','Fontsize',18)


% 
% figure
% hold on
% rectangle('Position',[-25,-25,50,50],'Curvature',.1,'Linewidth',2,'Linestyle','-.','Edgecolor','m')
% quiver(i1,i2,i3,i4,1,'k','Linewidth',1)
% axis equal
% axis([-35,35,-35,35]);
% axis off
% title('Imaginary E-field')


% 2-D E-Field Line Plot

%field = dlmread('/Users/elliotbeutler/Desktop/Projects/superquadric/mgo_face/15.2/bottom/ddfield.E','%t',23,0);



s_x = field(:,1);
s_y = field(:,2);
s_z = field(:,3);

imE_x = field(:,5);
imE_y = field(:,7);
imE_z = field(:,9);

r = [s_x, s_y, imE_x, imE_y];

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
subplot(1,2,2)
quiver(r1,r2,r3,r4,.8,'k','Linewidth',1)
axis equal
%axis([-35,35,-35,35]);
axis off
title('Imaginary E-field','Fontsize',18)


%%
% %y component of electric field
% reEy =field(:,6);
% % max(reEy)
% % min(reEy)
% 
% x = field(:,1);
% y = field(:,2);
% z = field(:,3);
% 
% a = abs(max(y)) + abs(min(y)) + 1;
% % a = abs(max(y)) + abs(min(y)) + 1;
% b = abs(max(z)) + abs(min(z)) + 1;
% 
% % a = abs(max(x)) + abs(min(x)) + 1;
% % b = abs(max(y)) + abs(min(y)) + 1;
% 
% % Ey_mag = Ey_mag1 - Ey_mag2;
% 
% reEy = reshape(reEy, [b,a]);
% 
% % reEy(:,1)
% % plot(reEy)
% 
% figure(1);
% pcolor(reEy)
% % shading flat
% shading interp
% 
% colormap(jet)
% %Here you can adjust the color scale
% %caxis([-1,1])
% 
% % caxis([-8,6])
% % caxis([-2.2,2.5])
% colorbar
% shading flat
% shading interp
% %This makes sure the axes aren't stretched to fit
% axis equal
% 
% %This is to prevent confusion with respect to the axis formatting
% %If we don't include the correct coordinates, then we shouldn't include
% %coordinates at all.
% axis off
% % str = "Re(Ey) Middle Cross Section of 960nm Long Empty Waveguide";
% % str = str + newline +"1310nm Plane Wave,10nm Dipole Spacing"
% % title('Re(Ey) Rail 0nm (front) 625nm Plane Wave, 5nm Dipole Spacing')
% % title('Electric Field Im(z) Component 142.37nm PW 1nm ds')
% % title(str)
% 
